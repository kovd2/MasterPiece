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
    <jsp:param name="name" value="3"/>
</jsp:include>
<div id="main">
	<h1 style="margin-left:50px">회원 정보</h1>
	<table id="mt">
	<tr><td><select name="">
		<option>전체</option>
		<option>전체</option>
		<option>전체</option>
	</select></td></tr>
	</table>
	<div>
		<table id="mt">
			<tr style="height: 50px">
			<td><select name="">
				<option>회원ID</option>
				<option> </option>
				<option> </option>
			</select></td>
			<td><input type="text" size="30"></td>
			<td><input type="button" value = "검색"></td>
			</tr>
		</table>
	</div>
	<div>
		<table id="mt" border="1">
		<tr align="center" style="background: lightgray;">
		<th style="width: 60px">번호</th>
		<th style="width: 60px">구분</th>
		<th style="width: 60px">회원ID</th>
		<th style="width: 90px">등급</th>
		<th style="width: 90px">성명</th>
		<th style="width: 200px">주소</th>
		<th style="width: 150px">연락처</th>
		<th style="width: 150px">이메일</th>
		</tr>
		</table>
	</div>
	</div>
</body>
</html>