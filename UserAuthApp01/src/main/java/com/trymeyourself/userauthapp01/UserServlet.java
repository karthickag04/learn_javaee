package com.trymeyourself.userauthapp01;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserServlet extends HttpServlet {
	
	
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		
		String action = req.getParameter("action");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
		
		try(Connection conn = DBConnection.getConnection())
		{
			
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
                    HttpSession session = req.getSession();
                    session.setAttribute("username", username);
                    res.sendRedirect("dashboard.jsp");
                } else {
                    res.getWriter().println("Login failed. Invalid credentials.");
                }
            }
			else if ("updatePassword".equals(action)) {
                HttpSession session = req.getSession(false);
                if (session == null || session.getAttribute("username") == null) {
                    res.sendRedirect("login.jsp");
                    return;
                }

                String newPassword = req.getParameter("newPassword");

                pst = conn.prepareStatement("UPDATE users SET password=? WHERE username=?");
                pst.setString(1, newPassword);
                pst.setString(2, (String) session.getAttribute("username"));
                int row = pst.executeUpdate();

                if (row > 0) {
                    req.setAttribute("msg", "Password updated successfully.");
                } else {
                    req.setAttribute("msg", "Password update failed.");
                }

                req.getRequestDispatcher("update-password.jsp").forward(req, res);
            }
			
			
		}
		catch (Exception e) 
		{}
		
	}

	
	
	
	
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String action = req.getParameter("action");
        
        
        HttpSession session = req.getSession(false);
        
        if (session == null || session.getAttribute("username") == null) {
            res.sendRedirect("login.jsp");
            return;
        }
        
        
        try (Connection conn = DBConnection.getConnection()) {
        	
        	
        	if ("updatePasswordForm".equals(action)) {
        	    req.getRequestDispatcher("update-password.jsp").forward(req, res);
        	}
        	
        	else if("viewProfile".equals(action)) {
			    String user_name = (String) session.getAttribute("username");
			    req.setAttribute("username", user_name);

			    // Forward to the profile page
			    req.getRequestDispatcher("profile.jsp").forward(req, res);
			}
			
			else if ("logout".equals(action)) {
				session.invalidate();
				res.sendRedirect("login.jsp");
			}

        }
        catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Error: " + e.getMessage());
        }
    }
}
