<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <title>Showtime Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-group input, .form-group select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f8f9fa;
        }
        .btn {
            padding: 8px 16px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn-danger {
            background-color: #dc3545;
        }
        .btn:hover {
            opacity: 0.9;
        }
        .success-msg {
            color: green;
            padding: 10px;
            background: #e8f5e9;
            border-radius: 4px;
            margin-bottom: 20px;
        }
        .error-msg {
            color: red;
            padding: 10px;
            background: #ffebee;
            border-radius: 4px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
         <a href="JSP/ManagerDashboard.jsp" class="back-link">← Back to Dashboard</a>
        <h1>Showtime Management</h1>
        
        <!-- Success/Error Messages -->
        <c:if test="${not empty successMessage}">
            <div class="success-msg">${successMessage}</div>
        </c:if>
        <c:if test="${not empty errorMessage}">
            <div class="error-msg">${errorMessage}</div>
        </c:if>

        <!-- Add Showtime Form -->
        <h2>Add New Showtime</h2>
        <form action="ShowtimeServlet" method="post">
            <input type="hidden" name="action" value="add">
            
            <div class="form-group">
                <label for="movieId">Movie:</label>
                <select name="movieId" required>
                    <c:forEach items="${movies}" var="movie">
                        <option value="${movie.id}">${movie.title}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label for="showDate">Show Date:</label>
                <input type="date" name="showDate" required>
            </div>

            <div class="form-group">
                <label for="showTime">Show Time:</label>
                <input type="time" name="showTime" required>
            </div>

            <div class="form-group">
                <label for="availableSeats">Available Seats:</label>
                <input type="number" name="availableSeats" min="1" value="50" required>
            </div>

            <button type="submit" class="btn">Add Showtime</button>
        </form>

        <!-- Showtimes List -->
        <h2>Current Showtimes</h2>
        <table>
            <tr>
                <th>Movie</th>
                <th>Date</th>
                <th>Time</th>
                <th>Available Seats</th>
                <th>Actions</th>
            </tr>
            <c:forEach items="${showtimes}" var="showtime">
                <tr>
                    <td>${showtime.movieTitle}</td>
                    <td><fmt:formatDate value="${showtime.showDate}" pattern="yyyy-MM-dd"/></td>
                    <td><fmt:formatDate value="${showtime.showTime}" pattern="HH:mm"/></td>
                    <td>${showtime.availableSeats}</td>
                    <td>
                        <form action="ShowtimeServlet" method="post" style="display: inline;">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="showtimeId" value="${showtime.id}">
                            <button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this showtime?')">Delete</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>