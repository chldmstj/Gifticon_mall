<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="java.util.*" %> 
<%@ page import="java.io.PrintWriter" %>


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
       

        <!-- Product Details Area Start -->
        <div class="single-product-area section-padding-100 clearfix">
            <div class="container-fluid">

                

                <div class="row">
                  
                    <div class="col-12 col-lg-5">
                        <div class="single_product_desc">
                            <!-- Product Meta Data -->
                            <div class="product-meta-data">
                                <div class="line"></div>
                                <p class="product-price">MERCHANDISE</p><br><br>
                                <a href="product-details.html">
                                </a>
                                
                             <form method="post" action="registration_product.jsp">
    							<h3 style="text-align: center;">Authentication</h3>
    							<br>
    							<div class="form-group">
    							Your PIN number : <%
    							Random r = new Random();
    							int i = r.nextInt(10000);
    							String MDPIN = Integer.toString(i);
    							out.print(MDPIN);
    							PrintWriter script = response.getWriter();
    							session.setAttribute("MerchandisePIN", MDPIN); 
    							
								%>
								
    							<br><br>
    							<!-- <input type="text" class="form-control" placeholder="input your MerchandisePIN" name="MDPIN" maxlength="20"> -->
     							<input type="text" class="form-control" placeholder="input your valid account" name="mdaccount" maxlength="20">
    							</div>
    							<br>
    							<input type="submit" class="btn amado-btn w-100" value="SUMBIT">
   							</form>
   								<br>
                            </div>
					
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Product Details Area End -->
    </div>
    <!-- ##### Main Content Wrapper End ##### -->

 
    <!-- ##### Newsletter Area End ##### -->

    <!-- ##### Footer Area Start ##### -->
    <footer class="footer_area clearfix">
        <div class="container">
            <div class="row align-items-center">
                <!-- Single Widget Area -->
                <div class="col-12 col-lg-4">
                    <div class="single_widget_area">
                        <!-- Logo -->
                        <div class="footer-logo mr-50">
                            <a href="main.jsp"><img src="https://ifh.cc/g/IhLfI.png" alt=""></a>
                        </div>
                        <!-- Copywrite Text -->
                        <p class="copywrite"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright & CPWEBP
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                    </div>
                </div>
                <!-- Single Widget Area -->
                
            </div>
        </div>
    </footer>
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