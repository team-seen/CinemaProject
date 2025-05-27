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

public class PriceManagementServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/cinema";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "12345678";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Map<String, Object>> movies = getAllMovies();
            request.setAttribute("movies", movies);
            request.getRequestDispatcher("JSP/PriceManagement.jsp").forward(request, response);
        } catch (SQLException e) {
            request.setAttribute("errorMessage", "Error loading movies: " + e.getMessage());
            request.getRequestDispatcher("JSP/PriceManagement.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String action = request.getParameter("action");
            
            if ("bulk_update".equals(action)) {
                handleBulkUpdate(request);
            } else {
                // Single movie price update
                String movieId = request.getParameter("movieId");
                if (movieId != null) {
                    updateMoviePrice(movieId, request.getParameter("price_" + movieId));
                }
            }
            
            request.setAttribute("successMessage", "Prices updated successfully!");
        } catch (SQLException e) {
            request.setAttribute("errorMessage", "Error updating prices: " + e.getMessage());
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Error: " + e.getMessage());
        }
        
        doGet(request, response);
    }

    private List<Map<String, Object>> getAllMovies() throws SQLException {
        List<Map<String, Object>> movies = new ArrayList<>();
        String sql = "SELECT id, title, price, rating, genre FROM movies ORDER BY title";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Map<String, Object> movie = new HashMap<>();
                movie.put("id", rs.getInt("id"));
                movie.put("title", rs.getString("title"));
                movie.put("price", rs.getDouble("price"));
                movie.put("rating", rs.getInt("rating"));
                movie.put("genre", rs.getString("genre"));
                movies.add(movie);
            }
        }
        return movies;
    }

    private void updateMoviePrice(String movieId, String newPrice) throws SQLException {
        String sql = "UPDATE movies SET price = ? WHERE id = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setDouble(1, Double.parseDouble(newPrice));
            ps.setInt(2, Integer.parseInt(movieId));
            ps.executeUpdate();
        }
    }

    private void handleBulkUpdate(HttpServletRequest request) throws SQLException {
        String updateType = request.getParameter("updateType");
        double changeValue = Double.parseDouble(request.getParameter("changeValue"));
        
        String sql;
        if ("percentage".equals(updateType)) {
            sql = "UPDATE movies SET price = price * (1 + ?/100)";
        } else { // fixed amount
            sql = "UPDATE movies SET price = price + ?";
        }
        
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setDouble(1, changeValue);
            ps.executeUpdate();
        }
    }

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }
}