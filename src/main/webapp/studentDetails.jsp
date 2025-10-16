<%@page import="com.qspider.student_management_system.dao.Studentdao"%>
<%@page import="com.qspider.student_management_system.dto.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Details</title>
    <style>
        /* ==== Modern Dark Theme ==== */
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #141E30, #243B55);
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        .container {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(12px);
            border-radius: 20px;
            padding: 30px 40px;
            max-width: 450px;
            width: 100%;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.5);
            text-align: center;
            transition: 0.3s ease;
        }

        .container:hover {
            transform: scale(1.02);
			box-shadow: 0 12px 30px rgba(0, 201, 255, 0.2);
        }

        h2 {
            margin-bottom: 25px;
            font-size: 28px;
            background: linear-gradient(45deg, #00C9FF, #92FE9D);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .details {
            text-align: left;
            margin-top: 10px;
        }

        .details p {
            background: rgba(255, 255, 255, 0.08);
            padding: 12px 15px;
            border-radius: 10px;
            margin: 8px 0;
            font-size: 16px;
        }

        .details span {
            color: #00C9FF;
            font-weight: 600;
        }

        .btn {
            display: inline-block;
            margin-top: 25px;
            background: linear-gradient(45deg, #00C9FF, #92FE9D);
            color: #141E30;
            padding: 10px 25px;
            border-radius: 25px;
            text-decoration: none;
            font-weight: 600;
            transition: 0.3s;
        }

        .btn:hover {
            opacity: 0.9;
        }

        @media (max-width: 480px) {
            .container {
                padding: 25px 20px;
            }
            h2 {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>

	<%
		HttpSession session1 = request.getSession(false);
	
		if(session1 == null || session1.getAttribute("studentSession") == null){
			response.sendRedirect("studentLogin.jsp");
			return;
		}
		String email = (String)session1.getAttribute("studentSession");
		Student student = new Studentdao().getStudentByEmailDao(email);
		
		int id = student.getId();
		String name = student.getName();
		Long phone = student.getPhone();
		String dob = student.getDob();
		String gender = student.getGender();
		int age = student.getAge();
		String branch = student.getBranch();
		
		
	%>
    <div class="container">
        <h2>Welcome, <%= name %> 👋</h2>
        <div class="details">
            <p><span>Student ID:</span> <%= id %></p>
            <p><span>Email:</span> <%= email %></p>
            <p><span>Phone:</span> <%= phone %></p>
            <p><span>Age:</span> <%= age %></p>
            <p><span>Gender:</span> <%= gender %></p>
            <p><span>DOB:</span> <%= dob %></p>
            <p><span>Branch:</span> <%= branch %></p>
        </div>
        <a href="logout" class="btn">Logout</a>
    </div>
</body>
</html>