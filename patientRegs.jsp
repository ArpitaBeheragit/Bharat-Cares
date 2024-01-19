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
ResultSet rs=null;
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
    String dob = request.getParameter("dob");
    String gender = request.getParameter("Gender");
    String phone = request.getParameter("phone");
    String email = request.getParameter("email");
    String addr = request.getParameter("address");
    String city = request.getParameter("city");
    String state = request.getParameter("state");
    int pin = Integer.parseInt(request.getParameter("pincode"));
    String prevMedication = request.getParameter("prev_medication");
    String bloodDonor = request.getParameter("blood_donor");
    String prevSurgeries = request.getParameter("prev_surgeries");
    String bloodGroup = request.getParameter("blood_group");
    int weight =Integer.parseInt( request.getParameter("weight"));
    int height = Integer.parseInt(request.getParameter("height"));
    //String qry1="Select email from user";
    //rs=smt.executeQuery(qry1);
    //String mail=rs.getString(email);
        String qry = "INSERT INTO patient VALUES('" + fname + "','" + lname + "','" + dob + "','" + gender + "','" + phone + "','"+email+"','"+addr+"','"+city+"','"+state+"',"+pin+",'"+prevMedication+"','"+bloodDonor+"','"+prevSurgeries+"','"+bloodGroup+"',"+weight+","+height+")";
        int i = smt.executeUpdate(qry);
    %>
          <script>
    <%
          	if (i>0){
    %>
          		 //document.getElementById("register").reset();
                 alert("Patient added successfully.");
                 window.location.href = "patientRegs.html";
          	<%}
          	else { %>
            	alert("An error has occured")
                window.location.href = "patientRegs.html";
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
