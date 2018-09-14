<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.bodyArea {
		text-align:center;
		width:1000px;
		background:green;
		height:600px;
		margin:0 auto;
	}
</style>
</head>
<body>
<%@ include file="/views/common/top.jsp" %> 
<div class="bodyArea">
<%@ include file="/views/mypage/buyerHistory/left.jsp" %> 
<%@ include file="/views/mypage/buyerHistory/center.jsp" %> 
</div>
<%@ include file="/views/common/footer.jsp" %>
	
</body>
</html>