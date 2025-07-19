<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
<style>
  body {
    font-family: Arial, sans-serif;
    background: #f4f6f8;
    margin: 0;
    padding: 0;
  }
  nav {
    background: #2d3e50;
    padding: 16px 0;
    text-align: center;
    box-shadow: 0 2px 4px rgba(0,0,0,0.05);
  }
  nav a {
    color: #fff;
    text-decoration: none;
    margin: 0 18px;
    padding: 8px 18px;
    border-radius: 4px;
    transition: background 0.2s;
    font-weight: 500;
    font-size: 16px;
    display: inline-block;
  }
  nav a:hover, nav a:focus {
    background: #1abc9c;
    color: #fff;
  }
  .container {
    max-width: 600px;
    margin: 40px auto;
    background: #fff;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.07);
    padding: 32px 24px;
    text-align: center;
  }
  h2 {
    color: #2d3e50;
    margin-bottom: 12px;
  }
  p {
    color: #555;
    font-size: 18px;
  }
</style>
</head>
<body>
<nav>
  <a href="UserServlet?action=viewProfile">Profile</a>
  <a href="UserServlet?action=updatePasswordForm">Update Password</a>
  <a href="UserServlet?action=fetchRecords">My Records</a>
  <a href="UserServlet?action=logout">Logout</a>
</nav>
<div class="container">
  <h2>Welcome, <%= username %>!</h2>
  <p>You have successfully logged in.</p>
</div>
</body>
</html>