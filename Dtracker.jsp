<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">

<title>Appointments</title>
    <link rel="icon" href="title-icon-no-bg.png">
    <link rel="stylesheet" href="./style (2).css">
    <!-- <link rel="stylesheet" href="https://fonts.google.com/specimen/Lunasima?preview.size=45&category=Sans+Serif,Display,Handwriting,Monospace"> -->
    <style>
        th {
            height: 37px;
            color: white;
            background: #485563;
            background: -webkit-linear-gradient(to right, #29323c, #485563);
            background: linear-gradient(to right, #29323c, #485563);
        }
        td {
            background-color: black;
            background-color: whitesmoke;
        }
        th,td {
            border: 1px solid black;
            position: relative;
            box-shadow: rgba(50, 50, 93, 0.25) 0px 30px 60px -12px inset, rgba(0, 0, 0, 0.3) 0px 18px 36px -18px inset;
            border-radius: 2px;
        }
        table {
            width: 100%;
            height: 100%;
            border: 1px solid black;
            font-family: Sans+Serif,Display,Handwriting,Monospace;
            font-size: 21px;
            font-weight: normal;
        }
        body {
            background-image: url("https://t3.ftcdn.net/jpg/02/16/47/22/240_F_216472247_cT66WDoS0fp1s3wC7eaykMJNDGVbOBPq.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            background-attachment: fixed;
            background-position: center center;
        }
        #myTable {
            backdrop-filter: brightness(18%);
        }
        #myheading {
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
        String doctorName = (String) session.getAttribute("doctorName");
		System.out.println("Dtracker = "+doctorName);
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/appointment", "root", "Arpita");
        smt = con.createStatement();
        String query = "SELECT CONCAT(a.fname, ' ', a.lname) as name, a.phone, a.docname, a.date, a.time, a.symptoms, p.* FROM appoint a NATURAL JOIN patient p WHERE a.phone = p.phone AND a.docname = '" + doctorName + "'";
        rs = smt.executeQuery(query);
%>
<div id="lading" style="background-size: cover; background-position: center;">
    <div id="nav">
        <div id="logo">
            <h1 id="logo-title">&#2349;&#2366;&#2352;&#x0924; Cares</h1>
            
            
        </div>
        <div id="btn-nav">
           <a class="btn-box" href="./indexdoc_dup.html">Home </a>
                 <a class="btn-box" href="./about us.html">About Us</a>
<a class="btn-box" href="./Dtracker.jsp">Track Appointments</a>
<a class="btn-box" href="./index.html">Logout</a>
        </div>
    </div>
</div>
<br>
   
<div id="myheading">
<h1><%out.print("Welcome  "+ doctorName); %></h1><br>
    <h1>My Appointments</h1>
</div>
<hr>
<div class="mydiv">
    <table id="myTable">
        <thead>
            <tr>
                <th>Name</th>
                <th>DOB</th>
                <th>Gender</th>
                <th>Phone Number</th>
                <th>Date</th>
                <th>Time</th>
                <th>Symptoms</th>
                <th>Previous Medication</th>
                <th>Blood Donation</th>
                <th>Surgery</th>
                <th>Blood Group</th>
                <th>Height</th>
                <th>Weight</th>
            </tr>
        </thead>
        <tbody><% 
         while (rs.next()) {
        %>
            <tr>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getString("dob") %></td>
                <td><%= rs.getString("gender") %></td>
                <td><%= rs.getString("phone") %></td>
                <td><%= rs.getString("date") %></td>
                <td><%= rs.getString("time") %></td>
                <td><%= rs.getString("symptoms") %></td>
                <td><%= rs.getString("prevMediaction") %></td>
                <td><%= rs.getString("bloodDonor") %></td>
                <td><%= rs.getString("prevSurgeries") %></td>
                <td><%= rs.getString("bloodGroup") %></td>
                <td><%= rs.getString("height") %></td>
                <td><%= rs.getString("weight") %></td>
            </tr><%} %>
        </tbody>
    </table>
</div>
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
