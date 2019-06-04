<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ page isELIgnored="false" %>
 <%@ page session="true" %>
<%//adding extra headers for no-cache
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
	response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
	response.setHeader("Expires", "0"); %>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Photo Upload</title>
    <link href="bootstrap3/css/bootstrap.min.css" rel="stylesheet">
    <link href="customcss/nav.css" rel="stylesheet">
    <style type="text/css">#col-left div,#col-right div{
    background-image: url('art-background-close-up-1939485.jpg');width:100%;height:110vh;background-size: 100% 1000px;}
    #uploadinfo li{
font-family: arial;
font-size: 20px;
font-weight: 500;
margin:5px;
}
</style>
  </head>
  <body style="padding-top:48px;">
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
<div class="container-fluid">
<div class="row">
<div id="col-left" class="col-md-2 col-lg-2 hidden-sm hidden-xs" style="padding-left:0;padding-right:0;"><div></div></div>
<div class="col-md-8 col-lg-8 col-xs-12 col-sm-12">
<div style="padding-top:50px;">
<div style="display: flex;justify-content: center;">
<div>
<ul id="uploadinfo" style="padding-top: 100px;">
  <li class="text-theme">
    Upload a neat and clean photo of you.
  </li>
<li class="text-theme">Your photo should speak about what you're.
</li>
<li class="text-theme">
  Must take consent of the people who are the main subjects in your photo.
</li>
</ul>
<div style="height: 100px;min-width: 100%;background: #e5e3e3;border:dashed;border-color:#97edf4">
 <div class="row">
      <div class="col-md-2 col-lg-2 col-sm-1 col-xs-1"></div>
      <div class="col-md-6 col-md-6 col-sm-10 col-xs-10" style="border:groove; border-top: none;border-bottom: none; border-color: #eae5e5;height: 100px;">
<form action="userphoto" method="post" enctype="multipart/form-data">
  <input type="file" name="userphoto" id="content" class="" style="margin-top: 30px;">
  <button type="submit" style="margin: 5px;height: 25px;margin-left:0;">Upload</button></form>
</div>
<div class="col-md-4 col-md-4 col-sm-1 col-xs-1"></div>
</div>
</div>
</div></div>
</div></div>
<div id="col-right" class="col-md-2 col-lg-2 hidden-sm hidden-xs" style="padding-left:0;padding-right:0;"><div></div></div></div>
</div>

</body></html>

