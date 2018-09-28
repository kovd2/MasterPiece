<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.MasterPiece.serviceCenter.model.vo.*, java.util.*, java.util.Date, java.text.SimpleDateFormat"%>
<%
	ArrayList<AfterService> list = (ArrayList<AfterService>)request.getAttribute("list");

	Date writeDate = new Date();

	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	String today = dateFormat.format(writeDate);
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
.boardTable>tbody>tr:last-child
{
	border-bottom:2px solid darkgray;
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
.FAQBoard-Btn-trueContent:hover
{
	cursor:pointer;
}
.moreBoard:hover
{
	cursor:pointer;
}
#serviceMainImg:hover
{
	cursor:pointer;
}
.pointer:hover
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
				<div style="width:700px; height:100px; border:1px solid darkgray; background:#F5F5F5;">
					<div style="display:inline-block; width:80px; height:30px; margin-left:10px; margin-top:20px;">
						<div style="font-size:small; text-align:center; font-weight:bold;">조회기간</div>
					</div>
					<!-- <div class="timebtn1" style="display:inline-block; width:65px; height:30px; background:royalblue; color:white; border:1px solid darkgray; font-size:small; text-align:center; margin-top:10px;">
						<div style="font-size:small; text-align:center; font-weight:bold; margin-top:6px;">1주일</div>
					</div>
					<div class="timebtn2" style="display:inline-block; width:65px; height:30px; background:white; border:1px solid darkgray; font-size:small; text-align:center; margin-top:10px; margin-left:-7px;">
						<div style="font-size:small; text-align:center; font-weight:bold; margin-top:6px;">1개월</div>
					</div>
					<div class="timebtn3" style="display:inline-block; width:65px; height:30px; background:white; border:1px solid darkgray; font-size:small; text-align:center; margin-top:10px; margin-left:-6px;">
						<div style="font-size:small; text-align:center; font-weight:bold; margin-top:6px;">3개월</div>
					</div>
					<div class="timebtn4" style="display:inline-block; width:65px; height:30px; background:white; border:1px solid darkgray; font-size:small; text-align:center; margin-top:10px; margin-left:-7px;">
						<div style="font-size:small; text-align:center; font-weight:bold; margin-top:6px;">6개월</div>
					</div>
					<div class="timebtn5" style="display:inline-block; width:65px; height:30px; background:white; border:1px solid darkgray; font-size:small; text-align:center; margin-top:10px; margin-left:-7px;">
						<div style="font-size:small; text-align:center; font-weight:bold; margin-top:6px;">1년</div> -->
					<input type="button" class="timebtn1 pointer" id="one-weeks" name="one-weeks" value="1주일" style="font-size:small; font-weight:bold; display:inline-block; width:65px; height:30px; background:white; border:1px solid darkgray; font-size:small; text-align:center; margin-top:10px;">
					<input type="button" class="timebtn2 pointer" id="one-months" name="one-months" value="1개월" style="font-size:small; font-weight:bold; display:inline-block; width:65px; height:30px; background:white; border:1px solid darkgray; font-size:small; text-align:center; margin-top:10px; margin-left:-7px;">
					<input type="button" class="timebtn3 pointer" id="three-months" name="three-months" value="3개월" style="font-size:small; font-weight:bold; display:inline-block; width:65px; height:30px; background:white; border:1px solid darkgray; font-size:small; text-align:center; margin-top:10px; margin-left:-6px;">
					<input type="button" class="timebtn4 pointer" id="six-months" name="six-months" value="6개월" style="font-size:small; font-weight:bold; display:inline-block; width:65px; height:30px; background:white; border:1px solid darkgray; font-size:small; text-align:center; margin-top:10px; margin-left:-7px;">
					<input type="button" class="timebtn5 pointer" id="one-years" name="one-years" value="1년" style="font-size:small; font-weight:bold; display:inline-block; width:65px; height:30px; background:white; border:1px solid darkgray; font-size:small; text-align:center; margin-top:10px; margin-left:-7px;">
					<br>
					<div style="display:inline-block; padding-top:10px; padding-left:23px;">
						<div style="font-size:small; font-weight:bold;">상품검색</div>
					</div>
					<div style="display:inline-block; padding-left:15px;">
					<form action="search.af" method="post">
						<select style="font-size:small; height:25px;" name="searchCondition">
							<option value="title">상품명</option>
						</select>
						<input type="text" name="searchValue" id="searchValue" size="40" style="height:19px;">
						<input type="submit" value="조회" style="margin-left:10px;">
					</form>
					</div>
				</div>
				<br clear="both">
				<div>
					<label style="margin-left:5px; font-size:14px; font-weight:bold;">교환, 반품, AS접수 조회</label>
					<br>
					<div>
						<table class="boardTable" style="margin-top:10px;">
							<thead style="border-top:2px solid darkgray; border-left:2px solid darkgray; border-right:2px solid darkgray; background:#DFDFDF;">
								<tr>
									<th>접수번호</th>
									<th>상품정보</th>
									<th>분류</th>
									<th>처리현황</th>
									<th>배송방법</th>
								</tr>
							</thead>
							<tbody style="border-left:2px solid darkgray; border-right:2px solid darkgray; background:white;">
								<%
									for(AfterService as : list)
									{
								%>
								<tr>
								<input type="hidden" value=<%= as.getServiceNo() %>>
									<td style="width:80px;"><%= as.getServiceNo() %></td>
									<td><%= as.getPrdCode() %></td>
									<td style="width:60px;"><%= as.getReason() %></td>
									<%
										if(as.getBoardStatus().equals("N"))
										{
											as.setBoardStatus("처리중");
									%>
									<td style="width:80px;"><%= as.getBoardStatus() %></td>
									<%
										}
										else if(as.getBoardStatus().equals("Y"))
										{
											as.setBoardStatus("처리완료");
									%>
									<td style="width:80px;"><%= as.getBoardStatus() %></td>
									<%
										}
									%>
									<td style="width:120px;"><%= as.getHowToRegister() %></td>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>
					</div>
				</div>
				<br clear="both">
				<div>
					<button type="button" class="btn btn-danger pointer" style="padding:2px 4px; height:28px; color:white; background:#d9534f; float:right; border:1px solid white; border-radius:5px;" onclick="location.href='/MasterPiece/views/serviceCenter/serviceCenterExchangeWrite.jsp'">신청하기</button>
				</div>
			</div>
		</div>
	</div>
	<br><br><br>
	<%@ include file="../common/footer.jsp" %>
	
	<script>
		$(function()
		{	
			/* ================================================================== */
			
			$(".boardTable td").click(function()
			{
				var serviceNo = $(this).parent().children("input").val();
				var userId = "<%= loginUser.getUserId() %>";
				
				/* alert("serviceNo : " + serviceNo); */
				
				location.href="<%= request.getContextPath() %>/selectOneExchange.af?serviceNo=" + serviceNo + "&userId=" + userId;
			});
			
			/* ================================================================================ */
			var betweenTime = 0;
			
			$("#one-weeks").click(function()
			{
				betweenTime = 7;
				console.log(betweenTime);
				
				location.href="<%= request.getContextPath() %>/selectExchangeBT.af?betweenTime=" + betweenTime;
			});
			
			$("#one-months").click(function()
			{
				betweenTime = 30;
				console.log(betweenTime);
				
				location.href="<%= request.getContextPath() %>/selectExchangeBT.af?betweenTime=" + betweenTime;
			});

			$("#three-months").click(function()
			{
				betweenTime = 90;
				console.log(betweenTime);
				
				location.href="<%= request.getContextPath() %>/selectExchangeBT.af?betweenTime=" + betweenTime;
			});
				
			$("#six-months").click(function()
			{
				betweenTime = 180;
				console.log(betweenTime);
				
				location.href="<%= request.getContextPath() %>/selectExchangeBT.af?betweenTime=" + betweenTime;
			});
					
			$("#one-years").click(function()
			{
				betweenTime = 365;
				console.log(betweenTime);
				
				location.href="<%= request.getContextPath() %>/selectExchangeBT.af?betweenTime=" + betweenTime;
			});
		});
	</script>
</body>
</html>