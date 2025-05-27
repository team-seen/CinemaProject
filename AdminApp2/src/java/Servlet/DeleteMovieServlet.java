package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteMovieServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/cinema";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "12345678";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String movieId = request.getParameter("movieId");

        try {
            deleteMovieAndRelatedData(movieId);
             request.getRequestDispatcher("AdminMovieServlet").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("Error deleting movie: " + e.getMessage());
        }
    }

    private void deleteMovieAndRelatedData(String movieId) throws SQLException {
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            conn.setAutoCommit(false);

            // First delete related bookings
            String deleteBookingsSQL = "DELETE FROM booking WHERE movie_id = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(deleteBookingsSQL)) {
                pstmt.setString(1, movieId);
                pstmt.executeUpdate();
            }

            // Then delete showtimes
            String deleteShowtimesSQL = "DELETE FROM show_times WHERE movie_id = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(deleteShowtimesSQL)) {
                pstmt.setString(1, movieId);
                pstmt.executeUpdate();
            }

            // Finally delete the movie
            String deleteMovieSQL = "DELETE FROM movies WHERE id = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(deleteMovieSQL)) {
                pstmt.setString(1, movieId);
                pstmt.executeUpdate();
            }

            conn.commit();
        } catch (SQLException e) {
            if (conn != null) {
                conn.rollback();
            }
            throw e;
        } finally {
            if (conn != null) {
                conn.setAutoCommit(true);
                conn.close();
            }
        }
    }
}