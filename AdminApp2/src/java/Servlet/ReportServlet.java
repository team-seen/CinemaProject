package Servlet;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class ReportServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/cinema";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "12345678";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String reportType = request.getParameter("type");
            
            if (reportType == null) {
                // First visit - just show the report selection page
                request.getRequestDispatcher("JSP/GenerateReports.jsp").forward(request, response);
                return;
            }

            // Generate the requested report
            Map<String, Object> reportData = new HashMap<>();
            String startDate = request.getParameter("startDate");
            String endDate = request.getParameter("endDate");

            switch (reportType) {
                case "revenue":
                    reportData = generateRevenueReport(startDate, endDate);
                    break;
                case "popular_movies":
                    reportData = generatePopularMoviesReport(startDate, endDate);
                    break;
                case "occupancy":
                    reportData = generateOccupancyReport(startDate, endDate);
                    break;
                case "user_activity":
                    reportData = generateUserActivityReport(startDate, endDate);
                    break;
            }

            request.setAttribute("reportData", reportData);
            request.setAttribute("reportType", reportType);
            request.setAttribute("startDate", startDate);
            request.setAttribute("endDate", endDate);
            
            request.getRequestDispatcher("JSP/GenerateReports.jsp").forward(request, response);
            
        } catch (SQLException e) {
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("JSP/GenerateReports.jsp").forward(request, response);
        }
    }

    private Map<String, Object> generateRevenueReport(String startDate, String endDate) throws SQLException {
        Map<String, Object> report = new HashMap<>();
        List<Map<String, Object>> dailyRevenue = new ArrayList<>();

        String sql = "SELECT DATE(booking_date) as date, " +
                    "COUNT(*) as booking_count, " +
                    "SUM(total_price) as daily_revenue " +
                    "FROM booking " +
                    "WHERE booking_date BETWEEN ? AND ? " +
                    "GROUP BY DATE(booking_date) " +
                    "ORDER BY date";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, startDate);
            ps.setString(2, endDate);
            ResultSet rs = ps.executeQuery();

            double totalRevenue = 0;
            int totalBookings = 0;

            while (rs.next()) {
                Map<String, Object> day = new HashMap<>();
                day.put("date", rs.getDate("date"));
                day.put("bookings", rs.getInt("booking_count"));
                day.put("revenue", rs.getDouble("daily_revenue"));
                dailyRevenue.add(day);

                totalRevenue += rs.getDouble("daily_revenue");
                totalBookings += rs.getInt("booking_count");
            }

            report.put("dailyData", dailyRevenue);
            report.put("totalRevenue", totalRevenue);
            report.put("totalBookings", totalBookings);
            report.put("averageRevenuePerBooking", totalBookings > 0 ? totalRevenue/totalBookings : 0);
        }

        return report;
    }

    private Map<String, Object> generatePopularMoviesReport(String startDate, String endDate) throws SQLException {
        Map<String, Object> report = new HashMap<>();
        List<Map<String, Object>> movieStats = new ArrayList<>();

        String sql = "SELECT m.title, m.genre, " +
                    "COUNT(b.booking_id) as booking_count, " +
                    "SUM(b.total_price) as total_revenue, " +
                    "m.rating " +
                    "FROM movies m " +
                    "LEFT JOIN booking b ON m.id = b.movie_id " +
                    "AND b.booking_date BETWEEN ? AND ? " +
                    "GROUP BY m.id, m.title, m.genre, m.rating " +
                    "ORDER BY booking_count DESC";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, startDate);
            ps.setString(2, endDate);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Map<String, Object> movie = new HashMap<>();
                movie.put("title", rs.getString("title"));
                movie.put("genre", rs.getString("genre"));
                movie.put("bookings", rs.getInt("booking_count"));
                movie.put("revenue", rs.getDouble("total_revenue"));
                movie.put("rating", rs.getInt("rating"));
                movieStats.add(movie);
            }

            report.put("movieStats", movieStats);
        }

        return report;
    }

    private Map<String, Object> generateOccupancyReport(String startDate, String endDate) throws SQLException {
        Map<String, Object> report = new HashMap<>();
        List<Map<String, Object>> occupancyData = new ArrayList<>();

        String sql = "SELECT st.show_date, st.show_time, m.title, " +
                    "st.available_seats as total_seats, " +
                    "COUNT(b.booking_id) as booked_seats " +
                    "FROM show_times st " +
                    "JOIN movies m ON st.movie_id = m.id " +
                    "LEFT JOIN booking b ON st.id = b.movie_id " +
                    "WHERE st.show_date BETWEEN ? AND ? " +
                    "GROUP BY st.id, st.show_date, st.show_time, m.title, st.available_seats " +
                    "ORDER BY st.show_date, st.show_time";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, startDate);
            ps.setString(2, endDate);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Map<String, Object> showing = new HashMap<>();
                showing.put("date", rs.getDate("show_date"));
                showing.put("time", rs.getTime("show_time"));
                showing.put("movie", rs.getString("title"));
                showing.put("totalSeats", rs.getInt("total_seats"));
                showing.put("bookedSeats", rs.getInt("booked_seats"));
                
                int totalSeats = rs.getInt("total_seats");
                int bookedSeats = rs.getInt("booked_seats");
                double occupancyRate = totalSeats > 0 ? (bookedSeats * 100.0 / totalSeats) : 0;
                showing.put("occupancyRate", occupancyRate);
                
                occupancyData.add(showing);
            }

            report.put("occupancyData", occupancyData);
        }

        return report;
    }

    private Map<String, Object> generateUserActivityReport(String startDate, String endDate) throws SQLException {
        Map<String, Object> report = new HashMap<>();
        List<Map<String, Object>> userActivity = new ArrayList<>();

        String sql = "SELECT u.username, u.email, " +
                    "COUNT(b.booking_id) as booking_count, " +
                    "SUM(b.total_price) as total_spent " +
                    "FROM users u " +
                    "LEFT JOIN booking b ON u.id = b.user_id " +
                    "AND b.booking_date BETWEEN ? AND ? " +
                    "GROUP BY u.id, u.username, u.email " +
                    "HAVING booking_count > 0 " +
                    "ORDER BY booking_count DESC";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, startDate);
            ps.setString(2, endDate);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Map<String, Object> user = new HashMap<>();
                user.put("username", rs.getString("username"));
                user.put("email", rs.getString("email"));
                user.put("bookings", rs.getInt("booking_count"));
                user.put("totalSpent", rs.getDouble("total_spent"));
                userActivity.add(user);
            }

            report.put("userActivity", userActivity);
        }

        return report;
    }

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }
}