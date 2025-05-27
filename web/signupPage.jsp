<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Sign Up</title>
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

            .signup-container {
                width: 300px;
                padding: 20px;
                background-color: #262626; /* Updated background color */
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .signup-container h2 {
                text-align: center;
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
        </style>
    </head>
    <body style="margin-bottom: 10px; background-color: #1A1A1A; color: #FFFFFF; margin-left: 0; margin-right: 0; margin-top: 0;">    <div class="signup-container">
            <h2>Sign Up</h2>
             <form action="SignupServlet" method="post"> 
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Choose a username.." required>

                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Choose a password.." required>

                <label for="email">Email</label>
                <input type="text" id="email" name="email" placeholder="Your email.." required>

                <label for="fname">First Name</label>
                <input type="text" id="fname" name="fname" placeholder="your first name.." required>

                <label for="lname">Last Name</label>
                <input type="text" id="lname" name="lname" placeholder="Your last name.." required>

                <label for="age">Age</label>
                <input type="text" id="age" name="age" placeholder="Your age.." required>

                <label for="phone_number">Phone Number</label>
                <input type="text" id="phone_number" name="phone_number" placeholder="Your phone number.." required>
                
                <input type="submit" value="Sign Up">
                
                <c:if test="${not empty signupErrorMessage}">
                    <p style="color: red; text-align: center;">${signupErrorMessage}</p>  
                </c:if

            </form>
        </div>
    </body>
</html>
