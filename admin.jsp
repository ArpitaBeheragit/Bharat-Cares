<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>AdminPage</title>
    <link rel="stylesheet" href="./admin.css">
    <script>
   // function confirm() {
    //	alert("Login Successful");
   // }
    </script>
  </head>
  <body>
    <div class="center">
      <h1>Hello Admin!!</h1>
      <form id="form" method="post" action="./admin1.jsp" >
        <div class="txt_field">
          <input type="email" id="email" name="email1" required>
          <span></span>
          <label>Username/Email</label>
        </div>
        <div class="txt_field">
          <input type="password" id="password" placeholder="Password" name="password1" required>
          <span></span>
          <label>Password</label>
        </div>
        <div class="pass">Forgot Password?</div>                                                                                                             
      <div class="sign">
        <button type="submit"  name="Signin" id="Signin" class="form-Submit">Submit</button>
    </div>
    </form>
    </div>
  </body>
</html>

