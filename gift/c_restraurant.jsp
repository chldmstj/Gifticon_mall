<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>
    <%@ page import="GIFT.ProductDA" %>
    <%@ page import="GIFT.ProductDT" %>
    	<%@ page import="java.util.ArrayList"%>
    		<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>

<html>
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
String CategoryCode = request.getParameter("Categorycode");
String BrandCode = request.getParameter("Brandcode");

/* ProductDA PDA = new ProductDA();
ProductDT PDT = new ProductDT(); */
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
                    <li><a href="bbs.jsp">QnA</a></li>
                </ul>
            </nav>
            <!-- Button Group -->
            <%
           		Object userID = session.getAttribute("userID");
           %>
           <%
           		if(userID == null){
           %>
				<div class="amado-btn-group mt-30 mb-100">
                <a href="join.jsp" class="btn amado-btn mb-15">JOIN</a>
                <a href="login.jsp" class="btn amado-btn active">LOGIN</a>
                </div>
            <%
           		}else{
            %>	<div class="amado-btn-group mt-30 mb-100">
            	<a href="logoutAction.jsp" class="btn amado-btn mb-15">LOGOUT</a>
            	</div>
            <%	
           		}
            %>
    
            
        </header>
        <!-- Header Area End -->

   <div class="shop_sidebar_area">

            <!-- ##### Single Widget ##### -->
            <div class="widget catagory mb-50">
                <!-- Widget Title -->
                <h6 class="widget-title mb-30">Catagories</h6>

                <!--  Catagories  -->
                <div class="catagories-menu">
                    <ul>
                        <li><a href="productView.jsp?Categorycode=1&Brandcode=1" accesskey="1" title="">CAFE</a></li>
                        <li><a href="c_cinema.jsp?Categorycode=2&Brandcode=1" accesskey="2" title="">CINEMA</a></li>
                        <li class="active"><a href="c_restraurant.jsp?Categorycode=3&Brandcode=1" accesskey="3" title="">RESTAURANT</a></li>
                        <li><a href="c_cosmetic.jsp?Categorycode=4&Brandcode=1" accesskey="4" title="">COSMETIC</a></li>
                        <li><a href="c_chiken.jsp?Categorycode=5&Brandcode=1" accesskey="5" title="">CHICKEN</a></li>
                        <li><a href="c_voucher.jsp?Categorycode=6&Brandcode=1" accesskey="6" title="">VOUCHER</a></li>
     
                    </ul>
                </div>
            </div>
      
            <!-- ##### Single Widget ##### -->
            <div class="widget price mb-50">
                <!-- Widget Title -->
                <h6 class="widget-title mb-30">Price</h6>

                <div class="widget-desc">
                    <div class="slider-range">
                        <div data-min="10" data-max="1000" data-unit="$" class="slider-range-price ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all" data-value-min="10" data-value-max="1000" data-label-result="">
                            <div class="ui-slider-range ui-widget-header ui-corner-all"></div>
                            <span class="ui-slider-handle ui-state-default ui-corner-all" tabindex="0"></span>
                            <span class="ui-slider-handle ui-state-default ui-corner-all" tabindex="0"></span>
                        </div>
                        <div class="range-price">$10 - $1000</div>
                    </div>
                </div>
            </div>
        </div>


    
<%
ProductDA PDA = new ProductDA();

ArrayList<ProductDT> list = PDA.CategoryProduct_List();
String id="";
String category="";
String brand="";
String mdid="";
String name="";
String price="";
String avail_date="";
String image="";
//out.print(Integer.toString(list.size()));
%>
<div id="page">
     <div class="container">
     <br><br>
<h3>Product List</h3>
<p><p><p>
<%
for (int i = 0; i < list.size(); i++) {
	
	 if ("3".equals(list.get(i).getCategoryCode())){
			
		 if("1".equals(list.get(i).getBrandCode())) image="http://www.consumuch.com/news/photo/201712/31726_31039_4351.jpg";
		 else if("2".equals(list.get(i).getBrandCode()))  image="http://t1.daumcdn.net/liveboard/5minute_lab/440d44fdae694ff6adc63f7c6f91b410.jpg";
		 else if("3".equals(list.get(i).getBrandCode()))  image="img/product-img/vips.png";
		 %>
		 
			<div class="boxD">
			<a href="Product_DetailView.jsp?PID=<%=list.get(i).getProductID()%>&IMG=<%=image%>">
			<img src="<%=image%>"/></a>
			<div style="text-align:center">
		Name: <%=list.get(i).getName()%><p>
		Price: <%=list.get(i).getPrice() %>
</p></div>
		
		<%
	
	 }
	%>

	<p><p>
	
	</div>
	<%}%>

 </div>
 </div>
 
<%PDA.disconnect(); %>
    

 

 <!-- ##### Main Content Wrapper End ##### -->

   
   
    <!-- ##### Footer Area End ##### -->

    <!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="js/plugins.js"></script>
    <!-- Active js -->
    <script src="js/active.js"></script>

</body>

</html>


