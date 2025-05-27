<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <title>Generate Reports</title>
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
        .report-section {
            margin-bottom: 30px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
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
        .summary-box {
            background: #f8f9fa;
            padding: 15px;
            border-radius: 4px;
            margin-bottom: 20px;
        }
        .stat {
            display: inline-block;
            margin-right: 20px;
            margin-bottom: 10px;
        }
        .stat-label {
            font-weight: bold;
            margin-bottom: 5px;
        }
        .stat-value {
            font-size: 1.2em;
            color: #007bff;
        }
        select, input[type="date"] {
            padding: 8px;
            border-radius: 4px;
            border: 1px solid #ddd;
            margin-right: 10px;
        }
        .occupancy-good { color: #28a745; }
        .occupancy-warning { color: #ffc107; }
        .occupancy-low { color: #dc3545; }
    </style>
</head>
<body>
    <div class="container">
        <a href="JSP/ManagerDashboard.jsp" style="text-decoration: none; color: #666; margin-bottom: 20px; display: block;">
            ← Back to Dashboard
        </a>
        <h1>Generate Reports</h1>

        <!-- Report Selection Form -->
        <div class="report-section">
            <form action="ReportServlet" method="get">
                <div class="form-group">
                    <label>Select Report Type:</label>
                    <select name="type" required>
                        <option value="revenue" ${reportType eq 'revenue' ? 'selected' : ''}>Revenue Report</option>
                       
                    </select>
                </div>
                <div class="form-group">
                    <label>Date Range:</label>
                    <input type="date" name="startDate" value="${startDate}" required>
                    to
                    <input type="date" name="endDate" value="${endDate}" required>
                </div>
                <button type="submit" class="btn">Generate Report</button>
            </form>
        </div>

        <!-- Report Display -->
        <c:if test="${not empty reportData}">
            <div class="report-section">
                <h2>
                    <c:choose>
                        <c:when test="${reportType eq 'revenue'}">Revenue Report</c:when>
                     
                    </c:choose>
                </h2>
                
                <!-- Revenue Report -->
                <c:if test="${reportType eq 'revenue'}">
                    <div class="summary-box">
                        <div class="stat">
                            <div class="stat-label">Total Revenue</div>
                            <div class="stat-value">$<fmt:formatNumber value="${reportData.totalRevenue}" pattern="#,##0.00"/></div>
                        </div>
                        <div class="stat">
                            <div class="stat-label">Total Bookings</div>
                            <div class="stat-value">${reportData.totalBookings}</div>
                        </div>
                        <div class="stat">
                            <div class="stat-label">Average Revenue per Booking</div>
                            <div class="stat-value">$<fmt:formatNumber value="${reportData.averageRevenuePerBooking}" pattern="#,##0.00"/></div>
                        </div>
                    </div>
                    
                    <table>
                        <tr>
                            <th>Date</th>
                            <th>Bookings</th>
                            <th>Revenue</th>
                        </tr>
                        <c:forEach items="${reportData.dailyData}" var="day">
                            <tr>
                                <td><fmt:formatDate value="${day.date}" pattern="yyyy-MM-dd"/></td>
                                <td>${day.bookings}</td>
                                <td>$<fmt:formatNumber value="${day.revenue}" pattern="#,##0.00"/></td>
                            </tr>
                        </c:forEach>
                    </table>
                </c:if>

                <!-- Popular Movies Report -->
                <c:if test="${reportType eq 'popular_movies'}">
                    <table>
                        <tr>
                            <th>Movie Title</th>
                            <th>Genre</th>
                            <th>Bookings</th>
                            <th>Revenue</th>
                            <th>Rating</th>
                        </tr>
                        <c:forEach items="${reportData.movieStats}" var="movie">
                            <tr>
                                <td>${movie.title}</td>
                                <td>${movie.genre}</td>
                                <td>${movie.bookings}</td>
                                <td>$<fmt:formatNumber value="${movie.revenue}" pattern="#,##0.00"/></td>
                                <td>${movie.rating}/10</td>
                            </tr>
                        </c:forEach>
                    </table>
                </c:if>

                <!-- Occupancy Report -->
                <c:if test="${reportType eq 'occupancy'}">
                    <table>
                        <tr>
                            <th>Date</th>
                            <th>Time</th>
                            <th>Movie</th>
                            <th>Seats Booked</th>
                            <th>Total Seats</th>
                            <th>Occupancy Rate</th>
                        </tr>
                        <c:forEach items="${reportData.occupancyData}" var="showing">
                            <tr>
                                <td><fmt:formatDate value="${showing.date}" pattern="yyyy-MM-dd"/></td>
                                <td><fmt:formatDate value="${showing.time}" pattern="HH:mm"/></td>
                                <td>${showing.movie}</td>
                                <td>${showing.bookedSeats}</td>
                                <td>${showing.totalSeats}</td>
                                <td class="${showing.occupancyRate >= 80 ? 'occupancy-good' : 
                                           showing.occupancyRate >= 50 ? 'occupancy-warning' : 'occupancy-low'}">
                                    <fmt:formatNumber value="${showing.occupancyRate}" pattern="#,##0.0"/>%
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </c:if>

                <!-- User Activity Report -->
                <c:if test="${reportType eq 'user_activity'}">
                    <table>
                        <tr>
                            <th>Username</th>
                            <th>Email</th>
                            <th>Total Bookings</th>
                            <th>Total Spent</th>
                        </tr>
                        <c:forEach items="${reportData.userActivity}" var="user">
                            <tr>
                                <td>${user.username}</td>
                                <td>${user.email}</td>
                                <td>${user.bookings}</td>
                                <td>$<fmt:formatNumber value="${user.totalSpent}" pattern="#,##0.00"/></td>
                            </tr>
                        </c:forEach>
                    </table>
                </c:if>
            </div>
        </c:if>
    </div>
</body>
</html>