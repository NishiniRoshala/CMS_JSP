<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sign Up</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #0d0d0d;
            color: #fff;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            background-color: #1a1a1a;
            padding: 40px 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(255, 77, 148, 0.3);
            width: 350px;
            text-align: center;
        }

        h1 {
            color: #ff4d94;
            margin-bottom: 10px;
        }

        p {
            color: #ccc;
            font-size: 14px;
            margin-bottom: 25px;
        }

        input[type="text"],
        input[type="password"],
        select {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ff4d94;
            border-radius: 5px;
            background-color: #262626;
            color: #fff;
            font-size: 14px;
        }

        input::placeholder {
            color: #aaa;
        }

        select {
            background-color: #262626;
            color: #fff;
        }

        .btn {
            background-color: #ff4d94;
            color: #fff;
            border: none;
            padding: 12px;
            width: 100%;
            border-radius: 5px;
            font-size: 15px;
            cursor: pointer;
            transition: background 0.3s;
        }

        .btn:hover {
            background-color: #e60073;
        }

        .message {
            margin-bottom: 15px;
            padding: 10px;
            border-radius: 5px;
            font-size: 14px;
        }

        .success {
            background-color: #28a745;
            color: #fff;
        }

        .error {
            background-color: #dc3545;
            color: #fff;
        }
    </style>
</head>
<body>

<div class="container">
    <%-- Optional success or error messages --%>
    <%
        String success = request.getParameter("success");
        String error = request.getParameter("error");
        if ("true".equals(success)) {
    %>
    <div class="message success">✓ User registered successfully!</div>
    <% } else if ("true".equals(error)) { %>
    <div class="message error">✗ Error registering user.</div>
    <% } %>

    <h1>Sign Up</h1>
    <p>Create a new account</p>

    <form action="${pageContext.request.contextPath}/signup" method="post">
        <input type="text" name="username" placeholder="Username" required>
        <input type="text" name="fullname" placeholder="Full Name" required>
        <input type="password" name="password" placeholder="Password" required>
        <input type="password" name="confirmPassword" placeholder="Confirm Password" required>

        <select name="role" required>
            <option value="" disabled selected>Select Role</option>
            <option value="Employee">Employee</option>
            <option value="Admin">Admin</option>
        </select>

        <button type="submit" class="btn">Sign Up</button>
    </form>
</div>

</body>
</html>
