<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>
    <%@ page import="GIFT.ProductDA" %>
    <%@ page import="GIFT.ProductDT" %>
    	<%@ page import="java.util.ArrayList"%>
    		<%@ page import="java.io.PrintWriter"%>



<!DOCTYPE html>
<html lang="en">

<head>
	
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
        <title>GIFTICON SHOP</title>

    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="css/core-style.css">
    <link rel="stylesheet" href="style.css">
	
<%
String PID = request.getParameter("PID");
String img = request.getParameter("IMG");

%>
</head>

<body>
    <!-- Search Wrapper Area Start -->
    <div class="search-wrapper section-padding-100">
        <div class="search-close">
            <i class="fa fa-close" aria-hidden="true"></i>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="search-content">
                        <form action="#" method="get">
                            <input type="search" name="search" id="search" placeholder="Type your keyword...">
                            <button type="submit"><img src="img/core-img/search.png" alt=""></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Search Wrapper Area End -->

    <!-- ##### Main Content Wrapper Start ##### -->
    <div class="main-content-wrapper d-flex clearfix">

        <!-- Mobile Nav (max width 767px)-->
        <div class="mobile-nav">
            <!-- Navbar Brand -->
            <div class="amado-navbar-brand">
                <a href="main.jsp"><img src="img/core-img/logo.png" alt=""></a>
            </div>
            <!-- Navbar Toggler -->
            <div class="amado-navbar-toggler">
                <span></span><span></span><span></span>
            </div>
        </div>

       
        <!-- Header Area Start -->
        <header class="header-area clearfix">
            <!-- Close Icon -->
            <div class="nav-close">
                <i class="fa fa-close" aria-hidden="true"></i>
            </div>
            <!-- Logo -->
            <div class="logo">
                <a href="main.jsp"><img src="https://ifh.cc/g/IhLfI.png" alt=""></a>
            </div>
            <!-- Amado Nav -->
            <nav class="amado-nav">
                <ul>
                    <li class="active"><a href="main.jsp">Home</a></li>
                    <li><a href="productView.jsp?Categorycode=1&Brandcode=1" accesskey="1" title="">Product</a></li>
                    <li><a href="merchandise_intro.jsp">MERCHANDISE</a></li>
                    <li><a href="cart.html">QnA</a></li>
                </ul>
            </nav>
            <!-- Button Group -->
            <div class="amado-btn-group mt-30 mb-100">
                <a href="join.jsp" class="btn amado-btn mb-15">JOIN</a>
                <a href="login.jsp" class="btn amado-btn active">LOGIN</a>
            </div>
    
            
        </header>
        <!-- Header Area End -->



<%

ProductDT PDT = new ProductDA().GetProduct(PID);

%>

<p><p>

<div class="boxB"> </div>
<div class="boxB"> </div>
	<div class="boxPR">
			<div class="boxpr">
   <img src="<%=img%>"/>
   <div class="details">
<p><p>
<h1>Product Name :: <%=PDT.getName() %></h1>
<p>
<h2>Product Avail Date :: <%=PDT.getAvail_Date() %></h2>
<p>
<h3>Product Price :: <%=PDT.getPrice() %></h3>
<p><p>
</div>
<form method="post" action="purchase.jsp">
<input type="hidden" name="PID" id="PID" value=<%=PDT.getProductID() %>>
 <input type="submit" class="btn btn-primary form-control"  value="PURCHASE">
</form>
</div>
</div>

 <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 



<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

 

</body>

</html>