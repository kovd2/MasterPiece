<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	
	<!-- 전체 틀 -->
	<div class="container">
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
				<div style="width:700px; height:100px; border:1px solid darkgray; background:#F5F5F5;">
					<div style="display:inline-block; width:80px; height:30px; margin-left:10px; margin-top:20px;">
						<div style="font-size:small; text-align:center; font-weight:bold;">조회기간</div>
					</div>
					<div style="display:inline-block; width:65px; height:30px; background:white; border:1px solid darkgray; font-size:small; text-align:center; margin-top:10px;">
						<div style="font-size:small; text-align:center; font-weight:bold; margin-top:6px;">1주일</div>
					</div>
					<div style="display:inline-block; width:65px; height:30px; background:white; border:1px solid darkgray; font-size:small; text-align:center; margin-top:10px; margin-left:-5px;">
						<div style="font-size:small; text-align:center; font-weight:bold; margin-top:6px;">1개월</div>
					</div>
					<div style="display:inline-block; width:65px; height:30px; background:white; border:1px solid darkgray; font-size:small; text-align:center; margin-top:10px; margin-left:-5px;">
						<div style="font-size:small; text-align:center; font-weight:bold; margin-top:6px;">3개월</div>
					</div>
					<div style="display:inline-block; width:65px; height:30px; background:white; border:1px solid darkgray; font-size:small; text-align:center; margin-top:10px; margin-left:-5px;">
						<div style="font-size:small; text-align:center; font-weight:bold; margin-top:6px;">6개월</div>
					</div>
					<div style="display:inline-block; width:65px; height:30px; background:white; border:1px solid darkgray; font-size:small; text-align:center; margin-top:10px; margin-left:-5px;">
						<div style="font-size:small; text-align:center; font-weight:bold; margin-top:6px;">1년</div>
					</div>
					<br>
					<div style="display:inline-block; padding-top:10px; padding-left:23px;">
						<div style="font-size:small; font-weight:bold;">상품검색</div>
					</div>
					<div style="display:inline-block; padding-left:15px;">
					<form action="" method="post">
						<select style="font-size:small; height:25px;">
							<option>상품명</option>
							<option>상품번호</option>
						</select>
						<input type="text" name="" id="" size="40">
						<input type="submit" value="조회" style="margin-left:10px;">
					</form>
					</div>
				</div>
				<br clear="both">
				<div>
					<label style="margin-left:5px;">교환, 반품, AS접수 조회</label>
					<br>
					<div>
						<table class="boardTable" style="margin-top:10px;">
							<thead style="border-top:2px solid darkgray; border-left:2px solid darkgray; border-right:2px solid darkgray; background:#DFDFDF;">
								<tr>
									<th>접수일/접수번호</th>
									<th>상품정보</th>
									<th>분류</th>
									<th>처리현황</th>
									<th>배송방법</th>
								</tr>
							</thead>
							<tbody style="border-left:2px solid darkgray; border-right:2px solid darkgray; background:white;">
								<tr>
									<td align="center">1</td>
									<td>[견적문의]견적 문의합니다.</td>
									<td>임하룡</td>
									<td>2018-08-31</td>
									<td align="center">23</td>
								</tr>
								<tr>
									<td align="center">John</td>
									<td>Doe</td>
									<td>john@example.com</td>
									<td>2018-08-31</td>
									<td align="center">2</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<br clear="both">
				<div>
					<button type="button" class="btn btn-danger" style="padding:2px 4px; float:right;">신청하기</button>
				</div>
				<div>
					<div>
						<div class="list_n_menu">
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
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>