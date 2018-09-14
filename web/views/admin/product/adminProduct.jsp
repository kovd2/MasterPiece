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
    <jsp:param name="name" value="2"/>
</jsp:include>
<style>
#mt{
	padding: 0px;
	border: 1px solid;
}

#mt td{
border-left:1px solid;
width: 50px;
text-align: center;
}

</style>
<div id="main">
<table style="margin-left: 40px;margin-top: 18px;">
<tr>
	<td style="width: 200px"><h1>상품</h1></td>
	<td><div style="background: lightblue; color:white;cursor: pointer;text-align: center; width: 113px; height: 40px; padding-top: 15px;" onclick="location.href='./productAdd.jsp'">상품추가</div></td>
</tr>

</table>
		<table align="center" id="mt">
			<tr>
				<td>전체</td>
				<td>cpu</td>
				<td>메인</td>
				<td style="width:100px">그래픽카드</td>
				<td>odd</td>
				<td style="width:120px">파워 서플라이</td>
				<td>쿨러</td>
				<td>케이스</td>
			</tr>			
		</table>
	</div>
</body>
</html>