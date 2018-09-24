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
    String phone = (String)request.getAttribute("phone");
    String email = (String)request.getAttribute("email");
%>
</head>
<body>
 <jsp:include page="../common/menu.jsp">
    <jsp:param name="name" value="6"/>
</jsp:include>
<div id="main">
		<div>
		<form action="<%=request.getContextPath()%>/answer.swy">
			<table style="margin-left: 20px; margin-top: 20px; width: 1080px"
				border="1">
				<tr>
					<th align="center" style="width: 20%; background: lightgray">작성자</th>
					<td style="width: 80%"><input style="width: 100%;background: white; color: black" type="text" disabled value="<%=b.getBOARD_WRITER()%>">
					<input type="hidden" name="id" value="<%=b.getBOARD_ID()%>">
					</td>
				</tr>
				<tr>
					<th align="center" style="width: 20%; background: lightgray">제목</th>
					<td style="width: 80%"><input style="width: 100%;background: white; color: black" type="text" disabled value="<%=b.getBOARD_TITLE()%>"></td>
				</tr>
				<tr>
					<th align="center"
						style="width: 20%; background: lightgray; height: 150px">내용</th>
					<td style="width: 80%"><textarea readonly="readonly" style="width: 100%; height: 150px; resize: none"><%=b.getBOARD_CONTENT()%></textarea></td>
				</tr>
				<tr>
					<th align="center" style="width: 20%; background: lightgray">이메일</th>
					<td style="width: 80%"><input style="width: 100%;background: white; color: black" type="text" disabled value="<%=email%>"></td>
				</tr>
				<tr>
					<th align="center" style="width: 20%; background: lightgray">연락처</th>
					<td style="width: 80%"><input style="width: 100%;background: white; color: black" type="text" disabled value="<%=phone%>"></td>
				</tr>
				<tr>
					<th align="center"
						style="width: 20%; background: lightgray; height: 150px">답변</th>
					<td style="width: 80%"><textarea style="width: 100%; height: 150px; resize: none" name = "content"></textarea></td>
				</tr>
			</table>
			<table style="width: 1080px;margin-top: 30px;"><tr><td align="center"><input style="width: 80px; height: 50px;" type="submit" value ="저장"></td></tr></table>
		</form>
		</div>
	</div>
</body>
</html>