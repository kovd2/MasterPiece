<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.leftWrapArea{
		display: inline-block;
		width:210px;
		height:600px;
		float:left;
		background:white;
	}
	.myMenu_left{
		
	}
	.text:hover{
		color:#c70000;
		font-weight:bold;
		cursor:pointer;
	}
</style>
</head>
<body>
	<div class="leftWrapArea">
		<div class="myMenu_left">
			<h2>마이페이지</h2>
			
			<br> <br>
			<div class="text" onclick="location.href='myPage.jsp'">회원정보</div>
			<br>
			<div class="text" onclick="location.href='../buyerHistory/myPage_buy.jsp'">구매내역</div>
			<br>
			<div class="text" onclick="location.href='../cart/cart_myPage.jsp'">장바구니</div>
			<br>
			<div class="text" onclick="location.href='../as/myPage_as.jsp'">A/S 신청하기</div>
			<br>
			<div class="text" onclick="location.href='#'">A/S 조회하기</div>
			<br>
			<div class="text" onclick="location.href='#'">내가 쓴 게시물</div>
			<br>
			<div class="text" onclick="location.href='#'">FAQ 자주하는 질문</div>
			
			


		</div>
	</div>
</body>
</html>