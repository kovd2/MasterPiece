<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
	.image {
		width: 200px;
		height: 150px;
	}
	
	#userId {
		width:300px;
		height:30px;
		font-size:15px;
		margin-right:12px;
	}

	.loginForm {
		text-align:center;
	}
	
	#logo {
		margin-bottom:50px;
	}
	
	a {
		color:darkgray;
	}
	
	a:hover{
		color:black;
	}
	
	#email {
		width:300px;
		height:30px;
		font-size:15px;
		margin-right:12px;
	}
	
	#passFindBtn {
		width:82px;
		height:82px;
		background-color: #f44336;
		border: none;
    	color: white;
    	padding: 15px 32px;
    	text-align: center;
    	text-decoration: none;
    	display: inline-block;
    	font-size: 16px;
    	cursor: pointer;
	}
	
	.find input{
		font-size:13px;
		padding:5px;
		margin-left: 15px;
	}
	
	.find input:first-child{
		margin-left: 0;
	}
	
	input [type=button] {	
		background-color: #e7e7e7;
		color: black;
		border-radius:0px;
		
	}
	
	.button4 {
		background-color: #e7e7e7;
    	border: none;
    	color: black;
   		text-align: center;
    	text-decoration: none;
    	display: inline-block;
    	font-size: 16px;
    	cursor: pointer;
    	
	}
	.button4.green{
		background:green;
	}

</style>
</head>
<body>
	<br><br><br>
	<div class="loginForm">
	<a href="<%=request.getContextPath()%>/main.jsp"><img class="image" src="<%=request.getContextPath()%>/images/logo.png" id="logo" align="center"></a>
	<form id="passFindForm" action="<%=request.getContextPath()%>/passFind" method="post">
	<table align="center" class="findd">
		<tr>
			<td colspan="3">
			<input type="text" id="userId" name="userId" class="form-control" placeholder="아이디를 입력해주세요" style="font-size:13px;">
			</td>
			<td rowspan="2">
			<input type="button" id="passFindBtn" name="passFindBtn" style="padding:0px" value="확인">
			<input type="hidden" name="code_check" id="code_check" value="<%=getRandom() %>" readonly>
			</td>
		</tr>
		<tr>
			<td colspan="3">
			<input type="text" id="email" name="email" class="form-control" placeholder="회원정보에 등록된 이메일을 입력해주세요" style="font-size:13px;">
			</td>
		</tr>
		<tr>
			<td>　</td>
			<td>　</td>
		</tr>
		<tr class="find">
			<td colspan="4">
				<a href="findId.jsp" >아이디 찾기 │</a>
				<a href="findPass.jsp" style="color:black">비밀번호 찾기 │</a>
				<a href="memberTerms.jsp">회원가입 │</a>
				<a href="login.jsp">로그인</a>
			</td>
		</tr>
	</table>
	</form>
	</div>
	<br><br><br><br>
	<%@ include file="../common/footer.jsp"%>
	<script>
		$(function(){
			  $("#passFindBtn").click(function(){
				
				  $("#passFindForm").submit();
			  });
			  
		});
	</script>
	
	<%! public int getRandom(){
		int random = 0;
		
		random = (int)Math.floor((Math.random()*(99999-10000+1)))+100;
		
		return random;
	}
	%>
	

</body>
</html>