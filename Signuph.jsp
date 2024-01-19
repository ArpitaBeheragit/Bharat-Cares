<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up Page</title>
<link rel="stylesheet" href="./signup.css">
<script>
  
function validate() {
    let emailField = document.getElementById("email");
    let passField = document.getElementById("password");
    let email1 = emailField.value;
    let pass1 = passField.value;

    if (email1.length < 6 || email1 === "") {
        alert("Please enter a valid email (at least 6 characters)");
        emailField.value = ""; // Reset email field
        passField.value = ""; // Reset password field
        emailField.focus(); // Set focus to email field
        return false; // Prevent form submission
    } if (pass1.length < 6) {
        alert("Your password must contain at least 6 characters");
        passField.value = ""; // Reset password field
        passField.focus(); // Set focus to password field
        return false; // Prevent form submission
    } else if (!/[A-Z]/.test(pass1)) {
        alert("Your password should contain at least 1 uppercase letter");
        passField.value = ""; // Reset password field
        passField.focus(); // Set focus to password field
        return false; // Prevent form submission
    } else if (!/\d/.test(pass1)) {
        alert("Your password should contain at least 1 digit");
        passField.value = ""; // Reset password field
        passField.focus(); // Set focus to password field
        return false; // Prevent form submission
    } else {
        // Validation passed, allow form submission
        return true;
    }
}


</script>

</head>
<body>
<%-- Use <%= %> to output the value --%>

    <div class="center">
      <h1>Sign Up</h1>
      <form id="form" method="post" action="./signup.jsp" onsubmit="return validate();">
        <div class="txt_field">
          <input type="email" name="email1" id="email" required>
          <span></span>
          <label>Email</label>
        </div>
        <div class="txt_field">
          <input type="password" name="password1" id="password" required>
          <span></span>
          <label>Password</label>
        </div>
        <div class="warning">
          <p>*your password must contain at least 6 characters</p>
          <p>*your password must contain one upper case letters</p>
          <p>*your password must contain one digit</p>
        </div>
        <div class="signup_link">
          Already a member? <a href="./loginpath.jsp">LogIn</a>
        </div>
      
        <div class="patbut">
        <button type="submit" name="Signup" id="Signup" class="form-Submit">Sign up</button>
          
        </div>
      </form>
    </div>
    

</body>

</html>


