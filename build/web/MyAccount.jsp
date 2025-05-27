<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>My Account</title>
    </head>
    <body>

        <jsp:include page="menuBarTemplate.jsp" />

        <div class="slider-container" style="margin-top: 100px;">
            <%--the user instance is in the userDAO--%>
            <h1>My Account Details</h1>
            <c:if test="${empty user}">
                <p>No user data available.</p>
            </c:if>
            <c:if test="${not empty user}">
                <p>Username: ${user.username}</p>
                <p>First Name: ${user.fname}</p>
                <p>Last Name: ${user.lname}</p>
                <p>Age: ${user.age}</p>
                <p>Email: ${user.email}</p>
                <p>Phone Number: ${user.phone_number}</p>
            </c:if>

        </div>
    </body>
</html>
