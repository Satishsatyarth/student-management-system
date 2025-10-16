<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Student Login</title>

<style>
/* ==== Modern Dark Mode Theme ==== */
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

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

/* ====== Login Container ====== */
.login-container {
	background: rgba(255, 255, 255, 0.1);
	backdrop-filter: blur(12px);
	padding: 35px 40px;
	border-radius: 20px;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.5);
	width: 90%;
	max-width: 420px;
	text-align: center;
	transition: 0.3s ease;
}

.login-container:hover {
	transform: scale(1.02);
	box-shadow: 0 12px 30px rgba(0, 201, 255, 0.2);
}

/* ====== Heading ====== */
.login-container h2 {
	text-align: center;
	font-weight: 700;
	margin-bottom: 25px;
	font-size: 26px;
	background: linear-gradient(45deg, #00C9FF, #92FE9D);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
}

/* ====== Form Groups ====== */
.form-group {
	margin-bottom: 18px;
	text-align: left;
}

.form-group label {
	display: block;
	font-weight: 600;
	color: #ddd;
	margin-bottom: 6px;
}

.form-group input {
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

.form-group input:focus {
	border-color: #00C9FF;
	box-shadow: 0 0 6px rgba(0, 201, 255, 0.6);
	background: #333;
}

/* ====== Success & Error Messages ====== */
.message {
	padding: 10px 12px;
	border-radius: 8px;
	margin-bottom: 15px;
	text-align: center;
	font-weight: 600;
}

.success {
	background: rgba(0, 255, 150, 0.15);
	color: #00ffae;
	border: 1px solid #00ffae;
}

.error {
	background: rgba(255, 60, 60, 0.15);
	color: #ff4e4e;
	border: 1px solid #ff4e4e;
}

/* ====== Button ====== */
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

/* ====== Register Link ====== */
.register-link {
	text-align: center;
	margin-top: 15px;
}

.register-link a {
	color: #00C9FF;
	text-decoration: none;
	font-weight: 600;
}

.register-link a:hover {
	text-decoration: underline;
	color: #92FE9D;
}

/* ====== Responsive ====== */
@media (max-width: 500px) {
	.login-container {
		padding: 25px 20px;
	}
	.login-container h2 {
		font-size: 22px;
	}
}
</style>
</head>

<body>

	<div class="login-container">
		<h2>Student Login</h2>

		<%
		String successMsg = (String) request.getAttribute("successMsg");
		if (successMsg != null) {
		%>
		<div class="message success"><%= successMsg %></div>
		<%
		}
		%>

		<%
		String errorMsg = (String) request.getAttribute("errorMsg");
		if (errorMsg != null) {
		%>
		<div class="message error"><%= errorMsg %></div>
		<%
		}
		%>

		<form action="login" method="post">
			<!-- Email -->
			<div class="form-group">
				<label for="email">Email</label>
				<input type="email" id="email" name="email" placeholder="Enter your email" required />
			</div>

			<!-- Password -->
			<div class="form-group">
				<label for="password">Password</label>
				<input type="password" id="password" name="password" placeholder="Enter your password" required />
			</div>

			<!-- Submit Button -->
			<button type="submit" class="btn">Login</button>

			<!-- Register Link -->
			<div class="register-link">
				<p>Don’t have an account? <a href="studentRegister.jsp">Register here</a></p>
			</div>
		</form>
	</div>
</body>
</html>
