<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.MasterPiece.board.model.vo.*, java.util.*"%>
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
    /*서브(리스트)_페이지넘버*/
    .list_number{padding-top:25px; text-align:center;}
    .list_n_menu {padding:3px; MARGIN:3px; TEXT-ALIGN: center}
	.list_n_menu A {padding: 1px 4px 0px 4px;MARGIN: 2px;/* BORDER: #ccc 1px solid; */COLOR: #999;TEXT-DECORATION: none;}
    .list_n_menu A:hover {BORDER:#999 1px solid; COLOR: #666;}
    .list_n_menu A:active {BORDER:#999 1px solid; COLOR: #666;}
	.list_n_menu .current {BORDER: #117bff 1px solid;padding: 1px 4px 0px 4px;FONT-WEIGHT: bold;MARGIN: 2px;COLOR: #036cb4;}
    .list_n_menu .disabled {BORDER: #eee 1px solid;padding: 1px 4px 0px 4px;MARGIN: 2px;COLOR: #ddd;}
    
.container-inner /* .inb 에 대한 인라인 블록 지정 */ {
	/* width:90%; */
	display: inline-block;
	float:left;
}

.container {
	overflow:hidden;
	width:1080px;
}
.sideBlank{width:120px;}
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
.menuAtt-inner
{
	padding-left: 10px;
}
.menuAtt-inner:hover
{
	cursor:pointer;
}
.boardTable
{
	font-size:small;
	width:700px;
	border-spacing:0px;
}
.boardTable th, td
{
	text-align:center;
	border-bottom:1px solid #D7D7D7;
	height:30px;
}
.boardTable>tbody>tr:hover
{
	background:lightgray;
	cursor:pointer;
}
.FAQBoard-Btn
{
	width:118px;
	height:40px;
	float:left;
	margin-left:-1px;
	border:1px solid lightgray;
}
.FAQBoard>div
{
	font-size:small;
	text-align:center;
	padding-top:11px;
}
.FAQBoard-Btn:hover
{
	cursor:pointer;
	background:royalblue;
	color:white;
}
.boardTable>tbody>tr:last-child
{
	border-bottom:2px solid darkgray;
}
.FAQBoard-Btn-trueContent:hover
{
	cursor:pointer;
}
#serviceMainImg:hover
{
	cursor:pointer;
}
</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	
	<!-- 전체 틀 -->
	<div class="container" style="margin:auto;">
		<!-- 사이드 메뉴 -->
		<div class="container-inner inner sideMenu">
			<div class="inb" id="sideMenu" style="width: 200px;">
				<div class="sideMenu menu menuAtt" style="height: 30px;" onclick="location.href='serviceCenterQuestionList.jsp'">
					<span style="float:left">1:1 문의</span><span style="float: right;">></span>
				</div>
				<div class="sideMenu menu menuAtt" style="height: 30px;" onclick="location.href='serviceCenterMoreBoard.jsp'">
					<span style="float:left">자주 묻는 질문</span><span style="float: right;">></span>
				</div>
				<div class="sideMenu menu menuAtt" style="height: 30px;" onclick="location.href='serviceCenterExchangeWrite.jsp'">
					<span style="float:left">교환, 반품, AS접수 신청</span><span style="float: right;">></span>
				</div>
				<div class="sideMenu menu menuAtt" style="height: 30px;" onclick="location.href='serviceCenterExchangeList.jsp'">
					<span style="float:left">교환, 반품, AS접수 조회</span><span style="float: right;">></span>
				</div>
				<div class="sideMenu menu menuAtt" style="height: 30px;">
					<span style="float:left">운송료 조회</span><span style="float: right;">></span>
				</div>
				<div class="sideMenu menu menuAtt" style="height: 30px;" onclick="location.href='serviceCenterNotice.jsp'">
					<span style="float:left">공지사항</span><span style="float: right;">></span>
				</div>
			</div>
		</div>
		<!-- 게시판 -->
		<div class="container-inner inner board">
			<div class="inb" id="board" style="width:700px;">
				<!-- 중앙 게시판 -->
				<div id="serviceMainImg" onclick="location.href='serviceCenter.jsp'">
					<img src="/MasterPiece/images/cus_intro_pic.jpg">
				</div>
				<br>
				<div>
					<label style="float:left; font-size:14px; font-weight:bold;">공지사항</label>
				</div>
				<br clear="both">
				<div id="order">
					<table class="boardTable" style="margin-top:10px;">
						<thead style="border-top:2px solid darkgray; background:#DFDFDF;">
							<tr>
								<th style="width:50px;">번호</th>
								<th style="width:100px;">분류</th>
								<th style="width:400px;">제목</th>
								<th style="width:100px;">작성일</th>
							</tr>
						</thead>
						<tbody>
							<%
								for(Board b : list)
								{
									if(b.getBOARD_CATEGORY().equals("공지사항"))
									{
							%>
							<tr>
								<td><%= b.getBOARD_NO() %></td>
								<td><%= b.getBOARD_CATEGORY() %></td>
								<td><%= b.getBOARD_TITLE() %></td>
								<td><%= b.getBOARD_DATE() %></td>
							</tr>
							<%
									}
								}
							%>
						</tbody>
					</table>
					<br><br clear="both">
				</div>
				<!-- 페이징 -->
				<!-- <div>
					<div>
						<div class="list_n_menu" style="font-size:14px;">
							<span class="disabled"><  이전</span>
							<span class="current">1</span>
							<a href="#?page=2">2</a>
							<a href="#?page=3">3</a>
							<a href="#?page=4">4</a>
							<a href="#?page=5">5</a>
							<a href="#?page=6">6</a>
							<a href="#?page=7">7</a>...
							<a href="#?page=2">다음  ></a>
						</div>
				    </div>
				</div> -->
			</div>
		</div>
	</div>
	<br><br><br>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>