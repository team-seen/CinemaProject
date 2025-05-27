package Servlet;

import Beans.UserBeans;
import JavaClass.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UserServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("loggedInUser");

        UserDAO userDAO = new UserDAO();
        UserBeans user = userDAO.getUserByUsername(username);

        request.setAttribute("user", user);
        request.getRequestDispatcher("/MyAccount.jsp").forward(request, response);
        
    }

}
