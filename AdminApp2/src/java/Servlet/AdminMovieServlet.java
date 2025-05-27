
package Servlet;

import DAO.AdminMovieDAO;
import JavaBeans.MovieBeans;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class AdminMovieServlet extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
     
          

        //create instance of AdminUserDAO
        AdminMovieDAO AdminMovieDAO = new AdminMovieDAO();

        // Call the getMovies method to retrieve a list of users
        List<MovieBeans> movieList = AdminMovieDAO.getMovies();

        // Store the movieList in the request scope
        request.setAttribute("movieList", movieList);

        // Forward the request to  movieManagement.JSP where users data wil be displayed 
        request.getRequestDispatcher("JSP/movieManagement.jsp").forward(request, response);

        }
    }
