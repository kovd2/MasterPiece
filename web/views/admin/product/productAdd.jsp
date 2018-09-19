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
		<jsp:param name="name" value="2" />
	</jsp:include>
	<div id="main">
		<form action="<%=request.getContextPath() %>/productInsert" method="post" encType="multipart/form-data">
			<table align="center" id="mt">
				<tr>
					<td><h1>상품 등록</h1></td>
				</tr>
				<tr>
					<td>
						<table border="1">
							<tr>
								<td>상품이미지</td>
								<td><input type="file" name="mainImg"></td>
							</tr>
							<tr>
								<td>상품명</td>
								<td><input type="text" name="name"></td>
							</tr>
							<tr>
								<td>상품코드</td>
								<td><input type="text" name="code"></td>
							</tr>
							<tr>
								<td>제조사</td>
								<td><input type="text" name="MANUFACTURER"></td>
							</tr>
							<tr>
								<td>판매가격</td>
								<td><input type="text" name="price"> 원</td>
							</tr>
							<tr>
								<td>내용</td>
								<td><input type="file" name="conImg"></td>
							</tr>
							<tr>
								<td>구분</td>
								<td><select name="category">
										<option value="CPU">CPU</option>
										<option value="MAINBOARD">메인보드</option>
										<option value="GRAPHIC">그래픽카드</option>
										<option value="ODD">ODD</option>
										<option value="POWER">파워 서플라이</option>
										<option value="COOLER">쿨러</option>
										<option value="CASE">케이스</option>
									</select></td>
							</tr>
							<tr>
								<td>갯수</td>
								<td><input type="text" name="stock"> 개</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr></tr>

			</table>
			<div align="center" style="margin-top:20px;"><input type="submit" value="추가" style="width:100px; height: 50px;"></div>
		</form>
	</div>
</body>
</html>