<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kh.MasterPiece.member.model.vo.Member" %>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>MasterPiece, Login</title>
<style>
	.image {
		width: 200px;
		height: 150px;
	}
	
	#naverlogin{
		border-radius:0px;
		background:#009900;
		color:white;
		width:185px;
		height:30px;
		margin:12px;
	}
	
	#userId {
		width:180px;
		height:30px;
		font-size:15px;
		margin:12px;
	}
	
	#userPwd {
		width:180px;
		height:30px;
		font-size:15px;
		margin:12px;
	}
	
	#checkBtn {
		width:15px;
		height:15px;
	}

	.log_tb .find {
		width:65px;
		height:10px;
	}
	
	.loginForm {
		text-align:center;
	}

	#loginBtn {
		background-color: #e7e7e7;
		color: black;
		border-radius:0px;
	}
	
	.find {
		margin:5px;
		padding:5px;
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
	
	

</style>

</head>
<body>
	<br><br><br>
	<div class="loginForm">
	<a href="../../index.jsp"><img class="image" src="../../images/logo.png" id="logo" align="center"></a>
	<% if(loginUser == null){ %>
	<form id="loginForm" action="<%=request.getContextPath() %>/login.me" method="post">
	<table align="center" class="log_tb">
		<tr>
			<td colspan="3"><input style="width:300px; height:30px; text-align:center;" class="form-control" id="userId" name="userId" placeholder="아이디를 입력하세요"></td>
		</tr>
		<tr>
			<td colspan="3"><input style="width:300px; height:30px; text-align:center;" type="password" class="form-control" id="userPwd" name="userPwd" placeholder="비밀번호를 입력하세요"></td>
		</tr>
		<tr>
			<td colspan="3"><input style="width:300px; height:30px; font-size:15px; font-weight:bold;" type="button" id="naverlogin" value="NAVER 로그인" class="btn btn-success"></td>
		</tr>
		<tr>
			<td style="font-size:13px; height:50px; display:table-cell; vertical-align:middle; text-align:left;"><input style="width:20px; height:20px; float:left;margin-top:5px; margin:10px;" type="checkbox" id="checkBtn">
				<span style="font-size:12px; padding-top: 8px; display: block; margin-top:5px;">로그인 상태 유지</span>
			</td>
			<td colspan="2" style="	padding-right:12px;"><input style="width:70px; height:30px; float:right;" class="btn btn-default" type="button" id="loginBtn" value="로그인" onclick="login()"></td>
		</tr>
		
	</table>
	</form>
		<div class="findAndJoin">
			<a href="findId.jsp">아이디 찾기 │</a>
			<a href="findPass.jsp">비밀번호 찾기 │</a>
			<a href="memberTerms.jsp">회원가입</a>
		</div>
	<% }else { %>
		<div id="userInfo">
				<label><%= loginUser.getUserName() %>님의 방문을 환영합니다.</label>
				<div class="btns">
					<div id="changeInfo">정보수정</div>
					<div id="logoutBtn" onclick="logout()">로그아웃</div>
				</div>
			</div>
	
	<% } %>
		
	</div>
	<script>
		function login(){
			$("#loginForm").submit();
		}
		
		function logout(){
				
			location.href="/main/logout.me";
		}
	
	</script>
</body>
</html>