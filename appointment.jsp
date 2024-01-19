<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Details</title>
</head>
<body>
    <%
        Connection con = null;
        Statement smt = null;

        try {
        	
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/appointment", "root", "Arpita");
            smt = con.createStatement();
        } catch (Exception ee) {
            ee.printStackTrace();
        }
    %>

    <%
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname"); 
    String phone = request.getParameter("phone");
    String docname = request.getParameter("docname");
    String date = request.getParameter("date");
    String time = request.getParameter("time");
    String symptoms = request.getParameter("symptoms");
        String qry = "INSERT INTO appoint (fname, lname, phone, docname,date, time , symptoms) VALUES('" + fname + "','" + lname + "','" + phone + "','" + docname + "','" + date + "','"+time+"','"+symptoms+"')";
        int i = smt.executeUpdate(qry);
    %>
          <script>
    <%
          	if (i>0){
    %>
          		 //document.getElementById("register").reset();
                 alert("Appointment submitted.");
                 window.location.href = "Appointment2.html";
                
          	<%}
          	else { %>
            	alert("An error has occured")
                window.location.href = "Appointment2.html";
           <% } %>
          </script>
    <%
 
    
        try {
            if (smt != null) smt.close();
            if (con != null) con.close();
        } catch (SQLException se) {
            se.printStackTrace();
        }
    %>
</body>
</html>
