<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <title>Movie Price Management</title>
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
            margin: 5px;
        }
        .btn:hover {
            opacity: 0.9;
        }
        .price-input {
            width: 100px;
            padding: 6px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .message {
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 4px;
        }
        .success {
            background-color: #d4edda;
            color: #155724;
        }
        .error {
            background-color: #f8d7da;
            color: #721c24;
        }
        .back-link {
            margin-bottom: 20px;
            display: block;
        }
    </style>
</head>
<body>
    <div class="container">
        <a href="JSP/ManagerDashboard.jsp" class="back-link">← Back to Dashboard</a>
        <h1>Movie Price Management</h1>

        <!-- Messages -->
        <c:if test="${not empty successMessage}">
            <div class="message success">${successMessage}</div>
        </c:if>
        <c:if test="${not empty errorMessage}">
            <div class="message error">${errorMessage}</div>
        </c:if>

        <!-- Movies Price List -->
        <form action="PriceManagementServlet" method="post">
            <table>
                <tr>
                    <th>Movie Title</th>
                    <th>Current Price</th>
                    <th>New Price</th>
                    <th>Rating</th>
                    <th>Genre</th>
                    <th>Action</th>
                </tr>
                <c:forEach items="${movies}" var="movie">
                    <tr>
                        <td>${movie.title}</td>
                        <td>$<fmt:formatNumber value="${movie.price}" type="number" minFractionDigits="2" maxFractionDigits="2"/></td>
                        <td>
                            <input type="number" name="price_${movie.id}" class="price-input" 
                                   step="0.01" min="0" value="${movie.price}">
                        </td>
                        <td>${movie.rating}/10</td>
                        <td>${movie.genre}</td>
                        <td>
                            <button type="submit" name="movieId" value="${movie.id}" class="btn">
                                Update Price
                            </button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </form>

        <!-- Bulk Price Update -->
        <div style="margin-top: 30px;">
            <h2>Bulk Price Update</h2>
            <form action="PriceManagementServlet" method="post">
                <input type="hidden" name="action" value="bulk_update">
                <div style="margin-bottom: 15px;">
                    <label style="margin-right: 10px;">
                        <input type="radio" name="updateType" value="percentage" required> 
                        Percentage Change
                    </label>
                    <label>
                        <input type="radio" name="updateType" value="fixed" required> 
                        Fixed Amount Change
                    </label>
                </div>
                <div style="margin-bottom: 15px;">
                    <input type="number" name="changeValue" step="0.01" required 
                           placeholder="Enter value" class="price-input" style="margin-right: 10px;">
                    <button type="submit" class="btn">Apply to All Movies</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>