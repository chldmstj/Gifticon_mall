<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>

<%@ page import="bbs.BbsDAO"%>

<%@ page import="bbs.Bbs"%>

<%@ page import="java.io.PrintWriter"%>

<%

	request.setCharacterEncoding("UTF-8");

	//sresponse.setContentType("text/html; charset=UTF-8");

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

		} 

		

		//���� ��ȿ���� �Ǻ�

		int bbsID = 0;

		if (request.getParameter("bbsID") != null) {

			bbsID = Integer.parseInt(request.getParameter("bbsID"));

		}

		if (bbsID == 0) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('��ȿ���� ���� �� �Դϴ�.')");

			script.println("location.href = 'bbs.jsp'");

			script.println("</script>");

		}

		Bbs bbs = new BbsDAO().getBbs(bbsID);

		if (!userID.equals(bbs.getUserID())) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('������ �����ϴ�.')");

			script.println("location.href = 'bbs.jsp'");

			script.println("</script>");				

		} 
		else {

			if (request.getParameter("bbsTitle") == null || request.getParameter("bbsContent") == null

					|| request.getParameter("bbsTitle").equals("") || request.getParameter("bbsContent").equals("") ) {

				PrintWriter script = response.getWriter();

				script.println("<script>");

				script.println("alert('�Է��� �ȵ� ������ �ֽ��ϴ�')");

				script.println("history.back()");

				script.println("</script>");

			} else {

				BbsDAO BbsDAO = new BbsDAO();

				int result = BbsDAO.update(bbsID, request.getParameter("bbsTitle"), request.getParameter("bbsContent"));

				if (result == -1) {

					PrintWriter script = response.getWriter();

					script.println("<script>");

					script.println("alert('�ۼ����� �����߽��ϴ�')");

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
	
	<%BbsDAO.disconnect();
	%>

</body>

</html>
