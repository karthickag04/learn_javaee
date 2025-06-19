<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<h2>Calculation Result</h2>

     <%
            Integer result = (Integer) request.getAttribute("finalresult");
     %>
        <p>The sum is: <%= result %></p>
  
      
   
    
    

</body>
</html>