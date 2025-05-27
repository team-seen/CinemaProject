package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddMovieServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        try (PrintWriter out = response.getWriter()) {
            try {
                // Validate and parse all parameters
                String title = validateString(request.getParameter("title"), "Title");
                String genre = validateString(request.getParameter("genre"), "Genre");
                LocalDate release_date = validateDate(request.getParameter("release_date"));
                String language = validateString(request.getParameter("language"), "Language");
                int rating = validateInt(request.getParameter("rating"), "Rating", 0, 10);
                String production_company = request.getParameter("production_company"); // Optional
                String country = validateString(request.getParameter("country"), "Country");
                int age_rating = validateInt(request.getParameter("age_rating"), "Age Rating", 0, 21);
                String poster_url = request.getParameter("poster_url"); // Optional
                int duration = validateInt(request.getParameter("duration"), "Duration", 1, 1000);
                String description = request.getParameter("description"); // Optional
                
                String DBurl = "jdbc:mysql://localhost:3306/cinema";
                String driverName = "com.mysql.cj.jdbc.Driver";
                String DBuser = "root";
                String DBpassword = "12345678";
                
                Class.forName(driverName);
                
                try (Connection con = DriverManager.getConnection(DBurl, DBuser, DBpassword);
                     PreparedStatement ps = con.prepareStatement(
                        "INSERT INTO movies (title, genre, release_date, language, rating, " +
                        "production_company, country, age_rating, poster_url, duration, description) " +
                        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)")) {
                    
                    ps.setString(1, title);
                    ps.setString(2, genre);
                    ps.setObject(3, release_date);
                    ps.setString(4, language);
                    ps.setInt(5, rating);
                    ps.setString(6, production_company != null ? production_company : "");
                    ps.setString(7, country);
                    ps.setInt(8, age_rating);
                    ps.setString(9, poster_url != null ? poster_url : "");
                    ps.setInt(10, duration);
                    ps.setString(11, description != null ? description : "");
                    
                    int rowsInserted = ps.executeUpdate();
                    if (rowsInserted > 0) {
                        request.getRequestDispatcher("AdminMovieServlet").forward(request, response);
                    } else {
                        throw new SQLException("Failed to insert movie");
                    }
                }
            } catch (ValidationException e) {
                out.println("Validation Error: " + e.getMessage());
            } catch (SQLException e) {
                out.println("Database Error: " + e.getMessage());
                e.printStackTrace(out);
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
                e.printStackTrace(out);
            }
        }
    }
    
    private String validateString(String value, String fieldName) throws ValidationException {
        if (value == null || value.trim().isEmpty()) {
            throw new ValidationException(fieldName + " is required");
        }
        return value.trim();
    }
    
    private int validateInt(String value, String fieldName, int min, int max) throws ValidationException {
        try {
            int intValue = Integer.parseInt(value.trim());
            if (intValue < min || intValue > max) {
                throw new ValidationException(fieldName + " must be between " + min + " and " + max);
            }
            return intValue;
        } catch (NumberFormatException e) {
            throw new ValidationException(fieldName + " must be a valid number");
        }
    }
    
    private LocalDate validateDate(String value) throws ValidationException {
        try {
            if (value == null || value.trim().isEmpty()) {
                throw new ValidationException("Release date is required");
            }
            return LocalDate.parse(value.trim());
        } catch (DateTimeParseException e) {
            throw new ValidationException("Invalid date format. Please use YYYY-MM-DD");
        }
    }
    
    private static class ValidationException extends Exception {
        public ValidationException(String message) {
            super(message);
        }
    }
}