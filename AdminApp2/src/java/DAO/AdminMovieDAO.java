package DAO;

import JavaBeans.MovieBeans;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class AdminMovieDAO {

    String DBurl = "jdbc:mysql://localhost:3306/cinema";
    String driverName = "com.mysql.cj.jdbc.Driver";
    String DBuser = "root";
    String DBpassword = "12345678";

    //retrieve all 
    String sql = "SELECT * FROM movies";

    public List<MovieBeans> getMovies() {
        List<MovieBeans> movieList = new ArrayList<>();

        try {

            Connection con = DriverManager.getConnection(DBurl, DBuser, DBpassword);
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                MovieBeans movie = new MovieBeans();
                movie.setId(rs.getInt("id"));
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

                movieList.add(movie);

            }
            rs.close();
            ps.close();
            con.close();
        } catch (SQLException e) {

            e.printStackTrace();
        }
        return movieList;
    }
}


