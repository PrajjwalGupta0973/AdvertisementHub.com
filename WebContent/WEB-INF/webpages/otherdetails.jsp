<!DOCTYPE html>
<%@page import="dao.DaoFactory,dao.UserDao"%>
<%@page import="beans.UserBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ page isELIgnored="false" %>
 <%@ page session="true" %>
<% //adding extra headers for no-cache
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
	response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
	response.setHeader("Expires", "0");
String email=session.getAttribute("user").toString();
UserDao ud= DaoFactory.getInstanceUserDao();
UserBean user=ud.getUser(email);
%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Other Details</title>
    <link href="bootstrap3/css/bootstrap.min.css" rel="stylesheet">
    <link href="customcss/nav.css" rel="stylesheet">
   <style type="text/css">
    #col-left div,#col-right div{
    background-image: url('art-background-close-up-1939485.jpg');width:100%;height:100vh;background-size: 100% 1000px;}
    </style>
    <script type="text/javascript">
    function sendQuery() {
    	document.getElementById("search").action=="search"+"?search="+document.getElementById("srch-bar").value;
	}
    </script>
     </head>
  <body style="padding-top:48px;">
   <script src="bootstrap3/JQuery/JQuery.min.js"></script>
    <script src="bootstrap3/js/bootstrap.min.js"></script>
    <div class="container-fluid">
      <div class="row">
<div class="col-md-12" style="padding:0;">
    <nav class="navbar navbar-default navbar-inverse navbar-fixed-top" style="border: 0;" id="main-nav">
<div class="navbar-header">
  <button type="button" class="navbar-toggle" data-target="#nav-toggle" data-toggle="collapse">
    <span class="icon-bar"></span>
    <span class="icon-bar"></span>
    <span class="icon-bar"></span>
  </button>
</div>     
<div class="navbar-collapse collapse" id="nav-toggle">
  <ul class="nav navbar-nav navbar-right" id="ulist">
            <li><a href="welcome"><span class="glyphicon glyphicon-home "></span>Home</a></li>
            <li><a href="cart"><span title="cart" class="glyphicon glyphicon-shopping-cart"></span></a></li>
            <li class="active"><a href="upload"><span class="glyphicon glyphicon-upload"></span>Upload</a></li>
           <li><a href="logout">Sign-out <span class="glyphicon glyphicon-log-out"></span></a></li>
            <li id="ddmenu" class="dropdown" style="margin-right: 20px;"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span ><span class="caret"></span></a>
            <ul class="dropdown-menu">
           <li> <a href="profileinfo">Your Profile</a></li>
           <li> <a href="editprofile">Settings</a></li>
           <li> <a href="logout">Logout</a></li>
           <li> <a href="aboutus">About us</a></li>
            </ul>
            </li>
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
  <div class="container-fluid" style="padding:0;">
<div class="row">
<div id="col-left" class="col-md-3 col-lg-3 col-sm-1 col-xs-1"><div></div></div>
<div class="col-md-6 col-lg-6 col-sm-10 col-xs-10">
<br><br>
<font class="text-theme" style="font-family: Arial;font-size: 30px;">Other profile information : </font><br><br>
<div class="row">
<div class="col-xs-12 col-md-8">
<div id="user">
<div>
<label for="name" style="font-size: 20px;" class="text-theme">Name:</label>
<div id="name" style="font-size:20px;display: inline;"> <%=user.getFirstName()%> <%=user.getLastName()%></div>
</div><br>
<div>
<label for="email" style="font-size:20px;" class="text-theme">Your email: </label>
<div id="email"style="font-size:20px;display: inline;"><%=user.getEMail() %></div>
</div><br>
<div>
<label for="mobile" style="font-size: 20px;" class="text-theme">Mobile Contact: </label>
<div id="mobile" style="font-size:20px;display: inline;"><%=user.getMobNo()%></div>
</div><br>
<a href="editprofile">
<button class="btn btn-primary"><span class="glyphicon glyphicon-pencil"></span>Update Profile</button></a>
<a href="welcome" style="margin-left: 10px;" class="text-theme"><button class="btn btn-primary">Go to Home</button></a>

</div>
</div>
</div>
</div>
<div id="col-right" class="col-md-3 col-lg-3 col-sm-1 col-xs-1"><div></div></div>
</div>
</div></body>
  </html>
  
  
  
  
  