<%@page import="javax.security.auth.callback.ConfirmationCallback"%>
	<%@ page language="java" contentType="text/html; charset=euc-kr"

		pageEncoding="euc-kr"%>

	<%@ page import="java.io.PrintWriter"%>

	<%@ page import="bbs.BbsDAO"%>

	<%@ page import="bbs.Bbs"%>

	<%@ page import="java.util.ArrayList"%>

	<!DOCTYPE html>

	<html>

	<head>

	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

	

	<meta name="viewport" content="width=device-width" initial-scale="1">

	

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">




	<title>jsp Board</title>

	<style type="text/css">

		a, a:hover {

			color: #000000;

			text-decoration: none;

		}

	</style>

	</head>

	<body>

		<%

	

			String userID = null;

			if (session.getAttribute("userID") != null) {

				userID = (String) session.getAttribute("userID");

	

			}

	

			int pageNumber = 1; 

	

		

			if (request.getParameter("pageNumber") != null) {

				pageNumber = Integer.parseInt(request.getParameter("pageNumber"));

			}

		%>

	

	

		
		<nav class="navbar navbar-default">

			<div class="navbar-header">

				<button type="button" class="navbar-toggle collapsed"

					data-toggle="collapse" data-target="bs-example-navbar-collapse-1"

					aria-expaned="false">

					<span class="icon-bar"></span> <span class="icon-bar"></span> <span

						class="icon-bar"></span>

				</button>

				<a class="navbar-brand" href="main.jsp">main</a>

			</div>

			<div class="collapse navbar-collapse"

				id="#bs-example-navbar-collapse-1">

				<ul class="nav navbar-nav">

					<li><a href="main.jsp">main</a></li>

					<li class="active"><a href="bbs.jsp">board</a></li>

				</ul>

	

	

				<%

			

					if (userID == null) {

				%>

				<ul class="nav navbar-nav navbar-right">

					<li class="dropdown"><a href="#" class="dropdown-toggle"

						data-toggle="dropdown" role="button" aria-haspopup="true"

						aria-expanded="false">ACCESS<span class="caret"></span></a>

						<ul class="dropdown-menu">

							<li><a href="login.jsp">LOGIN</a></li>

							<li><a href="join.jsp">LOGOUT</a></li>

						</ul></li>

				</ul>

				<%

					} else {

				%>

				<ul class="nav navbar-nav navbar-right">

					<li class="dropdown"><a href="#" class="dropdown-toggle"

						data-toggle="dropdown" role="button" aria-haspopup="true"

						aria-expanded="false">ACCESS<span class="caret"></span></a>

						<ul class="dropdown-menu">

							<li><a href="logoutAction.jsp">LOGOUT</a></li>

						</ul></li>

				</ul>

				<%

					}

				%>

			</div>

		</nav>

		<!-- 嶺뚯쉶梨몌옙�뭾�넼�뫀�뿨占쎈룱�뜝�럩�룼�뜝�럩�룾 -->

		<div class="container">

			<div class="row">

				<table class="table table-striped"

					style="text-align: center; border: 1px solid #dddddd">

					<thead>

						<tr>

							<th style="background-color: #eeeeee; text-align: center;">NO</th>

							<th style="background-color: #eeeeee; text-align: center;">TITLE</th>

							<th style="background-color: #eeeeee; text-align: center;">WRITER</th>

							<th style="background-color: #eeeeee; text-align: center;">DATE</th>

						</tr>

					</thead>

					<tbody>

						<%

							BbsDAO bbsDAO = new BbsDAO();

							ArrayList<Bbs> list = bbsDAO.getList(pageNumber);

							for (int i = 0; i < list.size(); i++) {

						%>

						<tr>

							<td><%=list.get(i).getBbsID()%></td>

							<td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle()%></a></td>

							<td><%=list.get(i).getUserID()%></td>

							<td><%=list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "H"

							+ list.get(i).getBbsDate().substring(14, 16) + "M"%></td>

						</tr>

	

						<%

							}

						%>

	

					</tbody>

				</table>

				<!-- �뜝�럩�룼嶺뚳옙熬곎딆굲�뜝�럩�뤈�뜝�럩�룫嶺뚳퐦�삕 勇싲쨪�삕�뜝�럩�뭸嶺뚯쉶占썲첎諭꾩�よキ占썲첎占� -->

				<%

					if (pageNumber != 1) {

				%>

				<a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>"

					class="btn btn-success btn-arrow-left">PREV</a>

				<%

					}

					if (bbsDAO.nextPage(pageNumber)) {

				%>

				<a href="bbs.jsp?pageNumber=<%=pageNumber + 1%>"

					class="btn btn-success btn-arrow-left">NEXT</a>

				<%

					}

				%>

	

	

				<!-- �뜝�럩�룿勇싲８�뵰筌〓낑�럸占쎈쳴�↔꼈�뀋占쎌뵰�뜝�룞�삕占쎈뭸�넼�뫀흮�꽴臾뺤�わ쭗袁⑹톭勇싲８留⒵�⊥껁뀋占쎌뒭占쎈뭶 -->

				<%

					//if logined userID勇싲８肉��뜎洹쎼뀋占쎈쐡占쎈룭 勇싲９瑗뤄옙�쟿�넼�뫀�뒩�뜎�뿥�렎�겫�슦痍� �뜝�럩�룾�뜝�럩�뮅勇싲８�쐠�굜占� �넼�뫀占쎄퀣�룼占쎈쐻占쏙옙占쎈뤈勇싲８留⒵꽴�뫜彛わ쭗袁⑹톭 勇싲８�쐠揶쏆눦彛よキ占썲첎諭꾩�わ쭗袁⑹돩 if not null

					if (session.getAttribute("userID") != null) {

				%>

				<a href="write.jsp" class="btn btn-primary pull-right">WRITE</a>

				<%

					} else {

				%>

				<button class="btn btn-primary pull-right"

					onclick="if(confirm('PLEASE LOGIN'))location.href='login.jsp';"

					type="button">WRITE</button>

				<%

					}

				%>

	<%bbsDAO.disconnect(); %>

			</div>

		</div>


		<!-- �넼�뫀占쎄퀣�뮀勇싲８�쐡占쎈뭶勇싲８�뿨占쎈룷占쎈쐻占쏙옙占쎈뤈�넼�뫀�뒭占쎈룾 勇싲８�쐠揶쏆뇯�뀋占쎈쐠�굜占� JQUERY -->

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 

 <!-- 勇싲９瑗뱄옙占썲뜝�럩�룼嶺뚯쉳�ｏ㎕�맕�뀋占쎄섰占쎈룼嶺뚯쉳�ｆ�∽옙嶺뚯쉻�삕 JS  -->

<!--  <script src="js/bootstrap.js"></script>-->




<!-- �뜝�럩�룾�뜝�럩�뭿�뜝�럩�룱�뜝�럩�룶�뜝�럩�룫嶺뚳퐣伊숋옙�윯嶺뚳옙�뜝占� �뜝�럩�룱�뜝�럩�뮀�넼�뫀�뒭占쎈뭺�뜝�럩�룿嶺뚯쉻�삕勇싲８留わ옙�룿 �뜝�럩�룱�뜝�럩�뮀�넼�뫀�뿨占쎈룷 占쎈쐻占쏙옙占쎈뮉勇싲８占쏙옙�뮇�넼�뫀�뵰�≪눦�삕占쎈룷嶺뚯쉧�걠�↔꼈�뀋�뜝�룞�삕占쎈룼嶺뚯쉻�삕 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

	</body>

	</html>

