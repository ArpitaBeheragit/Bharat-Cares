<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>DocLoginPage</title>
    <link rel="stylesheet" href="./Dloginh.css">
  </head>
  <body>
    <div class="logo"><img  src="istockphoto-1004243378-612x612.jpg"></div>
    <div class="head">
        HELLO DOCTOR!!!
    </div>
    <div class="center">
      <h1>Login</h1>
      <form id="form" method="post" action="Doclogin.jsp">
        <div class="txt_field">
          <input type="email" id="email" placeholder="Email" name="email1" required>
          <span></span>
          <label>Email</label>
        </div>
        <div class="txt_field">
          <input type="password" id="password" placeholder="Password" name="password1" required>
          <span></span>
          <label>Password</label>
        </div>
        <div class="sign">
        <button type="submit">Login</button>
    </div>  
        
      </form>
      
    </div>
  </body>
</html>
