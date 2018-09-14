<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

  <link href='https://cdn.rawgit.com/openhiun/hangul/14c0f6faa2941116bb53001d6a7dcd5e82300c3f/nanumbarungothic.css' rel='stylesheet' type='text/css'>
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <script charset="UTF-8" type="text/javascript" src="http://t1.daumcdn.net/postcode/api/core/180619/1529384927473/180619.js"></script>
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
  <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<title>MasterPiece, join</title>
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
	
	#idCheck, #emailCheck, #ckZip, #goMain, #joinBtn {
		background:#e7e7e7;
		border-radius:5px;
		width:80px;
		height:25px;
		text-align:center;
	}
	#idCheck:hover, #emailCheck:hover, #ckZip:hover, #goMain:hover, #joinBtn {
		cursor:pointer;
	}
	td {
		text-align:center;
	}
	
	#ckZip, #joinBtn {
		background:#e7e7e7;
	}
	
	#joinBtn, #goMain {
		display:inline-block;
	}
	
	.inner {
		width:600px;
		margin:0 auto;
		font-size:37px;
	}
	
	.form-control2{
	    width: 100%;
	    height: 34px;
	    padding: 6px 12px;
	    font-size: 14px;
	    line-height: 1.42857143;
	    color: #555;
	    background-color: #fff;
	    background-image: none;
	    border: 1px solid #ccc;
	    border-radius: 4px;
	}
	

</style>
</head>
<body>
	<br><br><br>
	<div class="loginForm">
	<a href="../../index.jsp"><img class="image" src="../../images/logo.png" id="logo" align="center"></a>
	<form id="joinForm" action="<%=request.getContextPath()%>/insertMember.me" method="post">
			<table align="center">
				<tr>
					<th width="120px" height="40px" float="left">이름</th>
					<td><input type="text" maxlength="13" name="userName" id="userName" class="form-control"></td>
				</tr>
				<tr>
					<th width="100px" height="40px">아이디</th>
					<td><input type="text" maxlength="13" name="userId" id="userId" class="form-control"></td>
					<td width="100px" style="padding-left:10px"><div id="idCheck" style="display: table-cell; vertical-align: middle;">중복확인</div></td>
				</tr>
				<tr>
					<th height="40px">비밀번호</th>
					<td><input type="password" maxlength="13" name="userPwd" class="form-control"></td>
					<td></td>
				</tr>
				<tr>
					<th height="40px">비밀번호 확인</th>
					<td><input type="password" maxlength="13" name="userPwd2" class="form-control"></td>
					<td><label id="pwdResult"></label></td>
				</tr>
				<tr>
					<th height="40px">연락처</th>
					<td>
						<input type="text" maxlength="3" id="phone" name="tel1" style="width:60px" class="form-control2"> - 
						<input type="text" maxlength="4" id="phone" name="tel2" style="width:60px" class="form-control2"> -
						<input type="text" maxlength="4" id="phone" name="tel3" style="width:60px" class="form-control2">
					</td>
				</tr>
				<tr>
					<th height="40px">우편번호</th>
					<td><input type="text" name="address1"  id="address1" class="form-control"></td>
					<td style="padding-left:10px"><div id="ckZip" style="display: table-cell; vertical-align: middle;" onclick="searchAdd()">검색</div></td>
				</tr>
				<tr>
					<th height="40px">주소</th>
					<td><input type="text" name="address2" id="address2" class="form-control"></td>
					<td></td>
				</tr>
				<tr>
					<th height="40px">상세주소</th>
					<td><input type="text" name="address3" id="address3" class="form-control"></td>
					<td></td>
				</tr>
				<tr>
					<th height="40px">이메일</th>
					<td><input type="email" id="email" name="email" class="form-control"></td>
					<td width="100px" style="padding-left:10px"><div id="emailCheck" style="display: table-cell; vertical-align: middle;">중복확인</div></td>
				</tr>
			</table>
			<br>
			<div class="btns" align="center">
				<div id="goMain" style="margin-left:20px; font-size:13px" onclick="goMain()">메인으로</div>&nbsp;
				<div id="joinBtn" style="font-size:13px" onclick="insertMember()" >가입하기</div>
			</div>
			<script>
				function insertMember(){
					$("#joinForm").submit();
				}
					
				function goMain(){
					location.href="<%=request.getContextPath()%>/index.jsp";
				}
				
				function searchAdd() {
					 new daum.Postcode({
				            oncomplete: function(data) {
				                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				 
				                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
				                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
				 
				                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
				                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
				                    extraRoadAddr += data.bname;
				                }
				                // 건물명이 있고, 공동주택일 경우 추가한다.
				                if(data.buildingName !== '' && data.apartment === 'Y'){
				                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				                }
				                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				                if(extraRoadAddr !== ''){
				                    extraRoadAddr = ' (' + extraRoadAddr + ')';
				                }
				                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
				                if(fullRoadAddr !== ''){
				                    fullRoadAddr += extraRoadAddr;
				                }
				 
				                // 우편번호와 주소 정보를 해당 필드에 넣는다.
				                document.getElementById('address1').value = data.zonecode; //5자리 새우편번호 사용
				                document.getElementById('address2').value = fullRoadAddr;
				                /* document.getElementById('address3').value = data.jibunAddress; */
			
				                
				            }
				        }).open();
				    }
				
				$(function(){
					  //id="btn" 클릭시
					  $("#joinBtn").click(function(){
					   //id="text1"이 공백일경우
					   if($('#userName').val()==""){
					    //얼럿으로처리
					    alert("이름을 입력 해 주세요");
					    //id="text1"인 곳으로 커서를 이동
					    $('#userName').focus();
					   
					   }
					   if($('#userId').val()==""){
					    alert("아이디를 입력 해 주세요");
					    $('#userId').focus();
					  
					   }
					   if($('#userPwd').val()==""){
						    alert("비밀번호를 입력 해 주세요");
						    $('#userPwd').focus();
					
					   }
					   if($('#userPwd2').val() != $('#userPwd').val()){
						    alert("입력하신 비밀번호를 확인 해 주세요");
						    $('#userPwd2').focus();
					   }
					   if($('#phone').val()==""){
						    alert("연락처를 입력 해 주세요");
						    $('#phone').focus();
					   }
					   if($('#address1').val()==""){
						    alert("주소를 입력 해 주세요");
						    $('#address1').focus();
					   }
					   if($('#address2').val()==""){
						    alert("주소를 입력 해 주세요");
						    $('#address2').focus();
				 	   }
					   if($('#address3').val()==""){
						    alert("주소를 입력 해 주세요");
						    $('#address3').focus();
					   }
					   if($('#email').val()==""){
						    alert("이메일을 입력 해 주세요");
						    $('#email').focus();
					   }
					});
				});
				
				
				$("#emailCheck").click(function(){
					
					var email = $("#email").val();
					
					$.ajax({
						
						url:"<%=request.getContextPath()%>/emailCheck.do",
						data:{email:email},
						type:"get",
						success:function(data){
							if(data == 0){
								alert("사용 가능한 이메일입니다.");
							}else{
								alert("사용 중인 이메일입니다.");
							}
						}
					});
				});
				
				$("#idCheck").click(function(){
					
					var userId = $("#userId").val();
					
					$.ajax({
						
						url:"<%=request.getContextPath()%>/idCheck.do",
						data:{userId:userId},
						type:"get",
						success:function(data){
							if(data == 0){
								alert("사용 가능한 아이디입니다.");
							}else{
								alert("이미 가입된 아이디입니다.");
							}
						}
					});
				});
			</script>
		</form>
	</div>
	
	<br><br><br><br><br>


</body>
</html>