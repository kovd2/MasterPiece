<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.wrap {
	width: 1100px;
	height: auto;
	margin: 0 auto;
	align: center;
}

.wrap .step {
	width: 80%;
	height: 150px;
	margin: auto;
}
.wrap .step img{
	width: 880px;
	height: 150px;
}
.wrap .complet_msg{
	width:80%;
	margin:auto;
	text-align:center;
	font-size:35px;
	color:#575f79;
	font-weight:bold;
}
.wrap .btnArea{
	width:100px;
	height:auto;
	margin:auto;
	margin-top:80px;
	text-align:center;
	align:center;
	background:yellowgreen;
}
.wrap .btnArea .goHome_btn {
	width:100px;
	height:45px;
	background:#c70000;
	color:white;
	font-size:20px;
	display:table-cell;
	vertical-align:middle;
}
.wrap .btnArea .goHome_btn:hover{
	cursor:pointer;
}
</style>
</head>
<body>
<%@ include file="../common/top.jsp"%>
	<div class="wrap">
		<!-- 결제완료 페이지 전체 div -->
		<div class="step">
			<img src="../../images/step_complet.png">
		</div>
		<div class="complet_msg">결제가 성공적으로 완료 되었습니다.</div>
		<div class="btnArea">
			<div class="goHome_btn">홈으로</div>
		</div>
	</div>
</body>
</html>