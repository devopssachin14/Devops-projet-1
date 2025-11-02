<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Employee Management System - Home</title>
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
    <h3>Welcome to Employee Management System</h3>
    <p>This system allows you to manage employee records efficiently.  
       You can add, view, update, or delete employee details using the navigation above.</p>
</section>

</body>
</html>
