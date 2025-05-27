<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Cinema Manager Dashboard</title>
        <style>
            .dashboard {
                max-width: 1200px;
                margin: 0 auto;
                padding: 20px;
            }
            .stats-grid {
                display: grid;
                grid-template-columns: repeat(2, 1fr);
                gap: 20px;
                margin-bottom: 20px;
            }
            .stat-card {
                background: white;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 10px;
            }
            th, td {
                padding: 12px;
                text-align: left;
                border: 1px solid #ddd;
            }
            th {
                background-color: #f5f5f5;
            }
        </style>
    </head>
    <body>
        <div class="dashboard">
            <h1>Cinema Manxager Dashboard</h1>

            <!-- Debug Info -->
<!--            <div style="margin-bottom: 20px; padding: 10px; background: #f8f9fa; border: 1px solid #ddd;">
                <h3>Debug Information</h3>
                <p>Statistics Object Present: ${not empty statistics}</p>
                <p>Top Movies Present: ${not empty statistics.topMoviesByBookings}</p>
                <p>Top Rated Present: ${not empty statistics.topRatedMovies}</p>
                <p>Revenue Stats Present: ${not empty statistics.revenueStats}</p>
                <p>Showtimes Present: ${not empty statistics.popularShowtimes}</p>
            </div>-->

            <div class="stats-grid">
                <!-- Top Movies by Bookings -->
                <div class="stat-card">
                    <h2>Top Movies by Bookings</h2>
                    <table>
                        <tr>
                            <th>Movie</th>
                            <th>Bookings</th>
                            <th>Revenue</th>
                        </tr>
                        <c:forEach items="${statistics.topMoviesByBookings}" var="movie">
                            <tr>
                                <td>${movie.title}</td>
                                <td>${movie.bookingCount}</td>
                                <td><fmt:formatNumber value="${movie.revenue}" type="currency"/></td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>

                <!-- Top Rated Movies -->
                <div class="stat-card">
                    <h2>Top Rated Movies</h2>
                    <table>
                        <tr>
                            <th>Movie</th>
                            <th>Rating</th>
                            <th>Genre</th>
                        </tr>
                        <c:forEach items="${statistics.topRatedMovies}" var="movie">
                            <tr>
                                <td>${movie.title}</td>
                                <td>${movie.rating}/10</td>
                                <td>${movie.genre}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>

                <!-- Revenue Statistics -->
                <div class="stat-card">
                    <h2>Revenue Overview</h2>
                    <c:if test="${not empty statistics.revenueStats}">
                        <p>Total Revenue: <fmt:formatNumber value="${statistics.revenueStats.totalRevenue}" type="currency"/></p>
                        <p>Total Bookings: ${statistics.revenueStats.totalBookings}</p>
                    </c:if>
                </div>

                <!-- Popular Show Times -->
                <div class="stat-card">
                    <h2>Popular Show Times</h2>
                    <table>
                        <tr>
                            <th>Time</th>
                            <th>Number of Shows</th>
                        </tr>
                        <c:forEach items="${statistics.popularShowtimes}" var="time">
                            <tr>
                                <td>${time.hour}</td>
                                <td>${time.count}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
            <!-- Management Actions -->
            <div class="actions">
                <h2>Management Actions</h2>
                <button class="btn" onclick="location.href = 'ShowtimeServlet'">Manage Show Times</button>
                <button class="btn" onclick="location.href = 'PriceManagementServlet'">Update Movie Prices</button>
      
                <button class="btn" onclick="location.href = 'ReportServlet'">Generate Reports</button>
            </div>
        </div>
    </body>
</html>