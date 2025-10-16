
package com.qspider.student_management_system.controller;
import java.io.IOException;

import com.qspider.student_management_system.dao.Studentdao;
import com.qspider.student_management_system.dto.Student;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class StudentRegisterController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        try {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            long phone = Long.parseLong(request.getParameter("phone"));
            String dob = request.getParameter("dob");
            String gender = request.getParameter("gender");
            int age = Integer.parseInt(request.getParameter("age"));
            String branch = request.getParameter("branch");

            Student student = new Student();
            student.setName(name);
            student.setEmail(email);
            student.setPassword(password);
            student.setPhone(phone);
            student.setDob(dob);
            student.setGender(gender);
            student.setAge(age);
            student.setBranch(branch);

            Studentdao dao = new Studentdao();
            Student saved = dao.saveStudentdata(student);

            if (saved != null) {
                // Send success message with generated ID to login page
                request.setAttribute("successMsg", "Registered successfully with ID: " + saved.getId());
                RequestDispatcher rd = request.getRequestDispatcher("studentLogin.jsp");
                rd.forward(request, response);
            } else {
                request.setAttribute("errorMsg", "Registration failed. Try again.");
                RequestDispatcher rd = request.getRequestDispatcher("studentLogin.jsp");
                rd.forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
