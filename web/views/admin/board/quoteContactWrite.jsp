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
.boardHead th
{
	width:80px;
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
					<hr style="margin-top:3px;">
					<form action="" method="post" style="margin-top:-20px;">
						<table class="table table-bordered">
							<tbody class="boardHead">
								<tr>
									<th colspan="2">
										<label style="width:80px;">작성자</label>
										<label>King-Computer</label>
										<label style="float:right; width:80px;">2018-09-08</label>
										<label style="float:right; width:80px;">작성일자</label>
									</th>
								</tr>
								<tr>
									<th style="vertical-align:middle;">제목</th>
									<td><input type="text" placeholder="제목을 입력하세요." name="subject" class="form-control" /></td>
								</tr>
								<tr>
									<th style="vertical-align:middle;">내용</th>
									<td class="boardContent">
										<textarea cols="10" rows="15" placeholder="내용을 입력하세요." name="content" class="form-control boardContent" style=" resize: none;"></textarea>
									</td>
								</tr>
								<tr>
									<th style="vertical-align:middle;">첨부파일</th>
									<td><input type="file" placeholder="파일을 선택하세요." name="filename" class="form-control" /></td>
								</tr>
								<tr>
									<th style="vertical-align:middle;">비밀번호</th>
									<td><input type="password" placeholder="비밀번호를 입력하세요" class="form-control" /></td>
								</tr>
								<tr>
									<td colspan="2">
										<div>
											<button type="submit" class="btn btn-success" style="padding:2px 4px; float:right;">등록</button>
										</div>
										<div>
											<button type="button" class="btn btn-primary" style="padding:2px 4px; float:left;" onclick="location.href='quoteContact.jsp'">목록</button>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
					</div>
				</div>
			</div>
		</div>
		<br clear="both">
	</div>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>