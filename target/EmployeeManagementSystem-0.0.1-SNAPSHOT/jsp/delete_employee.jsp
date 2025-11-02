<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Delete Employee</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>

<h2>Employee Management System</h2>

<nav>
    <ul>
        <li><span><a href="index.jsp">Home</a></span></li>
        <li><span><a href="add_employee.jsp">Add</a></span></li>
        <li><span><a href="view_employee.jsp">View</a></span></li>
        <li><span><a href="edit_employee.jsp">Update</a></span></li>
        <li><span><a href="delete_employee.jsp">Delete</a></span></li>
    </ul>
</nav>

<section class="content">
    <h3>Delete Employee</h3>
    <form action="DeleteEmployeeServlet" method="post" class="emp-form">
        <label>Employee ID:</label>
        <input type="text" name="empId" required>

        <button type="submit" class="delete-btn">Delete Employee</button>
    </form>
</section>

</body>
</html>
