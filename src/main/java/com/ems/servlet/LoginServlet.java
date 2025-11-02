package com.ems.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

//@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {

//    public LoginServlet() {
//        super(); // ✅ required (implicit is fine)
//        System.out.println("Login Servlet initialized successfully");
//    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        resp.setContentType("text/html");

        String user = req.getParameter("username");
        String pass = req.getParameter("password");

        if ("root".equals(user) && "root".equals(pass)) {
            HttpSession session = req.getSession();
            session.setAttribute("username", user);
            resp.sendRedirect("home.jsp");
        } else {
            req.setAttribute("errorMsg", "Invalid username or password!");
            RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
            rd.forward(req, resp);
//            out.print("<h3 style='color:red'>Email and Password didn't match. </h3>");
//			RequestDispatcher rd = req.getRequestDispatcher("/index.jsp");
//			rd.include(req, resp);
        }
    }
}
