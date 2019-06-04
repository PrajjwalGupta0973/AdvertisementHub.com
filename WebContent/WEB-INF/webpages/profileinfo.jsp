<!DOCTYPE html>
<%@page import="dao.DaoFactory,dao.UserDao"%>
<%@page import="beans.UserBean"%>
<% //adding extra headers for no-cache
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
	response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
	response.setHeader("Expires", "0");
	String email=null;
	UserBean user=null;
	UserDao ud= DaoFactory.getInstanceUserDao();
	if(session.getAttribute("user")!=null){
 email=session.getAttribute("user").toString();

 user=ud.getUser(email);}
	else
		request.getRequestDispatcher("WEB-INF\\webpages\\SignIn.html").forward(request, response);
%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Profile Info</title>
<link href="bootstrap3/css/bootstrap.min.css" rel="stylesheet">
    <link href="customcss/nav.css" rel="stylesheet">   
    <script type="text/javascript">
    window.addEventListener("load", function() {
    	lazyload();
    });
     function lazyload(){
    	 var lazyImg=document.getElementsByClassName("lazy");
    	 for(var i=0;i<lazyImg.length;i++){
    		 lazyImg[i].setAttribute('src',lazyImg[i].getAttribute("data-src"));
    	 }
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
            <li><a href="upload"><span class="glyphicon glyphicon-upload"></span>Upload</a></li>
           <li><a href="logout">Sign-out <span class="glyphicon glyphicon-log-out"></span></a></li>
            <li id="ddmenu" class="dropdown active" style="margin-right: 20px;"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span ><span class="caret"></span></a>
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
  <div class="container-fluid">
  <div class="row">
  <div class="col-md-3 col-lg-3 col-sm-3 hidden-xs"></div>
  <div class="col-md-6 col-lg-6 col-sm-6 col-xs-12">
  
   
  <div style="margin-top:100px;margin-bottom:50px;">
 <a href="editphoto"> <img id="profilephoto" title="Edit and Upload photo" alt="Name" data-src="profilephoto" class="img-circle lazy" style="height:150px;width:150px;"></a>
  <div style="font-family:arial;font-size:40px;font-weight: 1000;display: inline;margin-left: 30px;"><%= user.getFirstName()%> <%= user.getLastName()%></div>
 </div>
 <a href="editprofile" style="margin:5px;"><button class="btn btn-warning"><span class="glyphicon glyphicon-pencil"></span>Edit your profile</button></a>
  <a href="otherdetails" style="margin:5px;padding-top:5px;"><button class="btn btn-warning">View other details</button></a>
 </div>
 <div class="col-md-2 col-lg-2 col-sm-3 hidden-xs"></div>
 </div>
  </div>
  <br>
  <div class="container">
  <div class="row">
  <div class="col-md-12">
  <ul class="nav nav-tabs">
  <li><a></a></li>
  <li class="active"><a href="#">Your uploads</a></li>
  <li class="" ><a href="#" style="border-right: thin 2px;">Your purchases</a></li>
  </ul>
  </div></div>
  </div>
  </body>
  </html>
  
  
  
  
  