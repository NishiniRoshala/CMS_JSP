<%@ page import="Documents.AAD.JavaEE.Test_Project.Model.EmployeeModel" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Dashboard</title>
    <style>
        body {
            background-color: #000000;
            font-family: Arial, sans-serif;
            color: #f8c1d9;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1100px;
            margin: 30px auto;
            padding: 30px;
            background-color: #1a1a1a;
            border-radius: 10px;
            box-shadow: 0 0 10px #f06292;
        }

        h1, h2 {
            color: #f06292;
            text-align: center;
        }

        .user-info {
            text-align: center;
            margin-bottom: 20px;
            font-weight: bold;
        }

        .logout-btn {
            background-color: #f06292;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            float: right;
        }

        form {
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin-top: 15px;
            color: #f8c1d9;
        }

        input[type="text"], textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            background-color: #333;
            border: 1px solid #f06292;
            color: #fff;
            border-radius: 5px;
        }

        .buttons {
            margin-top: 20px;
            display: flex;
            gap: 10px;
        }

        .buttons button {
            flex: 1;
            background-color: #f06292;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 6px;
            cursor: pointer;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #111;
        }

        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #333;
            color: #fff;
        }

        th {
            background-color: #f06292;
        }

        .no-data {
            text-align: center;
            padding: 30px;
            color: #ccc;
        }

        .action-btn {
            background-color: #444;
            color: #fff;
            padding: 5px 10px;
            border: 1px solid #f06292;
            border-radius: 4px;
            cursor: pointer;
        }

        .message {
            margin: 20px 0;
            padding: 10px;
            background-color: #222;
            border-left: 5px solid #f06292;
            color: #fff;
        }

        .clear {
            clear: both;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="user-info">
        Welcome: <%= session.getAttribute("full_name") != null ? session.getAttribute("full_name") : "Employee" %> |
        ID: <%= session.getAttribute("user_id") != null ? session.getAttribute("user_id") : "N/A" %>
        <form method="post" action="logout" style="display:inline;">
            <button type="submit" class="logout-btn">Logout</button>
        </form>
    </div>
    <div class="clear"></div>

    <h1>Complaint Management</h1>

    <% String message = (String) request.getAttribute("message"); %>
    <% if (message != null) { %>
    <div class="message"><%= message %></div>
    <% } %>

    <form action="employee" method="post">
        <input type="hidden" name="complaint_id" id="complaint_id" value="">

        <label for="title">Complaint Title</label>
        <input type="text" name="title" id="title" required>

        <label for="description">Complaint Description</label>
        <textarea name="description" id="description" required></textarea>

        <div class="buttons">
            <button type="submit" name="action" value="add">Add</button>
            <button type="submit" name="action" value="update" id="updateBtn" disabled>Update</button>
            <button type="submit" name="action" value="delete" id="deleteBtn" disabled>Delete</button>
            <button type="reset" onclick="resetForm()">Clear</button>
        </div>
    </form>

    <h2>My Complaints</h2>
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>User ID</th>
            <th>Title</th>
            <th>Description</th>
            <th>Status</th>
            <th>Remarks</th>
            <th>Created</th>
            <th>Updated</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<EmployeeModel> complaintList = (List<EmployeeModel>) request.getAttribute("complaintList");
            if (complaintList != null && !complaintList.isEmpty()) {
                for (EmployeeModel complaint : complaintList) {
        %>
        <tr>
            <td><%= complaint.getComplaint_id() %></td>
            <td><%= complaint.getUser_id() %></td>
            <td><%= complaint.getTitle() %></td>
            <td><%= complaint.getDescription() %></td>
            <td><%= complaint.getStatus() != null ? complaint.getStatus() : "Pending" %></td>
            <td><%= complaint.getRemark() %></td>
            <td><%= complaint.getCreated_at() %></td>
            <td><%= complaint.getUpdated_at() %></td>
            <td>
                <button class="action-btn" onclick="selectComplaint('<%= complaint.getComplaint_id() %>', '<%= complaint.getTitle() %>', '<%= complaint.getDescription() %>')">Select</button>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="9" class="no-data">No complaints found.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

<script>
    function selectComplaint(id, title, description) {
        document.getElementById("complaint_id").value = id;
        document.getElementById("title").value = title;
        document.getElementById("description").value = description;
        document.getElementById("updateBtn").disabled = false;
        document.getElementById("deleteBtn").disabled = false;
        window.scrollTo(0, 0);
    }

    function resetForm() {
        document.getElementById("complaint_id").value = "";
        document.getElementById("updateBtn").disabled = true;
        document.getElementById("deleteBtn").disabled = true;
    }
</script>

</body>
</html>
