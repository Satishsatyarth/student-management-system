<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Register Form</title>

<style>
/* ==== Global Styles ==== */
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

/* ==== Register Container ==== */
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

/* ==== Title ==== */
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

/* ==== Form Elements ==== */
.form-group {
	margin-bottom: 18px;
}

.form-group label {
	display: block;
	font-weight: 600;
	color: #ddd;
	margin-bottom: 6px;
}

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

/* ==== Button ==== */
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

/* ==== Link Section ==== */
.register-container p {
	text-align: center;
	margin-top: 15px;
	font-size: 15px;
}

.register-container a {
	color: #00C9FF;
	text-decoration: none;
	font-weight: 600;
}

.register-container a:hover {
	color: #92FE9D;
	text-decoration: underline;
}

/* ==== Loader Overlay ==== */
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

.loader-overlay.active {
	visibility: visible;
	opacity: 1;
}

.spinner {
	width: 60px;
	height: 60px;
	border: 6px solid rgba(255, 255, 255, 0.2);
	border-top: 6px solid #00C9FF;
	border-radius: 50%;
	animation: spin 1s linear infinite;
}

@keyframes spin {
	0% { transform: rotate(0deg); }
	100% { transform: rotate(360deg); }
}

.loader-text {
	color: #00C9FF;
	font-size: 18px;
	font-weight: 500;
	margin-top: 15px;
	letter-spacing: 0.5px;
	text-shadow: 0 0 6px rgba(0, 201, 255, 0.6);
}

/* ==== Responsive ==== */
@media (max-width: 500px) {
	.register-container {
		padding: 25px 20px;
	}
	.register-container h2 {
		font-size: 22px;
	}
}
</style>
</head>

<body>

	<div class="register-container">
		<h2>Register</h2>
		<form id="registerForm" action="register" method="post">
			
			<div class="form-group">
				<label for="name">Full Name</label>
				<input type="text" id="name" name="name" placeholder="Enter your name" required />
			</div>

			<div class="form-group">
				<label for="email">Email Address</label>
				<input type="email" id="email" name="email" placeholder="Enter your email" required />
			</div>

			<div class="form-group">
				<label for="password">Password</label>
				<input type="password" id="password" name="password" placeholder="Enter your password" required />
			</div>

			<div class="form-group">
				<label for="phone">Phone Number</label>
				<input type="tel" id="phone" name="phone" placeholder="Enter phone number" required />
			</div>

			<div class="form-group">
				<label for="dob">Date of Birth</label>
				<input type="date" id="dob" name="dob" required />
			</div>

			<div class="form-group">
				<label for="gender">Gender</label>
				<select id="gender" name="gender" required>
					<option value="" disabled selected>Select gender</option>
					<option value="Male">Male</option>
					<option value="Female">Female</option>
					<option value="Other">Other</option>
				</select>
			</div>

			<div class="form-group">
				<label for="branch">Branch</label>
				<select id="branch" name="branch" required>
					<option value="" disabled selected>Select your branch</option>
					<option value="Computer Science and Engineering">Computer Science and Engineering</option>
					<option value="Information Technology">Information Technology</option>
					<option value="Electronics and Communication Engineering">Electronics and Communication Engineering</option>
					<option value="Electrical Engineering">Electrical Engineering</option>
					<option value="Mechanical Engineering">Mechanical Engineering</option>
					<option value="Civil Engineering">Civil Engineering</option>
					<option value="Chemical Engineering">Chemical Engineering</option>
					<option value="Artificial Intelligence and Data Science">Artificial Intelligence and Data Science</option>
				</select>
			</div>

			<div class="form-group">
				<label for="age">Age</label>
				<input type="number" id="age" name="age" placeholder="Enter your age" required />
			</div>

			<button type="submit" class="btn">Register</button>

			<p>Already have an account? <a href="studentLogin.jsp">Login</a></p>
		</form>
	</div>

	<!-- Loader -->
	<div class="loader-overlay" id="loader">
		<div class="spinner"></div>
		<div class="loader-text">Registering your account...</div>
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

	window.addEventListener('pageshow', function (event) {
		if (event.persisted) {
			loader.classList.remove('active');
			form.style.display = 'block';
		}
	});
	</script>

</body>
</html>
