<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<html>
<head>
    <title>Add Doctor</title>
    <link rel="stylesheet" href="./admind.css">
    <link rel="stylesheet" href="./style (2).css">
    
    
</head>
<body>
 <div id="lading" style="background-image: url(body-bg.jpeg);background-size: cover; background-position: center;">
      <div id="nav">
          <div id="logo">
              <h1 id="logo-title" >&#2349;&#2366;&#2352;&#x0924; Cares</h1>
          </div>
          <div id="btn-nav">
             <a class="btn-box" href="./adminadd.jsp">Home </a>
 
              <a class="btn-box" href="./about us.html">About Us</a>
               <a class="btn-box" href="./index.html">Logout</a>
          </div>
      </div>
  </div>
  <br>
    <h1 class="head" style="color:black;">Add Doctor</h1>
    
    <%-- Insert a new patient into the database --%>
    <%
        String uname = request.getParameter("name");
        String  uemail=request.getParameter("email");
        String upwd = request.getParameter("pass");

        // JDBC variables
        Connection con = null;
        PreparedStatement stmt = null;
Statement smt = null;
        try {
        	 Class.forName("com.mysql.cj.jdbc.Driver");
             con = DriverManager.getConnection("jdbc:mysql://localhost:3306/appointment", "root", "Arpita");
             smt = con.createStatement();

            // Disable auto-commit to manage transactions manually
            con.setAutoCommit(false);

            stmt = con.prepareStatement("INSERT INTO doctor (name,email, pass) VALUES (?, ?, ?)");
            stmt.setString(1, uname);
            stmt.setString(2, uemail);
            stmt.setString(3, upwd);

            // Execute the update
            int rowsAffected = stmt.executeUpdate();

            // Commit the transaction
            con.commit();

            
            out.println("<p style='text-align:center;color:#1f4772'>Doctor added successfully!</p>");
        } catch (ClassNotFoundException | SQLException e) {
            // Handle exceptions
            if (con != null) {
                try {
                    // Rollback the transaction in case of an exception
                    con.rollback();
                } catch (SQLException rollbackException) {
                    rollbackException.printStackTrace();
                }
            }
            e.printStackTrace();
        } finally {
            // Close resources in the finally block to ensure they are always closed
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException closeException) {
                closeException.printStackTrace();
            }
        }
    %>
    
    <form method="post" action="admindash.jsp">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>
        <br>
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>
        <br>
        <label for="password">Password:</label>
        <input type="password" id="email" name="pass" required>
        <input type="submit" value="Add">
    </form>
    
    <p class="padd"><a href="./adminadd.jsp">Back to Admin Dashboard</a></p>
    <p class="padd"><a href="./index.html">Logout</a></p>
    <div class="footer" style="height: 350px;background: rgb(21,21,24);
background: linear-gradient(90deg, rgba(21,21,24,0.8184523809523809) 0%, rgba(21,21,28,1) 35%, rgba(124,143,146,1) 100%);">
        <br><p id="p-tag"><i>Trusted Healing, Our Commitment</i></p><br>
        <h1>&#2349;&#2366;&#2352;&#x0924; Cares</h1>
        <br><br>
        <div id="footer-middle">
            <div id="email"><i>bharatcares@gmail.com</i></div>
            
            <div id="call-div">
                <img id="clock-footer" src="clock-footer.png" alt="clock">
                <i id="call">  +91 77508 16851</i>
            </div>
        </div>
        <br>
        <div style="padding: 0 80px 0;"><hr style="border: 1px solid rgb(53, 53, 53)"></div>
        <br>
        <div id="social-media">
            <img src="logo-f-no-bg.png" alt="social media" class="sm-logo">
            <img src="logo-i-no-bg.png" alt="social media" class="sm-logo">
            <img src="logo-t-no-bg.png" alt="social media" class="sm-logo">
            <img src="logo-w-no-bg.png" alt="social media" class="sm-logo">
        </div>

    </div>
</body>
</html>
