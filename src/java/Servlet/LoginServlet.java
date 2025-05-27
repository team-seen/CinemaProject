package Servlet;

import Beans.UserBeans;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // JDBC URL, username, and password of MySQL server
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/Cinema_d";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Connection con = null;
        Statement stmt = null;

        String databaseURL = "jdbc:mysql://localhost:3306/Cinema_db";
        String driverName = "com.mysql.cj.jdbc.Driver";
        String DBuser = "root";
        String DBpassword = "root";

        try {
            Class.forName(driverName).newInstance();
            con = DriverManager.getConnection(databaseURL, DBuser, DBpassword);
            stmt = con.createStatement();

            // SQL query to check the user's credentials
            String sql = "SELECT username FROM users WHERE username = ? AND password = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet resultSet = ps.executeQuery();
            if (resultSet.next()) {
                // User is authenticated, set a session attribute
                HttpSession session = request.getSession();
                session.setAttribute("loggedInUser", username);

                // Redirect to the home page
                response.sendRedirect("homePage.jsp");
            } else {
                // Invalid credentials, show an error message
                request.setAttribute("errorMessage", "Username or password is incorrect.");
                request.getRequestDispatcher("loginPage.jsp").forward(request, response);
            }

          

        } catch (Exception e) {
            System.out.println("Error connetcting to database" + e);
            return;

        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
