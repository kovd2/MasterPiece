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

/***************************** 로고 + 검색창 + 메뉴 (로그인, 회원가입, 고객센터, Q&A)*****************************/

.main_layer {
	position: relative;
	margin: auto;
	width: 1080px;
	height: 100%;
}
.search {
	position: absolute;
	top: 50%;
	left: 250px;
	/* margin-top: 0px; */
	width: 521px;
}

.search_window {
	display: inline-block;
	width: 370px;
	height: 40px;
	border: 2px solid #f43641;
	background-color: #fff;
}

.input_text {
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

.sch_smit {
	position: absolute;
	margin-left: 2px;
	overflow: visible;
	width: 45px;
	height: 45px;
	border: 0;
	background: #c70000;
}

#search_btn {
	color: white;
	width: 70px;
	height: 44px;
	font-size: 15px;
}

.hrtop {
	border-color: #f43641;
}

#top_menu {
	position: absolute;
	width: 380px;
	height: 100px;
	margin-left: 720px;
	margin-top: 25px;
	top: 10px;
}

#top_menu ul li {
	float: left;
	border-left: 1px solid #999;
	display: block;
}

#top_menu ul li:first-child {
	border-left: none;
}

/***************************** 카테고리 css*****************************/
.topContainer {
	padding: 8px 10px; 0;
	width: 1080px;
	zoom: 1;
	margin: auto;
}

.categoryBox {
	width: 1080px;
	height: 35px;
}

.categoryNav {
	width: 1080px;
	margin-left: auto;
	margin-right: auto;
}

.categoryBox_css {
	background: #d9534f;
	color: white;
	text-align: center;
	vertical-align: middle;
	display: table-cell;
	width: 250px;
	height: 35px;
	font-size: 14px;
	border-left: 1px solid #e26161;
}

.categoryBox_css:first-child {
	border-left: none;
}

.categoryBox_css:hover {
	background: #d2322d;
	/* color:orangered; */
	/* font-weight:bold; */
	cursor: pointer;
}

#mp {
	border-top-left-radius: 4px;
}

#cate {
	border-top-right-radius: 4px;
}

ul.mp_menu, ul.com_menu, ul.mo_menu, ul.de_menu, ul.cate_menu {
	position: absolute;
	background-color: darkgray;
	list-style-type: none;
	width: 180px;
	visibility: hidden;
	text-align: left;
	margin-top:9px;
	/* line-height:100%; */
	height:auto;
	z-index: 1;
}

ul.mp_menu>li, ul.com_menu>li, ul.mo_menu>li, ul.de_menu>li, ul.cate_menu>li {
	height: 35px;
	margin-top: 15px;
	vertical-align: bottom;
	margin-left: -40px;
	padding-left: 20px;
}
ul.mp_menu{ width:182px;}
ul.com_menu{ width:173px;}
ul.mo_menu{width:173px;}
ul.de_menu{width:174px;}
ul.cate_menu{width:174px;}

.categoryBox_css:hover .mp_menu, .categoryBox_css:hover .com_menu,
	.categoryBox_css:hover .mo_menu, .categoryBox_css:hover .de_menu,
	.categoryBox_css:hover .cate_menu {
	visibility: visible;
}

.mainBanner {
	z-index: 2;
}

.categoryBox_css ul li {
	border-bottom: 1px solid #999;
}

.categoryBox_css ul li:last-child {
	border-bottom: none;
}
  
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


			<a href="mainPage.jsp" title="바로가기"> <img
				src="../../images/MasterPiece.png" alt="로고"
				style="padding-top: 30px; padding-left: 1px;" title="로고"
				width="200px" height="70px">
			</a>
		</div>
		<div id="search" class="search">
			<span class="search_window"> <input id="query" name="query"
				type="text" title="검색어 입력" maxlength="255" class="input_text"
				tabindex="1" accesskey="s" style="ime-mode: active;"
				autocomplete="off" onclick="document.getElementById('fbm').value=1;"
				value="">
			</span>
			<button id="search_btn" type="submit" title="검색" tabindex="3"
				class="sch_smit" onmouseover="this.className='sch_smit over'"
				onmousedown="this.className='sch_smit down'"
				onmouseout="this.className='sch_smit'"
				onclick="clickcr(this,'sch.action','','',event);">
				<span class="blind">검색</span> <span class="ico_search_submit"></span>
			</button>
		</div>
		<div id="top_menu">
			<ul>
				<li class="top_subMenuLogin"><a href="https://www.google.com/"
					title="로그인"> <img src="../../images/login_off.png"
						onmouseover="this.src='../../images/login_on.png'"
						onmouseout="this.src='../../images/login_off.png'" border="0"
						style="width: 83px; height: 40px;">
				</a></li>
				<li class="top_subMenuMemberShip"><a
					href="http://www.naver.com" title="회원가입"> <img
						src="../../images/membership_off.png"
						onmouseover="this.src='../../images/membership_on.png'"
						onmouseout="this.src='../../images/membership_off.png'" border="0"
						style="width: 83px; height: 40px;">
				</a></li>
				<li class="top_subMenuService"><a href="https://www.google.com/"
					title="고객센터"> <img src="../../images/service_off.png"
						onmouseover="this.src='../../images/service_on.png'"
						onmouseout="this.src='../../images/service_off.png'" border="0"
						style="width: 83px; height: 40px;">
				</a></li>
				<li class="top_subMenuQnA"><a href="https://www.google.com/"
					title="Q&A"> <img src="../../images/qna_off.png"
						onmouseover="this.src='../../images/qna_on.png'"
						onmouseout="this.src='../../images/qna_off.png'" border="0"
						style="width: 83px; height: 40px;">
				</a></li>
			</ul>
		</div>
	</div>
	<hr class="hrtop">
		<!------------------------------- 카테고리 바 ------------------------------->
	<div class="topContainer">
		<div class="categoryBox">
			<div class="categoryNav" id="categoryNav">
				<div class="categoryBox_css" id="mp">
					MasterPiece
					<ul class="mp_menu">
						<li onclick="location.href='https://www.google.com/'">게임</li>
						<li onclick="location.href='https://www.google.com/'">인터넷/사무</li>
						<li onclick="location.href='https://www.google.com/'">그래픽</li>
					</ul>
				</div>
				<div class="categoryBox_css" id="com">
					컴퓨터 부품
					<ul class="com_menu">
						<li onclick="location.href='https://www.google.com/'">cpu</li>
						<li onclick="location.href='https://www.google.com/'">메인보드</li>
						<li onclick="location.href='https://www.google.com/'">메모리</li>
						<li onclick="location.href='https://www.google.com/'">그래픽카드</li>
						<li onclick="location.href='https://www.google.com/'">저장 장치</li>
						<li onclick="location.href='https://www.google.com/'">ODD</li>
						<li onclick="location.href='https://www.google.com/'">파워</li>
						<li onclick="location.href='https://www.google.com/'">쿨러</li>
						<li onclick="location.href='https://www.google.com/'">케이스</li>
					</ul>
				</div>
				<div class="categoryBox_css" id="mo">
					모니터
					<ul class="mo_menu">
						<li onclick="location.href='https://www.google.com/'">모니터</li>
						<li onclick="location.href='https://www.google.com/'">모니터 거치대</li>
						<li onclick="location.href='https://www.google.com/'">어댑터</li>
						<li onclick="location.href='https://www.google.com/'">모니터 받침대</li>
					</ul>
				</div>
				<div class="categoryBox_css" id="de">
					주변기기
					<ul class="de_menu">
						<li onclick="location.href='https://www.google.com/'">키보드</li>
						<li onclick="location.href='https://www.google.com/'">마우스</li>
						<li onclick="location.href='https://www.google.com/'">스피커</li>
						<li onclick="location.href='https://www.google.com/'">헤드셋</li>
						<li onclick="location.href='https://www.google.com/'">마우스 패드</li>
					</ul>
				</div>
				<div class="categoryBox_css" id="cate">
					게시판
					<ul class="cate_menu">
						<li onclick="location.href='https://www.google.com/'">공지사항</li>
						<li onclick="location.href='https://www.google.com/'">견적 문의</li>
						<li onclick="location.href='https://www.google.com/'">회원 견적</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

</body>
</html>