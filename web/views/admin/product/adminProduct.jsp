<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
#mt{
margin-left:20px;
}
#menubar{
background: lightblue;
    color: white;
    cursor: pointer;
    width: auto;
    padding-left: 10px;
    padding-right: 10px;
    padding-top: 10px;
    height: 30px;
    display: inline-block;
}
#list{
	border: 1px solid;
}
</style>
<body>
 <jsp:include page="../common/menu.jsp">
    <jsp:param name="name" value="2"/>
</jsp:include>
<div id="main">
				<div style="display: inline-block; margin-left: 20px;"><h1>상품</h1></div>
				<div style="display: inline-block; width: 300px;"></div>
				<div style="background: lightblue; color:white;cursor: pointer;text-align: center; width: 113px; height: 40px; padding-top: 15px; display: inline-block;" onclick="location.href='./productAdd.jsp'">상품추가</div>

		<div style="margin-top: 20px">
				<div id="menubar" onclick="location.href='./productAdd.jsp'" style="margin-left:20px">전체</div>
				<div id="menubar" onclick="location.href='./productAdd.jsp'">CPU</div>
				<div id="menubar" onclick="location.href='./productAdd.jsp'">메인</div>
				<div id="menubar" onclick="location.href='./productAdd.jsp'">그래픽카드</div>
				<div id="menubar" onclick="location.href='./productAdd.jsp'">ODD</div>
				<div id="menubar" onclick="location.href='./productAdd.jsp'">파워 서플라이</div>
				<div id="menubar" onclick="location.href='./productAdd.jsp'">쿨러</div>
				<div id="menubar" onclick="location.href='./productAdd.jsp'">케이스</div>
		</div>
		<div style="margin-top:20px;">
			<table style="margin-left:20px;" id="list">
			<tr>
					<th style="width:50px;"><input type="checkbox" name="all"></th>
					<th style="width:100px;"><img alt="" src=""></th>
					<th style="width:200px;">상품명</th>
					<th style="width:100px;">상품코드</th>
					<th style="width:50px;">재고<br>현황</th>
					<th style="width:80px;">판매가격</th>
					<th style="width:50px;">카테<br>고리</th>
			</tr>
			<tr>
			<td style="text-align: center"><input type="checkbox" name=""></td>
					<td><img alt="" src=""></td>
					<td></td><!-- 상품명 -->
					<td></td><!-- 상품코드 -->
					<td></td><!-- 재고 -->
					<td style="text-align: right;">원</td><!-- 가격-->
					<td style="text-align: center"></td><!-- 카테고리-->
				<th></th>
			</tr>
			</table>
		</div>
	</div>
</body>
</html>