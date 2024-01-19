<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="./admin1.css">
    <link rel="stylesheet" href="./style (2).css">
    
</head>
<body>
  <div id="lading" style="background-image: url(body-bg.jpeg);background-size: cover; background-position: center; margin:0px">
      <div id="nav">
          <div id="logo">
              <h1 id="logo-title">&#2349;&#2366;&#2352;&#x0924; Cares</h1>
          </div>
          <div id="btn-nav">
             <a class="btn-box" href="./adminadd.jsp">Home </a>
 
              <a class="btn-box" href="./about us.html">About Us</a>
               <a class="btn-box" href="./index.html">Logout</a>
          </div>
      </div>
  </div>
 <br>
    <h1>Admin Dashboard</h1>
    
    <%-- Retrieve the number of doctors --%>
    <%!
        private int getNumberOfDoctors() throws SQLException, ClassNotFoundException {
            int count = 0;
            Connection con = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/appointment", "root", "Arpita");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM doctor");
                if (rs.next()) {
                    count = rs.getInt(1);
                }
            } finally {
                if (con != null) {
                    con.close();
                }
            }
            return count;
        }
    %>
    
    <p style="margin:10px 0px 17px 26px">Number of doctors: <%= getNumberOfDoctors() %></p>
    
    <%-- Retrieve all doctors --%>
    <%!
        private List<Map<String, Object>> getAllDoctors() throws SQLException, ClassNotFoundException {
            List<Map<String, Object>> doctorsList = new ArrayList<>();
            Connection con = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/appointment", "root", "Arpita");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM doctor");
                ResultSetMetaData rsmd = rs.getMetaData();
                int columnCount = rsmd.getColumnCount();
                while (rs.next()) {
                    Map<String, Object> doctor = new HashMap<>();
                    for (int i = 1; i <= columnCount; i++) {
                        doctor.put(rsmd.getColumnName(i), rs.getObject(i));
                    }
                    doctorsList.add(doctor);
                }
            } finally {
            	
                if (con != null) {
                    con.close();
                }
            }
            return doctorsList;
        }
    %>
    
    <%-- Display the list of doctors --%>
    <ul>
        <%
            List<Map<String, Object>> doctors = getAllDoctors();
            for (Map<String, Object> doctor : doctors) {
        %>
        <li style="margin:10px 0px 17px 26px"><%= doctor.get("name") %>, Email: <%= doctor.get("email") %></li>
        <%
            }
        %>
    </ul>
    
    <p class="padd"><a href="./admindash.jsp">Add Doctor</a></p>
    <p class="padd"><a href="./index.html">Logout</a></p>
    <div class="footer" style="height: 350px;background: rgb(21,21,24);
background: linear-gradient(90deg, rgba(21,21,24,0.8184523809523809) 0%, rgba(21,21,28,1) 35%, rgba(124,143,146,1) 100%);">
        <br><p id="p-tag"><i>Trusted Healing, Our Commitment</i></p><br>
        <h1 style="color:#c4c4c4">&#2349;&#2366;&#2352;&#x0924; Cares</h1>
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
