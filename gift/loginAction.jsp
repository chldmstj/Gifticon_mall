<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<%@ page import="user.UserDAO" %> <!-- userdao�� Ŭ���� ������ -->

<%@ page import="java.io.PrintWriter" %> <!-- �ڹ� Ŭ���� ��� -->

<% request.setCharacterEncoding("UTF-8"); %>



<!-- �Ѹ��� ȸ�������� ��� userŬ������ �ڹ� ����� ��� / scope:������ ������ ������������ ���-->

<jsp:useBean id="user" class="user.User" scope="page" />

<jsp:setProperty name="user" property="userID" />

<jsp:setProperty name="user" property="userPassword" /> 



<!DOCTYPE html>

<html>

<head>



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Gifticon</title>

</head>

<body>

	<%
		UserDAO userDAO = new UserDAO(); //�ν��Ͻ�����
		int result = userDAO.login(user.getUserID(), user.getUserPassword());
		//�α��� ����

		if(result == 1){

			PrintWriter script = response.getWriter();
			session.setAttribute("userID", user.getUserID()); 
			response.sendRedirect("main.jsp");
		}

		//�α��� ����

		else if(result == 0){

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('Wrong Password')");

			script.println("history.back()");

			script.println("</script>");

		}

		//���̵� ����

		else if(result == -1){

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('Unknown ID')");

		script.println("history.back()");

		script.println("</script>");

		}

		//DB����

		else if(result == -2){

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('DB Error')");

		script.println("history.back()");

		script.println("</script>");

		}		

	

	%>

<%userDAO.disconnect(); %>

</body>

</body>

</html>

