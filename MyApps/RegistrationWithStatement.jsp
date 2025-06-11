<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        form {
            width: 400px;
            margin: 30px auto;
            padding: 20px;
            border: 1px solid #ccc;
            background: #f9f9f9;
        }
        label {
            display: block;
            margin: 10px 0 5px;
        }
        input, select {
            width: 100%;
            padding: 8px;
        }
        button {
            margin-top: 15px;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        h2 {
            text-align: center;
        }
        .message {
            text-align: center;
            font-weight: bold;
            margin-top: 15px;
        }
    </style>
</head>
<body>

<h2>📝 Student Registration Form</h2>

<form method="post">
    <label for="name">Name:</label>
    <input type="text" name="name" required />

    <label for="gender">Gender:</label>
    <select name="gender" required>
        <option value="">--Select--</option>
        <option value="Male">Male</option>
        <option value="Female">Female</option>
    </select>

    <label for="grade">Grade:</label>
    <input type="text" name="grade" required />

    <label for="marks">Marks:</label>
    <input type="number" name="marks" required />

    <label for="city">City:</label>
    <input type="text" name="city" required />

    <button type="submit">Register</button>
</form>

<%
    String url = "jdbc:mysql://localhost:3306/studentdb";
    String user = "test01";
    String password = "test@123";

    Connection conn = null;
    Statement stmt = null;

    // Handle form submission
    String name = request.getParameter("name");
    String gender = request.getParameter("gender");
    String grade = request.getParameter("grade");
    String marksStr = request.getParameter("marks");
    String city = request.getParameter("city");

    if (name != null && gender != null && grade != null && marksStr != null && city != null) {
        try {
            int marks = Integer.parseInt(marksStr);

            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);
            stmt = conn.createStatement();



           String sql = "INSERT INTO students (name, gender, grade, marks, city) VALUES ('" 
                        + name + "', '" 
                        + gender + "', '" 
                        + grade + "', " 
                        + marks + ", '" 
                        + city + "')";

            int rows = stmt.executeUpdate(sql);
            if (rows > 0) {
%>
                <div class="message" style="color: green;">✅ Record inserted successfully!</div>
<%
            } else {
%>
                <div class="message" style="color: red;">❌ Failed to insert record.</div>
<%
            }
        } catch (Exception e) {
%>
            <div class="message" style="color: red;">Error: <%= e.getMessage() %></div>
<%
        } finally {
            try { if (stmt != null) stmt.close(); } catch (Exception e) {}
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }
    }
%>

</body>
</html>
