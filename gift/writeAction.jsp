<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>

<%@ page import="bbs.BbsDAO"%>

<!-- bbsdao�� Ŭ���� ������ -->

<%@ page import="java.io.PrintWriter"%>

<!-- �ڹ� Ŭ���� ��� -->

<%

	request.setCharacterEncoding("UTF-8");

	response.setContentType("text/html; charset=UTF-8"); //set���ξ��½������̼���.

%>



<!-- �Ѹ��� ȸ�������� ��� userŬ������ �ڹ� ����� ��� / scope:������ ������ ������������ ���-->

<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />

<!-- // Bbs bbs = new Bbs(); -->

<jsp:setProperty name="bbs" property="bbsTitle" /><!-- bbs.setBbsTitle(requrst) -->

<jsp:setProperty name="bbs" property="bbsContent" />

<%

	System.out.println(bbs);

%>

<!DOCTYPE html>

<html>

<head>



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>jsp �Խ��� ������Ʈ</title>

</head>

<body>

	<%

		String userID = null;

		if (session.getAttribute("userID") != null) {//�������̵��̸����� ������ �����ϴ� ȸ������ 

			userID = (String) session.getAttribute("userID");//�������̵� �ش� ���ǰ��� �־��ش�.

		}

		if (userID == null) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('�α����� �ϼ���.')");

			script.println("location.href = 'login.jsp'");

			script.println("</script>");

		} else {



			if (bbs.getBbsTitle() == null || bbs.getBbsContent() == null) {

				PrintWriter script = response.getWriter();

				script.println("<script>");

				script.println("alert('�Է��� �ȵ� ������ �ֽ��ϴ�')");

				script.println("history.back()");

				script.println("</script>");

			} else {

				BbsDAO BbsDAO = new BbsDAO();

				int result = BbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());

				if (result == -1) {

					PrintWriter script = response.getWriter();

					script.println("<script>");

					script.println("alert('�۾��⿡ �����߽��ϴ�')");

					script.println("history.back()");

					script.println("</script>");

				} else {

					PrintWriter script = response.getWriter();

					script.println("<script>");

					script.println("location.href='bbs.jsp'");

					//script.println("history.back()");

					script.println("</script>");

				}



			}



		}

	%>
<%BbsDAO.disconnect(); %>
</body>

</html>



