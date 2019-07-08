<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter"%>
<%@ page import="GIFT.MerchandiseDA" %>
<%@ page import="GIFT.MerchandiseDT" %>
<%@ page import="GIFT.ProductDA" %>
<%@ page import="GIFT.ProductDT" %>
<%@ page import="java.util.*" %>

<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<!DOCTYPE html>

<html>

<head>
<%
	String uploadPath = application.getRealPath("/upload");
	int maxSize = 1024 * 1024 * 10; 
	String fileName1 = "";
	String originalName1 = ""; 
	long fileSize = 0; 
	String fileType = ""; 
	MultipartRequest multi = null;
	
	try{
		multi = new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
		Enumeration files = multi.getFileNames();
		
		while(files.hasMoreElements()){
			
			String file1 = (String)files.nextElement(); 
			originalName1 = multi.getOriginalFileName(file1);
			fileName1 = multi.getFilesystemName(file1);		
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	String Image = "../upload/"+fileName1;
%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



<meta name="viewport" content="width=device-width" initial-scale="1">


<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link href="default.css" rel="stylesheet" type="text/css" media="all" />

<title>GIFTICON LOGIN</title>
<%
String MDPrice =multi.getParameter("MDPrice");
if(MDPrice==null)MDPrice="0";

String Avail_Date = multi.getParameter("Avail_Date");
String Name = multi.getParameter("Name");
out.print(Name);
String BrandID = multi.getParameter("BrandID");
String Category = multi.getParameter("Category");
String MDAccount = multi.getParameter("mdaccount");
//String Image = "http://m.akplaza.com/resources/images/gift/thum_giftcard_card2.jpg";



%>
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
		else{
			
			double mdprice = Double.parseDouble(MDPrice) * 0.85;
			double RealPrice = Double.parseDouble(MDPrice) * 0.95; 
	
			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("if(!confirm('DO YOU WANT SELL PRODUCT "+Double.toString(mdprice)+"won?'))");

			script.println("{location.href = 'main.jsp'}");

			script.println("</script>"); 
			
	
			
			Random r = new Random();
			int i = r.nextInt(10000);
			String ProductID = Integer.toString(i);
			String mdPrice = Double.toString(mdprice);//product테이블과 md 테이블에 넣기 
	
			MerchandiseDA MDA = new MerchandiseDA(); 
			
			MDA.Registration_MD(MDPIN,MDAccount,ProductID,mdPrice);
			
			ProductDA PDA = new ProductDA();
			String price = Double.toString(RealPrice);
			
			ProductDT PDT = new ProductDT();
			PDT.R_ProductDT(ProductID,Category,BrandID,MDPIN,Name,price,Avail_Date,Image);
			PDA.Registration_Product(PDT);
			
			script.println("<script>");
			script.println("alert('Registration Success!')");
			script.println("location.href = 'main.jsp'");

			script.println("</script>"); 
		
			
		}
		

%>




<div id="header" class="container">
	<div id="logo">
		<h1><a href="main.jsp">GIFTICON SALES</a></h1>
	</div>
	<div id="menu">
		<ul>
			<li class="active"><a href="main.jsp" accesskey="1" title="">Homepage</a></li>
			<li><a href="productView.jsp?Categorycode=1&Brandcode=1" accesskey="3" title="">PRODUCT</a></li>
			<li><a href="merchandise_intro.jsp" accesskey="3" title="">MERCHANDISE</a></li>
			<li><a href="bbs.jsp" accesskey="5" title="">QnA</a></li>
			<li><a href="login.jsp" accesskey="5" title="">Login</a></li>
			<li><a href="join.jsp" accesskey="5" title="">JOIN</a></li>
			
		</ul>
		
	</div>
	
</div>




    

    

   </form>

  </div>

 </div>

</div>
</div>
 
<%MDA.disconnect();
PDA.disconnect();%>
 



 <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 



<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

 


</body>
</html>