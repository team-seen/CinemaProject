package Servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class StatisticsServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/cinema";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "12345678";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try {
            // Create statistics map
            Map<String, Object> statistics = new HashMap<>();
            
            // Start collecting statistics with debug output
//            out.println("Debug: Starting statistics collection");
//            
            // Get top movies by bookings
            List<Map<String, Object>> topMovies = getTopMoviesByBookings();
//            out.println("Debug: Top movies count: " + topMovies.size());
            statistics.put("topMoviesByBookings", topMovies);
            
            // Get top rated movies
            List<Map<String, Object>> topRated = getTopRatedMovies();
//            out.println("Debug: Top rated movies count: " + topRated.size());
            statistics.put("topRatedMovies", topRated);
            
            // Get revenue statistics
            Map<String, Object> revenue = getRevenueStatistics();
//            out.println("Debug: Revenue stats collected");
            statistics.put("revenueStats", revenue);
            
            // Get popular showtimes
            List<Map<String, Object>> showtimes = getPopularShowtimes();
//            out.println("Debug: Showtimes count: " + showtimes.size());
            statistics.put("popularShowtimes", showtimes);
            
            // Set the statistics in request attribute
            request.setAttribute("statistics", statistics);
            
            // Debug output before forwarding
//            out.println("Debug: Statistics object created and set in request");
//            out.println("Debug: Statistics map size: " + statistics.size());
            
            // Forward to the JSP page
            request.getRequestDispatcher("JSP/ManagerDashboard.jsp").forward(request, response);
            
        } catch (SQLException e) {
            out.println("SQL Error: " + e.getMessage());
            e.printStackTrace(out);
        } catch (Exception e) {
            out.println("General Error: " + e.getMessage());
            e.printStackTrace(out);
        }
    }

    private List<Map<String, Object>> getTopMoviesByBookings() throws SQLException {
        List<Map<String, Object>> movies = new ArrayList<>();
        String sql = "SELECT m.title, COUNT(b.booking_id) as booking_count, " +
                    "SUM(b.total_price) as total_revenue " +
                    "FROM movies m " +
                    "LEFT JOIN booking b ON m.id = b.movie_id " +
                    "GROUP BY m.id, m.title " +
                    "ORDER BY booking_count DESC " +
                    "LIMIT 10";
        
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                Map<String, Object> movie = new HashMap<>();
                movie.put("title", rs.getString("title"));
                movie.put("bookingCount", rs.getInt("booking_count"));
                movie.put("revenue", rs.getDouble("total_revenue"));
                movies.add(movie);
            }
        }
        return movies;
    }

    private List<Map<String, Object>> getTopRatedMovies() throws SQLException {
        List<Map<String, Object>> movies = new ArrayList<>();
        String sql = "SELECT title, rating, genre FROM movies " +
                    "WHERE rating > 0 " +
                    "ORDER BY rating DESC LIMIT 10";
        
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                Map<String, Object> movie = new HashMap<>();
                movie.put("title", rs.getString("title"));
                movie.put("rating", rs.getInt("rating"));
                movie.put("genre", rs.getString("genre"));
                movies.add(movie);
            }
        }
        return movies;
    }

    private Map<String, Object> getRevenueStatistics() throws SQLException {
        Map<String, Object> stats = new HashMap<>();
        String sql = "SELECT SUM(total_price) as total_revenue, " +
                    "COUNT(*) as total_bookings " +
                    "FROM booking";
        
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            if (rs.next()) {
                stats.put("totalRevenue", rs.getDouble("total_revenue"));
                stats.put("totalBookings", rs.getInt("total_bookings"));
            }
        }
        return stats;
    }

    private List<Map<String, Object>> getPopularShowtimes() throws SQLException {
        List<Map<String, Object>> times = new ArrayList<>();
        String sql = "SELECT show_time, COUNT(*) as show_count " +
                    "FROM show_times " +
                    "GROUP BY show_time " +
                    "ORDER BY show_count DESC";
        
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                Map<String, Object> time = new HashMap<>();
                time.put("hour", rs.getTime("show_time").toString());
                time.put("count", rs.getInt("show_count"));
                times.add(time);
            }
        }
        return times;
    }

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }

    

    private List<Map<String, Object>> getGenreStatistics() throws SQLException {
        List<Map<String, Object>> genres = new ArrayList<>();
        String sql = "SELECT genre, COUNT(*) as movie_count, " +
                    "AVG(rating) as avg_rating " +
                    "FROM movies " +
                    "GROUP BY genre " +
                    "ORDER BY movie_count DESC";
        
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> genre = new HashMap<>();
                genre.put("name", rs.getString("genre"));
                genre.put("count", rs.getInt("movie_count"));
                genre.put("avgRating", rs.getDouble("avg_rating"));
                genres.add(genre);
            }
        }
        return genres;
    }

 
}