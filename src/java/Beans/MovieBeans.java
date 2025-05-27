package Beans;

import java.time.LocalDate;

public class MovieBeans {

    int id;
    private String title;
    private String genre;
    private LocalDate release_date;
    private String language;
    private int rating;
    private String production_company;
    private String country;
    private int admin_id;
    private int age_rating;
    private String poster_url;
    private int duration;
    private String description;

    private String trailer_url;

    public MovieBeans(String title, String genre, LocalDate release_date, String language, int rating, String production_company, String country, int admin_id, int age_rating, String poster_url, int duration, String description, String trailer_url, int id) {
        this.id = id;
        this.title = title;
        this.genre = genre;
        this.release_date = release_date;
        this.language = language;
        this.rating = rating;
        this.production_company = production_company;
        this.country = country;
        this.admin_id = admin_id;
        this.age_rating = age_rating;
        this.poster_url = poster_url;
        this.duration = duration;
        this.description = description;
        this.trailer_url = trailer_url;
    }

    public String getTrailer_url() {
        return trailer_url;
    }

    public void setTrailer_url(String trailer_url) {
        this.trailer_url = trailer_url;
    }

    public MovieBeans() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public LocalDate getRelease_date() {
        return release_date;
    }

    public void setRelease_date(LocalDate realse_date) {
        this.release_date = realse_date;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getProduction_company() {
        return production_company;
    }

    public void setProduction_company(String production_company) {
        this.production_company = production_company;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public int getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(int admin_id) {
        this.admin_id = admin_id;
    }

    public int getAge_rating() {
        return age_rating;
    }

    public void setAge_rating(int age_rating) {
        this.age_rating = age_rating;
    }

    public String getPoster_url() {
        return poster_url;
    }

    public void setPoster_url(String poster_url) {
        this.poster_url = poster_url;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
