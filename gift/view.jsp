<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>

<%@ page import="bbs.Bbs"%>

<%@ page import="bbs.BbsDAO"%>

<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- ºäÆ÷Æ® -->

<meta name="viewport" content="width=device-width" initial-scale="1">


<!-- ÇÕÃÄÁö°í ÃÖ¼ÒÈ­µÈ ÃÖ½Å CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- ºÎ°¡ÀûÀÎ Å×¸¶ -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">



<title>jsp 게시판 웹사이트</title>

</head>

<body>

	<%

		//·Î±äÇÑ»ç¶÷ÀÌ¶ó¸é	 userID¶ó´Â º¯¼ö¿¡ ÇØ´ç ¾ÆÀÌµð°¡ ´ã±â°í ±×·¸Áö ¾ÊÀ¸¸é null°ª

		String userID = null;

		if (session.getAttribute("userID") != null) {

			userID = (String) session.getAttribute("userID");

	

		}

		int bbsID = 0;

		if (request.getParameter("bbsID") != null) {

			bbsID = Integer.parseInt(request.getParameter("bbsID"));

		}

		if (bbsID == 0) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('유효하지 않은 글입니다. ')");

			script.println("location.href = 'bbs.jsp'");

			script.println("</script>");

		}

		Bbs bbs = new BbsDAO().getBbs(bbsID);

	%>





	<!-- ³×ºñ°ÔÀÌ¼Ç  -->

	<nav class="navbar navbar-default">

		<div class="navbar-header">

			<button type="button" class="navbar-toggle collapsed"

				data-toggle="collapse" data-target="bs-example-navbar-collapse-1"

				aria-expaned="false">

				<span class="icon-bar"></span> <span class="icon-bar"></span> <span

					class="icon-bar"></span>

			</button>

			<a class="navbar-brand" href="main.jsp">JSP 게시판</a>

		</div>

		<div class="collapse navbar-collapse"

			id="#bs-example-navbar-collapse-1">

			<ul class="nav navbar-nav">

				<li><a href="main.jsp">main</a></li>

				<li class="active"><a href="bbs.jsp">게시판</a></li>

			</ul>





			<%

				//¶ó±ä¾ÈµÈ°æ¿ì

				if (userID == null) {

			%>

			<ul class="nav navbar-nav navbar-right">

				<li class="dropdown"><a href="#" class="dropdown-toggle"

					data-toggle="dropdown" role="button" aria-haspopup="true"

					aria-expanded="false">접속하기<span class="caret"></span></a>

					<ul class="dropdown-menu">

						<li><a href="login.jsp">로그인</a></li>

						<li><a href="join.jsp">회원가입</a></li>

					</ul></li>

			</ul>

			<%

				} else {

			%>

			<ul class="nav navbar-nav navbar-right">

				<li class="dropdown"><a href="#" class="dropdown-toggle"

					data-toggle="dropdown" role="button" aria-haspopup="true"

					aria-expanded="false">회원관리<span class="caret"></span></a>

					<ul class="dropdown-menu">

						<li><a href="logoutAction.jsp">로그아웃</a></li>

					</ul></li>

			</ul>

			<%

				}

			%>

		</div>

	</nav>

	<!-- °Ô½ÃÆÇ -->

	<div class="container">

		<div class="row">

				<table class="table table-striped"

					style="text-align: center; border: 1px solid #dddddd">

					<thead>

						<tr>

							<th colspan="3"

								style="background-color: #eeeeee; text-align: center;">글보기 </th>

						</tr>

					</thead>

					<tbody>

						<tr>

							<td style="width: 20%;"> 글제목 </td>

							<td colspan="2"><%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br/>") %></td>

						</tr>

						<tr>

							<td>작성자</td>	

							<td colspan="2"><%= bbs.getUserID() %></td>

						</tr>

						<tr>

							<td>작성일</td>	

							<td colspan="2"><%= bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + "시"

							+ bbs.getBbsDate().substring(14, 16) + "분"%></td>

						</tr>

						<tr>

							<td>내용</td>	

							<td colspan="2" style="min-height: 200px; text-align: left;"><%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br/>") %></td>

						</tr>

						

					</tbody>

				</table>	

				<a href = "bbs.jsp" class="btn btn-primary">목록</a>

				

				

				<%

				//±ÛÀÛ¼ºÀÚ º»ÀÎÀÏ½Ã ¼öÁ¤ »èÁ¦ °¡´É 

					if(userID != null && userID.equals(bbs.getUserID())){

				%>

						<a href="update.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">수정</a>

						<a onclick="return confirm('정말로 삭제 하시겠습니까?')" href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-primary	">삭제</a>


				<%					

					}

				%>

		</div>

	</div>









	<!-- ¾Ö´Ï¸ÅÀÌ¼Ç ´ã´ç JQUERY -->

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

	<!-- ÇÕÃÄÁö°í ÃÖ¼ÒÈ­µÈ ÃÖ½Å ÀÚ¹Ù½ºÅ©¸³Æ® -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>



</body>

</html>

