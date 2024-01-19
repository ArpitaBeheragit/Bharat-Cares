
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
    	function showAlert(msg){
    		alert(msg);
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
        pst = con.prepareStatement("SELECT name FROM doctor WHERE email=? AND pass=?");
        // Prepare SQL query
        
        
       
        
        pst.setString(1, uname);
        pst.setString(2, upwd);
        
        
        // Execute query
        rs = pst.executeQuery();

        // Check if the user exists
        if (rs.next()) {
            // User authenticated, redirect to homepage
            String doctorName = rs.getString("name"); 
            System.out.println(doctorName);
            
            session = request.getSession();
            session.setAttribute("doctorName", doctorName);
%>
            <%
                out.println("<script>alert('Signin Successfull.');");
                out.println("window.location.href='" + request.getContextPath() + "/indexdoc_dup.html';</script>");
            %>
<%
        } else {
%>
            <%
                out.println("<script>alert('Invalid username or password. Please try again.');");
                out.println("window.location.href='" + request.getContextPath() + "/Dloginh.jsp';</script>");
            %><% 
          
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
    