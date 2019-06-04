<!DOCTYPE html>

<%@page import="dao.ImageRepresentingCategory"%>
<%@page import="dao.DaoFactory"%>
<%@page import="dao.CategoriesDao"%>
<%@page import="java.util.Iterator"%>
<%@page import="beans.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ page isELIgnored="false" %>
 <%@ page session="true" %>
 <%
 ArrayList<ProductBean> products=(ArrayList<ProductBean>)request.getAttribute("products");
 CategoriesDao cd=DaoFactory.getInstanceCategoriesDao();
 String[] categories=cd.getCategories();
 int productSize=0;
 int firstColCap=0;
 int secColCap=0;
 int thirdColCap=0;
 Iterator<ProductBean> itr=null;
 if(categories.length!=0){
 productSize=0;
 productSize=products.size();
 firstColCap=0;secColCap=0;thirdColCap=0;
//ColCap : column capacity
if(productSize!=0){
if(productSize%3==1){
	firstColCap=(productSize/3)+1;
	secColCap=(productSize/3);
	thirdColCap=(productSize/3);
}
else
if(productSize%3==2){
	firstColCap=(productSize/3)+1;
	secColCap=(productSize/3)+1;
	thirdColCap=(productSize/3);
	}
else
	if(productSize%3==0){
		thirdColCap=secColCap=firstColCap=productSize/3;
	}
else
{
	thirdColCap=secColCap=firstColCap=(productSize/3);
}
}
itr=products.iterator();
 }
%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Search Results</title>
    <link href="bootstrap3/css/bootstrap.min.css" rel="stylesheet">
    <link href="customcss/nav.css" rel="stylesheet">
    <script type="text/javascript">
    window.addEventListener("load", function() {
    	lazyload();
    });
     function lazyload(){
    	 var lazyImg=document.getElementsByClassName("lazy");
    	 console.log(lazyImg.length);
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
  <hr>
  <div class="container-fluid">
  <div class="row">
  <div class="hidden-xs col-sm-3 col-md-3 col-lg-3"><div style="background-color: #e8eaed;">
  <div style="text-align: center;color:white;height: 50px;background-color:#0b5a84;border-style:ridge;border-radius:5px;"><h4>-: Browse Categories :-</h4></div>
  <br>
  <ul style="font-size:15px;list-style:circle;">
  <%
  for(int i=0;i<categories.length;i++)
  out.print("<li><a href=\"search?search="+categories[i]+"\">"+categories[i].substring(0,1).toUpperCase()+categories[i].substring(1)+"</a>"+"</li>");
   %>
  </ul>
  <br>
</div>
  </div>
  <div class="col-md-9 col-lg-9 col-sm-9 col-xs-12" style="padding-left:0;">
  <div style="width: 100%;padding-left:15px;border-left:ridge;border-width: 1px;">
    <div class="row">
<div class="col-md-4 col-lg-4 col-sm-4 col-xs-12" style="padding-right:5px;padding-left:10px;">
<%
if(productSize==0){
	out.print("<div style=\"color:blue;\">Sorry! no result found...</div>");
}
for(int i=0;i<firstColCap;i++){
	if(itr.hasNext()){
		ProductBean product=(ProductBean)itr.next();
out.print("<div style=\"position:relative;\">");
out.print("<a href=\"preview?product="+product.getProductId()+"\"><img alt=\"Loading Image...\" data-src=\"image?product="+product.getProductId()+"\""+" class=\"img-thumbnail img-responsive lazy\" style=\"margin-bottom:10px;\" id=\""+product.getProductId()+"\"></a>");
out.print("</div>");
}
}
%>
</div>
<div class="col-md-4 col-lg-4 col-sm-4 col-xs-12" style="padding-right:5px;padding-left:10px;">
<%
for(int i=0;i<secColCap;i++){
	if(itr.hasNext()){
		ProductBean product=(ProductBean)itr.next();
out.print("<div style=\"position:relative;\">");
out.print("<a href=\"preview?product="+product.getProductId()+"\"><img alt=\"Loading Image...\" data-src=\"image?product="+product.getProductId()+"\""+" class=\"img-thumbnail img-responsive lazy\" style=\"margin-bottom:10px;\" id=\""+product.getProductId()+"\"></a>");
out.print("</div>");
}
}
%>
</div>
<div class="col-md-4 col-lg-4 col-sm-4 col-xs-12" style="padding-right:5px;padding-left:10px;">
<%
for(int i=0;i<thirdColCap;i++){
	if(itr.hasNext()){
		ProductBean product=(ProductBean)itr.next();
out.print("<div style=\"position:relative;\">");
out.print("<a href=\"preview?product="+product.getProductId()+"\"><img alt=\"Loading Image...\" data-src=\"image?product="+product.getProductId()+"\""+" class=\"img-thumbnail img-responsive lazy\" style=\"margin-bottom:10px;\" id=\""+product.getProductId()+"\"></a>");
out.print("</div>");
}
}
%>
</div>
</div>
  </div>
  </div>
  </div></div>
  </body>
  </html>
  
  
  
  
  