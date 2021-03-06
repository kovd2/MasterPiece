<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.MasterPiece.board.model.vo.*, java.util.*"%>
<%
	ArrayList<Board> list1 = (ArrayList<Board>)request.getAttribute("list1");
	ArrayList<Board> list2 = (ArrayList<Board>)request.getAttribute("list2");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
    /*서브(리스트)_페이지넘버*/
    .list1_number{padding-top:25px; text-align:center;}
    .list1_n_menu {padding:3px; MARGIN:3px; TEXT-ALIGN: center}
	.list1_n_menu A {padding: 1px 4px 0px 4px;MARGIN: 2px;/* BORDER: #ccc 1px solid; */COLOR: #999;TEXT-DECORATION: none;}
    .list1_n_menu A:hover {BORDER:#999 1px solid; COLOR: #666;}
    .list1_n_menu A:active {BORDER:#999 1px solid; COLOR: #666;}
	.list1_n_menu .current {BORDER: #117bff 1px solid;padding: 1px 4px 0px 4px;FONT-WEIGHT: bold;MARGIN: 2px;COLOR: #036cb4;}
    .list1_n_menu .disabled {BORDER: #eee 1px solid;padding: 1px 4px 0px 4px;MARGIN: 2px;COLOR: #ddd;}
    
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
	width:115px;
	height:30px;
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
.boardTable>tbody>tr:last-child
{
	border-bottom:2px solid darkgray;
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
#order-btn:hover
{
	cursor:pointer;
	background:royalblue;
	color:white;
}
#serviceMainImg:hover
{
	cursor:pointer;
}
#oneOnOne-btn:hover
{
	cursor:pointer;
}
.boardTableNotice
{
	font-size:small;
	width:700px;
	border-spacing:0px;
}
.boardTableNotice th, td
{
	text-align:center;
	border-bottom:1px solid #D7D7D7;
	height:30px;
}
.boardTableNotice>tbody>tr:hover
{
	background:lightgray;
	cursor:pointer;
}
.boardTableNotice>tbody>tr:last-child
{
	border-bottom:2px solid darkgray;
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
				<br clear="both">
				<label style="float:left; font-size:14px; font-weight:bold;">자주 묻는 질문</label>
				<label class="moreBoard" style="float:right; font-size:14px;" onclick="location.href='<%= request.getContextPath() %>/selectMoreList.sc'">더보기 ▶</label>
				<br clear="both">
				<div class="FAQBoard" style="width:700px; margin-top:10px;">
					<div id="order-btn" style="width:115px; height:30px; float:left; border:1px solid lightgray;">주문결제
					</div>
					<div id="delivery-btn" class="FAQBoard-Btn">배송
					</div>
					<div id="afterService-btn" class="FAQBoard-Btn">환불.반품.교환.AS
					</div>
					<div id="point-btn" class="FAQBoard-Btn">적립금.포인트
					</div>
					<div id="aboutProduct-btn" class="FAQBoard-Btn">상품
					</div>
					<div id="etc-btn" class="FAQBoard-Btn">기타
					</div>
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
								for(Board b : list1)
								{
									if(b.getBOARD_CATEGORY().equals("주문결제"))
									{
							%>
							<tr>
								<input type="hidden" value="<%= b.getBOARD_NO() %>">
								<td><%= b.getBOARD_NO() %></td>
								<td><%= b.getBOARD_CATEGORY() %></td>
								<td><%= b.getBOARD_TITLE() %></td>
								<td><%= b.getBOARD_DATE() %></td>
								<th style="display:none;"><input type="hidden" value="<%= b.getBOARD_ID() %>"></th>
							</tr>
							<%
									}
								}
							%>
						</tbody>
					</table>
					<br><br clear="both">
				</div>
				<div id="delivery" style="display:none;">
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
								for(Board b : list1)
								{
									if(b.getBOARD_CATEGORY().equals("배송"))
									{
							%>
							<tr>
								<input type="hidden" value="<%= b.getBOARD_NO() %>">
								<td><%= b.getBOARD_NO() %></td>
								<td><%= b.getBOARD_CATEGORY() %></td>
								<td><%= b.getBOARD_TITLE() %></td>
								<td><%= b.getBOARD_DATE() %></td>
								<th style="display:none;"><input type="hidden" value="<%= b.getBOARD_ID() %>"></th>
							</tr>
							<%
									}
								}
							%>
						</tbody>
					</table>
					<br><br clear="both">
				</div>
				<div id="afterService" style="display:none;">
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
								for(Board b : list1)
								{
									if(b.getBOARD_CATEGORY().equals("환불.반품.교환.AS"))
									{
							%>
							<tr>
								<input type="hidden" value="<%= b.getBOARD_NO() %>">
								<td><%= b.getBOARD_NO() %></td>
								<td><%= b.getBOARD_CATEGORY() %></td>
								<td><%= b.getBOARD_TITLE() %></td>
								<td><%= b.getBOARD_DATE() %></td>
								<th style="display:none;"><input type="hidden" value="<%= b.getBOARD_ID() %>"></th>
							</tr>
							<%
									}
								}
							%>
						</tbody>
					</table>
					<br><br clear="both">
				</div>
				<div id="point" style="display:none;">
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
								for(Board b : list1)
								{
									if(b.getBOARD_CATEGORY().equals("적립금.포인트"))
									{
							%>
							<tr>
								<input type="hidden" value="<%= b.getBOARD_NO() %>">
								<td><%= b.getBOARD_NO() %></td>
								<td><%= b.getBOARD_CATEGORY() %></td>
								<td><%= b.getBOARD_TITLE() %></td>
								<td><%= b.getBOARD_DATE() %></td>
								<th style="display:none;"><input type="hidden" value="<%= b.getBOARD_ID() %>"></th>
							</tr>
							<%
									}
								}
							%>
						</tbody>
					</table>
					<br><br clear="both">
				</div>
				<div id="aboutProduct" style="display:none;">
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
								for(Board b : list1)
								{
									if(b.getBOARD_CATEGORY().equals("상품"))
									{
							%>
							<tr>
								<input type="hidden" value="<%= b.getBOARD_NO() %>">
								<td><%= b.getBOARD_NO() %></td>
								<td><%= b.getBOARD_CATEGORY() %></td>
								<td><%= b.getBOARD_TITLE() %></td>
								<td><%= b.getBOARD_DATE() %></td>
								<th style="display:none;"><input type="hidden" value="<%= b.getBOARD_ID() %>"></th>
							</tr>
							<%
									}
								}
							%>
						</tbody>
					</table>
					<br><br clear="both">
				</div>
				<div id="etc" style="display:none;">
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
								for(Board b : list1)
								{
									if(b.getBOARD_CATEGORY().equals("기타"))
									{
							%>
							<tr>
								<input type="hidden" value="<%= b.getBOARD_NO() %>">
								<td><%= b.getBOARD_NO() %></td>
								<td><%= b.getBOARD_CATEGORY() %></td>
								<td><%= b.getBOARD_TITLE() %></td>
								<td><%= b.getBOARD_DATE() %></td>
								<th style="display:none;"><input type="hidden" value="<%= b.getBOARD_ID() %>"></th>
							</tr>
							<%
									}
								}
							%>
						</tbody>
					</table>
					<br><br clear="both">
				</div>
				<script>
					/* 자주묻는 질문 버튼 클릭시 해당 메뉴 불러오기 */
					$("#order-btn").css({"background":"royalblue", "color":"white"});
					
					$("#order-btn").click(function()
					{
						$("#order-btn").css({"background":"royalblue", "color":"white"});
						$("#delivery-btn").css({"background":"white", "color":"black"});
						$("#afterService-btn").css({"background":"white", "color":"black"});
						$("#point-btn").css({"background":"white", "color":"black"});
						$("#aboutProduct-btn").css({"background":"white", "color":"black"});
						$("#etc-btn").css({"background":"white", "color":"black"});
						
						$("#order").css("display","block");
						$("#delivery").css("display", "none");
						$("#afterService").css("display", "none");
						$("#point").css("display", "none");
						$("#aboutProduct").css("display", "none");
						$("#etc").css("display", "none");
					});

					$("#delivery-btn").click(function()
					{
						$("#order-btn").css({"background":"white", "color":"black"});
						$("#delivery-btn").css({"background":"royalblue", "color":"white"});
						$("#afterService-btn").css({"background":"white", "color":"black"});
						$("#point-btn").css({"background":"white", "color":"black"});
						$("#aboutProduct-btn").css({"background":"white", "color":"black"});
						$("#etc-btn").css({"background":"white", "color":"black"});

						$("#order").css("display", "none");
						$("#delivery").css("display", "block");
						$("#afterService").css("display", "none");
						$("#point").css("display", "none");
						$("#aboutProduct").css("display", "none");
						$("#etc").css("display", "none");
					});

					$("#afterService-btn").click(function()
					{
						$("#order-btn").css({"background":"white", "color":"black"});
						$("#delivery-btn").css({"background":"white", "color":"black"});
						$("#afterService-btn").css({"background":"royalblue", "color":"white"});
						$("#point-btn").css({"background":"white", "color":"black"});
						$("#aboutProduct-btn").css({"background":"white", "color":"black"});
						$("#etc-btn").css({"background":"white", "color":"black"});
						
						$("#order").css("display", "none");
						$("#delivery").css("display", "none");
						$("#afterService").css("display", "block");
						$("#point").css("display", "none");
						$("#aboutProduct").css("display", "none");
						$("#etc").css("display", "none");
					});

					$("#point-btn").click(function()
					{
						$("#order-btn").css({"background":"white", "color":"black"});
						$("#delivery-btn").css({"background":"white", "color":"black"});
						$("#afterService-btn").css({"background":"white", "color":"black"});
						$("#point-btn").css({"background":"royalblue", "color":"white"});
						$("#aboutProduct-btn").css({"background":"white", "color":"black"});
						$("#etc-btn").css({"background":"white", "color":"black"});
						
						$("#order").css("display", "none");
						$("#delivery").css("display", "none");
						$("#afterService").css("display", "none");
						$("#point").css("display", "block");
						$("#aboutProduct").css("display", "none");
						$("#etc").css("display", "none");
					});

					$("#aboutProduct-btn").click(function()
					{
						$("#order-btn").css({"background":"white", "color":"black"});
						$("#delivery-btn").css({"background":"white", "color":"black"});
						$("#afterService-btn").css({"background":"white", "color":"black"});
						$("#point-btn").css({"background":"white", "color":"black"});
						$("#aboutProduct-btn").css({"background":"royalblue", "color":"white"});
						$("#etc-btn").css({"background":"white", "color":"black"});
						
						$("#order").css("display", "none");
						$("#delivery").css("display", "none");
						$("#afterService").css("display", "none");
						$("#point").css("display", "none");
						$("#aboutProduct").css("display", "block");
						$("#etc").css("display", "none");
					});

					$("#etc-btn").click(function()
					{
						$("#order-btn").css({"background":"white", "color":"black"});
						$("#delivery-btn").css({"background":"white", "color":"black"});
						$("#afterService-btn").css({"background":"white", "color":"black"});
						$("#point-btn").css({"background":"white", "color":"black"});
						$("#aboutProduct-btn").css({"background":"white", "color":"black"});
						$("#etc-btn").css({"background":"royalblue", "color":"white"});
						
						$("#order").css("display", "none");
						$("#delivery").css("display", "none");
						$("#afterService").css("display", "none");
						$("#point").css("display", "none");
						$("#aboutProduct").css("display", "none");
						$("#etc").css("display", "block");			
					});
				</script>
				<label style="float:left; font-size:14px; font-weight:bold;">공지사항</label>
				<label class="moreBoard Notice" style="float:right; font-size:14px;" onclick="location.href='<%= request.getContextPath() %>/selectNoticeList.sc'">더보기 ▶</label>
				<br clear="both">
				<table class="boardTableNotice" style="margin-top:10px;">
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
								for(Board b : list2)
								{
									if(b.getBOARD_CATEGORY().equals("공지사항"))
									{
							%>
							<tr>
								<input type="hidden" value="<%= b.getBOARD_NO() %>">
								<td><%= b.getBOARD_NO() %></td>
								<td><%= b.getBOARD_CATEGORY() %></td>
								<td><%= b.getBOARD_TITLE() %></td>
								<td><%= b.getBOARD_DATE() %></td>
								<th style="display:none;"><input type="hidden" value="<%= b.getBOARD_ID() %>"></th>
							</tr>
							<%
									}
								}
							%>
						</tbody>
				</table>
			</div>
		</div>
	</div>
	<br><br><br>
	<%@ include file="../common/footer.jsp" %>
	
	<script>
		$(function()
		{
			$(".boardTable td").click(function()
			{
				var boardNo = $(this).parent().children("input").val();
				var boardId = $(this).parent().children().children("input").val();
				
				console.log("boardNo : " + boardNo);
				console.log("boardId : " + boardId);
				
				location.href="<%= request.getContextPath() %>/selectOneMoreBoard.sc?boardNo=" + boardNo + "&boardId=" + boardId;
			});
		});
		
		$(function()
		{
			$(".boardTableNotice td").click(function()
			{
				var boardNo = $(this).parent().children("input").val();
				var boardId = $(this).parent().children().children("input").val();
				
				console.log("boardNo : " + boardNo);
				console.log("boardId : " + boardId);
				
				location.href="<%= request.getContextPath() %>/selectOneNotice.sc?boardNo=" + boardNo + "&boardId=" + boardId;
			});
		});
	</script>
</body>
</html>