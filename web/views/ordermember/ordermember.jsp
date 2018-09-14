<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <jsp:include page="../common/menu.jsp">
    <jsp:param name="name" value="4"/>
</jsp:include>
<div id="main">
	<div>
		<table id="mt" style="margin-top: 80px">
			<tr style="height: 50px">
			<td><select name="">
				<option>주문번호</option>
				<option> </option>
				<option> </option>
			</select></td>
			<td><input type="text" size="30"></td>
			<td><input type="button" value = "검색"></td>
			<td><input type="button" value = "주문확인" style="margin-left: 100px"></td>
			<td><input type="button" value = "배송준비"></td>
			</tr>
		</table>
	</div>
	<div>
		<table id="mt" border="1">
		<tr align="center" style="background: lightgray;">
		<th style="width: 50px">번호</th>
		<th>주문일자/주문번호</th>
		<th style="width: 100px">상품정보</th>
		<th style="width: 90px">주문자</th>
		<th style="width: 90px">주문금액</th>
		<th style="width: 200px">결제금액</th>
		<th>결제방법</th>
		<th>결제상태</th>
		<th>주문상태</th>
		<th>상세정보</th>
		</tr>
		</table>
	</div>
	</div>
</body>
</html>