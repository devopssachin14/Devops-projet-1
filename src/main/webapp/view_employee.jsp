<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.ems.entity.Employee" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View Employees</title>
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
    <h3>All Employee Records</h3>

    <% String errorFormDelete = (String) request.getAttribute("errorForDelete");
        if(errorFormDelete != null) { %>
            <p class="success" style="color: red;"><%= errorFormDelete%></p>
        <% } %>

    <% String successFromDelete = (String) request.getAttribute("successForDelete");
        if(successFromDelete != null) { %>
            <p class="success" style="color: green;"><%= successFromDelete %></p>
        <% } %>

    <% String errorFromUpdate = (String) request.getAttribute("errorForUpdate");
        if(errorFromUpdate != null) { %>
            <p class="success" style="color: red;"><%= errorFromUpdate %></p>
        <% } %>

    <% String successFromUpdate = (String) request.getAttribute("successForUpdate");
        if(successFromUpdate != null) { %>
            <p class="success" style="color: green;"><%= successFromUpdate %></p>
        <% } %>

    <% String failFromUpdate = (String) request.getAttribute("failForUpdate");
        if(failFromUpdate != null) { %>
            <p class="success" style="color: green;"><%= failFromUpdate %></p>
        <% } %>

    <% List<Employee> list = (List<Employee>) request.getAttribute("empList"); %>            

    <div class="filter-div">
        <form action="listEmployeeServlet" method="post">
            <%
                String empfilter1 = (String) request.getAttribute("empFilter1");
                String empfilter2 = (String) request.getAttribute("empFilter2");
            %>
            <select name="empFilter1" class="select">
                <option value="all" <%= "all".equals(empfilter1) ? "selected" : "" %>>All</option>
                <option value="Software_Developer" <%= "Software_Developer".equals(empfilter1) ? "selected" : "" %>>Software Developer</option>
                <option value="Web_Designer" <%= "Web_Designer".equals(empfilter1) ? "selected" : "" %>>Web Designer</option>
                <option value="Web_Developer" <%= "Web_Developer".equals(empfilter1) ? "selected" : "" %>>Web Developer</option>
                <option value="Python_Developer" <%= "Python_Developer".equals(empfilter1) ? "selected" : "" %>>Python Developer</option>
            </select>

            <select name="empFilter2" class="select">
                <option value="all" <%= "all".equals(empfilter2) ? "selected" : "" %>>All</option>
                <option value="Intern" <%= "Intern".equals(empfilter2) ? "selected" : "" %>>Intern</option>
                <option value="Full_Time_Employee" <%= "Full_Time_Employee".equals(empfilter2) ? "selected" : "" %>>Full Time Employee</option>
            </select>
            
            <button type="submit" class="filter">Search</button>
        </form>
    </div>

    <% String status = (String) request.getAttribute("status");
    if (status != null && status.equals("success")) { %>
        <p class="success" style="color: green;">Employee deleted successfully.</p>
    <%
    } else if (status != null && status.equals("fail")) {
    %>
        <p class="fail" style="color: red;">Employee not deleted.</p>
    <% } %>


    <!-- You can populate this table dynamically using Servlet -->
    <div class="table-wrap">
        <table class="emp-table">
            <thead>
                <tr>
                    <th>Employee ID</th>
                    <th>Name</th>
                    <th>Department</th>
                    <th>Intern</th>
                    <th>Salary</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>            
                <!-- Example static rows (will be replaced by servlet output) -->
                <% if(list != null && !list.isEmpty()) { 
                    for(Employee e: list) { %>
                    <tr>
                        <td><%= e.getId() %></td>
                        <td><%= e.getName() %></td>
                        <td><%= e.getDepartment() %></td>
                        <td><%= e.getStatus() %></td>
                        <td><%= e.getSalary() %></td>
                        <td><a href="edit_employee.jsp?id=<%= e.getId() %>&name=<%= e.getName()%>" class="update">Update</a></td>
                        <td><form action="deleteEmployeeServlet" method="post">
                            <button type="submit" name="id" value="<%= e.getId() %>" class="delete">Delete</button>
                        </form></td>
                    </tr>
            <% } 
            } else { %>
                <tr>
                    <td colspan="6">Search Employee by filter.</td>
                </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</section>

</body>
</html>
