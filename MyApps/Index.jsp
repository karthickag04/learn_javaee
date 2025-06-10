<%@ page import="java.sql.*" %>
<!-- <%@ page contentType="text/html; charset=UTF-8" language="java" %> -->
<html>
<head>
    <title>Student Records</title>
    <style>
        table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
        }
        th, td {
            border: 1px solid #555;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #f4b400;
        }
        h2 {
            text-align: center;
        }
    </style>
</head>
<body>
    <h2>📋 10th Grade Student Records</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Gender</th>
            <th>Grade</th>
            <th>Marks</th>
            <th>City</th>
        </tr>

<%
    String url = "jdbc:mysql://localhost:3306/studentdb";
    String user = "test01"; // use your MySQL username
    String password = "test@123"; // replace with your MySQL password

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);
        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT * FROM students");

        while (rs.next()) {
%>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("gender") %></td>
            <td><%= rs.getString("grade") %></td>
            <td><%= rs.getInt("marks") %></td>
            <td><%= rs.getString("city") %></td>
        </tr>
<%
        }
    } catch (Exception e) {
        out.println("<tr><td colspan='6' style='color:red'>" + e.getMessage() + "</td></tr>");
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception e) {}
        try { if (stmt != null) stmt.close(); } catch (Exception e) {}
        try { if (conn != null) conn.close(); } catch (Exception e) {}
    }
%>
    </table>
</body>
</html>
