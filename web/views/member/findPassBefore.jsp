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

.sendPassArea2 {
	margin: 0 auto;
	width: 600px;
	height: 80px;
	background: #f0e1e1;
	padding-top: 25px;
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
		<a href="<%=request.getContextPath()%>/main.jsp"><img
			class="image" src="<%=request.getContextPath()%>/images/logo.png"
			id="logo" align="center"></a>

		<form id="successForm" action="<%=request.getContextPath()%>/passFind2" method="post">
			<div class="Form">
				<div class="inner">
					<div class="Form2">인증번호 확인</div>
					<hr style="border: 0.5px solid #929292; margin-top: 5px;">
					<p style="font-weight: bold;">이메일에 전송된 인증번호 입력</p>
					<p style="color: gray;">인증번호 확인 후 비밀번호 변경 페이지로 이동합니다.</p>

					<br>
					<div class="sendPassArea2">
					<table align="center">
							<input type="hidden" name="code_check" id="code_check" value="<%=request.getAttribute("code")%>">
							<tr>
								<td>
								<input type="hidden" name="userId" value="<%=request.getAttribute("userId") %>">
								<input type="hidden" name="email" value="<%=request.getAttribute("email") %>">
								</td>
							</tr>
							<tr>
								<th>인증번호&nbsp;&nbsp;</th>
								<td><input type="text" name="code" id="code" onkeyup="checkCode();" placeholder="인증번호를 입력하세요."></td>
							</tr>
						</table>
					</div>
					<br> <input type="hidden" id="successBtn" name="successBtn"
						class="btn btn-default" value="확인">
				</div>
			</div>
		</form>
	</div>
	<br><br><br><br>
	<%@ include file="../common/footer.jsp"%>
	<script type="text/javascript">
	function checkCode(){
		
		var v1 = successForm.code_check.value;
		var v2 = successForm.code.value;
	
		if(v1 != v2){ //같지않은경우
			makeNull();
		}else{
			makeReal();
		}
		
		function makeReal(){
			
			var successBtn = document.getElementById("successBtn")
			
			successBtn.type = "submit";
		}
		
		function makeNull(){
			
			var successBtn = document.getElementById("successBtn")
			
			successBtn.type = "hidden";
		}
		

	}
	</script>


</body>
</html>