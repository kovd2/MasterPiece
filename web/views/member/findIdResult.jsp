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
	.sendIdArea {
		margin:0 auto;
		width:600px;
		height:80px;
		background:#f0e1e1;
		padding-top:10px;
	}
	.sendBtn {
		width:90px;
		height:30px;
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
    	width:60px;
    	height:30px;
    	
	}
	
	.Form2 {
		font-size:37px;
		text-align:left;
		
	}
	
	.inner {
		width:600px;
		margin:0 auto;
	}
</style>
</head>
<body>
	<br><br><br>
	<div class="loginForm">
	<a href="<%=request.getContextPath() %>/index.jsp"><img class="image" src="<%=request.getContextPath() %>/images/logo.png" id="logo" align="center"></a>
	
	<div class="Form">
		<div class="inner">
		
			<div class="Form2">아이디 찾기</div>
			<hr style="border:0.5px solid #929292; margin-top:5px;">
			<p style="font-weight:bold;">가입된 회원님의 아이디</p>
			<p style="color:gray;">고객님의 정보와 일치하는 아이디입니다.</p>
			
			<br>
			<div class="sendIdArea">
				<p style="margin-top:20px">요기에 일치하는 고객 아이디</p>
			</div>
			<br>
			<button class="button button4" onclick="canBtn()">확인</button>
		</div>
	</div>
	</div>
	<script>
		function canBtn(){
			
			location.href = "findId.jsp";
			
		}
	</script>
	

</body>
</html>