<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>My Profile</title>
</head>
<body>
    <h2>User Profile</h2>
    <p><strong>Username:</strong> <%= username %></p>
    <p><a href="dashboard.jsp">Back to Dashboard</a></p>
</body>
</html>
