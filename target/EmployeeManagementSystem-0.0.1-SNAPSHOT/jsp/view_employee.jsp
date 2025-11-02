<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View Employees</title>
<link rel="stylesheet" href="/css/style.css">
</head>
<body>

<h2>Employee Management System</h2>

<nav>
    <ul>
        <li><span><a href="index.jsp">Home</a></span></li>
        <li><span><a href="add_employee.jsp">Add</a></span></li>
        <li><span><a href="view_employee.jsp">View</a></span></li>
        <li><span><a href="edit_employee.jsp">Update</a></span></li>
        <li><span><a href="index.jsp">Delete</a></span></li>
    </ul>
</nav>

<section class="content">
    <h3>All Employee Records</h3>

    <!-- You can populate this table dynamically using Servlet -->
    <table class="emp-table">
        <thead>
            <tr>
                <th>Employee ID</th>
                <th>Name</th>
                <th>Department</th>
                <th>Salary</th>
            </tr>
        </thead>
        <tbody>
            <!-- Example static rows (will be replaced by servlet output) -->
            <tr>
                <td>101</td>
                <td>Pravin Maithil</td>
                <td>AI & Robotics</td>
                <td>75000</td>
            </tr>
            <tr>
                <td>102</td>
                <td>Riya Sharma</td>
                <td>HR</td>
                <td>50000</td>
            </tr>
        </tbody>
    </table>
</section>

</body>
</html>
