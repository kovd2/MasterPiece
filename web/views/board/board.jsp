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
    <jsp:param name="name" value="7"/>
</jsp:include>
<div id="main">
	<div style="margin-left: 30px; margin-top: 20px;">
		<select name="">
				<option>게시판 선택</option>
				<option> </option>
				<option> </option>
			</select>
	</div>
	<div>
		<table id="mt" border="1" style="margin-top: 20px">
		<tr align="center" style="background: lightgray; height: 50px">
		<th style="width: 100px">번호</th>
		<th style="width: 800px">제목</th>
		<th style="width: 180px">작성자</th>
		</tr>
		</table>
	</div>
	<div>
		<table align="center" id="mt" style="margin-top: 30px">
			<tr style="height: 50px">
			<td><select name="">
				<option>제목</option>
				<option> </option>
				<option> </option>
			</select></td>
			<td><input type="text" size="50"></td>
			<td><input type="button" value = "검색"></td>
			</tr>
		</table>
	</div>
	</div>
</body>
</html>