<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ page isELIgnored="false" %>
 <%@ page session="true" %>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>About Us</title>
    <link href="navcss" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <style>
    p{
    font-size: 15px;
    }
    @media (min-width: 1000px){
	#srch-bar{
	width: 400px !important;    
    }
}
.navbar-collapse.in {
    overflow-y: visible !important;
}
#ddmenu ul{
	z-index:10000 !important;
	position: absolute !important;
}
    </style>
  </head>
  <body style="padding-top:48px;">
    <div class="container-fluid">
      <div class="row">
<div class="col-md-12" style="padding:0;">
    <nav class="navbar navbar-default navbar-fixed-top" style="background: transparent;border: 0;" id="main-nav">
<script type="text/javascript">
    function sendQuery() {
    	document.getElementById("search").action=="search"+"?search="+document.getElementById("srch-bar").value;
	}
    </script>
<div class="navbar-header">
  <button type="button" class="navbar-toggle" data-target="#nav-toggle" data-toggle="collapse">
    <span class="icon-bar"></span>
    <span class="icon-bar"></span>
    <span class="icon-bar"></span>
  </button>
</div>     
<div class="navbar-collapse collapse transparent-bk" id="nav-toggle" style="position: absolute;width: 100%;">
  <ul class="nav navbar-nav navbar-right" id="ulist-transparent">
            <li><a href="welcome"><span class="glyphicon glyphicon-home "></span>Home</a></li>
             <li><a href="cart"><span title="cart" class="glyphicon glyphicon-shopping-cart"></span></a></li>
            <li><a href="upload"><span class="glyphicon glyphicon-upload"></span>Upload</a></li>
            <c:choose>
             <c:when test="${sessionScope.user==null || sessionScope.user==''}">
             <li><a href="signin">Sign-In<span class="glyphicon glyphicon-log-in"></span></a></li>
            <li class="active"><a href="aboutus">About Us<span class="glyphicon glyphicon-user"></span ></a></li>
             </c:when>
             <c:otherwise>
             <li><a href="logout">Sign-out <span class="glyphicon glyphicon-log-out"></span></a></li>
            <li id="ddmenu" class="dropdown " style="margin-right: 20px;"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span ><span class="caret"></span></a>
            <ul class="dropdown-menu">
           <li> <a href="profileinfo">Your Profile</a></li>
           <li> <a href="editprofile">Settings</a></li>
           <li> <a href="logout">Logout</a></li>
           <li><a href="aboutus">About us</a></li>
            </ul>
            </li>
             </c:otherwise>
            </c:choose>
            </ul>
<form action="search" method="get" id="search" class="navbar-form navbar-right" >
<div class="input-group">
<input type="text" id="srch-bar" name="search" class="form-control" placeholder="Search" >
<div class="input-group-btn">
<button class="btn" type="submit" onclick="sendQuery()"><span class="glyphicon glyphicon-search"></span></button>
</div></div>
</form>
</div>
  </nav></div></div></div>
  <div class="container"><div class="row">
  <div class="col-md-12 col-lg-12 col-xs-12 col-sm-12">
  <div style="border-radius:5px;border-style: ridge;margin-top: 10px;">
  <div style="display: flex;">
  <div style="width:75px;height:50px;">
  <img alt="" src="about-us-icon-8.png" style="width:75px;height:50px;border-style: ridge;"></div>
  <div style="width:100%;background-image:url('art-background-close-up-1939485.jpg');background-size: 100% 100%;">
  <div style="font-size:20px;font-weight:1000;padding-top:5px;padding-right:20px;display:flex;justify-content: center;"> About Us </div>
  </div>
   </div></div>
   <p>Advertisement Hub is an imperative resource for searching, purchasing and downloading creative Indian images and videos. Thousands of leading brands across the globe have been using our content for their advertising, marketing and publishing needs.
   </p>
   <h3>Our Objective:</h3>
   <p>To provide creative, high quality, theme based and already made advertising content such as professional Images or Videos to organizational and non-organizational bodies for purchasing and downloading all over the globe for their advertising and marketing communication and non-commercial purpose.
   </p>
   <h3>Salient Features:</h3>
   <ul>
   <li>
   <p>Many medium/large businesses and start ups need to scale up their business through innovative and creative advertisements.
   </p></li>
   <li>
   <p>On advertisementhub.com, entrepreneurs will get already made, well categorized and desired advertisement stuff through advanced AI based searching facility.   </p></li>
   <li>
   <p>In the presence of advertisementhub.com , one need not to spent huge amount of time on the set up of shooting studios.
   </p></li>
   <li><p>The clients just need to sign up and make an account on advertisementhub.com and then they can purchase and download the desired content  </p></li>
   <li><p>
  As the clients need not to go anywhere physically to initiate deals it costs very low.</p>
   </li>
   <li>
   <p>
Less paper-works also saves money.</p></li>
<li><p>
Each and every transactions are done online which eliminates the costly meetings of payment settlements.</p></li>
</ul>
<div style="display: flex;justify-content: center;">
<a href="welcome"><button class="btn btn-primary">Go to Home<span class="glyphicon glyphicon-arrow-right"></span></button></a>
</div>

   </div>
   </div></div>
  </body>
  </html>
  
  
  
  
  