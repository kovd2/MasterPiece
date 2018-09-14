<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%int view = Integer.parseInt(request.getParameter("name")); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style type="text/css">
#top {
	display: block;
	height: 90px;
	background: lightgray;
	height: 90px;
}

#logo {
	width: 80px;
	height: 50px;
	margin-left: 20px;
	margin-top: 20px;
}

#title {
	width: 150px;
	height: 50px;
	margin-left: 10px;
	margin-top: 20px;
}

#main {
	width: 80% px;
	height: 1080px;
	float: left;
}

#menu {
	background: lightgray;
	height: 1080px;
	width: 20% px;
	float: left;
}
.menu2{
	height: 60px;
}
#mt{
	margin-left: 30px;
}
a:link{
	color:black;
	text-decoration: none;
}
a:VISITED {
	color:black;
	text-decoration:none;
}
a:HOVER {
	color:black;
	text-decoration:none;
}
#tm td:hover{
	background: black;
	color:white;
	cursor:pointer;
}
</style>
</head>
<body>

	<div id="top">
		<img alt="" src="<%=request.getContextPath()%>/images/logo.png" id="logo"> 
		<img alt=""	src="<%=request.getContextPath()%>/images/MasterPiece.png" id="title">
	</div>
	<div id="menu">
		<table align="center" id="tm">
			<tr>
			<%if(view == 1){ %>			
				<td align="center" class="menu2" style="background: black; color:white;"><h3>현황</h3></td>
			<%}else{ %>
				<td align="center" class="menu2" onclick="location.href='<%=request.getContextPath()%>/start'"><h3>현황</h3></td>
			<%} %>
			</tr>
			<tr>
			<%if(view == 2){ %>
				<td align="center" class="menu2" style="background: black; color:white;"><h3>상품관리</h3></td>
			<%}else{ %>
				<td align="center" class="menu2" onclick="location.href='<%=request.getContextPath()%>/views/admin/product/adminProduct.jsp'"><h3>상품관리</h3></td>
			<%} %>
			</tr>
			<tr>
			<%if(view == 3){ %>
				<td align="center" class="menu2" style="background: black; color:white;"><h3>회원관리</h3></td>
			<%}else{ %>
				<td align="center" class="menu2" onclick="location.href='<%=request.getContextPath()%>/views/admin/member/member.jsp'"><h3>회원관리</h3></td>
			<%} %>
			</tr>
			<tr>
			<%if(view == 4){ %>
				<td align="center" class="menu2" style="background: black; color:white;"><h3>주문관리</h3></td>
			<%}else{ %>
				<td align="center" class="menu2" onclick="location.href='<%=request.getContextPath()%>/views/admin/ordermember/ordermember.jsp'"><h3>주문관리</h3></td>
			<%} %>
			</tr>
			<tr>
			<%if(view == 5){ %>
				<td align="center" class="menu2" style="background: black; color:white;"><h3>발주관리</h3></td>
			<%}else{ %>
				<td align="center" class="menu2" onclick="location.href='<%=request.getContextPath()%>/views/admin/order/order.jsp'"><h3>발주관리</h3></td>
			<%} %>
			</tr>
			<tr>
			<%if(view == 6){ %>
				<td align="center" class="menu2" style="background: black; color:white;"><h3>문의관리</h3></td>
			<%}else{ %>
				<td align="center" class="menu2" onclick="location.href='<%=request.getContextPath()%>/views/admin/question/question.jsp'"><h3>문의관리</h3></td>
			<%} %>
			</tr>
			<tr>
			<%if(view == 7){ %>
				<td align="center" class="menu2" style="background: black; color:white;"><h3>게시판 관리</h3></td>
			<%}else{ %>
				<td align="center" class="menu2" onclick="location.href='<%=request.getContextPath()%>/views/admin/board/board.jsp'"><h3>게시판 관리</h3></td>
			<%} %>
			</tr>
			<tr>
			<%if(view == 8){ %>
				<td align="center" class="menu2" style="background: black; color:white;"><h3>프로모션</h3></td>
			<%}else{ %>
				<td align="center" class="menu2" onclick="location.href='<%=request.getContextPath()%>/views/admin/promotion/pro.jsp'"><h3>프로모션</h3></td>
			<%} %>
			</tr>
		</table>
	</div>
</body>
</html>












