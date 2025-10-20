package com.qspider.student_management_system.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.qspider.student_management_system.dao.Studentdao;
import com.qspider.student_management_system.dto.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/update")
public class StudentUpdateController extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
			
		String email = req.getParameter("email"); // existing email

		String name = req.getParameter("name");
		String password = req.getParameter("password");
		Long phone = Long.parseLong(req.getParameter("phone"));
		String dob = req.getParameter("dob");
		String gender = req.getParameter("gender");
		int age = Integer.parseInt(req.getParameter("age"));
		String branch = req.getParameter("branch");

		Student student = new Student();
		student.setName(name);
		student.setPassword(password);
		student.setPhone(phone);
		student.setDob(dob);
		student.setGender(gender);
		student.setAge(age);
		student.setBranch(branch);

		boolean isUpdated = new Studentdao().updateStudentDetails(student, email);

		if (isUpdated) {
			out.print("<h1>Student updated successfully!</h1>");
			System.out.println("Student updated successfully!");
		} else {
			out.print("<h1>Failed to update Student. Check Email or Data.</h1>");
			System.out.println("Failed to update Student. Check Email or Data.");
		}
	}
}
