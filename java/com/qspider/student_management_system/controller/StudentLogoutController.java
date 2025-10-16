package com.qspider.student_management_system.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet(value = "/logout")
public class StudentLogoutController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		if(session.getAttribute("studentSession") != null) {
			session.invalidate();	
			req.setAttribute("errorMsg", "You are logout successfully!!!");
			req.getRequestDispatcher("studentLogin.jsp").forward(req, resp);		
		}		
		
	}
}
