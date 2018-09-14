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
				<td><h1>상품 등록</h1></td>
			</tr>
			<tr>
				<td>
				<table border="1">
					<tr>
					<td>상품명</td>
					<td><input type="text"></td>
					</tr>
				<tr>
					<td>상품코드</td>
					<td><input type="text"></td>
					</tr>
					<tr>
					<td>판매기간</td>
					<td><input type="text"> ~ <input type="text"></td>
					</tr>
					<tr>
					<td>판매가격</td>
					<td><input type="text"> 원</td>
					</tr>
					<tr>
					<td>내용</td>
					<td><input type="text"></td>
					</tr>
					<tr>
					<td>구분</td>
					<td><input type="text"></td>
					</tr>
					<tr>
					<td>첨부파일</td>
					<td><input type="text"></td>
					</tr>
				</table>
				</td>
			</tr>
			<tr></tr>
			
		</table>
	</div>
</body>
</html>