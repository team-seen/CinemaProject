package JavaClass;

import Beans.UserBeans;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import java.sql.*;

public class UserDAO {
    //connet to databasse

    Connection con = null;
    Statement stmt = null;

    String databaseURL = "jdbc:mysql://localhost:3306/Cinema_db";
    String driverName = "com.mysql.cj.jdbc.Driver";
    String DBuser = "root";
    String DBpassword = "root";

    //retries all columns except the password
    private static final String sql = "SELECT  email, phone_number, age, fname, lname FROM users WHERE username = ?";

    public UserBeans getUserByUsername(String username) {
        UserBeans user = null;

        try (Connection connection = DriverManager.getConnection(databaseURL, DBuser, DBpassword);
                PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, username);

            ResultSet rs = preparedStatement.executeQuery();

            // retrieve same names and same order of the columns in the users table
            if (rs.next()) {
                user = new UserBeans();
                user.setUsername(username);
                user.setEmail(rs.getString("email"));
                user.setPhone_number(rs.getInt("phone_number"));
                user.setAge(rs.getInt("age"));
                user.setFname(rs.getString("fname"));
                user.setLname(rs.getString("lname"));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }
}
