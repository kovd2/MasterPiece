<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
.image {
	width: 200px;
	height: 150px;
}

.loginForm {
	text-align: center;
}

#logo {
	margin-bottom: 50px;
}

a {
	color: darkgray;
}

a:hover {
	color: black;
}

.sendPassArea {
	margin: 0 auto;
	width: 600px;
	height: 80px;
	background: #f0e1e1;
	padding-top: 10px;
}

.sendBtn {
	width: 90px;
	height: 30px;
	background-color: #e7e7e7;
	border: 1px solid #929292;
	color: black;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 13px;
	cursor: pointer;
}

.button4 {
	background-color: #e7e7e7;
	border: none;
	color: black;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 13px;
	cursor: pointer;
	width: 60px;
	height: 30px;
}

.Form2 {
	font-size: 37px;
	text-align: left;
}

.inner {
	width: 600px;
	margin: 0 auto;
}

#passBtn {
	background-color: #e7e7e7;
	color: black;
	border-radius: 0px;
}
</style>
</head>
<body>
	<br>
	<br>
	<br>
	<div class="loginForm">
		<a href="<%=request.getContextPath()%>/index.jsp"><img
			class="image" src="<%=request.getContextPath()%>/images/logo.png"
			id="logo" align="center"></a>

		<form id="passForm"
			action="<%=request.getContextPath()%>/passFindResult.me" method="post">
			<div class="Form">
				<div class="inner">
					<div class="Form2">새 비밀번호 설정</div>
					<hr style="border: 0.5px solid #929292; margin-top: 5px;">
					<p style="font-weight: bold;">사용하실 새 비밀번호 입력</p>
					<p style="color: gray;">패스워드는 최소 8자리 이상 입력해야 합니다.</p>

					<br>
					<div class="sendPassArea">
						<table align="center">
							<tr>
								<th>새 비밀번호</th>
								<td><input type="password" id="userPwd" name="userPwd"></td>
							</tr>
							<tr>
								<th>새 비밀번호 확인&nbsp;&nbsp;</th>
								<td><input type="password" id="userPwd2" name="userPwd2"></td>
							</tr>
							<tr><td>
							<input type="hidden" name="userId" value="<%=request.getAttribute("userId") %>">
							<input type="hidden" name="email" value="<%=request.getAttribute("email") %>">
							</td>
							</tr>
						</table>
					</div>
					<br> <input type="submit" id="passBtn" name="passBtn"
						class="btn btn-default" value="확인">
				</div>

			</div>
		</form>
	</div>
	<%@ include file="../common/footer.jsp"%>
	<script>
		$(function(){
			  $("#passBtn").click(function(){
				  if($('#userPwd').val() == $('#userPwd2').val()){
					  alert("비밀번호가 변경되었습니다.")
					  $("#passForm").submit();  
				  }else{
					  
					  alert("입력하신 비밀번호를 확인해 주세요.");
				  }
			  });
			  
		});
		
	</script>


</body>
</html>