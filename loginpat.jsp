<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Sign in</title>
    
    <script>
        function showAlert(message) {
            alert(message);
            window.location.href="./loginpath.jsp";
        }
        function sAlert(message) {
            alert(message);
            window.location.href="./indexdup.html";
        }
    </script>
</head>
<body>
<%
    // Database connection details

    // Retrieve user input
    String uname = request.getParameter("email1");
    String upwd = request.getParameter("password1");

    // JDBC variables
    Connection con = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    try {
        // Establish database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/appointment", "root", "Arpita");

        // Prepare SQL query
        String sql = "SELECT * FROM user WHERE email=? AND pass=?";
        pst = con.prepareStatement(sql);

        pst.setString(1, uname);
        pst.setString(2, upwd);
        rs = pst.executeQuery();

        // Check if the user exists
        if (rs.next()) {
            // User authenticated', set session attribute and redirect
            session = request.getSession();
            session.setAttribute("uname", uname);
            System.out.println(uname);%>
            <script>
            	sAlert("Signin Successfull.");
            </script><% 
            //response.sendRedirect("ok1.jsp"); // Redirect to a valid page after successful login
        } else {
            // Invalid credentials, display an error message using JavaScript
            %>
            <script>
                showAlert("Invalid username or password. Please try again.");
                // Redirect after displaying the alert if needed
                // window.location.href="loginpath.jsp";
            </script>
            <%
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close database connections
        try {
            if (rs != null) rs.close();
            if (pst != null) pst.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
</body>
</html>
