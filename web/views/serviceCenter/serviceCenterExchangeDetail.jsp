<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.MasterPiece.serviceCenter.model.vo.*, java.util.*"%>
<%
	AfterService as = (AfterService)request.getAttribute("as");
	
	//System.out.println("aaa2 : " + as);
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
table
{
	border-spacing:0px;
	border-collapse:collapse;
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
				<div>
					<table style="width:700px; border:1px solid lightgray;">
						<thead style="background:#F5F5F5;">
							<tr>
								<th colspan="2" style="height:45px; padding-left:10px; font-size:small;">회원정보</th>
							</tr>
						</thead>
						<tbody>
							<tr style="border:1px solid lightgray;">
								<td style="border:1px solid lightgray; height:45px; text-align:left; padding-left:10px; width:70px; font-size:small;">이름</td>
								<td style="padding-left:10px; font-size:small;"><%= loginUser.getUserName() %></td>
							</tr>
							<tr style="border:1px solid lightgray">
								<td style="border:1px solid lightgray; height:45px; padding-left:10px; font-size:small;">연락처</td>
								<td style="padding-left:10px; font-size:small;"><%= loginUser.getPhone() %></td>
							</tr>
							<tr style="border:1px solid lightgray">
								<td style="border:1px solid lightgray; height:45px; padding-left:10px; font-size:small;">이메일</td>
								<td style="padding-left:10px; font-size:small;"><%= loginUser.getEmail() %></td>
							</tr>
						</tbody>
					</table>
				</div>
				<br>
				<div>
					<table style="width:700px; border:1px solid lightgray;">
						<thead style="background:#F5F5F5;">
							<tr>
								<th colspan="2" style="height:45px; padding-left:10px; font-size:small;">상품</th>
							</tr>
						</thead>
						<tbody>
							<tr style="border:1px solid lightgray;">
								<td colspan="2" style="border:1px solid lightgray; text-align:left; padding-left:10px; font-size:small;">
									<div id="productListArea">
										<span><%= as.getPrdCode() %></span>
									</div>
								</td>
							</tr>
							<tr>
								<td style="border:1px solid lightgray; width:100px; height:45px; font-size:small; padding-left:10px;">신청 사유</td>
								<td>
									<span style="font-size:small;"><%= as.getReason() %></span>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<br>
				<div>
					<table style="width:700px; border:1px solid lightgray;">
						<thead style="background:#F5F5F5;">
							<tr>
								<th colspan="2" style="height:45px; padding-left:10px; font-size:small;">내용</th>
							</tr>
						</thead>
						<tbody>
							<tr style="border:1px solid lightgray;">
								<td colspan="2" style="border:1px solid lightgray; height:100px; text-align:left; padding-left:10px; font-size:small;">
									<%
										as.setBoardContent(as.getBoardContent().replace("\n", "<br>"));
									%>
									<span style="width:98%; height:100px; resize:none;"><%= as.getBoardContent() %></span>
									<%
										as.setBoardContent(as.getBoardContent().replace("<br>", "\n"));
									%>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<br>
				<div>
					<table style="width:700px; border:1px solid lightgray;">
						<thead style="background:#F5F5F5;">
							<tr>
								<th colspan="2" style="height:45px; padding-left:10px; font-size:small;">접수 방법</th>
							</tr>
						</thead>
						<tbody>
							<tr style="border:1px solid lightgray;">
								<td style="border:1px solid lightgray; width:100px; height:50px; text-align:left; padding-left:10px; font-size:small;">
									선택
								</td>
								<td style="padding-left:10px;">
									<span style="font-size:small;"><%= as.getHowToRegister() %></span>
								</td>
							</tr>
							<tr>
								<td style="border:1px solid lightgray; width:100px; height:50px; text-align:left; padding-left:10px; font-size:small;">
									반송정보
								</td>
								<td style="padding-left:10px;">
									<span style="font-size:small;"><%= as.getTrackingNumber() %></span>
									<%-- <%
										System.out.println("ㅋㅋ : " + as.getTrackingNumber());
									%> --%>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<br>
				<div>
					<table style="width:700px; border:1px solid lightgray;">
						<thead style="background:#F5F5F5;">
							<tr>
								<th colspan="2" style="height:45px; padding-left:10px; font-size:small;">환불 계좌정보</th>
							</tr>
						</thead>
						<tbody>
							<tr style="border:1px solid lightgray;">
								<td style="border:1px solid lightgray; width:100px; height:50px; text-align:left; padding-left:10px; font-size:small;">
									은행명
								</td>
								<td style="padding-left:10px; font-size:small;">
									<span><%= as.getBank() %></span>
								</td>
							</tr>
							<tr>
								<td style="border:1px solid lightgray; width:100px; height:50px; text-align:left; padding-left:10px; font-size:small;">
									계좌번호
								</td>
								<td style="padding-left:10px; font-size:small">
									<span><%= as.getBankNum() %></span>
								</td>
							</tr>
							<tr>
								<td style="border:1px solid lightgray; width:100px; height:50px; text-align:left; padding-left:10px; font-size:small;">
									예금주명
								</td>
								<td style="padding-left:10px; font-size:small;">
									<span><%= as.getBankUserName() %></span>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<br>
			</div>
		</div>
	</div>
	<br><br><br>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>