package Servlet;

import Beans.MovieBeans;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class MovieDetailsServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String movieIdParameter = request.getParameter("movieId");

        List<MovieBeans> movieList;
        try {
            movieList = fetchMoviesFromDatabase();
            request.setAttribute("moviesList", movieList);

            RequestDispatcher dispatcher = request.getRequestDispatcher("homePage.jsp");
            dispatcher.forward(request, response);

            //Fetch the specific movie based on movieId
            if (movieIdParameter != null) {
                int movieId = Integer.parseInt(movieIdParameter);
                MovieBeans movie = findMovieById(movieList, movieId);
                // Forward to the JSP for displaying movie details
                //  Set the Movie object as an attribute to be accessed by the JSP
                request.setAttribute("movie", movie);
                request.getRequestDispatcher("movieDetailsPage.jsp").forward(request, response);

            } else {
                System.out.print("movieId is null");
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(MovieDetailsServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
// handle GET requests for displaying movie details

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String movieIdParameter = request.getParameter("movieId");

        List<MovieBeans> movieList;
        try {
            movieList = fetchMoviesFromDatabase();
            request.setAttribute("moviesList", movieList);

            if (movieIdParameter == null) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("homePage.jsp");
                dispatcher.forward(request, response);
            }

            //Fetch the specific movie based on movieId
            if (movieIdParameter != null) {
                int movieId = Integer.parseInt(movieIdParameter);
                MovieBeans movie = findMovieById(movieList, movieId);
                // Forward to the JSP for displaying movie details
                //  Set the Movie object as an attribute to be accessed by the JSP
                request.setAttribute("movie", movie);
                request.getRequestDispatcher("movieDetailsPage.jsp").forward(request, response);
            } else {
                System.out.print("movieId is null");
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(MovieDetailsServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private List<MovieBeans> fetchMoviesFromDatabase() throws ClassNotFoundException {
        List<MovieBeans> movieList = new ArrayList<>();

        // Database connection details
        String DBurl = "jdbc:mysql://localhost:3306/Cinema_db";
        String driverName = "com.mysql.cj.jdbc.Driver";
        String DBuser = "root";
        String DBpassword = "root";

        try {
            Class.forName(driverName).newInstance();
            Connection connection = DriverManager.getConnection(DBurl, DBuser, DBpassword);
            String sql = "SELECT * FROM movies";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                MovieBeans movie = new MovieBeans();

                movie.setTitle(rs.getString("title"));
                movie.setGenre(rs.getString("genre"));
                movie.setRelease_date(rs.getObject("release_date", LocalDate.class));
                movie.setLanguage(rs.getString("language"));
                movie.setRating(rs.getInt("rating"));
                movie.setProduction_company(rs.getString("production_company"));
                movie.setCountry(rs.getString("country"));

                movie.setAge_rating(rs.getInt("age_rating"));
                movie.setPoster_url(rs.getString("poster_url"));
                movie.setDuration(rs.getInt("duration"));
                movie.setDescription(rs.getString("description"));
movie.setTrailer_url(rs.getString("trailer_url"));
                movie.setId(rs.getInt("id"));

                // Set other movie attributes as needed
                movieList.add(movie);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print("while loop in movieDetailServlet ist sussceffl");
            // Handle database connection or query errors
        } catch (InstantiationException ex) {
            Logger.getLogger(MovieDetailsServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(MovieDetailsServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        return movieList;
    }

    private MovieBeans findMovieById(List<MovieBeans> movieList, int movieId) {
        for (MovieBeans movie : movieList) {
            if (movie.getId() == movieId) {
                return movie;
            }
        }
        return null; // Movie not found
    }
}
