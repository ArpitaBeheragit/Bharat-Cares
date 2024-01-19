<%@ page import="java.sql.*,java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page language="java" %>

<%
    
    String uname = request.getParameter("feed12");
     String ufeed = request.getParameter("feed14");
    String ucont = request.getParameter("feed13");

    Connection con = null;
    PreparedStatement preparedStatement = null;

    try {
    	 Class.forName("com.mysql.cj.jdbc.Driver");
         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/appointment", "root", "Arpita");

        PreparedStatement pst = con.prepareStatement("INSERT INTO feedback(name,email,feedback) VALUES (?, ?, ? )");
        pst.setString(1, uname);
        pst.setString(2, ucont);
        pst.setString(3, ufeed);
        pst.executeUpdate();
%>
    <p>Feedback saved successfully!</p>
<%
        // Redirect to the signin page
        response.sendRedirect(request.getContextPath() + "/feedback.jsp");
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


