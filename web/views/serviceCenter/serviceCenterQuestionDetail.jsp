<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.MasterPiece.board.model.vo.*, java.util.*"%>
<%
	Board b = (Board)request.getAttribute("b");
	Board answerBoard = (Board)request.getAttribute("answerBoard");
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
#detailTable
{
	border-spacing:0px;
	border-collapse: collapse;
}
#detailTable>tbody>tr>th, #detailTable>tbody>tr>td
{
	border:1px solid lightgray;
}
#detailTable>tbody>tr>th
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
#replyTable
{
	border-spacing:0px;
	border-collapse:collapse;
}
#replyTable>tr>td
{
	border:none;
}
.pointer
{
	cursor:pointer;
}
#replyListTable>tr>td
{
	font-size:14px;
}
#serviceMainImg:hover
{
	cursor:pointer;
}
#answerTable
{
	border-spacing:0px;
	border-collapse: collapse;
}
#answerTable>tbody>tr>th, #answerTable>tbody>tr>td
{
	border:1px solid lightgray;
}
#answerTable>tbody>tr>th
{
	text-align:left;
	padding-left:10px;
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
			<div class="inb" id="sideMenu" style="width: 200px;">
				<div class="sideMenu menu menuAtt" style="height: 30px;" onclick="location.href='<%= request.getContextPath() %>/selectQuestionList.sc'">
					<span style="float:left">1:1 문의</span><span style="float: right;">></span>
				</div>
				<div class="sideMenu menu menuAtt" style="height: 30px;" onclick="location.href='<%= request.getContextPath() %>/selectMoreList.sc'">
					<span style="float:left">자주 묻는 질문</span><span style="float: right;">></span>
				</div>
				<div class="sideMenu menu menuAtt" style="height: 30px;" onclick="location.href='/MasterPiece/views/serviceCenter/serviceCenterExchangeWrite.jsp'">
					<span style="float:left">교환, 반품, AS접수 신청</span><span style="float: right;">></span>
				</div>
				<div class="sideMenu menu menuAtt" style="height: 30px;" onclick="location.href='<%= request.getContextPath() %>/selectExchange.af'">
					<span style="float:left">교환, 반품, AS접수 조회</span><span style="float: right;">></span>
				</div>
				<div class="sideMenu menu menuAtt" style="height: 30px;" onclick="location.href='<%= request.getContextPath() %>/selectNoticeList.sc'">
					<span style="float:left">공지사항</span><span style="float: right;">></span>
				</div>
			</div>
		</div>
		<!-- 게시판 -->
		<div class="container-inner inner board">
			<div class="inb" id="board" style="width:700px;">
				<!-- 중앙 게시판 -->
				<div id="serviceMainImg" onclick="location.href='<%= request.getContextPath() %>/selectList.sc'">
					<img src="/MasterPiece/images/cus_intro_pic.jpg">
				</div>
				<br>
				<div>
					<label style="margin-left:5px; font-size:14px; font-weight:bold;">1:1 문의내역</label>
					<br><br>
					<div>
						<table id="detailTable" style="width:100%;">
							<tbody class="boardHead" style="font-size:14px;">
								<tr style="height:50px;">
									<th style="width:150px; border-right:none;">작성자</th>
									<td style="width:250px; border-left:none; border-right:none; font-weight:bold; padding-left:20px;"><%= b.getBOARD_WRITER() %></td>
									<td style="width:100px; border-left:none; border-right:none; font-weight:bold; text-align:right;">작성일자</td>
									<td style="width:150px; border-left:none; font-weight:bold; text-align:right; padding-right:30px;"><%= b.getBOARD_DATE() %></td>
								</tr>
								<tr>
									<th style="vertical-align:middle; height:50px;">문의유형</th>
									<td colspan="3"><span><%= b.getBOARD_CATEGORY() %></span></td>
								</tr>
								<tr>
									<th style="vertical-align:middle; height:50px;">제목</th>
									<!-- <td colspan="3" style="text-align:center"><input type="text" placeholder="제목을 입력하세요." name="title" style="width:500px; height:30px; border:1px solid #ccc; border-radius:4px;"/></td> -->
									<td colspan="3"><span><%= b.getBOARD_TITLE() %></span></td>
								</tr>
								<tr>
									<th style="vertical-align:middle;">내용</th>
									<td class="boardContent" colspan="3" style="height:300px; vertical-align:top;">
										<%
											b.setBOARD_CONTENT(b.getBOARD_CONTENT().replace("\n", "<br>"));
										%>
										<span><%= b.getBOARD_CONTENT() %></span>
										<%
											b.setBOARD_CONTENT(b.getBOARD_CONTENT().replace("<br>", "\n"));
										%>
									</td>
								</tr>
							</tbody>
						</table>
						<br>
					</div>
					<br><br>
					<%
						if(b.getQUE_STATUS().equals("Y"))
						{
					%>
					<div style="background:#D5D5D5; font-size:14px;">
						<table id="answerTable" style="width:100%;">
						<tbody class="boardHead" style="font-size:14px;">
							<tr>
								<th style="vertical-align:middle; width:100px;">답변</th>
								<td class="boardContent" colspan="3" style="vertical-align:middle;">
									<textarea readonly="readonly"style="resize: none; width: 90%;height: 200px"><%= answerBoard.getBOARD_CONTENT() %></textarea>
								</td>
							</tr>
						</tbody>
						</table>
					</div>
					<%
						}
					%>
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