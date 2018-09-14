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
	<h1 style="margin-left: 50px">프로모션 등록</h1>
	<table border="1" style="margin-top: 20px;width: 900px" id="mt">
	<tr>
	<td align="center" style="width:70px;height: 30px;">상태</td>
	<td>
	<input type="radio" id="wait" name="status" style="margin-left: 20px"><label for="wait">대기</label>
	<input type="radio" id="start" name="status" style="margin-left: 50px"><label for="start">게시</label>
	</td>
	</tr>
	<tr>
	<td align="center" style="width:70px;height: 30px;">기간</td>
	<td>
	<input type="text"style="margin-left: 20px"> ~ <input type="text"><label> ex)2018-08-23 00시</label>
	</td>
	</tr>
	<tr>
	<td align="center" style="width:70px;height: 30px;">형태</td>
	<td>
	<input type="radio" id="pop" name="status" style="margin-left: 20px"><label for="pop">팝업</label>
	<input type="radio" id="lay" name="status" style="margin-left: 50px"><label for="lay">레이어</label>
	</td>
	</tr>
	<tr>
	<td align="center" style="width:70px;height: 30px;">제목</td>
	<td>

	</td>
	</tr>
	<tr>
	<td align="center" style="width:70px;height: 200px;">내용</td>
	<td>
	</td>
	</tr>
	<tr>
	<td align="center" style="width:70px">첨부파일</td>
	<td>
	<input type="text" style="margin-left: 20px"><input type="button" value="파일추가" style="margin-left: 20px">
	</td>
	</tr>
	</table>
	<table align="center" style="margin-top: 40px"><tr><td><input type="button" value="저장"></td></tr></table>
	</div>
</body>
</html>