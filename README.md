# 🎬 CinemaProject

CinemaProject is a Java web application that allows users to browse movies, register/login, view movie details, select showtimes, book seats, and confirm bookings. Built using JSP, Servlets, and MySQL, and designed for deployment on Apache Tomcat.

## ✨ Features

- 🧑‍💻 User registration and login
- 🎞️ Movie listing and detail pages
- 🪑 Seat selection and booking confirmation
- 📨 Booking summary with user info
- 🎯 Admin-ready backend structure
- ✅ Session-based user experience

## 🚀 Technologies Used

- Java (JSP + Servlets)
- Apache Tomcat
- MySQL
- JSTL (JSP Standard Tag Library)
- JSON Simple (for light-weight data operations)
- NetBeans IDE (recommended)

## 🗂️ Project Structure

- `*.jsp` – Frontend views (e.g. home, login, booking)
- `Servlet/*.java` – Controllers (e.g. LoginServlet, BookingServlet)
- `Beans/*.java` – JavaBeans (e.g. MovieBeans, ShowtimeBeans)
- `DAO/*.java` – Data Access (e.g. UserDAO)
- `DatabaseUtil.java` – JDBC connection handler
- `web.xml` – Web deployment descriptor
- `context.xml` – Context configuration for Tomcat

## 📦 How to Run

1. Clone this repository
2. Import the project into NetBeans IDE
3. Configure database connection in `DatabaseUtil.java`
4. Deploy the app on Apache Tomcat
5. Visit `http://localhost:8080/CinemaProject` in your browser

## 📄 License

This project is for educational purposes only.
