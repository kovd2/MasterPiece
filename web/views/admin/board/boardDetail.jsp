<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
        import="java.util.*, com.kh.MasterPiece.member.model.vo.*, com.kh.MasterPiece.board.model.vo.*"
    %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	Board b = (Board)request.getAttribute("Board");    
%>
</head>
<body>
 <jsp:include page="../common/menu.jsp">
    <jsp:param name="name" value="7"/>
</jsp:include>
<div id="main">
		<div align="center">
		<form action="<%=request.getContextPath()%>/ModifyBoard.swy">
		<input type="hidden" name="id" value = "<%=b.getBOARD_ID() %>">
			<table style="margin-left: 20px; margin-top: 20px; width: 1080px"
				border="1">
				<tr>
					<th align="center" style="width: 20%; background: lightgray">제목</th>
					<td style="width: 80%"><input name = "title" style="border:0px; width: 99%;background: white; color: black" type="text" value="<%=b.getBOARD_TITLE()%>"></td>
				</tr>
				<tr>
					<th align="center"
						style="width: 20%; background: lightgray; height: 150px">내용</th>
					<td style="width: 80%"><textarea name="content" style="border:0px;width: 99%; height: 150px; resize: none"><%=b.getBOARD_CONTENT()%></textarea></td>
				</tr>
			</table>
			<input type ="submit" value="수정" style="margin-top:20px;width: 80px;height: 40px">
			</form>
		</div>
	</div>
</body>
</html>