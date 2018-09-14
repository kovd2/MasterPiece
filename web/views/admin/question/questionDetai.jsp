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
    <jsp:param name="name" value="6"/>
</jsp:include>
<div id="main">
		<div>
			<table style="margin-left: 20px; margin-top: 20px; width: 1080px"
				border="1">
				<tr>
					<th align="center" style="width: 20%; background: lightgray">작성자</th>
					<td style="width: 80%"></td>
				</tr>
				<tr>
					<th align="center" style="width: 20%; background: lightgray">제목</th>
					<td style="width: 80%"></td>
				</tr>
				<tr>
					<th align="center"
						style="width: 20%; background: lightgray; height: 150px">내용</th>
					<td style="width: 80%"></td>
				</tr>
				<tr>
					<th align="center" style="width: 20%; background: lightgray">이메일</th>
					<td style="width: 80%"></td>
				</tr>
				<tr>
					<th align="center" style="width: 20%; background: lightgray">연락처</th>
					<td style="width: 80%"></td>
				</tr>
				<tr>
					<th align="center"
						style="width: 20%; background: lightgray; height: 40px">처리상태</th>
					<td style="width: 80%"><input type="checkbox" id="ok"><label
						for="ok">완료</label> <input type="checkbox" id="wait"
						style="margin-left: 20px"><label for="wait">대기</label></td>
				</tr>
				<tr>
					<th align="center"
						style="width: 20%; background: lightgray; height: 150px">답변</th>
					<td style="width: 80%"></td>
				</tr>
			</table>
		</div>
		<div>
		<table style="width: 1080px;margin-top: 30px;"><tr><td align="center"><input type="button" value ="저장"></td></tr></table>
		
		</div>
	</div>
</body>
</html>