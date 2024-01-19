<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Appointment Details</title>
    <link rel="icon" href="title-icon-no-bg.png">
    <link rel="stylesheet" href="./style (2).css">
    <style>
        th {
            border: 1px solid black;
            height: 37px;
            color: white;
            text-align: center;
        }

        td {
            color: white;
            text-align: center;
        }

        th, td {
            position: relative;
        }

        table {
            width: 100%;
            height: 100%;
            border-radius: 3px;
            font-family: Sans+Serif, Display, Handwriting, Monospace;
            font-size: 21px;
            font-weight: normal;
        }

        body {
        	font-family: "Times New Roman", Times, serif;
            background-color: #3CA55C;
            background: -webkit-linear-gradient(to right, #B5AC49, #3CA55C);
            background: linear-gradient(to right, #B5AC49, #3CA55C);
            color: #FFFFFF;
        }

        #myTable {
            background-attachment: fixed;
            backdrop-filter: brightness(18%);
        }

        .mydiv {
            width: 100%;
            border-radius: 6px;
        }

        .button {
            background: #e91f04;
            background: -webkit-linear-gradient(to right, #061700, #e43509);
            background: linear-gradient(#e30101);
            border: none;
            color: white;
            border-radius: 2px;
            padding: 10px 29px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px 11px 3px;
            cursor: pointer;
        }

        #myhead {
            font-size: 130%;
            text-align: center;
            padding: 0px 5px 0px;
        }

        #input {
            display: flex;
            justify-content: flex-end;
        }

        #mail {
            height: 22px;
            width: 195px;
            border-radius: 2px;
        }
    </style>
</head>
<body>
    <%
        Connection con = null;
        Statement smt = null;
        ResultSet rs = null;

        try {
        	String email = (String) session.getAttribute("uname");
        	System.out.println("Ptacker= "+email);
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/appointment", "root", "Arpita");
            smt = con.createStatement();
            String query = "SELECT id, concat(a.fname,' ',a.lname) as name ,CONCAT(a.date, ' / ', a.time) as datetime, a.docname, a.phone, a.symptoms, p.email,p.phone FROM appoint a natural join patient p where p.phone=a.phone AND p.email = '" + email + "'" ;
            rs = smt.executeQuery(query);
            
           // String nm1 = rs.getString("lname");
            //String s
    %>
    <div id="lading" style="background-image: url(body-bg.jpeg);background-size: cover; background-position: center;">
    <div id="nav">
        <div id="logo">
            <h1 id="logo-title">&#2349;&#2366;&#2352;&#x0924; Cares</h1>
            
            
        </div>
        <div id="btn-nav">
            <a class="btn-box" href="./indexdup.html">Home </a>
                    <a class="btn-box" href="./about us.html">About us </a>
                    <a class="btn-box" href="./Appointment2.html">Appointments</a>
                    <a class="btn-box" href="./patientRegs.html">Patient Details</a>
                    <a class="btn-box" href="./Ptracker.jsp">Tracker</a>
                    <a class="btn-box" href="./index.html">Logout</a>
        </div>
    </div>
</div>
<br>
    <div class="register">
        
        <div id="myhead">
            <h1>Appointments</h1>
        </div>
        <hr>
        <div class="mydiv">
            <table id="myTable">
                <thead>
                    <tr>
                        <th>D/T</th>
                        <th>Symptoms</th>
                        <th>Doctor Name</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        while (rs.next()) {
                        	int id = rs.getInt("id");
                        	String s = rs.getString("name");
                            String datetime = rs.getString("datetime");
                            String symptoms = rs.getString("symptoms");
                            String docname = rs.getString("docname");
                            String phone = rs.getString("phone");
                    %>
                            <tr>
                                <td><%= datetime %></td>
                                <td><%= symptoms %></td>
                                 <td><%= docname %></td>
                                <td><button type="button" onclick="deleteAppointment('<%= id %>');" class="button">Withdraw</button></td>
                            </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
    <script type="text/javascript">
        function deleteAppointment(id) {
            if (confirm("Are you sure you want to withdraw this Appointment!")) {
                // Use AJAX to call the server-side delete function
                var xhr = new XMLHttpRequest();
                xhr.open("GET", "DeleteAppointment.jsp?id=" + id, true);
                xhr.onreadystatechange = function () {
                    if (xhr.readyState == 4 && xhr.status == 200) {
                        // Reload the page or update the table as needed
                        window.location.reload();
                    }
                };
                xhr.send();
            }
        }
    </script>
    <%
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (smt != null) smt.close();
                if (con != null) con.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    %>
</body>
</html>
