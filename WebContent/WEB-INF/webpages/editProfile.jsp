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
    <title>Edit Profile</title>
    <link href="bootstrap3/css/bootstrap.min.css" rel="stylesheet">
    <link href="customcss/nav.css" rel="stylesheet">
    <style type="text/css">
    #col-left div,#col-right div{
    background-image: url('animals-aquarium-aquatic-animal-1784578.jpg');width:100%;height:1000px;background-size: 100% 1000px;}
    </style>
    
  </head>
  <body style="padding-top:48px;">
  <% String fName=request.getAttribute("fName").toString(); %>
  <% String lName=request.getAttribute("lName").toString(); %>
  <% String email=request.getAttribute("email").toString(); %>
  <% String mobNO=request.getAttribute("mobNo").toString(); %>
  <%String password=request.getAttribute("password").toString(); %>
   <script src="bootstrap3/JQuery/JQuery.min.js"></script>
    <script src="bootstrap3/js/bootstrap.min.js"></script>
    <div class="container-fluid">
      <div class="row">
<div class="col-md-12" style="padding:0;">
      <nav class="navbar navbar-default navbar-inverse navbar-fixed-top" style="border: 0;" id="main-nav">
<script type="text/javascript">
function sendQuery() {
	document.getElementById("search").action="search"+"?search="+document.getElementById("srch-bar").value;
}
</script>
<div class="navbar-header">
  <button type="button" class="navbar-toggle" data-target="#nav-toggle" data-toggle="collapse">
    <span class="icon-bar"></span>
    <span class="icon-bar"></span>
    <span class="icon-bar"></span>
  </button>
</div>     
<div class="navbar-collapse collapse" id="nav-toggle">
  <ul class="nav navbar-nav navbar-right" id="ulist">
            <li><a href="welcome"><span class="glyphicon glyphicon-home"></span>Home</a></li>
           <li><a href="cart"><span title="cart" class="glyphicon glyphicon-shopping-cart"></span></a></li>
            <li><a href="upload"><span class="glyphicon glyphicon-upload"></span>Upload</a></li>
            <c:choose>
             <c:when test="${sessionScope.user==null || sessionScope.user==''}">
             <li><a href="signin">Sign-In<span class="glyphicon glyphicon-log-in"></span></a></li>
            <li ><a href="aboutus">About Us<span class="glyphicon glyphicon-user"></span ></a></li>
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
<form action="search" method="get" id="search" class="navbar-form navbar-right">
<div class="input-group" >
<input class="form-control" name="search" type="text" placeholder="Search" id="srch-bar">
<div class="input-group-btn">
<button class="btn" type="submit" onclick="sendQuery()"><span class="glyphicon glyphicon-search"></span></button>
</div></div>
</form>
</div>
  </nav></div></div></div>
    <div class="container-fluid" style="padding:0;">
<div class="row">
<div id="col-left" class="col-md-3 col-lg-3 col-sm-1 col-xs-1"><div></div></div>
<div class="col-md-6 col-lg-6 col-sm-10 col-xs-10">
<br><br>
<font class="text-theme" style="font-family: Arial;font-size: 30px;">Edit your profile information : </font><br><br>
<div class="row">
<div class="col-xs-12 col-md-8">
<form action="updateprofile" id="new-user" class="form-horizontal" method="post" >
<div class="form-group">
<label for="firstname">First Name</label>
<input type="text" name="firstname" id="firstname" class="form-control" value="<%= fName%>">
</div>
<div class="form-group">
<label>Last Name</label>
<input type="text" name="lastname" class="form-control" value="<%= lName%>">
</div>
<div class="form-group">
<label>Your email</label>
<input type="text" name="email" class="form-control" value="<%= email%>">
</div>
<div class="form-group">
<label>Mobile Number</label>
<input type="text" name="mobile" class="form-control" value="<%= mobNO%>">
</div>
<div class="form-group">
<label>Password</label>
<input type="password" name="password" class="form-control" value="<%= password%>">
</div>
<div class="form-group">
<button type="submit" class="btn btn-primary">Update Profile</button>
<a href="welcome" style="margin-left: 10px;" class="text-theme">Cancel</a>
</div>
</form>
</div>
</div>
</div>
<div id="col-right" class="col-md-3 col-lg-3 col-sm-1 col-xs-1"><div></div></div>
</div>
</div>
  </body>
  </html>
  
  
  
  
  