<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String oc = (String)request.getAttribute("oc"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<style>
	.bodyArea {
		text-align:center;
		width:1000px;
		background:white;
		height:1200px;
		margin:0 auto;
	}
</style>
</head>
<body>
<%@ include file="/views/common/top.jsp" %> 
<div class="bodyArea">
	<%if(loginUser.getOrderCheck()==null){
			loginUser.setOrderCheck(oc);
		} %>
<%@ include file="/views/mypage/cart/cart_left.jsp" %> 
<%@ include file="/views/mypage/cart/cart_center.jsp" %> 
</div>
<%@ include file="/views/common/footer.jsp" %>
	
</body>
</html>