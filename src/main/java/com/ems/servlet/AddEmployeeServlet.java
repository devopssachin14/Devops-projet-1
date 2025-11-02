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

//@WebServlet("/AddEmployeeServlet")
public class AddEmployeeServlet extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String name = req.getParameter("empName");
        String fatherName = req.getParameter("empFatherName");
        String email = req.getParameter("empEmail");
        String status = req.getParameter("empStatus");
        String department = req.getParameter("empDepartment");
        double salary = Double.parseDouble(req.getParameter("empSalary"));
//        LocalDate localDate = LocalDate.now();

        Employee employee = new Employee();
        employee.setName(name);
        employee.setFatherName(fatherName);
        employee.setEmail(email);
        employee.setStatus(status);
        employee.setDepartment(department);
        employee.setSalary(salary);
//        employee.setJoinAt(localDate);

        EmployeeDAO employeeDAO = new EmployeeDAO();
        String isSaved = employeeDAO.saveEmployee(employee);
        if(isSaved.equals("error")){
            req.setAttribute("errorForAdd","Employee doesn't add due to server error");
        }
        else if(isSaved.equals("duplicate")){
            req.setAttribute("duplicateForAdd","Employee with same name and email already exist.");
        } else {
            req.setAttribute("successForAdd","user saved successfully");
        }
        RequestDispatcher rd = req.getRequestDispatcher("add_employee.jsp");
        rd.forward(req,resp);
    }
}
