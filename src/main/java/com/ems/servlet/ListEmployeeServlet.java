package com.ems.servlet;

import com.ems.dao.EmployeeDAO;
import com.ems.entity.Employee;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

//@WebServlet("/listEmployeeServlet")
public class ListEmployeeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<Employee> list = new ArrayList<>();
        String filter1 = req.getParameter("empFilter1");
        String filter2 = req.getParameter("empFilter2");

        EmployeeDAO employeeDAO = new EmployeeDAO();

        if(filter1 != null && filter1.equals("all") && filter2 != null && filter2.equals("all")){
            list = employeeDAO.getAllEmployee();
        } else {
            list = employeeDAO.getAllEmployee(filter1,filter2);
        }
        // id form url

        req.setAttribute("empList", list);
        req.setAttribute("empFilter1",filter1);
        req.setAttribute("empFilter2",filter2);

//        resp.sendRedirect("view_employee.jsp");
        // ✅ Use forward (not redirect) so attributes are preserved
        RequestDispatcher rd = req.getRequestDispatcher("view_employee.jsp");
        rd.include(req,resp);
    }
}
