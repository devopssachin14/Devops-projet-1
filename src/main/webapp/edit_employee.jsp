<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Employee</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>

<h2>Employee Management System</h2>


<nav>
    <ul>
        <li><span><a href="home.jsp">Home</a></span></li>
        <li><span><a href="add_employee.jsp">Add</a></span></li>
        <li><span><a href="view_employee.jsp">View</a></span></li>
        <!-- <li><span><a href="edit_employee.jsp">Update</a></span></li> -->
        <!-- <li><span><a href="delete_employee.jsp">Delete</a></span></li> -->
    </ul>
    <div class="logout-container">
        <form action="logoutServlet" method="get">
            <button type="submit" class="logout-btn">Logout</button>
        </form>
    </div>
</nav>


    <%
        String idStr = request.getParameter("id");
        String name = request.getParameter("name");
        int id = Integer.parseInt(idStr); // convert String to int
    %>

<section class="content">
    <h3>Update Employee Details</h3>
    <form action="updateEmployeeServlet" method="post" class="emp-form">
        <label>Employee ID:</label>
        <input type="text" name="empId" value="<%= id %>" required>

        <label>New Name:</label>
        <input type="text" name="empName" value="<%= name %>" required>

        <label>Status:</label>
        <select name="empStatus" class="select">
            <option value="Full_Time_Employee" selected>Full Time Employee</option>
            <option value="Intern">Intern</option>
        </select>

        <label>Department:</label>
        <!-- <input type="text" name="empDepartment" required> -->
        <select name="empDepartment" class="select">
            <option value="Software_Developer" selected>Software Developer</option>
            <option value="Web_Designer">Web Designer</option>
            <option value="Web_Developer">Web Developer</option>
            <option value="Python_Developer">Python Developer</option>
        </select>

        <label>New Salary:</label>
        <input type="number" name="empSalary">

        <button class="filter" type="submit">Update Employee</button>
    </form>
</section>

</body>
</html>
