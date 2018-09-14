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
    <jsp:param name="name" value="8"/>
</jsp:include>
<div id="main">
	<h1 style="margin-left: 50px">프로모션 관리</h1>
	<div>
		<table id="mt">
			<tr style="height: 50px">
			<td><select name="">
				<option>작성자</option>
				<option> </option>
				<option> </option>
			</select></td>
			<td><input type="text" size="30"></td>
			<td><input type="button" value = "검색"></td>
			</tr>
		</table>
	</div>
	<div>
	<table align="right">
	<tr>
	<td>
	<input type="button" value = "등록">
	</td>
	<td>
	<input type="button" value = "삭제">
	</td>
	</tr>
	</table>
	</div>
	<div>
		<table id="mt" border="1" style="margin-top: 30px">
		<tr align="center" style="background: lightgray; height: 50px">
		<th>번호</th>
		<th>all</th>
		<th>코드</th>
		<th style="width:80px;">제목</th>
		<th>작성자</th>
		<th>첨부</th>
		<th>형태</th>
		<th style="width:200px;">상태(기간)</th>
		<th style="width:80px;">등록일</th>
		<th>상태</th>
		<th>보기</th>
		</tr>
		</table>
	</div>
	
	</div>
</body>
</html>