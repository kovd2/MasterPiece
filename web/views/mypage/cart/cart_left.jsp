<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.leftWrapArea {
	display: inline-block;
	width: 210px;
	height: 600px;
	float: left;
	background: white;
	color: #464646;
	font-family: dotum;
	font-size: 15px;
	text-align: left;
	margin-left:10px;
}

}
.myMenu_left {
	float: left;
	width: 233px;
	border: 1px #ccc solid;
}

.text:hover {
	color: #c70000;
	font-weight: bold;
	cursor: pointer;
}

.sub_text>.first-child {
	padding: 15px -1px 5px 10px;
}

.sub_text>div>.first-child {
	margin-bottom: 12px;
	margin-top: 0px;
}

.text-bold {
	font-weight: bold;
}

.sub_text>div>div {
	margin-top: 6px;
}

.sub_text .sub_span {
	width: 36px;
	display: inline-block;
}

.text-red {
	color: #e31738;
}

.sub_text>div>div {
	margin-top: 6px;
}

.text-red {
	color: #e31738;
}
</style>
</head>
<body>
	<div class="leftWrapArea">
		<h2>마이페이지</h2>

		<div class="myMenu_left">

			<br> <br>
			<div class="text" onclick="location.href='../member/myPage.jsp'">회원정보</div>
			<br>
			<div class="text"
				onclick="location.href='<%=request.getContextPath()%>/view_history'">구매내역</div>
			<br>
			<div class="text" onclick="location.href='<%=request.getContextPath()%>/SelectCartList.swy'">장바구니</div>
			<br>
			<div class="text"
				onclick="location.href='../review/review_myPage.jsp'">내가 쓴 게시물</div>
			<br>
			<div class="text"
				onclick="location.href='<%=request.getContextPath()%>/views/mypage/member/myPage2.jsp'">회원
				탈퇴</div>
			<br> <br> <br> <br>

			<div class='sub_text last-child'>
				<div class='first-child'>
					<div class='first-child text-bold'>고객센터</div>
					<div>
						<span class='sub_span'>평일</span> : AM 09:30 - PM 06:00
					</div>
					<div>
						토요일 : <span class='text-red'>휴무</span>
					</div>
					<div class='text-red'>일요일, 공휴일 휴무</div>
				</div>
			</div>





		</div>
	</div>
</body>
</html>