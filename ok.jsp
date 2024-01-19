<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./ok1.css">
    <title>Document</title>
</head>
<body>
    <div class="container">
        <div class="confirm">
            <img src=".next.png">
        </div>
        <button type="submit" class="btn" onclick="openPopup()">CONFIRM HERE ?</button>
        <div class="popup" id="popup">
            
            <div class="head">
                <h2>Thank You!</h2>
            </div>
            <p>Your Details has been successfully submitted. Thanks!</p>
            <div class="confirm">
                <a type="button" href="./loginpath.jsp">OK</a>
            </div>
        </div>

    </div>
</body>
<script>
    let popup = document.getElementById("popup");
    function openPopup(){
        popup.classList.add("open-popup");
    }
    function closePopup(){
        popup.classList.remove("open-popup");
    }
</script>
</html>
