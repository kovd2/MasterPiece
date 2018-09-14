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
    <jsp:param name="name" value="5"/>
</jsp:include>
<div id="main">
	<h1 style="margin-left: 50px">발주 요청</h1>
	<div>
		<table id="mt">
			<tr align="center" style="height: 50px">
			<td>상품명</td>
			<td><input type="text" size="30"></td>
			<td><input type="button" value = "검색"></td>
			</tr>
		</table>
	</div>
	<div>
		<table id="mt" border="1">
		<tr align="center" style="background: lightgray;">
		<th style="width: 60px"></th>
		<th style="width: 60px">상품명</th>
		<th style="width: 60px">수량</th>
		<th style="width: 90px">발주 단가</th>
		<th style="width: 90px">발주 금액</th>
		<th style="width: 60px">비고</th>
		<th style="width: 200px">발주처</th>
		</tr>
		</table>
	</div>
	</div>
</body>
</html>