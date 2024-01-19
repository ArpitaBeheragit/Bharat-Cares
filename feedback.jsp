<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback</title>
     <link rel="stylesheet" href="./styleindex.css">
    <style>
        
       .one{
            display: grid;
            grid-template-columns: column;
             width:70%;
             display:flex;
             justify-content: center;
             align-items: center;
             flex-direction: column;
             text-align: center;
             margin:20px auto;
             /* border:5px solid #609966; */
            /* border: 4px solid  #9bda7cc0;
             border-radius:4px;
             box-sizing: border-box;
             /* box-shadow:#ffffff; */
            box-shadow: -9px 9px 3px 1px rgba(112, 168, 39, 0.521);          

             
       }
        .one:hover{
              background-color:#609966;
        }*/
        .btn{
            display: flex;
            flex-direction: row;
            display: inline-block;
            color: #fff;
            background-color: #609966;
            border: none;
            border-radius: 5px;
            padding:12px 20 px;
            font-size :18px;
            cursor:pointer;
        }
        



.image
{
               width: 180px;
                 height: 100px;
                align-items: center;
                 border: 1px solid  rgba(168, 231, 51, 0);
                 box-shadow: -4px 4px 2px 1px rgba(112, 168, 39, 0.521);
                /* border-radius: 50%; */
                border-radius: 4%;
     
}
.review{
       width:250px;
       height: 350px;
       display:flex;
       flex-direction: column;
    
       padding: 20px;
       border: 3px solid  #9bda7cc0;
       border-radius: 6%;
       box-shadow: -8px 8px 2px 1px rgba(112, 168, 39, 0.521);
       box-shadow:#ffffff;
      
}
.two{
    display: grid;
    grid-template-columns: repeat(3,1fr);
    justify-content:space-evenly;
    
}
.heading{
              
             display:flex;
             justify-content: center;
             align-items: center;
             text-align: center;
             margin:20px auto;
             font-size: 70px;
             font-weight: 600;
             background-image: linear-gradient(to left,#40513B,#609966);
             color: #cbf1c6f3;
             text-shadow: -3px 3px rgba(0, 0, 0, 0.3);
             /* color:transparent; */
             background-clip:text;
             -webkit-background-clip: text;
}
body{
font-family: "Times New Roman", Times, serif;
    background: rgb(176,199,59);
            background: linear-gradient(45deg, rgba(176,199,59,1) 26%, rgba(142,221,76,1) 51%, rgba(34,125,7,1) 94%);
        }
        input
             {
                background-color: #fff; height: 50px; color: #191a1e;text-align:left; border: none; font-size: 18px; font-weight: 400; -webkit-box-shadow: none; box-shadow: none; border-radius: 40px; padding: 0 25px; }
.register hr{border-top: 1px solid #ffffff;
            
            

        }
        .tag{
            font-variant:unset;
        }
        .review:hover{
            /* background-color:#609966; */
            background-color: #609966;
        }
        .heart{
            width: 26px;
            height: 26px;
        }
        @media screen and (max-width:767px) {
                .two{
                    display: flex;
                    flex-wrap: wrap;
                }
                
            }
            @media screen and (min-width:1024px) {
                .two{
                    display: flex;
                    flex-wrap: nowrap;
                }
                
                
            }
            @media screen and (min-width:767px) and (max-width:1024px) {
                .two{
                    display: flex;
                    flex-wrap: nowrap;
                }
                
                
            } 
            .feedback-form {
            background-color: #fff;
            padding: 40px;
            border-radius: 8px;
            
        }

        .feedback-form label {
            display: block;
            margin-bottom: 8px;
        }

        .feedback-form input[type="text"] {
            width: 100%;
            padding-left: 70px;
            border-radius: 5px;
            border: 1px solid #ccc;
            margin-bottom: 15px;
            box-sizing: border-box;
            font-size: 18px;
        }
.feedback-form input[type="email"] {
            width: 100%;
            padding-left: 70px;
            border-radius: 5px;
            border: 1px solid #ccc;
            margin-bottom: 15px;
            box-sizing: border-box;
            font-size: 18px;
        }

        .feedback-form .btn {
        display: block;
            width: 100%;
            padding: 12px;
            background-color: #609966;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .feedback-form .btn:hover {
            background-color: #508055;
        }
             
        
    </style>
</head>
<body>
<div id="lading" style="background-image: url(body-bg.jpeg);background-size: cover; background-position: center;">
    <div id="nav">
        <div id="logo">
            <h1 id="logo-title">&#2349;&#2366;&#2352;&#x0924; Cares</h1>
            
            
        </div>
        <div id="btn-nav">
           <a class="btn-box" href="./index.html">Home </a>
                <a class="btn-box" href="./about us.html">About Us</a>
                <a class="btn-box" href="./index1.jsp">Login/Signup</a>
        </div>
    </div>
</div>
    <div class ="five" style="padding-bottom: 6%;">
        <h1 class = "heading">Customer Reviews</h1>
    </div>
    <div class ="two">
    <div class = "review">
        <div style="display: flex;">
            <div>
                <img class="heart" src="heartbeat.png" alt="heart">
                <img class="heart" src="heartbeat.png" alt="heart">
                <img class="heart" src="heartbeat.png" alt="heart">
                <img class="heart" src="heartbeat.png" alt="heart">
                <!-- <img class="heart" src="heart.png" alt="heart"> -->
            </div>
        </div>
    
     
    <p class = "tag">Dr. Sneha Patel: I had the privilege of consulting Dr. Sneha Patel for my recurring migraines. Her approach to patient care is exceptional, and she made me feel at ease throughout the treatment. Thanks to her expertise, my migraines have significantly reduced, and I'm grateful for her thoughtful and compassionate care.

    </p>
     <img  class ="image"src="male1-no-bg.png"   width : 20px height :20px alt="" srcset="">
    </div>
    <div class = "review">
        <div style="display: flex;">
            <div>
                <img class="heart" src="heartbeat.png" alt="heart">
                <img class="heart" src="heartbeat.png" alt="heart">
                <img class="heart" src="heartbeat.png" alt="heart">
                <img class="heart" src="heartbeat.png" alt="heart">
                <!-- <img class="heart" src="heart.png" alt="heart"> -->
            </div>
        </div>
    

        <p>Dr. Ravi Singh: My experience with Dr. Ravi Singh was exceptional. I sought his expertise for my chronic back pain, and he patiently listened to my concerns, providing me with comprehensive guidance. Dr. Singh's caring nature and dedication to patient well-being truly made a difference in my healing journey.</p>
         <img  class ="image"src="female-doc-no-bg.png"   width : 5% height :5% alt="" srcset=""> <!--https://st3.depositphotos.com/1017228/18878/i/600/depositphotos_188781580-stock-photo-handsome-cheerful-young-man-standing.jpg -->
       </div>
       <div class = "review">
        <div style="display: flex;">
            <div>
                <img class="heart" src="heartbeat.png" alt="heart">
                <img class="heart" src="heartbeat.png" alt="heart">
                <img class="heart" src="heartbeat.png" alt="heart">
                <img class="heart" src="heartbeat.png" alt="heart">
                <!-- <img class="heart" src="heart.png" alt="heart"> -->
            </div>
        </div>
    
        
        <p>Dr. Ayesha Khan: I recently visited Dr. Ayesha Khan for a skin condition that had been bothering me for months. Her expertise and gentle demeanor instantly put me at ease. Thanks to her prescribed treatment, my skin has greatly improved, and I'm genuinely appreciative of her compassionate care.</p>
        <img  class ="image"src="male2-no-bg.png"   width : 4% height :6% alt="" srcset="">
       </div>

    </div>
   
    <div class="one" style="margin-top: 50px;">
            <h2 style="text-align: center;">FEEDBACK FORM</h2>
            <form id="form" class="feedback-form" method="post" action="./feed.jsp">
                <label for="name">NAME</label>
                <input name="feed12" id="name" type="text" required>

                <label for="contact">EMAIL</label>
                <input name="feed13" id="email1" type="email">

                <label for="feedback">FEEDBACK</label>
                <input name="feed14" id="feedback" type="text">

                <button class="btn">Submit</button>
            </form>
        </div>
        <div class="footer" style="height: 350px;background: rgb(21,21,24);
background: linear-gradient(90deg, rgba(21,21,24,0.8184523809523809) 0%, rgba(21,21,28,1) 35%, rgba(124,143,146,1) 100%);">
        <br><p id="p-tag"><i>Trusted Healing, Our Commitment</i></p><br>
        <h1>&#2349;&#2366;&#2352;&#x0924; Cares</h1>
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