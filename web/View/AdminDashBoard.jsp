
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="Documents.AAD.JavaEE.Test_Project.Dao.AdminDao" %>
<%@ page import="Documents.AAD.JavaEE.Test_Project.Model.AdminModel" %>
<%@ page import="jakarta.annotation.Resource" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.xml.transform.Result" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="Documents.AAD.JavaEE.Test_Project.Model.AdminModel" %>

<html>
<head>
    <title>Admin Dashboard - Complaint Management System</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #000000;
            color: #f8d7e5;
        }
        .header {
            background-color: #8b005d;
            color: white;
            padding: 20px;
            text-align: center;
        }
        .container {
            padding: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #f06292;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #59003a;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #1a1a1a;
        }
        tr:hover {
            background-color: #2a2a2a;
        }
        .form-section {
            margin-top: 30px;
            background-color: #1a1a1a;
            padding: 20px;
            border-radius: 10px;
        }
        input, select, textarea {
            width: 100%;
            padding: 10px;
            margin-top: 8px;
            margin-bottom: 16px;
            background-color: #2a2a2a;
            border: 1px solid #f06292;
            color: white;
        }
        button {
            background-color: #f06292;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-right: 10px;
        }
        button:hover {
            background-color: #ec407a;
        }
        .status-label {
            padding: 5px 10px;
            border-radius: 5px;
            font-weight: bold;
        }
        .status-pending {
            background-color: #f39c12;
            color: black;
        }
        .status-in_progress {
            background-color: #3498db;
            color: white;
        }
        .status-resolved {
            background-color: #2ecc71;
            color: black;
        }
    </style>
</head>
<body>
<div class="header">
    <h1>Admin Dashboard</h1>
    <p>Complaint Management System</p>
</div>
<div class="container">
    <h2>Complaints</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>User ID</th>
            <th>Title</th>
            <th>Description</th>
            <th>Status</th>
            <th>Remark</th>
        </tr>
        <%
            List<AdminModel> complaints = (List<AdminModel>) request.getAttribute("complaints");
            if (complaints != null) {
                for (AdminModel c : complaints) {
        %>
        <tr>
            <td><%= c.getComplaint_id() %></td>
            <td><%= c.getUser_id() %></td>
            <td><%= c.getTitle() %></td>
            <td><%= c.getDescription() %></td>
            <td><span class="status-label status-<%= c.getStatus().toLowerCase().replace(" ", "_") %>"><%= c.getStatus() %></span></td>
            <td><%= c.getRemark() != null ? c.getRemark() : "N/A" %></td>
        </tr>
        <%
            }
        } else {
        %>
        <tr><td colspan="6">No complaints found.</td></tr>
        <% } %>
    </table>

    <div class="form-section">
        <h2>Manage Complaint</h2>
        <form method="post" action="${pageContext.request.contextPath}/admin">
            <input type="text" name="complaint_id" placeholder="Complaint ID" required />
            <input type="text" name="user_id" placeholder="User ID" required />
            <input type="text" name="title" placeholder="Title" required />
            <textarea name="description" placeholder="Description" required></textarea>
            <textarea name="remark" placeholder="Admin Remark"></textarea>
            <select name="status" required>
                <option value="PENDING">Pending</option>
                <option value="IN_PROGRESS">In Progress</option>
                <option value="RESOLVED">Resolved</option>
            </select>
            <button type="submit" name="action" value="update">Update</button>
            <button type="submit" name="action" value="delete">Delete</button>
        </form>
    </div>
</div>
</body>
</html>
