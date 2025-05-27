package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class SignupServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Get form parameters
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("email");
        String age = request.getParameter("age");
        String phone_number = request.getParameter("phone_number");

        // Database connection parameters
        //connet to databasse
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
        } catch (Exception e) {
            System.out.println("Error connetcting to database" + e);
            return;

        }

        // Check if username already exists in the database
        String sql = "SELECT * FROM users WHERE username = '" + username + "'";

        try {
            ResultSet resultSet = stmt.executeQuery(sql);
            boolean usernameExists = false; // Flag to check if the username already exists
            String signupErrorMessage = "username already exists";
            if (resultSet.next()) {
                // username already exists, set the flag to true
                usernameExists = true;
                request.setAttribute("signupErrorMessage", signupErrorMessage);
                request.getRequestDispatcher("signupPage.jsp").forward(request, response);

            } else {
                // username is unique, insert the book into the database

                String insertStmt = "INSERT INTO users (username,  password, email, phone_number, age,fname,lname) VALUES ("
                        + "'" + username + "', "
                        + "'" + password + "', "
                        + "'" + email + "', "
                        + "'" + phone_number + "', "
                        + "'" + age + "', "
                        + "'" + fname + "', "
                        + "'" + lname + "'"
                        + ")";
                try {
                    stmt.executeUpdate(insertStmt);
                    System.out.println("<h1>user added to the database successfully.</h1>");
                    // Set usernameExists as a request attribute
                    request.setAttribute("usernameExists", usernameExists);

                    HttpSession session = request.getSession();
                    session.setAttribute("loggedInUser", username);
                  
                    response.sendRedirect("homePage.jsp");

                } catch (SQLException e) {

                    System.out.println("ERROR: Insert into books DB: " + e);
                }
            }
        } catch (SQLException e) {

            System.out.println("ERROR: SQL Exception: " + e);
        }

    }
}
