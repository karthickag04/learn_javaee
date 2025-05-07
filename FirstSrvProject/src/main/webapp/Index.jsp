<!DOCTYPE html>
<html>
<head>
    <title>Simple Addition Form</title>
</head>
<body>
    <h2>Enter two numbers to add:</h2>
    <form action="AddServlet" method="POST">
        <label for="num1">Number 1:</label>
        <input type="text" id="num1" name="num1" required/><br/><br/>
        <label for="num2">Number 2:</label>
        <input type="text" id="num2" name="num2" required/><br/><br/>
        <input type="submit" value="Add Numbers"/>
    </form>
</body>
</html>
