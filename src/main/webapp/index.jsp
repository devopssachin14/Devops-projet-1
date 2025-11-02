<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Login | Employee Management System</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>

<h2>Employee Management System</h2>

<section class="content login-section">

    <h2 >Admin Login</h2>
    
    <% String error = (String) request.getAttribute("errorMsg"); %>
	<% if (error != null) { %>
	    <p class="error" style="color:red; margin-top: 10px;"> <%= error %></p>
	<% } %>
	
    <form action="loginServlet" method="post" class="emp-form login-form" >
        
        <label>Username:</label>
        <input type="text" name="username" placeholder="Enter username" required>

        <label>Password:</label>
        <input type="password" name="password" placeholder="Enter password" required>

        <button type="submit">Login</button>
    </form>

    <p class="note">Only administrators are allowed to log in.</p>
</section>

</body>
</html>
