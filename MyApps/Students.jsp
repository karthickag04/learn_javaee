<%@ page import="java.sql.*, java.util.*" %>
<%!
    // Student class definition
    public class Student {
        private int id;
        private String name;
        private String gender;
        private String grade;
        private int marks;
        private String city;

        public Student(int id, String name, String gender, String grade, int marks, String city) {
            this.id = id;
            this.name = name;
            this.gender = gender;
            this.grade = grade;
            this.marks = marks;
            this.city = city;
        }

        public int getId() { return id; }
        public void setId(int id) { this.id = id; }
        public String getName() { return name; }
        public void setName(String name) { this.name = name; }
        public String getGender() { return gender; }
        public void setGender(String gender) { this.gender = gender; }
        public String getGrade() { return grade; }
        public void setGrade(String grade) { this.grade = grade; }
        public int getMarks() { return marks; }
        public void setMarks(int marks) { this.marks = marks; }
        public String getCity() { return city; }
        public void setCity(String city) { this.city = city; }
    }

    // DAO method to fetch students
    public List<Student> getAllStudents() {
        List<Student> students = new ArrayList<>();
        String url = "jdbc:mysql://localhost:3306/studentdb";
        String user = "test01";
        String password = "test@123";
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT * FROM students");

            while (rs.next()) {
                Student student = new Student(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("gender"),
                    rs.getString("grade"),
                    rs.getInt("marks"),
                    rs.getString("city")
                );
                students.add(student);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (stmt != null) stmt.close(); } catch (Exception e) {}
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }
        return students;
    }
%>
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
        .error {
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>
    <h2>10th Grade Student Records</h2>

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
            // Scriptlet section for data access
            List<Student> students = null;
            String errorMessage = null;
            
            try {
                students = getAllStudents();
            } catch (Exception e) {
                errorMessage = e.getMessage();
            }
        %>

        <%-- Expression section for displaying data --%>
        <% if (errorMessage != null) { %>
            <tr><td colspan="6" class="error"><%= errorMessage %></td></tr>
        <% } else if (students != null) { %>
            <% for (Student student : students) { %>
                <tr>
                    <td><%= student.getId() %></td>
                    <td><%= student.getName() %></td>
                    <td><%= student.getGender() %></td>
                    <td><%= student.getGrade() %></td>
                    <td><%= student.getMarks() %></td>
                    <td><%= student.getCity() %></td>
                </tr>
            <% } %>
        <% } %>
    </table>
</body>
</html>