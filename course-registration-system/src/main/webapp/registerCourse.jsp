<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*, com.university.util.DBConnection" %>

<html>
<head>
    <title>Register Course</title>
</head>
<body>

<%
    int studentId = Integer.parseInt(request.getParameter("studentId"));
    int courseId = Integer.parseInt(request.getParameter("courseId"));

    try {
        Connection con = DBConnection.getConnection();

        String sql = "INSERT INTO registrations(student_id, course_id, date) VALUES (?, ?, CURDATE())";
        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, studentId);
        ps.setInt(2, courseId);

        int rows = ps.executeUpdate();

        if (rows > 0) {
%>
            <h2>Course registered successfully!</h2>
<%
        }

        con.close();

    } catch (Exception e) {
%>
        <h2 style="color:red;">Registration failed.</h2>
        <p>You may have entered wrong Student ID.</p>
<%
        e.printStackTrace();
    }
%>

<a href="courses.jsp">Back to Courses</a>

</body>
</html>