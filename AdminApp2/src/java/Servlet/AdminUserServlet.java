
package Servlet;

import DAO.AdminUserDAO;

import JavaBeans.UserBeans;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class AdminUserServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        //create instance of AdminUserDAO
        AdminUserDAO AdminUserDAO = new AdminUserDAO();

        // Call the getUsers method to retrieve a list of users
        List<UserBeans> userList =AdminUserDAO.getUsers();

        // Store the userList in the request scope
        request.setAttribute("userList", userList);

        // Forward the request to  userManagement.JSP where users data wil be displayed 
        request.getRequestDispatcher("JSP/userManagement.jsp").forward(request, response);

    }

   
}
