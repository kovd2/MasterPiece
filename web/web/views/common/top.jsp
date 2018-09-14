<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/***************************** 로고 + 검색창 + 메뉴 (로그인, 회원가입, 고객센터, Q&A)*****************************/
	.main_layer{
		position: relative;
		margin:auto;
		width:1080px;
		height:100%;
	}
	.search {
		position: absolute;
		top: 50%;
		left: 250px;
		/* margin-top: 0px; */
		width: 521px;
	}
	.search .search_window{
		display: inline-block;
		width: 474px;
		height: 41px;
		border: 2px solid #f43641;
		background-color: #fff;
	}
	.search .input_text{
		margin: 11px 0 0 9px;
   		width: 405px;
    	height: 23px;
   	 	outline: 0;
    	border: 0;
    	background-color: transparent;
    	color: #000;
    	font-weight: 700;
    	font-size: 18px;
    	line-height: 23px;
	}
	.search .sch_smit{
    	position: absolute;
    	margin-left:2px;
    	overflow: visible;
    	width: 45px;
    	height: 45px;
    	border: 0;	
    	background: #c70000;
	}
	.search #search_btn{
		color:white;
		width:70px;
		height:45px;
		font-size:15px;
	}
	hr { 
    border-color: #f43641;
	} 
	#top_menu{
		position: absolute;
		width: 500px;
		height: 100px;
		margin-left: 800px;
		margin-top: 43px;
		top: 10px;
	}
	#top_menu ul li{
		float:left;
		border-left:1px solid #999;
    	display:block;
	}
	#top_menu ul li:first-child{
		border-left:none;
	}
	/********************************************************************/
</style>
</head>
<body>
	<!------------------------------- 로고  + 검색창 + 메뉴 (로그인, 회원가입, 고객센터, Q&A) ------------------------------->
	<div class="main_layer">
		<div id="top_logo" class="top_logo">
			<a href="main.html" title="바로가기">
				<img src="../../images/MasterPiece.png" alt="로고" style="padding-top:30px;padding-left:1px;" title="로고" width="230px" height="100px">
			</a>
		</div>
		<div id="search" class="search">
				<span class="search_window">
					<input id="query" name="query" type="text" title="검색어 입력" maxlength="255" class="input_text" tabindex="1" accesskey="s" style="ime-mode:active;" autocomplete="off" onclick="document.getElementById('fbm').value=1;" value="">
				</span>
				<button id="search_btn" type="submit" title="검색" tabindex="3" class="sch_smit" onmouseover="this.className='sch_smit over'" onmousedown="this.className='sch_smit down'" onmouseout="this.className='sch_smit'" onclick="clickcr(this,'sch.action','','',event);">
					<span class="blind">검색</span>
					<span class="ico_search_submit"></span>
				</button>
		</div>
		<div id="top_menu">
			<ul>
				<li class="top_subMenuLogin">
					<a href="http://www.naver.com" title="로그인">
						<img src="../../images/login_off.png" onmouseover="this.src='../../images/login_on.png'" onmouseout="this.src='../../images/login_off.png'" border="0" style="width:90px;height:40px;">
					</a>
				</li>
				<li class="top_subMenuMemberShip">
					<a href="http://www.naver.com" title="회원가입">
						<img src="../../images/membership_off.png" onmouseover="this.src='../../images/membership_on.png'" onmouseout="this.src='../../images/membership_off.png'" border="0" style="width:90px;height:40px;">
					</a>
				</li>
				<li class="top_subMenuService">
					<a href="http://www.naver.com" title="고객센터">
						<img src="../../images/service_off.png" onmouseover="this.src='../../images/service_on.png'" onmouseout="this.src='../../images/service_off.png'" border="0" style="width:90px;height:40px;">
					</a>
				</li>
				<li class="top_subMenuQnA">
					<a href="http://www.naver.com" title="Q&A">
						<img src="../../images/qna_off.png" onmouseover="this.src='../../images/qna_on.png'" onmouseout="this.src='../../images/qna_off.png'" border="0" style="width:90px;height:40px;">
					</a>
				</li>
			</ul>
		</div>
	</div>
	<hr>

</body>
</html>