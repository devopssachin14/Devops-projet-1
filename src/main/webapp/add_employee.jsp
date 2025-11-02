<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Employee</title>
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

<section class="content">
    <h3>Add New Employee</h3>

    <% String errorFromAdd = (String) request.getAttribute("errorForAdd"); %>
    <% if(errorFromAdd != null) { %>
        <p class="error" style="color: red;"> <%= errorFromAdd %> </p>
        <% } %>

    <% String duplicateFromAdd = (String) request.getAttribute("failForAdd"); %>
    	<% if (duplicateFromAdd != null) { %>
    	    <p class="duplicate" style="color:red;"> <%= duplicateFromAdd %></p>
    	<% } %>
        
    <% String successFromAdd = (String) request.getAttribute("successForAdd"); %>
        	<% if (successFromAdd != null) { %>
        	    <p class="success" style="color:green;"> <%= successFromAdd %></p>
        	<% } %>

    <form action="addEmployeeServlet" method="post" class="emp-form">

        <label>Name:</label>
        <input type="text" name="empName" placeholder="Name" required>

        <label>FatherName:</label>
        <input type="text" name="empFatherName" placeholder="FatherName" required>

        <label>Email: </label>
        <input type="email" name="empEmail" placeholder="xyz@gamil.com" style="text-transform: lowercase;" required>

        <label>Status:</label>
        <select name="empStatus" class="select">
            <option value="Full_time_Employee" selected>Full time Employee</option>
            <option value="Intern">Inter</option>
        </select>

        <label>Department:</label>
        <!-- <input type="text" name="empDepartment" required> -->
        <select name="empDepartment" class="select">
            <option value="Software_Developer" selected>Software Developer</option>
            <option value="Web_Designer">Web Desiner</option>
            <option value="Web_Developer">Web Developer</option>
            <option value="Python_Developer">Python Developer</option>
        </select>


        <label>Salary:</label>
        <input type="number" min="0" step="100" name="empSalary" placeholder="e.g. 10000">

        <button class="filter" type="submit">Add Employee</button>
    </form>
</section>

</body>
</html>
