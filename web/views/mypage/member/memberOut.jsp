<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.MasterPiece.member.model.vo.Member"%>
<%
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script charset="UTF-8" type="text/javascript" src="http://t1.daumcdn.net/postcode/api/core/180619/1529384927473/180619.js"></script>

<style>
	.centerWrapArea {
		display: inline-block;
		width: 79%;
		height: 600px;
		background: white;
		float: right;
		font-family: dotum;
		font-size: 12px;
	}
	
	.center_top_title {
		height: 40px;
		background: white;
		font-size: 28px;
		font-weight: bold;
		padding: 20px 22px;
		color: #000;
	}
	.ml10 {
	    margin-left: 10px !important;
	}
	
	.figure {
		border: 1px solid #ccc;
		padding: 10px;
		width: 915px;
		line-height: 40px;
	}
	
	div, li, dd, dt, table, td {
		word-break: break-all;
		word-wrap: break-word;
	}
	
	div {
		display: block;
	}
	
	.figure>div>.nth-child1 {
		width: 120px;
	}
	
	.figure .info_input {
		padding: 8px 10px;
		border: 1px solid #ccc;
		width: 769px;
		height: 15px;
		line-height: 0px;
	}
	
	.bg_f3f4f6 {
		background-color: #f3f4f6;
	}
	
	input[type="text"], select {
		padding: 0px;
		box-shadow: none;
		border: 1px solid #ccc;
		font-size: 12px;
	}
	
	.section .figure>div>div {
		display: inline-block;
	}
	
	.section .figure {
		border: 1px solid #ccc;
		padding: 10px;
		width: 915px;
		line-height: 40px;
	}
	
	input {
		-webkit-appearance: textfield;
		background-color: white;
		-webkit-rtl-ordering: logical;
		cursor: text;
		padding: 1px;
		border-width: 2px;
		border-style: inset;
		border-color: initial;
		border-image: initial;
	}
	
	.vtop {
		vertical-align: top;
	}
	
	.section .figure .sub_input1_1 {
		width: 150px;
		margin-right: 10px;
		height: 15px;
		line-height: 0px;
		float:left;
	}
	.section .figure .sub_input1_2 {
		width: 230px;
		margin-right: 10px;
		height: 15px;
		line-height: 0px;
		float:left;
	}
	.section .figure .sub_input1_3 {
		width: 190px;
		margin-right: 10px;
		height: 15px;
		line-height: 0px;
		float:left;
	}
	
	
	.section .figure .sub_input2 {
		width: 240px;
		margin-right: 9px;
		height: 15px;
		line-height: 0px;
	
	}
	.no_m {
	    margin: 0px !important;
	}
	
	.btn_124_bg_blue {
		background-color: #454C5F;
		width: 124px;
		padding: 10.5px 0px;
		height: 12px;
		color: #fff;
		text-align: center;
		display: inline-block;
		cursor: pointer;
		line-height: 12px;
	}
	
	.figure .info_select {
		border: 1px solid #ccc;
		width: 237px;
		margin-right: 10px;
		height: 33px;
		line-height: 0px;
	}
	
	select {
		padding-left: 10px !important;
	}
	
	select {
		-webkit-appearance: menulist;
		box-sizing: border-box;
		align-items: center;
		white-space: pre;
		-webkit-rtl-ordering: logical;
		color: black;
		background-color: white;
		cursor: default;
		border-width: 1px;
		border-style: solid;
		border-color: initial;
		border-image: initial;
	}
	
	.section .figure {
		border: 1px solid #ccc;
		padding: 10px;
		width: 915px;
		line-height: 40px;
	}
	
	.figure>div>.nth-child2 {
		width: 790px;
	}
	
	.section .figure .info_mail .info_mail_1 {
		border: 0px;
		height: 30px;
		padding-left: 10px;
		width: 222px;
	}
	
	.section .figure .info_mail {
		border: 1px solid #ccc;
		width: 643px;
		display: inline-block;
		margin-right: 10px;
		height: 33px;
		line-height: 33px;
		float:left;
	}
	
	.figure .info_select2 {
		width: 124px;
		height: 33px;
		border: 1px solid #ccc;
		padding: 0px;
	}
	
	.section .figure_footer {
	    margin-top: 20px;
	    padding-left: 10px;
	    line-height: 20px;
	}
	
	
	.section .figure_footer .info_radio {
	    float: right;
	    margin: 0px 5px 0px 5px;
	}
	
	.section .figure_footer .info_radio .nth-child2 {
	    margin-left: 20px;
	}
	.text-red {
	    color: #e31738;
	}
	input[type="radio" i] {
	    margin: 3px 3px 0px 5px;
	}
	
	input[type="radio" i] {
	    -webkit-appearance: radio;
	    box-sizing: border-box;
	}
	
	input[type="radio" i], input[type="checkbox" i] {
	    background-color: initial;
	    cursor: default;
	    margin: 3px 0.5ex;
	    padding: initial;
	    border: initial;
	}
	
	.section .figure_footer .btn_box {
	    text-align: center;
	    margin-top: 20px;
	}
	
	.btn_140_red {
	    display: inline-block;
	    background-color: #fff;
	    color: #E01737;
	    border: 1px #E01737 solid;
	    height: 12px;
	    font-size: 12px;
	    padding: 9.5px 0px;
	    width: 138px;
	    text-align: center;
	    cursor: pointer;
	    line-height: 12px;
	}
	.btn_140_bg_red {
	    display: inline-block;
	    background-color: #E01737;
	    color: #fff;
	    height: 12px;
	    font-size: 12px;
	    padding: 10.4px 0px;
	    width: 140px;
	    text-align: center;
	    cursor: pointer;
	    line-height: 12px;
	}
</style>


</head>
<body>
	<form id="MemberOutForm" action="<%=request.getContextPath()%>/MemberOut.me" method="post">
	<div class="centerWrapArea">
		<div class="section">
			<div class='figure'>
				<div class="center_top_title" align="left">회원 탈퇴</div>
				<div>
					<div class='nth-child1'>회원아이디</div>
					<div class='nth-child2'>
						<input name="userId" class='info_input bg_f3f4f6'
							 type='text' value="<%= loginUser.getUserId() %>" readonly/>
					</div>
				</div>
				<div>
					<div class='nth-child1 '>비밀번호 입력</div>
					<div class='nth-child2'>
						<input name="userPwd" id="userPwd" class='info_input red_focus' type='password' maxlength="16" />
					</div>
				</div>
				<div>
					<div class='nth-child1 '>비밀번호 확인</div>
					<div class='nth-child2'>
						<input name="userPwd2" id="userPwd2" class='info_input red_focus'
							type='password' maxlength="16" />
					</div>
				</div>
			</div>
				<br><br>
				<div class='btn_box'>
					<span class='btn_140_bg_red' onclick="ByeBye();">탈퇴</span>
				</div>
			</div>
		</div>
	</form>
	<script>
		function ByeBye(){

		   if($('#userPwd').val()==""){
			    alert("비밀번호를 입력 해 주세요");
			    $('#userPwd').focus();
			    return;	
		   }else if($('#userPwd2').val() != $('#userPwd').val()){
			    alert("입력하신 비밀번호를 확인 해 주세요");
			    $('#userPwd2').focus();
			    return;
		   }else{
			   	var trueBye = confirm("정말 탈퇴하시겠습니까?");
			   
			    if(trueBye == true){
			   
			    $("#MemberOutForm").submit();
				  
			    }
		   }

		}

	</script>

</body>
</html>