<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>고객센터</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
.border:hover {
	color: green;
}

.menu:hover {
	cursor: pointer;
}

.menu {
	background: #F5F5F5;
	border: 1px solid lightgray;
	font-weight: bold;
	padding-top: 8px;
	padding-right: 10px;
}

.FAQMenu {
	padding-top: 15px;
	cursor: pointer;
	border: 1px solid lightgray;
	display:inline-block;
}

.clickedMenu {
	background: #c70000;
}

.menuAtt {
	padding-left: 10px;
}
.frameAtt
{
	display:inline-block;
}
</style>
</head>
<body>
	<%@ include file="../common/top.jsp"%>
	<%@ include file="../common/left.jsp"%>
	<%@ include file="../common/right.jsp"%>
	<div class="centerFrame"> 
		<div id="menuLeftFrame" class="frameAtt" style="height:1000px;">
			<div class="menuLeft" style="width: 200px;">
				<div class="sideMenu menu menuAtt" style="height:37px;">
					<span>1:1 문의</span><span style="float: right;">></span>
				</div>
				<div class="menuAtt">
					<span>1</span>
				</div>
				<div class="menuAtt">
					<span>2</span>
				</div>
				<div class="menuAtt">
					<span>3</span>
				</div>
				<div class="menuAtt">
					<span>4</span>
				</div>
				<div class="menuAtt">
					<span>5</span>
				</div>
				<div class="sideMenu menu menuAtt" style="height: 37px">
					<span>FAQ</span> <span style="float: right;">></span>
				</div>
				<div class="sideMenu menu menuAtt" style="height: 37px">
					<span>교환, 반품, A/S 접수</span> <span style="float: right;">></span>
				</div>
				<div class="sideMenu menu menuAtt" style="height: 37px">
					<span>교환, 반품, A/S 조회</span> <span style="float: right;">></span>
				</div>
				<div class="sideMenu menu menuAtt" style="height: 37px">
					<span>운송료조회</span> <span style="float: right;">></span>
				</div>
			</div>
		</div>
		<div style="width:1170px; height:270px;" align="center" class="frameAtt">
			<div style="border: 1px solid black; width:1000px; height:500px;">
				<!-- <br> <span style="padding-left: 30px; font-size: 1.2em; font-weight: bold;">자주 묻는 질문</span> <br> <br>
				<form style="padding-left: 30px;">
					<div class="input-group col-xs-11 pull-left">
						<input type="text" class="form-control" placeholder="Search"
							size="5">
						<div class="input-group-btn">
							<button class="btn btn-default" type="submit">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</div>
					</div>
				</form> -->
			</div>
		</div>
	</div>
</body>
</html>