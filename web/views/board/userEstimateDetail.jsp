<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.MasterPiece.board.model.vo.*, java.util.*"%>
<%
	Board b = (Board)request.getAttribute("b");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.container-inner /* .inb 에 대한 인라인 블록 지정 */ {
	/* width:90%; */
	display: inline-block;
	float:left;
}

.container {
	overflow:hidden;
	width:1080px;
}
.sideMenu{width:210px;}
.board{width:600px;}

.menu {
	width: 178px;
    background: #F5F5F5;
    border: 1px solid lightgray;
    font-weight: bold;
    font-size:0.9em;
    padding-top: 8px;
    padding-right: 10px;
}
.menuAtt {
	padding-left: 10px;
}
.menuAtt:hover
{
	background:darkgray;
	color:white;
	cursor:pointer;
}
.boardHead th
{
	width:65px;
}
table
{
	border-spacing:0px;
	border-collapse: collapse;
}
table th, td
{
	border:1px solid lightgray;
}
table th
{
	text-align:left;
	padding-left:10px;
}
.btn:hover
{
	cursor:pointer;
}
.img
{
	width:70%;
	height:80%;
}
</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	<%
		if(loginUser != null)
		{
	%>
	
	<!-- 전체 틀 -->
	<div class="container" style="margin:auto;">
		<!-- 사이드 메뉴 -->
		<div class="container-inner inner sideMenu">
			<div class="inb" id="sideMenu" style="width: 200px; height:80px;">
				<div class="sideMenu menu menuAtt" style="height: 30px;" onclick="location.href='<%= request.getContextPath() %>/selectList.qc'">
					<span style="float:left">견적 요청</span><span style="float: right;">></span>
				</div>
				<div class="sideMenu menu menuAtt" style="height: 30px;" onclick="location.href='userEstimate.jsp'">
					<span style="float:left">유저 견적 게시판</span><span style="float: right;">></span>
				</div>
			</div>
		</div>
		<!-- 게시판 -->
		<div class="container-inner inner board" style="margin-top:-8px;">
			<div class="inb" id="board" style="width:600px; margin-left:40px;">
				<!-- 중앙 게시판 -->
				<div>
					<div>
					<hr style="border-color:#f43641;">
					<span style="padding-left:10px; font-weight:bold; font-size:large; float:left; width:290px; margin-top:-5px;">견적 요청</span>
					<br clear="both">
					<hr style="margin-top:3px; border-color:#f43641;">
						<table style="width:100%;">
							<tbody class="boardHead" style="font-size:14px;">
								<tr style="height:50px;">
									<th style="width:150px; border-right:none;">작성자</th>
									<td style="width:250px; border-left:none; border-right:none; font-weight:bold; padding-left:20px;"><%= loginUser.getUserId() %></td>
									<td style="width:100px; border-left:none; border-right:none; font-weight:bold; text-align:right;">작성일자</td>
									<td style="width:150px; border-left:none; font-weight:bold; text-align:right; padding-right:30px;"><%= b.getBOARD_DATE() %></td>
								</tr>
								<tr>
									<th style="vertical-align:middle; height:50px;">제목</th>
									<!-- <td colspan="3" style="text-align:center"><input type="text" placeholder="제목을 입력하세요." name="title" style="width:500px; height:30px; border:1px solid #ccc; border-radius:4px;"/></td> -->
									<td colspan="3"><span style="margin-left:20px;"/><%= b.getBOARD_TITLE() %></span></td>
								</tr>
								<tr>
									<th style="vertical-align:middle;">내용</th>
									<td class="boardContent" colspan="3" style="height:300px; vertical-align:top;">
										<span style="margin-left:20px;"><%= b.getBOARD_CONTENT() %></span>
									</td>
								</tr>
							</tbody>
						</table>
						<br>
						<div>
							<button type="submit" class="btn" style="background:dodgerblue; color:white; border:1px solid white; border-radius:5px; width:50px; height:28px; padding:2px 4px; float:right; margin-right:5px;" onclick="location.href='<%= request.getContextPath() %>/selectOne.ue?num=<%= b.getBOARD_NO()+1 %>'">다음</button>
						</div>
						<div>
							<button type="button" class="btn" style="background:forestgreen; color:white; border:1px solid white; border-radius:5px; width:50px; height:28px; padding:2px 4px; float:left; margin-left:5px;" onclick="location.href='<%= request.getContextPath() %>/selectOne.ue?num=<%= b.getBOARD_NO()-1 %>'">이전</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br clear="both">
	</div>
	<br><br><br>
	<%@ include file="../common/footer.jsp" %>
	<%
		}
		else
		{
			request.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
			request.getRequestDispatcher("../common/errorPage.jsp").forward(request, response);
		}
	%>
</body>
</html>