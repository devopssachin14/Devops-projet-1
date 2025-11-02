package com.ems.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class LogoutServlet extends HttpServlet {

    public LogoutServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
        HttpSession session = req.getSession();
        if(session != null) {
            session.invalidate();
        }
        RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
        rd.forward(req,resp);
    }
}
