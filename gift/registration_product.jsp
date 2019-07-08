<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <%String mdaccount = request.getParameter("mdaccount");%>
    
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

<%

String MDPIN = null;

		if (session.getAttribute("MerchandisePIN") != null) {//유저아이디이름으로 세션이 존재하는 회원들은 

			MDPIN = (String) session.getAttribute("MerchandisePIN");//유저아이디에 해당 세션값을 넣어준다.

		}

		if (MDPIN == null) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('Please Registrate PIN.')");

			script.println("location.href = 'merchandise_intro.jsp'");

			script.println("</script>");

		} 
		

%>
<script>
function itemchange(){
	var selectBox1 = Document.getElementById("selectBox1");
	var selectBox2 = Document.getElementById("selectBox2");
	var CAFE =["HOLLYS","IDIYA","CAFE BENE","ETC"];
	var CINEMA = ["CGV","LOTTE","MEGABOX","ETC"];
	var RESTAURANT =["OUTBACK","DOMINO","ETC"];
	var COSMETIC = ["OLIVE-YOUNG","LALAVLA","ETC"];
	var CHICKEN = ["BHC","BBQ","ETC"];
	var VOUCHER = ["SINSEGE","LOTTE","ETC"];
	
	var selectItem =selectBox1 //selectBox1.val();
	var changeItem;
	if(selectItem == "CAFE"){
		  changeItem = CAFE;
		}
		else if(selectItem == "CINEMA"){
		  changeItem = CINEMA;
		}
		else if(selectItem == "RESTAURANT"){
		  changeItem =  RESTAURANT;
		}
		else if(selectItem == "COSMETIC"){
			changeItem = COSMETIC;
		}
		else if(selectItem=="CHICKEN"){
			changeItem=CHICKEN;
		}
		else if(selectItem=="6"){
			changeItem=VOUCHER;
		}
		selectBox2.empty();
		 
		for(var count = 0; count < changeItem.size(); count++){                
		                var option = "<option>"+changeItem[count]+"</option>";
		                selectBox2.append(option);
		            }
}

</script>


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
                    <li><a href="bbs.jsp">QnA</a></li>
                </ul>
            </nav>
            <!-- Button Group -->
            <div class="amado-btn-group mt-30 mb-100">
                <a href="join.jsp" class="btn amado-btn mb-15">JOIN</a>
                <a href="login.jsp" class="btn amado-btn active">LOGIN</a>
            </div>
    
            
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
                                
                                <form  method="post" action="Registration_product_Action.jsp" enctype="multipart/form-data"> 

    <h3 style="text-align: center;"> Registration Product</h3>

    <div class="form-group">

     <input type="text" class="form-control" placeholder="Price" id ="MDPrice" name="MDPrice" maxlength="20">
   

    </div>

       

    <div class="form-group">

     <input type="text" class="form-control" placeholder="Avail_Date:: yyyymmdd	" id="Avail_Date" name="Avail_Date" maxlength="20">

    </div>
      <div class="form-group">
   FILE  <input type="file" name="file1"><br>
    </div>
      <div class="form-group">
		<input type="hidden" id = "mdaccount" name="mdaccount" value=<%=mdaccount %>>
     	<input type="text" class="form-control" placeholder="Product Name" id="Name" name="Name" maxlength="20">

   	 </div>
     <div class="form-group">
   <select  name="Category" id="Category" style="width:150px;" onchange="itemchange()">
<!-- 카테고리 셀렉트 박스 -->

<option selected disabled>CATEGORY</option>
<option value="1">CAFE</option>
<option value="2">CINEMA</option>
<option value="3">RESTAURANT</option>
<option value="4">COSMETIC</option>
<option value="5">CHICKEN</option>
<option value="6">VOUCHER</option>
</select>

    <select  name="BrandID" id="BrandID" style="width: 150px;">
<!-- 카테고리 셀렉트 박스 -->
<option selected disabled>BRAND</option>
<option value="1">HOLLYS</option>
<option value="2">IDIYA</option>
<option value="3">CAFE BENE</option>
<option value="4">ETC</option>
</select>

</div>

    <input type="submit" class="btn btn-primary form-control" value="SUMBIT">
    
<%-- <input type="button" value="gogogo" onclick = "go()">

<script>
function go(){
	var MDPrice = Document.getElementById("MDPrice");
	var Avail_Date = Document.getElementById("Avail_Date");
	var Name = Document.getElementById("Name");
	var BrandID = Document.getElementById("BrandID");
	var Category = Document.getElementById("Category");
	var MDAccount = <%=mdaccount%>
	var Image = "tmp";
	
	location.href='Registration_product_Action.jsp?MDPrice='+MDPrice+'?Avail_Date='+Avail_Date+'?Name='+Name+'?BrandID='+BrnadID+
			'?Category='+Category+'?MDAccount='+MDAccount+'?Image='+Image;
	
} --%>

</script>
    

   </form>
 
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