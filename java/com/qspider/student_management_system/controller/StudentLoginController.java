package com.qspider.student_management_system.controller;

import java.io.IOException;
import com.qspider.student_management_system.dao.Studentdao;
import com.qspider.student_management_system.dto.Student;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(value = "/login")
public class StudentLoginController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		String email = req.getParameter("email");
		String password = req.getParameter("password");

		Student student = new Studentdao().getStudentByEmailDao(email);

		if (student != null && student.getPassword().equals(password)) {
			System.out.println("Login Successfully");
			session.setAttribute("studentSession", email);

			resp.sendRedirect("studentDetails.jsp");
		} else {
			System.out.println("Check your credentials!!!");
			req.setAttribute("errorMsg", "Check your credentials!!!");
			req.getRequestDispatcher("studentLogin.jsp").forward(req, resp);
		}
	}
}
