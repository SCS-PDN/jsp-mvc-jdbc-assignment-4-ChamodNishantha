<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*, com.university.util.DBConnection" %>

<html>
<head>
    <title>Courses</title>
</head>
<body>

<h2>Available Courses</h2>

<table border="1" cellpadding="10">
<tr>
    <th>Course ID</th>
    <th>Course Name</th>
    <th>Instructor</th>
    <th>Credits</th>
    <th>Action</th>
</tr>

<%
    try {
        Connection con = DBConnection.getConnection();

        String sql = "SELECT * FROM courses";
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
%>

<tr>
    <td><%= rs.getInt("course_id") %></td>
    <td><%= rs.getString("name") %></td>
    <td><%= rs.getString("instructor") %></td>
    <td><%= rs.getInt("credits") %></td>
    <td>
        <form action="registerCourse.jsp" method="post">
            <input type="hidden" name="courseId" value="<%= rs.getInt("course_id") %>">
            Student ID:
            <input type="number" name="studentId" required>
            <input type="submit" value="Register">
        </form>
    </td>
</tr>

<%
        }

        con.close();

    } catch (Exception e) {
        e.printStackTrace();
    }
%>

</table>

<br>
<a href="dashboard.jsp">Back to Dashboard</a>

</body>
</html>