package com.qspider.student_management_system.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mysql.cj.exceptions.CJConnectionFeatureNotAvailableException;
import com.mysql.cj.result.Row;
import com.qspider.student_management_system.connection.JDBC_connection;
import com.qspider.student_management_system.dto.Student;

public class Studentdao {

	Connection connection = JDBC_connection.getJdbcConnection();

	public Student saveStudentdata(Student std) {

		String insertQuery = "INSERT INTO student (name, email, password, phone, dob, gender, branch, age) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			PreparedStatement ps = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);

			ps.setString(1, std.getName());
			ps.setString(2, std.getEmail());
			ps.setString(3, std.getPassword());
			ps.setLong(4, std.getPhone());
			ps.setString(5, std.getDob());
			ps.setString(6, std.getGender());
			ps.setString(7, std.getBranch());
			ps.setInt(8, std.getAge());

			int rowsAffected = ps.executeUpdate();
			if (rowsAffected > 0) {
				// Get generated ID
				ResultSet rs = ps.getGeneratedKeys();
				if (rs.next()) {
					int generatedId = rs.getInt(1);
					std.setId(generatedId); // set generated ID in Student object
				}
				System.out.println("Data inserted");
				return std;
			} else {
				System.out.println("Something went wrong in StudentDao");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public Student getStudentByEmailDao(String studentEmail) {

		String getEmailQuery = "select * from student where email = ?";

		try {
			PreparedStatement ps = connection.prepareStatement(getEmailQuery);

			ps.setString(1, studentEmail);
			ResultSet resultSet = ps.executeQuery();

			if (resultSet.next()) {
				Student student = new Student();

				student.setId(resultSet.getInt("id"));
				student.setName(resultSet.getString("name"));
				student.setEmail(resultSet.getString("email"));
				student.setPassword(resultSet.getString("password"));
				student.setPhone(resultSet.getLong("phone"));
				student.setDob(resultSet.getString("Dob"));
				student.setAge(resultSet.getInt("age"));
				student.setGender(resultSet.getString("gender"));
				student.setBranch(resultSet.getString("branch"));

				return student;
			}
			return null;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	public boolean updateStudentDetails(Student student, String email) {
		String updateQuery = "UPDATE student SET name=?, password=?, phone=?, dob=?, gender=?, age=?, branch=? WHERE email=?";
		boolean rowUpdated = false;

		try {
			PreparedStatement ps = connection.prepareStatement(updateQuery);

			ps.setString(1, student.getName());
			ps.setString(2, student.getPassword());
			ps.setLong(3, student.getPhone());
			ps.setString(4, student.getDob());
			ps.setString(5, student.getGender());
			ps.setInt(6, student.getAge());
			ps.setString(7, student.getBranch());
			ps.setString(8, email); // WHERE email = ?

			rowUpdated = ps.executeUpdate() > 0;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rowUpdated;
	}

}
