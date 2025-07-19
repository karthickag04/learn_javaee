<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>Register</h2>
    <form action="UserServlet" method="post">
        Username: <input type="text" name="username" required /><br/>
        Password: <input type="password" name="password" required /><br/>
        <input type="hidden" name="action" value="register" />
        <input type="submit" value="Register" />
    </form>
    <a href="login.jsp">Already have an account? Login here.</a>
</body>
</html>