<%@ page import="java.sql.*,java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page language="java" %>

<%
    String uname = request.getParameter("email1");
    String upwd = request.getParameter("password1");

    Connection con = null;
    PreparedStatement preparedStatement = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/appointment", "root", "Arpita");

        // Check if the user already exists
        PreparedStatement checkUser = con.prepareStatement("SELECT * FROM user WHERE email=?");
        checkUser.setString(1, uname);
        ResultSet existingUser = checkUser.executeQuery();

        if (existingUser.next()) {
            // User already exists, prompt for confirmation
%>
            <script>
                var isConfirmed = confirm("User already exists. Do you want to sign in?");
                if (isConfirmed) {
                    // Redirect to the signin page
                    window.location.href = "<%= request.getContextPath() + "/loginpath.jsp" %>";
                } 
                else {
                	alert('Signup canceled.');
                window.location.href = "<%= request.getContextPath() + "/index.html" %>";
            
                }

            </script>
<%
        } else {
            // User does not exist, proceed with registration
            preparedStatement = con.prepareStatement("INSERT INTO user(email, pass) VALUES (?, ?)");
            preparedStatement.setString(1, uname);
            preparedStatement.setString(2, upwd);
            preparedStatement.executeUpdate();
%>
            <script>
                alert("User registered successfully!");
                // Redirect to the signin page
                window.location.href = "<%= request.getContextPath() + "/indexdup.html" %>";
            </script>
<%
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        try {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            out.println("Error closing database resources: " + e.getMessage());
        }
    }
%>
