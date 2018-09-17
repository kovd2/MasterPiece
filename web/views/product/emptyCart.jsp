<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.wrap {
	width: 1300px;
	margin: 0 auto;
	align: center;
	overflow:hidden;
}

.wrap .step {
	width: 80%;
	height: 150px;
	margin: auto;
}
.wrap .empty_cart{
	text-align:center;
	margin-top:100px;
}
.wrap .empty_cart #no_cart_item{
	text-align:center;
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
		<div class="step">
			<img src="../..//images/jinseok/icon/step_cart.PNG">
		</div>
		<div class="empty_cart">
			<div id="no_cart_item" class="div_all_layer">장바구니에 상품이 존재하지 않습니다.</div>

			<div class="div_all_layer" style="font-size: 12px; text-align: center; margin-bottom: 10px">
				<span style="color: #f02857;">특정상품의 경우 (30인치 이상 모니터,업체배송제품,파손위험제품, 고가품, 부피가 큰제품) 택배사가 변경되어 발송될수 있습니다.</span>
			</div>
		</div>
		<div class="btnArea">
			<div class="goHome_btn" onclick="goHome();">홈으로</div>
		</div>
		
	</div>
	<br><br><br><br><br>
	<%@include file = "../common/footer.jsp" %>
	<script>
		function goHome(){
			location.href="../../index.jsp";
		}
	</script>
</body>
</html>