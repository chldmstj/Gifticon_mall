<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<%@ page import="user.UserDAO" %> <!-- userdao�� Ŭ���� ������ -->

<%@ page import="java.io.PrintWriter" %> <!-- �ڹ� Ŭ���� ��� -->

<% request.setCharacterEncoding("UTF-8"); %>



<!-- �Ѹ��� ȸ�������� ��� userŬ������ �ڹ� ����� ��� / scope:������ ������ ������������ ���-->

<jsp:useBean id="user" class="user.User" scope="page" />

<jsp:setProperty name="user" property="userID" />

<jsp:setProperty name="user" property="userPassword" /> 

<jsp:setProperty name="user" property="userName" />

<jsp:setProperty name="user" property="userGender" />

<jsp:setProperty name="user" property="userEmail" />



<!DOCTYPE html>

<html>

<head>



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Gifticon</title>

</head>

<body>

	<%
	
	<%

	//�α��ε� ȸ������ �������� ���� �� �� ������

	String userID = null;

	if(session.getAttribute("userID") != null ){

		userID = (String) session.getAttribute("userID");

	}

	if(userID != null){

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('�̹� �α��� �Ǿ��ֽ��ϴ�.')");

		script.println("location.href = 'main.jsp'");

		script.println("</script>");	

	}



		if (user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null

			|| user.getUserGender() == null || user.getUserEmail() == null){

				PrintWriter script = response.getWriter();

				script.println("<script>");

				script.println("alert('�Է��� �� �� ������ �ֽ��ϴ�.')");

				script.println("history.back()");

				script.println("</script>");

			} else{

				UserDAO userDAO = new UserDAO(); //�ν��Ͻ�����

				int result = userDAO.join(user);				

				

				if(result == -1){ // ���̵� �⺻Ű��. �ߺ��Ǹ� ����.

					PrintWriter script = response.getWriter();

					script.println("<script>");

					script.println("alert('�̹� �����ϴ� ���̵� �Դϴ�.')");

					script.println("history.back()");

					script.println("</script>");

				}

				//���Լ���

				else {

					PrintWriter script = response.getWriter();

					script.println("<script>");

					script.println("location.href = 'main.jsp'");

					script.println("</script>");

				}

			}

			%>


<%userDAO.disconnect(); %>
</body>

</body>

</html>

