package com.auth;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserServlet extends HttpServlet {
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) {
		
		String action = req.getParameter("action");
		
		
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        
        try(Connection conn = DBConnection.getConnection()){
        	
        	 PreparedStatement pst;
             ResultSet rs;
             
             if ("register".equals(action)) {
            	 
            	 pst = conn.prepareStatement("INSERT INTO users(username, password) VALUES (?, ?)");
            	 pst.setString(1, username);
            	 pst.setString(2, password);
            	 
            	 int row = pst.executeUpdate();
            	 
            	 if (row > 0) {
                     res.sendRedirect("login.jsp");
                 } else {
                     res.getWriter().println("Registration failed.");
                 }
            	 
            	 
                 
            	 
            	 
            	 
             }
        	
        	
        }
        catch (Exception e) {
        	
        	 e.printStackTrace();
        	
        }
		
	}

}
