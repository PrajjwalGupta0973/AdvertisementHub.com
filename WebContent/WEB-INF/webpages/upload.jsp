<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ page isELIgnored="false" %>
 <%@ page session="true" %>
<%@page import="dao.CategoriesDao"%>
<%//adding extra headers for no-cache
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
	response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
	response.setHeader("Expires", "0");
	if(session!=null){
		if(session.getAttribute("user")==null){
			request.getRequestDispatcher("WEB-INF\\webpages\\SignIn.html").forward(request, response);
			}
	}
	else{
		request.getRequestDispatcher("WEB-INF\\webpages\\SignIn.html").forward(request, response);
	}
	CategoriesDao cD=new CategoriesDao();
	String [] categories=cD.getCategories();
	
	%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Content Upload</title>
    <link href="bootstrap3/css/bootstrap.min.css" rel="stylesheet">
    <link href="customcss/nav.css" rel="stylesheet">
    <style type="text/css">#col-left div,#col-right div{
    background-image: url('citrus-fruit-delicious-fruit-616838.jpg');width:100%;height:800px;background-size: 100% 1000px;}
    #uploadinfo li{
font-family: arial;
font-size: 20px;
font-weight: 500;
margin:5px;
}
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
    <div>
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
  </nav></div></div></div></div>
<div class="container-fluid">
<div class="row">
<div id="col-left" class="col-md-2 col-lg-2 hidden-sm hidden-xs" style="padding-left:0;padding-right:0;"><div></div></div>
<div class="col-md-8 col-lg-8 col-xs-12 col-sm-12">
<div style="display: flex;justify-content: center;">
<div>
<ul id="uploadinfo" style="padding-top: 100px;">
  <li class="text-theme">
    Upload content and enjoy your share price.
  </li>
<li class="text-theme">Always upload a unique content.
</li>
<li class="text-theme">
  Take consent of the people who are the main subject in your content.
</li>
</ul>
<div style="min-width: 100%;background: #e5e3e3;border:dashed;border-color:#97edf4">
  <div class="container-fuild">
    <div class="row">
      <div class="col-md-2 col-lg-2 col-sm-1 col-xs-1"></div>
      <div class="col-md-6 col-md-6 col-sm-10 col-xs-10" style="border:groove; border-top: none;border-bottom: none; border-color: #eae5e5;">
<form action="uploadcontent" method="post" enctype="multipart/form-data" class="form-horizontal">
  <input type="file" name="content" id="content" style="margin: 5px;margin-top: 30px;" enctype="multipart/form-data" accept="image/*">
  <input type="text" name="price" class="form-control" placeholder="Set Your Price*" style="margin:5px;">
  <select id="cat" name="category" class="form-control" style="margin:5px;">
  <option value="select">Select Category</option>
  <%
  for(int i=0;i<categories.length;i++){
	  out.print("<option value=\""+categories[i]+"\">"+categories[i].substring(0,1).toUpperCase()+categories[i].substring(1).toLowerCase()+"</option>");
  
  }
  %></select>
  <button type="submit" style="border-radius: 5px;background-color:#0b5a84; color:white;" >Upload</button></form>
</div>
<div class="col-md-4 col-md-4 col-sm-1 col-xs-1"></div>
</div>
</div>
</div>
</div></div>
<div style="display:flex;justify-content: center;">
<form action="#">
<input type="checkbox" id="agreement" name="agreement">
<label for="agreement">I own the copyrights of the content.</label></form></div>
<p><span style="color: red;font-weight: bold;">Image Usage Terms & Restrictions</span> : Pornographic, defamatory, libelous, immoral, obscene, fraudulent or otherwise unlawful use of this image is strictly prohibited. You further agree not to use the image for any sensitive subject matter, as determined by MASH, including, but not limited to, Sex related products and services, sexually transmitted diseases, substance abuse, alcohol, tobacco, AIDS, cancer, mental ailments, homosexual or alternative lifestyle issues, and physical or mental abuse, without advance written consent from MASH. All images on this website are copyrighted and are the sole property of ImagesBazaar.com. All use and/or publication rights are reserved worldwide. Image use is subject to the issuance and payment of an image use licensing agreement. You may not take, use or copy any image from this website without reading and complying with the terms. Read COMP USAGE terms.</p>
</div>
<div id="col-right" class="col-md-2 col-lg-2 hidden-sm hidden-xs" style="padding-left:0;padding-right:0;"><div></div></div></div>
</div>

</body></html>
