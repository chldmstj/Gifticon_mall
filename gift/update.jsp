<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>

<%@ page import="bbs.Bbs"%>

<%@ page import="bbs.BbsDAO"%>

<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 쨘채횈첨횈짰 -->

<meta name="viewport" content="width=device-width" initial-scale="1">


<!-- 횉횛횄횆횁철째챠 횄횜쩌횘횊짯쨉횊 횄횜쩍횇 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 쨘횓째징�청�횓 횇횞쨍쨋 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


<title>jsp 寃뚯떆�뙋 �쎒�궗�씠�듃 </title>

</head>

<body>

	<%

		//쨌횓짹채횉횗쨩챌쨋첨�횑쨋처쨍챕	 userID쨋처쨈횂 쨘짱쩌철쩔징 횉횠쨈챌 쩐횈�횑쨉챨째징 쨈찾짹창째챠 짹횞쨌쨍횁철 쩐횎�쨍쨍챕 null째짧

		String userID = null;

		if (session.getAttribute("userID") != null) {

			userID = (String) session.getAttribute("userID");



		} 

		//쨌횓짹횞�횓 쩐횊횉횗 째챈쩔챙

		if(userID == null) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('濡쒓렇�씤�쓣 �븯�꽭�슂.	')");

			script.println("location.href = 'login.jsp'");

			script.println("</script>");

			

		}

		

		int bbsID = 0;

		if (request.getParameter("bbsID") != null) {

			bbsID = Integer.parseInt(request.getParameter("bbsID"));

		}

		if (bbsID == 0) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('�쑀�슚�븯吏� �븡�� 湲��엯�땲�떎. ')");

			script.println("location.href = 'bbs.jsp'");

			script.println("</script>");

		}

		Bbs bbs = new BbsDAO().getBbs(bbsID);

		if (!userID.equals(bbs.getUserID())) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('沅뚰븳�씠 �뾾�뒿�땲�떎. ')");

			script.println("location.href = 'bbs.jsp'");

			script.println("</script>");				

		}

	%>





	<!-- 쨀횞쨘챰째횚�횑쩌횉  -->

	<nav class="navbar navbar-default">

		<div class="navbar-header">

			<button type="button" class="navbar-toggle collapsed"

				data-toggle="collapse" data-target="bs-example-navbar-collapse-1"

				aria-expaned="false">

				<span class="icon-bar"></span> <span class="icon-bar"></span> <span

					class="icon-bar"></span>

			</button>

			<a class="navbar-brand" href="main.jsp">JSP 寃뚯떆�뙋</a>

		</div>

		<div class="collapse navbar-collapse"

			id="#bs-example-navbar-collapse-1">

			<ul class="nav navbar-nav">

				<li><a href="main.jsp">硫붿씤</a></li>

				<li class="active"><a href="bbs.jsp">寃뚯떆�뙋</a></li>

			</ul>

			<ul class="nav navbar-nav navbar-right">

				<li class="dropdown"><a href="#" class="dropdown-toggle"

					data-toggle="dropdown" role="button" aria-haspopup="true"

					aria-expanded="false">�쉶�썝愿�由�<span class="caret"></span></a>

					<ul class="dropdown-menu">

						<li><a href="logoutAction.jsp">濡쒓렇�븘�썐</a></li>

					</ul>

				</li>

			</ul>

		</div>

	</nav>

	<!-- 째횚쩍횄횈횉 --> 

	<div class="container">

		<div class="row">

			<form method="post" action="updateAction.jsp?bbsID=<%= bbsID %> ">

				<table class="table table-striped"

					style="text-align: center; border: 1px solid #dddddd">

					<thead>

						<tr>

							<th colspan="2"

								style="background-color: #eeeeee; text-align: center;">湲��닔�젙</th>

						</tr>

					</thead>

					<tbody>

						<tr>

							<td><input type="text" class="form-control" placeholder="湲��젣紐�" name="bbsTitle" maxlength="50" value="<%= bbs.getBbsTitle() %>" ></td>

						</tr>

						<tr>

							<td><textarea class="form-control" placeholder="湲��궡�슜" name="bbsContent" maxlength="2048" style="height: 350px;" ><%= bbs.getBbsContent() %></textarea></td>

						</tr>

					</tbody>

				</table>	

				<button type="submit" class="btn btn-primary pull-right" >湲��닔�젙</button>

			</form>

		</div>

	</div>









	<!-- 쩐횜쨈횕쨍횇�횑쩌횉 쨈찾쨈챌 JQUERY -->

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<!-- 횉횛횄횆횁철째챠 횄횜쩌횘횊짯쨉횊 횄횜쩍횇 �횣쨔횢쩍쨘횇짤쨍쨀횈짰 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>



</body>

</html>

