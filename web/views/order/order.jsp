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
	<h1 style="margin-left: 50px">발주 관리</h1>
		<table align="center" id="mt">
			<tr align="center" style="height: 50px">
			<td>전체</td>
			<td>CPU</td>
			<td>메인보드</td>
			<td>그래픽카드</td>
			<td>저장장치</td>
			<td>ODD</td>
			<td>파워 서플라이</td>
			<td>쿨러</td>
			<td>케이스</td>
			</tr>
			<tr align="center" style="height: 50px">
			<td><input type="checkbox" ></td>
			<td>발주코드</td>
			<td>발주처</td>
			<td>사진</td>
			<td>상품명</td>
			<td>발주수량</td>
			<td>발주단가</td>
			<td>발주금액</td>
			<td>비고</td>
			<td style="width: 100px"></td>
			<td style="background: lightblue; color:white;cursor: pointer;" onclick="location.href='./orderPre.jsp'">발주 요청</td>
			</tr>
		</table>
	</div>
</body>
</html>