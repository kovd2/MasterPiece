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
		<jsp:param name="name" value="7" />
	</jsp:include>
	<div id="main" style="width: 800px;" align="center">
	<form action="<%=request.getContextPath() %>/Boardinsert.swy">
	
	<table style="margin-left:-100px; margin-top:20px">
	<tr>
	<th>제목</th>
	<td style="width:500px;"><input type="text" name="title" style="width:100%"></td>
	</tr>
	<tr style="height:10px"></tr>
	<tr>
	<th style="vertical-align: top;">내용</th>
	<td><textarea name="content" style="resize: none; width:100%; height:300px;"></textarea></td>
	</tr>
	</table>
	
	<input type="submit" value="저장">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" onclick="location.href='<%=request.getContextPath()%>/selectBoard.swy'" value="취소">
	</form>
	</div>
	
	
</body>
</html>