 	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kh.MasterPiece.member.model.vo.Member" %>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<%
	Cookie[] cookie = request.getCookies();
	String userId = "";
	if(cookie != null){
		for(int i=0; i<cookie.length; i++){
			if(cookie[i].getName().trim().equals("userId")){
				userId = cookie[i].getValue();
			}
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
	<a href="<%=request.getContextPath() %>/main.jsp"><img class="image" src="<%=request.getContextPath() %>/images/logo.png" id="logo" align="center"></a>
	<% if(loginUser == null){ %>
	<form id="loginForm" action="<%=request.getContextPath() %>/login.me" method="post">
	<table align="center" class="log_tb">
		<tr>
			<td colspan="3"><input style="width:300px; height:30px; text-align:center;" class="form-control" id="userId" name="userId" value="<%= userId %>" placeholder="아이디를 입력하세요"></td>
		</tr>
		<tr>
			<td colspan="3"><input style="width:300px; height:30px; text-align:center;" type="password" class="form-control" id="userPwd" name="userPwd" onkeypress="if(event.keyCode==13){login();}" placeholder="비밀번호를 입력하세요"></td>
		</tr>
		<tr>
			<td style="font-size:13px; height:50px; display:table-cell; vertical-align:middle; text-align:left;">
			<input style="width:20px; height:20px; float:left;margin-top:5px; margin:10px;" type="checkbox" id="checkBtn" name="checkBtn" <% if(userId.length() > 1) out.println("checked"); %>>
				<label for="checkBtn" style="font-size:12px; padding-top: 8px; display: block; margin-top:5px;">아이디 저장</label>
			</td>
			<td colspan="2" style="	padding-right:12px;"><input style="width:70px; height:30px; float:right;" class="btn btn-default" type="button" id="loginBtn" value="로그인" onclick="login()"></td>
		</tr>
		
	</table>
	</form>
		<div class="findAndJoin">
			<a href="<%=request.getContextPath() %>/views/member/findId.jsp">아이디 찾기 │</a>
			<a href="<%=request.getContextPath() %>/views/member/findPass.jsp">비밀번호 찾기 │</a>
			<a href="<%=request.getContextPath() %>/views/member/memberTerms.jsp">회원가입</a>
		</div>
	<% }else{ %>
		
		<script>
			location.href = "/MasterPiece/main.jsp";
		</script>
	<% } %>
	</div>
	<script>
		function login(){
			$("#loginForm").submit();
		}
		
		function logout(){
				
			location.href="/MasterPiece/logout.me";
		}
	
	</script>
</body>
</html>