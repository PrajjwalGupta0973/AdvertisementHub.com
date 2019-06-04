<!DOCTYPE html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ page isELIgnored="false" %>
 <%@ page session="true" %>
 <%@ page trimDirectiveWhitespaces="true" %>
 <%@ page import="dao.CategoriesDao" %>
 <%@ page import="dao.DaoFactory" %>
 <%@ page import="dao.ImageRepresentingCategory" %>
<% //adding extra headers for no-cache
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
	response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
	response.setHeader("Expires", "0");
	CategoriesDao cd=DaoFactory.getInstanceCategoriesDao();
	String[] categories=cd.getCategories();
	ImageRepresentingCategory irc=DaoFactory.getInstanceIRC();
	int[] product= new int[categories.length];
	for(int i=0;i<product.length;i++){
		product[i]=irc.getImage(categories[i]);
	}
%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Advertisementhub.com</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="customcss/custom.css" >  
    <style type="text/css">
.navbar-collapse.in {
    overflow-y: visible !important;
}
#ddmenu ul{
	z-index:10000 !important;
	position: absolute !important;
}
</style>
    <script type="text/javascript">
      function goTop(){
   window.scroll(0,0);
 }
 window.addEventListener("load", function() {
	lazyload();
});
 function lazyload(){
	 var lazyImg=document.getElementsByClassName("lazy");
	 for(var i=0;i<lazyImg.length;i++){
		 lazyImg[i].setAttribute('src',lazyImg[i].getAttribute("data-src"));
	 }
 }
 function sendQuery() {
		document.getElementById("search").action="search"+"?search="+document.getElementById("srch-bar").value;
	}
 </script>
  </head>
  <body >
    <div class="bk-img">
    <div class="container-fluid">
      <div class="row">
<div class="col-md-12" style="padding:0;">
      <nav class="navbar navbar-default navbar-fixed-top" style="background: transparent;border: 0;" id="main-nav">
      <div class="navbar-header">
  <button type="button" class="navbar-toggle" data-target="#nav-toggle" data-toggle="collapse">
    <span class="icon-bar"></span>
    <span class="icon-bar"></span>
    <span class="icon-bar"></span>
  </button>
</div>     
<div class="navbar-collapse collapse transparent-bk" id="nav-toggle" style="position: absolute;width: 100%;">
  <ul class="nav navbar-nav navbar-right" id="ulist-transparent">
            <li class="active"><a href="welcome"><span class="glyphicon glyphicon-home "></span>Home</a></li>
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
              <ul class="nav navbar-nav navabr-left"><li><a href="welcome" class="nav-text-color"><span class="glyphicon glyphicon-copyright-mark"></span>AdvertismentHub.com</a></li></ul>               </div>
  </nav></div></div></div>
  <div class="container">
<div class="row"><div class="col-md-3 col-lg-3 hidden-xs hidden-sm"></div>
<div class="col-md-6 col-lg-6 col-xs-12 col-sm-12">
  <div id="welcome">
     <p class="welcome-text" style="margin-bottom:40px;">Welcome to the next generation advertisement solution</p>
<div class="row">
<div class="col-md-12 col-lg-12">
    <form action="search" method="get" id="search">
    <div class="input-group input-group-lg">
      <input type="text" id="srch-bar" name="search" placeholder="Search for your desired content" class="form-control" >
      <div class="input-group-btn"><button class="btn" type="submit" onclick="sendQuery()"><span class="glyphicon glyphicon-search"></span></button></div> 
  </div>
  </form></div></div>
</div>
</div><div class="col-md-3 col-lg-3 hidden-xs hidden-sm"></div>
</div></div></div>
<div class="container">
<div><h3 style="margin-bottom: -10px;font-style: italic;color:#0b5a84;">Categories:</h3><hr></div>
<%int firstColCap=0,secColCap=0,thirdColCap=0;
//ColCap==column capacity
if(product.length%3==1){
	firstColCap=(product.length/3)+1;
	secColCap=(product.length/3);
	thirdColCap=(product.length/3);
}
else
if(product.length%3==2){
	firstColCap=(product.length/3)+1;
	secColCap=(product.length/3)+1;
	thirdColCap=(product.length/3);
	}
else
{
	thirdColCap=secColCap=firstColCap=(product.length/3);
}
%>
<div class="row">
<div class="col-md-4 col-lg-4 col-sm-4 col-xs-12" style="padding-right:5px;padding-left:10px;">
<%
for(int i=0;i<firstColCap;i++){
out.print("<div style=\"position:relative;\">");
out.print("<a href=\"search?search="+categories[i]+"\">"+" <img alt=\"Loading Image...\" data-src=\"image?product="+product[i]+"\""+" class=\"img-thumbnail img-responsive lazy\" style=\"margin-bottom:10px;\" id=\""+product[i]+"\"></a>");
out.print("<div style=\"position: absolute;bottom:15px;left:15px;\"><a href=\"search\"><p style=\"color:white;font-weight: bold;font-family: arial; font-size: 25px;font-style: italic;text-decoration:underline\">"+categories[i]+"</p></a></div>");
out.print("</div>");
}
%>
</div>
<div class="col-md-4 col-lg-4 col-sm-4 col-xs-12" style="padding-right:5px;padding-left:10px;">
<%
for(int i=0;i<secColCap;i++){
	out.print("<div style=\"position:relative;\">");
	out.print("<a href=\"search?search="+categories[i+firstColCap]+"\">"+" <img alt=\"Loading Image...\" data-src=\"image?product="+product[i+firstColCap]+"\""+" class=\"img-thumbnail img-responsive lazy\" style=\"margin-bottom:10px;\" id=\""+product[i+firstColCap]+"\"></a>");
	out.print("<div style=\"position: absolute;bottom:15px;left:15px;\"><a href=\"search\"><p style=\"color:white;font-weight: bold;font-family: arial; font-size: 25px;font-style: italic;text-decoration:underline\">"+categories[i+firstColCap]+"</p></a></div>");
	out.print("</div>");
}
%>
</div>
<div class="col-md-4 col-lg-4 col-sm-4 col-xs-12" style="padding-right:5px;padding-left:10px;">
<%
for(int i=0;i<thirdColCap;i++){
	out.print("<div style=\"position:relative;\">");
	out.print("<a href=\"search?search="+categories[i+firstColCap+secColCap]+"\">"+" <img alt=\"Loading Image...\" data-src=\"image?product="+product[i+firstColCap+secColCap]+"\""+" class=\"img-thumbnail img-responsive lazy\" style=\"margin-bottom:10px;\" id=\""+product[i+firstColCap+secColCap]+"\"></a>");
	out.print("<div style=\"position: absolute;bottom:15px;left:15px;\"><a href=\"search\"><p style=\"color:white;font-weight: bold;font-family: arial; font-size: 25px;font-style: italic;text-decoration:underline\">"+categories[i+firstColCap+secColCap]+"</p></a></div>");
	out.print("</div>");
}
%>
</div>
</div></div>
<div style="display: flex;justify-content: center;">
<button class="btn btn-success" onclick="goTop()" style="margin: 20px;">Go to top<span class="glyphicon glyphicon-arrow-up"></span></button></div>
  </body>
  </html>