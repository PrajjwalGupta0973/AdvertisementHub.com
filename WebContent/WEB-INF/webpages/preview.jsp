<!DOCTYPE html>
<%@page import="com.mysql.cj.ParseInfo"%>
<%@page import="dao.ProductDao"%>
<%@page import="dao.DaoFactory"%>
<%@page import="beans.ProductBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ page isELIgnored="false" %>
 <%@ page session="true" %>
 <%
 response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
	response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
	response.setHeader("Expires", "0");
	ProductBean product=new ProductBean();
	ProductDao pd=DaoFactory.getInstanceProductDao();
	if(request.getParameter("product")!=null)
	product=pd.getProductByProdId(Integer.parseInt(request.getParameter("product")));
 %>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>Image Preview</title>
    <link href="bootstrap3/css/bootstrap.min.css" rel="stylesheet">
    <link href="customcss/nav.css" rel="stylesheet">
  </head>
  <body >
   <script src="bootstrap3/JQuery/JQuery.min.js"></script>
    <script src="bootstrap3/js/bootstrap.min.js"></script>
    <div class="container-fluid">
      <div class="row">
<div class="col-md-12" style="padding:0;">
    <div>
      <nav class="navbar navbar-default navbar-fixed-top" style="background: transparent;border: 0;" id="main-nav">
<script type="text/javascript">
    function sendQuery() {
    	document.getElementById("search").action=="search"+"?search="+document.getElementById("srch-bar").value;
    }
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
     function addToCart() {
    	 if(document.getElementById("cart-link").getAttribute('data-count')=="1"){
    		 let xreq=new XMLHttpRequest();
		let url="addtocart?product="+<%=product.getProductId()%>;
		xreq.open("GET",url,true);
		xreq.onload=function (e){
			 if (xreq.readyState === 4) {
				    if (xreq.status === 200) {
				    	
				    	if(xreq.responseText=="successful"){
				    		 alert(xreq.responseText);
				  document.getElementById("cart-link").innerHTML="Added to cart";
						document.getElementById("cart-link").setAttribute('data-count',"2");
						document.getElementById("cart-link").style.cursor="default";
				    	}
				    	else
				    		if(xreq.responseText=="Please login first")
				    			alert(xreq.responseText);
				    		else
					    		if(xreq.responseText=="Already added!")
					    			alert(xreq.responseText);
				    }
				  }
			}
		xreq.onerror=function (e){
			alert("some error ouccured");
		document.getElementById("cart-link").innerHTML="Added to cart";
			document.getElementById("cart-link").removeAttribute("onclick");
			document.getElementById("cart-link").style.cursor="default";
		}
		xreq.send();
    	 }
    	 else{
    		 alert("Already added");
    	 }
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
            <li><a href="aboutus">About Us<span class="glyphicon glyphicon-user"></span ></a></li>
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
<form action="search" method="get" id="search" class="navbar-form navbar-left" >
<div class="input-group">
<input type="text" id="srch-bar" name="search" class="form-control" placeholder="Search" >
<div class="input-group-btn">
<button class="btn" type="submit" onclick="sendQuery()"><span class="glyphicon glyphicon-search"></span></button>
</div></div>
</form>
</div>
  </nav></div></div></div></div>
  <div class="container">
  <div class="row">
  <div class="col-md-1 col-lg-1 hidden-sm hidden-xs"></div>
  <div class="col-md-10 col-lg-10 col-sm-12 col-xs-12">
  <div style="max-height:100vh;display:flex;justify-content: center;" id="image-frame">
  <img alt="Loading Image..." data-src="image?product=<%=product.getProductId()%>" class="lazy img-thumbnail img-responsive" style="margin-top:10px;max-height: 90vh;width:auto;" id="image">
  </div>
  </div>
  <div class="col-md-1 col-lg-1 hidden-sm hidden-xs"></div>
  </div></div>
  <div style="display: flex;justify-content: center;">
     <h5 style="font-style: italic;"><span class="glyphicon glyphicon-copyright-mark"></span>Copyrights are reserved.</h5>
     </div>
  <div class="container">
  <div class="row">
  <div class="col-md-4 col-lg-4"><div style="display: flex;justify-content: center;"><p id="imgid" style="margin-bottom:5px;"><span style="font-weight:bold;">Product id:</span> <%=product.getProductId()%></p></div></div>
  <div class="col-md-4 col-lg-4">
  <div style="display: flex;justify-content: center;"><font id="name" style="margin-bottom:5px;"><span style="font-weight: bold;">Name:</span> <%=product.getName() %></font></div>
     </div>
  <div class="col-md-4 col-lg-4 "><div style="display: flex;justify-content: center;">
     <a onclick="addToCart()" id="cart-link" data-count="1" class="text-theme" style="margin-bottom:5px;cursor: pointer;"><span class="glyphicon glyphicon-shopping-cart"></span>Add to cart</a>
      </div>
  </div>
  </div>
  </div>
  <div style="display: flex;justify-content: center;"><a href="image?product=<%=product.getProductId()%>" class="text-theme" style="margin-bottom:5px;" download=<%=product.getName()+"."+product.getProductType() %>><button class="btn btn-default" style="background-color:#0b5a84;"><font color="white">Download</font></button></a></div>
  <div class="container">
  <div class="row">
  <div class="col-md-1 col-lg-1 hidden-sm hidden-xs">
  </div>
  <div class="col-md-10 col-lg-10 col-sm-12 col-xs-12"><p><span style="color: red;font-weight: bold;">Image Usage Terms & Restrictions</span> : Pornographic, defamatory, libelous, immoral, obscene, fraudulent or otherwise unlawful use of this image is strictly prohibited. You further agree not to use the image for any sensitive subject matter, as determined by MASH, including, but not limited to, Sex related products and services, sexually transmitted diseases, substance abuse, alcohol, tobacco, AIDS, cancer, mental ailments, homosexual or alternative lifestyle issues, and physical or mental abuse, without advance written consent from MASH. All images on this website are copyrighted and are the sole property of ImagesBazaar.com. All use and/or publication rights are reserved worldwide. Image use is subject to the issuance and payment of an image use licensing agreement. You may not take, use or copy any image from this website without reading and complying with the terms. Read COMP USAGE terms.</p></div>
  <div class="col-md-1 col-lg-1 hidden-sm hidden-xs"></div>
  </div>
  </div><br><br>
  </body>
  </html>