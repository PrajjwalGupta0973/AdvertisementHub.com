<!DOCTYPE html>
<%@page import="java.util.Iterator"%>
<%@page import="beans.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ page isELIgnored="false" %>
 <%@ page session="true" %>
 <%
 ArrayList<ProductBean> itemArray=(ArrayList<ProductBean>)request.getAttribute("itemArray");
 int totalItems=itemArray.size();
 float totalPayableAmount=0;
 String[] productNames=new String[totalItems];
 int [] productsIds=new int[totalItems];
 float[] productsPrices=new float[totalItems];
 Iterator<ProductBean> itr=itemArray.iterator();
 for(int i=0;itr.hasNext();i++){
	 ProductBean product=itr.next();
 totalPayableAmount=totalPayableAmount+product.getPrice();
 productNames[i]=product.getName();
 productsIds[i]=product.getProductId();
 productsPrices[i]=product.getPrice();
 }
 %>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Cart</title>
    <link href="bootstrap3/css/bootstrap.min.css" rel="stylesheet">
    <link href="customcss/nav.css" rel="stylesheet">
    <style type="text/css">#col-left ,#col-right {
    background-image: url('bright-design-floor-235994.jpg');background-size: 100% 100px;background-repeat: inherit;}
    #ulist a:hover{
	color:black;
	background-color: white ;
}
    </style>
    <script type="text/javascript">
    window.addEventListener("load", function() {
    	lazyload();
    	var x=document.getElementsByTagName("body")[0].scrollHeight;
    	x=x+50;
    	x=x+"px";
    	document.getElementById("col-left").style.height=document.getElementById("col-right").style.height=x;
    	document.getElementById("col-left").style['background-size']=document.getElementById("col-right").style['background-size']="100% "+x;
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
  <body>
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
  <div class="col-md-3 col-lg-3 hidden-xs col-sm-3" ><div id="col-left"></div ></div>
  <div class="col-md-6 col-lg-6 col-sm-6">
  <div style="margin-top:30px;margin-bottom:30px;border-style:ridge;border-color:white;border-radius: 5px;margin-top:50px;">
  <div style="height:30px;background-color:#0b5a84;border-radius: 5px;">
  <div style="display: flex;padding-top:10px;justify-content: center;">
  <p style="color:white;font-size:15px;margin-top:-5px;">Cart Summary</p></div>
  </div>
  <ul style="list-style:none; padding-top:10px;">
  <li style="margin-bottom:5px;"><b>Total items added:</b> <%= totalItems %></li>
 <li style="margin-bottom:5px;"> <b>Total Payable Amount:</b> INR. <%= totalPayableAmount%></li>
 <li> <button class="btn btn-warning" style="margin-top:30px;">Proceed to pay<span class="glyphicon glyphicon-arrow-right"></span></button></li>
 </ul>
  </div>
  <%
  for(int i=0;i<totalItems;i++){
  out.write("<div style=\"margin-top:10px;height:auto;width:100%;border-style:ridge;border-color: white;border-radius: 5px;\">");
  out.write("<div style=\"height:50px;background-color:#0b5a84;border-radius: 5px;\">");
  out.write("<div style=\"display: flex;padding-top:10px;justify-content: center;\">");
  out.write("<p style=\"color:white;font-size:20px;\">Item information and price</p></div>");
  out.write("</div>");
  out.write("<div class=\"row\">");
  out.write("<div class=\"col-md-6 col-sm-6 col-xs-8\">");
  out.write("<img alt=\"Loading Image...\" data-src=\"image?product="+productsIds[i]+"\""+" class=\"thumbnail img-fluid img-responsive lazy\" >");
  out.write("</div>");
  out.write("<div class=\"col-md-6 col-sm-6 col-xs-5\">");
 out.write("<div style=\"font-size:20px;\">");
 out.write("<ul>");
 out.write("<li style=\"margin-bottom:5px;\"><b>Item ID: "+productsIds[i]+"</b></li><br>");
 out.write("<li style=\"margin-bottom:5px;\"> <b>Item name: </b> "+productNames[i]+"</li><br>");
 out.write("<li style=\"margin-bottom:5px;\"><b>Price:</b> INR. "+productsPrices[i]+"</li><br>");
 out.write("</ul></div>");
 out.write("</div>");
 out.write("</div></div><div></div>");
  }
 %>
 <div style="margin-top:40px;border-style:ridge;border-color:white;border-radius: 5px;margin-top:50px;">
  <div style="height:30px;background-color:#0b5a84;border-radius: 5px;">
  <div style="display: flex;padding-top:10px;justify-content: center;">
  <p style="color:white;font-size:15px;margin-top:-5px;">Cart Summary</p></div>
  </div>
  <ul style="list-style:none; padding-top:10px;">
  <li style="margin-bottom:5px;"><b>Total items added:</b> <%= totalItems %></li>
 <li style="margin-bottom:5px;"> <b>Total Payable Amount:</b> INR. <%= totalPayableAmount%></li>
 <li> <button class="btn btn-warning" style="margin-top:30px;">Proceed to pay<span class="glyphicon glyphicon-arrow-right"></span></button></li>
 </ul>
  </div>
  </div>
  <div class="col-md-3 col-lg-3 hidden-xs col-sm-3" >
  <div id="col-right"></div>
  </div>
  </div></div>
  </body>
  </html>
  
  
  
  
  