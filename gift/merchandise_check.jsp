<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<%@ page import="GIFT.MerchandiseDA" %>
<%@ page import="GIFT.MerchandiseDT" %> <!-- userdao�� Ŭ���� ������ -->

<%@ page import="java.io.PrintWriter" %> <!-- �ڹ� Ŭ���� ��� -->

<% request.setCharacterEncoding("UTF-8"); 
String mdpin = request.getParameter("MerchandisePIN");
String mdaccount = request.getParameter("MerchandiseAccount");%>



<!-- �Ѹ��� ȸ�������� ��� userŬ������ �ڹ� ����� ��� / scope:������ ������ ������������ ���-->

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

		//�α��� ����

		else if(result == 0){

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('wrongpin')");

			script.println("history.back()");

			script.println("</script>");

		}

		//���̵� ����

		else if(result == -1){

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('noaccount')");

		script.println("history.back()");

		script.println("</script>");

		}

		//DB����

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

