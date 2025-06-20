<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Complaint Management System</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #000;
            color: #fff;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .login-container {
            background-color: #1a1a1a;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px #ff4d94;
            width: 100%;
            max-width: 400px;
            text-align: center;
        }

        .login-container h1 {
            color: #ff4d94;
            margin-bottom: 10px;
        }

        .login-container p {
            color: #ccc;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #ff4d94;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ff4d94;
            border-radius: 5px;
            background-color: #333;
            color: #fff;
        }

        .login-btn {
            width: 100%;
            padding: 10px;
            background-color: #ff4d94;
            border: none;
            border-radius: 5px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
        }

        .divider {
            margin: 20px 0;
            color: #aaa;
        }

        .signup-link {
            color: #ff4d94;
            text-decoration: none;
        }

        .success-message, .error-message {
            background-color: #333;
            border-left: 5px solid;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 5px;
        }

        .success-message {
            border-color: #28a745;
            color: #28a745;
        }

        .error-message {
            border-color: #dc3545;
            color: #dc3545;
        }
    </style>
</head>
<body>
<div class="login-container">
    <h1>Complaint Management</h1>
    <p>Login to your account</p>

    <% String success = request.getParameter("success"); %>
    <% String error = request.getParameter("error"); %>

    <% if ("true".equals(success)) { %>
    <div class="success-message">
        ✓ Successfully signed up! Please login.
    </div>
    <% } %>

    <% if ("true".equals(error)) { %>
    <div class="error-message">
        ✗ Invalid username or password.
    </div>
    <% } %>

    <form action="signin" method="post">
        <div class="form-group">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" required>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" required>
        </div>
        <button type="submit" class="login-btn">Login</button>
    </form>

    <div class="divider">Don't have an account?</div>
    <a href="View/signup.jsp" class="signup-link">Sign Up Here</a>
</div>
</body>
</html>
