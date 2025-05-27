<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>User List</title>
        <style>
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            th, td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
            .delete-form {
                margin-top: 20px;
                padding: 10px;
                border: 1px solid #ddd;
                background-color: #f9f9f9;
            }
            .delete-form input[type="text"] {
                padding: 5px;
                margin-right: 10px;
            }
            .delete-form button {
                padding: 5px 10px;
                background-color: #ff4444;
                color: white;
                border: none;
                cursor: pointer;
            }
            .delete-form button:hover {
                background-color: #cc0000;
            }
        </style>
        <script>
            function confirmDelete() {
                var userId = document.getElementById('userId').value;
                if (!userId) {
                    alert('Please enter a User ID');
                    return false;
                }
                if (confirm('Warning: Deleting this user will also delete all their bookings. Are you sure you want to continue?')) {
                    document.getElementById('deleteForm').submit();
                }
                return false;
            }
        </script>
    </head>
    <body>
        <table>
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Password</th>
                <th>Email</th>
                <th>Phone Number</th>
                <th>Age</th>
                <th>First Name</th>
                <th>Last Name</th>
            </tr>
            <c:forEach var="user" items="${userList}">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.username}</td>
                    <td>${user.password}</td>
                    <td>${user.email}</td>
                    <td>${user.phone_number}</td>
                    <td>${user.age}</td>
                    <td>${user.fname}</td>
                    <td>${user.lname}</td>
                </tr>
            </c:forEach>
        </table>

        <%-- Delete user form --%>
        <div class="delete-form">
            <form id="deleteForm" action="DeleteUserServlet" method="post">
                <input type="text" name="userId" id="userId" placeholder="Enter User ID to delete">
                <button type="button" onclick="confirmDelete()">Delete User</button>
            </form>
        </div>
    </body>
</html>