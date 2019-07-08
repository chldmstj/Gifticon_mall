<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>
<%@ page import="GIFT.ProductDA" %>
<%@ page import="GIFT.ProductDT" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="GIFT.PurchaseDA" %>
<%@page import="GIFT.PurchaseDT" %>
<%@ page import="java.util.*" %>



<!DOCTYPE html>

<html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>Amado - Furniture Ecommerce Template | Product Details</title>

    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="css/core-style.css">
    <link rel="stylesheet" href="style.css">

<title>GIFTICON LOGIN</title>


<%
String PID = request.getParameter("PID");
ProductDA PDA= new ProductDA();
PDA.ChangeSell(PID);
ProductDT PDT = new ProductDT();
PurchaseDT PUDT = new PurchaseDT();
PurchaseDA PUDA = new PurchaseDA();
PDT = PDA.GetProduct(PID);
Date now = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss");
String PayDate = sf.format(now);	
Random r = new Random();
int i = r.nextInt(10000);
String PurchaseID = Integer.toString(i);
PUDA.R_Purchase(PurchaseID,PID,PayDate);
%>
</head>


<body>
	
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
                <a href="index.html"><img src="img/core-img/logo.png" alt=""></a>
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
       



<!-- container -->
<div id="page">
	<div class="container">
<div class="boxB"> </div>
<div class="boxB"> </div>
	<div class="boxPR">
			<div class="boxpr">
				<br><br><br><br>
				<img src="<%=PDT.getImage() %>" width="320" height="280" alt="" />
				<!-- https://ccimg.hellomarket.com/images/2019/item/05/06/03/3740_3757550_1.jpg?size=s6 -->
				<div class="details">
					<p>
					AVAIL_DATE: <%=PDT.getAvail_Date() %></p>
					<p>
					PRICE: <%=PDT.getPrice() %>
					
					
					
					 </p>
				</div>

<script>
function go(){
	
	location.href="<%=PDT.getImage()%>";
	
}

</script>
				  <form method="post" action="purchase.jsp">
				  
					<input type="hidden" id="price" name="price" value="2000"/>


				  <input type="button" class="BTN_PUR" value="Download!" onclick="go();">
				<!-- <a href="#" class="button">PURCHASE!</a>-->
			</div>
			
			
		</div>


	
	</div>
</div>
<!-- /container -->

<%PDA.disconnect();
PUDA.disconnect();%>
</body>
</html>