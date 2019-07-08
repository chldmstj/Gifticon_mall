<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<%@ page import="GIFT.MerchandiseDA" %>
<%@ page import="GIFT.MerchandiseDT" %> <!-- userdao의 클래스 가져옴 -->

<%@ page import="java.io.PrintWriter" %> <!-- 자바 클래스 사용 -->

<% request.setCharacterEncoding("UTF-8"); 
String mdpin = request.getParameter("MerchandisePIN");
String mdaccount = request.getParameter("MerchandiseAccount");%>



<!-- 한명의 회원정보를 담는 user클래스를 자바 빈즈로 사용 / scope:페이지 현재의 페이지에서만 사용-->

<%-- <jsp:useBean id="md" class="GIFT.MerchandiseDT" scope="page" /> --%>

<%-- <jsp:setProperty name="md" property="*" /> --%>

<%-- <jsp:setProperty name="md" property="MerchandisePIN"  />  --%>

<%
MerchandiseDT MD = new MerchandiseDT(mdpin,mdaccount);

%>

<!DOCTYPE html>

<html>

<head>



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>GIFTICON SHOP</title>

</head>

<body>

	<%

		
			MerchandiseDA MDA = new MerchandiseDA();
		
	
		
	int result = MDA.login(MD.getMerchandiseAccount(),MD.getMerchandisePIN());
		

 	if(result == 1){

			PrintWriter script = response.getWriter();
			session.setAttribute("MerchandisePIN", MD.getMerchandisePIN()); 
			response.sendRedirect("registration_product.jsp?mdaccount="+mdaccount);
		}

		//로그인 실패

		else if(result == 0){

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('wrongpin')");

			script.println("history.back()");

			script.println("</script>");

		}

		//아이디 없음

		else if(result == -1){

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('noaccount')");

		script.println("history.back()");

		script.println("</script>");

		}

		//DB오류

		else if(result == -2){

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('DB error')");

		script.println("history.back()");

		script.println("</script>");

		}		 

	

	%>
<%MDA.disconnect(); %>


</body>

</body>

</html>

