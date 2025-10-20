<%@page import="com.qspider.student_management_system.dao.Studentdao"%>
<%@ page import="com.qspider.student_management_system.dto.Student" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Edit Form</title>

<style>
/* ==== Your existing CSS (unchanged) ==== */
* { box-sizing: border-box; margin: 0; padding: 0; }
body {
	font-family: "Poppins", sans-serif;
	background: linear-gradient(135deg, #141E30, #243B55);
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	color: #fff;
	padding: 20px;
}
.register-container {
	background: rgba(255, 255, 255, 0.1);
	backdrop-filter: blur(12px);
	padding: 35px 40px;
	border-radius: 20px;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.5);
	width: 90%;
	max-width: 480px;
	transition: 0.3s ease;
}
.register-container:hover {
	transform: scale(1.02);
	box-shadow: 0 12px 30px rgba(0, 201, 255, 0.2);
}
.register-container h2 {
	text-align: center;
	font-weight: 700;
	margin-bottom: 25px;
	font-size: 26px;
	background: linear-gradient(45deg, #00C9FF, #92FE9D);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	text-shadow: 0 0 10px rgba(0, 201, 255, 0.3);
}
.form-group { margin-bottom: 18px; }
.form-group label { display: block; font-weight: 600; color: #ddd; margin-bottom: 6px; }
.form-group input,
.form-group select {
	width: 100%;
	padding: 10px 12px;
	border: 1px solid #444;
	border-radius: 8px;
	font-size: 15px;
	background: #2a2a2a;
	color: #fff;
	outline: none;
	transition: all 0.3s ease;
}
.form-group input:focus,
.form-group select:focus {
	border-color: #00C9FF;
	box-shadow: 0 0 6px rgba(0, 201, 255, 0.6);
	background: #333;
}
.btn {
	width: 100%;
	padding: 12px;
	background: linear-gradient(45deg, #00C9FF, #92FE9D);
	border: none;
	border-radius: 8px;
	color: #141E30;
	font-size: 16px;
	font-weight: 600;
	cursor: pointer;
	transition: 0.3s ease;
}
.btn:hover {
	opacity: 0.9;
	transform: translateY(-2px);
}
.loader-overlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(15, 15, 15, 0.9);
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	z-index: 1000;
	visibility: hidden;
	opacity: 0;
	transition: opacity 0.3s ease;
}
.loader-overlay.active { visibility: visible; opacity: 1; }
.spinner {
	width: 60px;
	height: 60px;
	border: 6px solid rgba(255, 255, 255, 0.2);
	border-top: 6px solid #00C9FF;
	border-radius: 50%;
	animation: spin 1s linear infinite;
}
@keyframes spin { 0% { transform: rotate(0deg); } 100% { transform: rotate(360deg); } }
.loader-text {
	color: #00C9FF;
	font-size: 18px;
	font-weight: 500;
	margin-top: 15px;
	letter-spacing: 0.5px;
	text-shadow: 0 0 6px rgba(0, 201, 255, 0.6);
}
@media (max-width: 500px) {
	.register-container { padding: 25px 20px; }
	.register-container h2 { font-size: 22px; }
}
</style>
</head>

<body>
<%@page import="com.qspider.student_management_system.dto.Student"%>
<%
    Student student = (Student) request.getAttribute("student");
    if (student == null) {
        out.print("<h3 style='color:red;'>No student data found to edit.</h3>");
        return;
    }
%>


<div class="register-container">
	<h2>Update Details</h2>
	<form id="registerForm" action="update" method="post">

		<div class="form-group">
			<label for="name">Full Name</label>
			<input type="text" id="name" name="name" value="<%= student.getName() %>" required />
		</div>

		<div class="form-group">
			<label for="email">Email Address</label>
			<input type="email" id="email" name="email" value="<%= student.getEmail() %>" readonly />
		</div>

		<div class="form-group">
			<label for="password">Password</label>
			<input type="password" id="password" name="password" value="<%= student.getPassword() %>" required />
		</div>

		<div class="form-group">
			<label for="phone">Phone Number</label>
			<input type="tel" id="phone" name="phone" value="<%= student.getPhone() %>" required />
		</div>

		<div class="form-group">
			<label for="dob">Date of Birth</label>
			<input type="date" id="dob" name="dob" value="<%= student.getDob() %>" required />
		</div>

		<div class="form-group">
			<label for="gender">Gender</label>
			<select id="gender" name="gender" required>
				<option value="Male" <%= "Male".equals(student.getGender()) ? "selected" : "" %>>Male</option>
				<option value="Female" <%= "Female".equals(student.getGender()) ? "selected" : "" %>>Female</option>
				<option value="Other" <%= "Other".equals(student.getGender()) ? "selected" : "" %>>Other</option>
			</select>
		</div>

		<div class="form-group">
			<label for="branch">Branch</label>
			<select id="branch" name="branch" required>
				<option value="Computer Science and Engineering" <%= "Computer Science and Engineering".equals(student.getBranch()) ? "selected" : "" %>>Computer Science and Engineering</option>
				<option value="Information Technology" <%= "Information Technology".equals(student.getBranch()) ? "selected" : "" %>>Information Technology</option>
				<option value="Electronics and Communication Engineering" <%= "Electronics and Communication Engineering".equals(student.getBranch()) ? "selected" : "" %>>Electronics and Communication Engineering</option>
				<option value="Electrical Engineering" <%= "Electrical Engineering".equals(student.getBranch()) ? "selected" : "" %>>Electrical Engineering</option>
				<option value="Mechanical Engineering" <%= "Mechanical Engineering".equals(student.getBranch()) ? "selected" : "" %>>Mechanical Engineering</option>
				<option value="Civil Engineering" <%= "Civil Engineering".equals(student.getBranch()) ? "selected" : "" %>>Civil Engineering</option>
				<option value="Chemical Engineering" <%= "Chemical Engineering".equals(student.getBranch()) ? "selected" : "" %>>Chemical Engineering</option>
				<option value="Artificial Intelligence and Data Science" <%= "Artificial Intelligence and Data Science".equals(student.getBranch()) ? "selected" : "" %>>Artificial Intelligence and Data Science</option>
			</select>
		</div>

		<div class="form-group">
			<label for="age">Age</label>
			<input type="number" id="age" name="age" value="<%= student.getAge() %>" required />
		</div>

		<button type="submit" class="btn">Update</button>

	</form>
</div>

<div class="loader-overlay" id="loader">
	<div class="spinner"></div>
	<div class="loader-text">Updating your details...</div>
</div>

<script>
const form = document.getElementById('registerForm');
const loader = document.getElementById('loader');

form.addEventListener('submit', function (e) {
	e.preventDefault();
	loader.classList.add('active');
	setTimeout(() => {
		loader.classList.remove('active');
		form.submit();
	}, 2000);
});
</script>

</body>
</html>
