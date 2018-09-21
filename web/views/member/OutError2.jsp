<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		alert("입력하신 비밀번호가 틀립니다. 다시 확인해주세요.");
		location.href = "<%=request.getContextPath() %>/views/mypage/member/myPage2.jsp";
	</script>
</body>
</html>