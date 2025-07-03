package com.auth;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	
	public static Connection getConnection() {
		
		String url = "jdbc:mysql://localhost:3306/userdb";
	    String user = "test01"; // use your MySQL username
	    String password = "test@123"; // replace with your MySQL password
	    Connection conn= null;
	    
	    try {
	    	Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(
                url, user, password
            );
	    }
	    catch (Exception e) {
	    	e.printStackTrace();
	    }
		
		
		
		return conn;
	
	}
	
	
}