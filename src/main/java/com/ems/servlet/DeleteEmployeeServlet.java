package com.ems.servlet;

import com.ems.dao.EmployeeDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class DeleteEmployeeServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        String empFilter = req.getParameter("empFilter");

        EmployeeDAO employeeDAO = new EmployeeDAO();
        String status = employeeDAO.removeEmployee(id);

        if(status.equals("successForDelete")){
            req.setAttribute("successForDelete","✅Employee deleted successfully.");
        } else {
            req.setAttribute("errorForDelete","❌Employee doesn't delete");
        }
        RequestDispatcher rd = req.getRequestDispatcher("view_employee.jsp");
        rd.forward(req,resp);

    }
}
