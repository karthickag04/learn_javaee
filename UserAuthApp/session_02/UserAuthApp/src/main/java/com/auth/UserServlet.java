package com.auth;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
             else if ("login".equals(action)) {
                 pst = conn.prepareStatement("SELECT * FROM users WHERE username=? AND password=?");
                 pst.setString(1, username);
                 pst.setString(2, password);
                 rs = pst.executeQuery();

                 if (rs.next()) {
                	 String role = rs.getString("role");
                	 
                	 
                     HttpSession session = req.getSession();
                     
                     session.setAttribute("username", username);
                     
                     session.setAttribute("role",role);
                     
//                     res.sendRedirect("dashboard.jsp");
                     if ("admin".equals(role)) {
                    	    res.sendRedirect("admin_dashboard.jsp");
                    	}
                     
                     else if("staff".equals(role)) {
                    	 res.sendRedirect("staff_dashboard.jsp");
                     }
                     
                     else {
                    	    res.sendRedirect("dashboard.jsp");
                    	}
                     
                     
                 } else {
                     res.getWriter().println("Login failed. Invalid credentials.");
                 }
             }
        	
        	
        }
        catch (Exception e) {
        	
        	 e.printStackTrace();
        	
        }
		
	}

}
