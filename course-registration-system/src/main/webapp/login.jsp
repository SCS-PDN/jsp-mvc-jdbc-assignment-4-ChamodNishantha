<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<html>
<head>
    <title>Student Login</title>
</head>
<body>

<h2>Student Login</h2>

<%
    String error = request.getParameter("error");
    if (error != null) {
%>
    <p style="color:red;">Invalid email or password</p>
<%
    }
%>

<form action="login" method="post">
    Email:
    <input type="text" name="email" required><br><br>

    Password:
    <input type="password" name="password" required><br><br>

    <input type="submit" value="Login">
</form>

</body>
</html>