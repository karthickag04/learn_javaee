<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String msg = (String) request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Password</title>
</head>
<body>
    <h2>Update Your Password</h2>
    
    <% if (msg != null) { %>
        <p style="color: green;"><%= msg %></p>
    <% } %>

    <form method="post" action="UserServlet?action=updatePassword">
        <label>New Password:</label>
        <input type="password" name="newPassword" required><br><br>
        <input type="submit" value="Update Password">
    </form>
    
    <p><a href="dashboard.jsp">Back to Dashboard</a></p>
</body>
</html>
