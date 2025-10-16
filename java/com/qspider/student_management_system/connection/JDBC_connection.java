package com.qspider.student_management_system.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class JDBC_connection {
	
	public static Connection getJdbcConnection() {	
		String username = "root";
		String url = "jdbc:mysql://127.0.0.1:3306/student-management";
		String password = "Mysql";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			return DriverManager.getConnection(url,username,password);
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return null;
	}

}
