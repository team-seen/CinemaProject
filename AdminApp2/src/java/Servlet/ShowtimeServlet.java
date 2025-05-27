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
import java.time.LocalTime;

public class ShowtimeServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/cinema";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "12345678";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Load movies for dropdown
            List<Map<String, Object>> movies = getMovies();
            request.setAttribute("movies", movies);

            // Load current showtimes
            List<Map<String, Object>> showtimes = getCurrentShowtimes();
            request.setAttribute("showtimes", showtimes);

            request.getRequestDispatcher("JSP/ShowtimeManagement.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("Database error", e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            switch (action) {
                case "add":
                    addShowtime(request);
                    request.setAttribute("successMessage", "Showtime added successfully!");
                    break;
                case "delete":
                    deleteShowtime(request);
                    request.setAttribute("successMessage", "Showtime deleted successfully!");
                    break;
                default:
                    request.setAttribute("errorMessage", "Invalid action specified.");
            }
        } catch (SQLException e) {
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Error: " + e.getMessage());
        }

        doGet(request, response);
    }

    private List<Map<String, Object>> getMovies() throws SQLException {
        List<Map<String, Object>> movies = new ArrayList<>();
        String sql = "SELECT id, title FROM movies ORDER BY title";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Map<String, Object> movie = new HashMap<>();
                movie.put("id", rs.getInt("id"));
                movie.put("title", rs.getString("title"));
                movies.add(movie);
            }
        }
        return movies;
    }

    private List<Map<String, Object>> getCurrentShowtimes() throws SQLException {
        List<Map<String, Object>> showtimes = new ArrayList<>();
        String sql = "SELECT st.id, st.show_date, st.show_time, st.available_seats, " +
                    "m.title as movie_title " +
                    "FROM show_times st " +
                    "JOIN movies m ON st.movie_id = m.id " +
                    "WHERE st.show_date >= CURDATE() " +
                    "ORDER BY st.show_date, st.show_time";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Map<String, Object> showtime = new HashMap<>();
                showtime.put("id", rs.getInt("id"));
                showtime.put("movieTitle", rs.getString("movie_title"));
                showtime.put("showDate", rs.getDate("show_date"));
                showtime.put("showTime", rs.getTime("show_time"));
                showtime.put("availableSeats", rs.getInt("available_seats"));
                showtimes.add(showtime);
            }
        }
        return showtimes;
    }

    private void addShowtime(HttpServletRequest request) throws SQLException {
        String sql = "INSERT INTO show_times (movie_id, show_date, show_time, available_seats) VALUES (?, ?, ?, ?)";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, Integer.parseInt(request.getParameter("movieId")));
            ps.setDate(2, Date.valueOf(request.getParameter("showDate")));
            ps.setTime(3, Time.valueOf(request.getParameter("showTime") + ":00"));
            ps.setInt(4, Integer.parseInt(request.getParameter("availableSeats")));

            ps.executeUpdate();
        }
    }

    private void deleteShowtime(HttpServletRequest request) throws SQLException {
        String sql = "DELETE FROM show_times WHERE id = ? AND " +
                    "NOT EXISTS (SELECT 1 FROM booking WHERE movie_id = ?)";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            int showtimeId = Integer.parseInt(request.getParameter("showtimeId"));
            ps.setInt(1, showtimeId);
            ps.setInt(2, showtimeId);

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected == 0) {
                throw new SQLException("Cannot delete showtime: it has existing bookings");
            }
        }
    }

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }
}