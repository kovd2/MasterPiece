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
.boardTable
{
	font-size:small;
	width:600px;
}
.boardTable th, td
{
	text-align:center;
	border-bottom:1px dashed #F5F5F5;
	height:30px;
}
.boardTable th:nth-child(1), td:nth-child(1)
{
	background:#F5F5F5;
}
.boardTable>tbody>tr:hover
{
	background:lightgray;
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
			<div class="inb" id="sideMenu" style="width: 200px; height:80px;">
				<div class="sideMenu menu menuAtt" style="height: 30px;" onclick="location.href='quoteContact.jsp'">
					<span style="float:left">견적 요청</span><span style="float: right;">></span>
				</div>
				<div class="sideMenu menu menuAtt" style="height: 30px;" onclick="location.href='userEstimate.jsp'">
					<span style="float:left">유저 견적 게시판</span><span style="float: right;">></span>
				</div>
			</div>
		</div>
		<!-- 게시판 -->
		<div class="container-inner inner board" style="margin-top:-20px;">
			<div class="inb" id="board" style="width:600px;">
				<!-- 중앙 게시판 -->
				<div>
					<div>
						<hr style="margin-bottom:7px;">
						<span style="padding-left:10px; font-weight:bold; font-size:large; float:left; width:290px;">견적 요청</span>
						<br clear="both">
						<form>
						  <div class="input-group col-xs-5" style="float:right; margin-top:-27px;">
						    <input type="text" class="form-control" placeholder="검색어를 입력하세요." size="5" style="height:26px; font-size:small">
						    <div class="input-group-btn">
						      <button class="btn btn-default" type="submit" style="height:26px; padding:3px 6px;">
						        <i class="glyphicon glyphicon-search"></i>
						      </button>
						    </div>
						  </div>
						</form>
						<div>
							<select style="margin-top: -26px;float:right;margin-right: 255px;height: 24px;">
								<option value="title">제목</option>
								<option value="writer">작성자</option>
								<option value="content">내용</option>
							</select>
						</div>
						<hr style="margin-top:3px;">
						<table class="boardTable" style="margin-top:-19px;">
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody>
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
				<br>
				<div>
					<button type="button" class="btn btn-danger" style="padding:2px 4px; float:right;" onclick="location.href='quoteContactWrite.jsp'">견적 요청</button>
				</div>
			</div>
		</div>
		<br clear="both">
		<br>
		<!-- 페이징 -->
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
	<%@ include file="../common/footer.jsp" %>
</body>
</html>