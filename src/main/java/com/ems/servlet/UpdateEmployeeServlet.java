package com.ems.servlet;

import com.ems.dao.EmployeeDAO;
import com.ems.entity.Employee;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

//@WebServlet("/UpdateEmployeeServlet")
public class UpdateEmployeeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("empId"));
        String newName = req.getParameter("empName");
        String newDepartment = req.getParameter("empDepartment");
        double newSalary = Double.parseDouble(req.getParameter("empSalary"));
        String newEmpStatus = req.getParameter("empStatus");

        Employee employee = new Employee();
        employee.setName(newName);
        employee.setStatus(newEmpStatus);
        employee.setDepartment(newDepartment);
        employee.setSalary(newSalary);

        EmployeeDAO employeeDAO = new EmployeeDAO();

        String status = employeeDAO.updateEmployee(employee,id);
        if(status.equals("successForUpdate")){
            req.setAttribute("successForUpdate","Employee data updated successfully");
            RequestDispatcher rd = req.getRequestDispatcher("view_employee.jsp");
            rd.include(req,resp);
        } else if(status.equals("failForUpdate")){
            req.setAttribute("failFromUpdate","Employee data doesn't found successfully");
            RequestDispatcher rd = req.getRequestDispatcher("view_employee.jsp");
            rd.include(req,resp);
        } else  {
            req.setAttribute("errorForUpdate","Employee doesn't updated due to server issue");
            RequestDispatcher rd = req.getRequestDispatcher("view_employee.jsp");
            rd.include(req,resp);
        }
    }
}
