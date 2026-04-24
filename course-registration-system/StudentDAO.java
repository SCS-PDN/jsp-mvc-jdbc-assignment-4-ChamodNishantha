package com.university.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.university.model.Student;
import com.university.util.DBConnection;

public class StudentDAO {

    public Student login(String email, String password) {
        Student student = null;

        try {
            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM students WHERE email = ? AND password = ?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                student = new Student();

                student.setStudentId(rs.getInt("student_id"));
                student.setName(rs.getString("name"));
                student.setEmail(rs.getString("email"));
                student.setPassword(rs.getString("password"));
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return student;
    }
}