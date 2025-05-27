package DAO;

import JavaBeans.AdminBeans;
import JavaBeans.UserBeans;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class AdminUserDAO {
    
    String DBurl = "jdbc:mysql://localhost:3306/cinema";
    String driverName = "com.mysql.cj.jdbc.Driver";
    String DBuser = "root";
    String DBpassword = "12345678";

    //retrieve all 
    String sql = "SELECT * FROM users";
    
    public List<UserBeans> getUsers() {
        List<UserBeans> userList = new ArrayList<>();
        
        try {
            
            Connection con = DriverManager.getConnection(DBurl, DBuser, DBpassword);
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                UserBeans user = new UserBeans();
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setPhone_number(rs.getInt("phone_number"));
                user.setAge(rs.getInt("age"));
                user.setFname(rs.getString("fname"));
                user.setLname(rs.getString("lname"));
                user.setId(rs.getInt("id"));
                
                userList.add(user);
                
            }
            rs.close();
            ps.close();
            con.close();
        } catch (SQLException e) {
            
            e.printStackTrace();
        }
        return userList;
    }
}
