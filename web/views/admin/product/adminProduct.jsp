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
<div id="main">
		<table align="center" id="mt">
			<tr>
				<td colspan="4"><h1>상품</h1></td>
				<td colspan="7"><div style="background: lightblue; color:white;cursor: pointer;text-align: center; width: 113px; height: 40px; padding-top: 15px; margin-left: -70px;" onclick="location.href='./productAdd.jsp'">상품추가</div></td>
			</tr>
			<tr>
				<td>전체</td>
				<td>cpu</td>
				<td>메인</td>
				<td>그래픽카드</td>
				<td>odd</td>
				<td>파워 서플라이</td>
				<td>쿨러</td>
				<td>케이스</td>
			</tr>
			<tr></tr>
			
		</table>
	</div>
</body>
</html>