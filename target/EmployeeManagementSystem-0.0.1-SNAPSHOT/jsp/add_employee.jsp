<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Employee</title>
<link rel="stylesheet" href="/css/style.css">
</head>
<body>

<h2>Employee Management System</h2>

<nav>
    <ul>
        <li><span><a href="index.jsp">Home</a></span></li>
        <li><span><a href="add_employee.jsp">Add</a></span></li>
        <li><span><a href="edit_employee.jsp">Update</a></span></li>
        <li><span><a href="delete_employee.jsp">Delete</a></span></li>
    </ul>
</nav>

<section class="content">
    <h3>Add New Employee</h3>
    <form action="AddEmployeeServlet" method="post" class="emp-form">

        <label>Name:</label>
        <input type="text" name="empName" required>

        <label>Email: </label>
        <input type="text" name="empEmail" required>

        <label>Department:</label>
        <input type="text" name="empDept" required>

        <label>Salary:</label>
        <input type="number" name="empSalary" required>

        <button type="submit">Add Employee</button>
    </form>
</section>

</body>
</html>
