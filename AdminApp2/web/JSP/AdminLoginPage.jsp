<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <style>
            body {
                background-color: #f2f2f2;
                font-family: Arial, sans-serif;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
            }

            .login-container {
                width: 300px;
                padding: 20px;
                background-color: #262626; /* Updated background color */
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .login-container h2 {
                text-align: center;
                color: #FFFFFF; /* Updated text color */
            }

            input[type="text"],
            input[type="password"] {
                width: 100%;
                padding: 12px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                box-sizing: border-box;
                border-radius: 4px;
            }

            input[type="submit"] {
                width: 100%;
                background-color: #4CAF50;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            input[type="submit"]:hover {
                background-color: #45a049;
            }

            .signup-link {
                text-align: center;
                margin-top: 16px;
            }

            .signup-link a {
                text-decoration: none;
                color: #4CAF50;
            }
        </style>
    </head>
    <body style="margin-bottom: 10px; background-color: #1A1A1A; color: #FFFFFF; margin-left: 0; margin-right: 0; margin-top: 0;">    <div class="login-container">
            <h2>Login</h2>
            <form action="<c:url value="AdminLoginServlet"/>" method="post"> 
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Your username.." required>

                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Your password.." required>

               
                <input type="submit" value="Submit">
            </form>

            <!-- Add the error message display code
            if the errormessage defined in the  LoginServlet is not empty, display it -->
            <c:if test="${not empty errorMessage}">
                <p style="color: red; text-align: center;">${errorMessage}</p>  
            </c:if>

    </body>
</html>
