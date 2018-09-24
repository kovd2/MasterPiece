<%@ page language="java" contentType="text/html; charset=UTF-8"

pageEncoding="UTF-8"%>
<%@ page import="com.kh.MasterPiece.member.model.vo.Member" %>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<style>

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
	border: 2px solid #c70000;
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
	/* margin-left: 2px; */
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
	border-color: #d9534f; margin-bottom: -10px;
}

#top_menu {
	position: absolute;
	width: 403px;
	height: 70px;
	margin-left: 697px;
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
	background-color: #d9534f;
	color:white;
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
ul.mp_menu{ width:182px; box-shadow: 3px 3px 10px #ea4c4c;  /* box-shadow: 3px 3px 10px #b5b5b5; */}
ul.com_menu{ width:173px; box-shadow: 3px 3px 10px #ea4c4c;}
ul.mo_menu{width:173px; box-shadow: 3px 3px 10px #ea4c4c;}
ul.de_menu{width:174px; box-shadow: 3px 3px 10px #ea4c4c;}
ul.cate_menu{width:174px; box-shadow: 3px 3px 10px #ea4c4c;}

.categoryBox_css:hover .mp_menu, .categoryBox_css:hover .com_menu,
	.categoryBox_css:hover .mo_menu, .categoryBox_css:hover .de_menu,
	.categoryBox_css:hover .cate_menu {
	visibility: visible;
}

.mp_menu>li:hover, .com_menu>li:hover, .mo_menu>li:hover, .de_menu>li:hover, .cate_menu>li:hover { font-weight:bold; font-size:15px; color:black;}

.mainBanner {
	z-index: 2;
}

.categoryBox_css ul li {
	/* border-bottom: 1px solid white; */
}

.categoryBox_css ul li:last-child {
	border-bottom: none;
}
</style>
</head>
<body>

<!-- ajax -->
<script>

	
	
	
</script>


	<!------------------------------- 로고  + 검색창 + 메뉴 (로그인, 회원가입, 고객센터, Q&A) ------------------------------->
	<div class="main_layer">
		<div id="top_logo" class="top_logo">
			<a href="<%=request.getContextPath() %>/main.jsp" title="바로가기"> <img
				src="<%=request.getContextPath() %>/images/kimjaeyup/MasterPiece.png" alt="로고"
				style="padding-top: 30px; padding-left: 1px;" title="로고"
				width="200px" height="70px">
			</a>
		</div>
		<div id="search" class="search">
			<span class="search_window">
				<input id="query" name="query" type="text" title="검색어 입력" maxlength="255" class="input_text"
					tabindex="1" accesskey="s" style="ime-mode: active;"
					autocomplete="off" onclick="document.getElementById('fbm').value=1;" value="">
			</span>
			<button id="search_btn" type="submit" title="검색" tabindex="3" class="sch_smit" onmouseover="this.className='sch_smit over'"
				onmousedown="this.className='sch_smit down'" onmouseout="this.className='sch_smit'"
				onclick="clickcr(this,'sch.action','','',event);">
				<span class="blind">검색</span> <span class="ico_search_submit"></span>
			</button>
		</div>
		
		<div id="top_menu">
			<% if(loginUser == null){ %>
		 	 <!-- 로그인 전 메뉴(로그인,회원가입,고객센터,Q&A) -->
			 <ul>
				<li class="top_subMenuLogin" id="login_menu" type="button">
					<a href="<%=request.getContextPath() %>/views/member/login.jsp" title="로그인">
					<img src="<%=request.getContextPath() %>/images/kimjaeyup/login_off.png"
					     onmouseover="this.src='<%=request.getContextPath() %>/images/kimjaeyup/login_on.png'"
					     onmouseout="this.src='<%=request.getContextPath() %>/images/kimjaeyup/login_off.png'"
					     border="0" style="width: 90px; height: 40px;">
					</a>
				</li>
				<li class="top_subMenuMemberShip">
					<a href="<%=request.getContextPath() %>/views/member/memberTerms.jsp" title="회원가입">
						<img src="<%=request.getContextPath() %>/images/kimjaeyup/membership_off.png"
					     onmouseover="this.src='<%=request.getContextPath() %>/images/kimjaeyup/membership_on.png'"
					     onmouseout="this.src='<%=request.getContextPath() %>/images/kimjaeyup/membership_off.png'" border="0"
						style="width: 90px; height: 40px;">
					</a>
				</li>
				<li class="top_subMenuService"><a href="<%=request.getContextPath() %>/views/serviceCenter/serviceCenter.jsp" title="고객센터">
					<img src="<%=request.getContextPath() %>/images/kimjaeyup/service_off.png"
					     onmouseover="this.src='<%=request.getContextPath() %>/images/kimjaeyup/service_on.png'"
						    onmouseout="this.src='<%=request.getContextPath() %>/images/kimjaeyup/service_off.png'" border="0"
						style="width: 90px; height: 40px;">
				</a></li>
				<li class="top_subMenuQnA"><a href="<%=request.getContextPath() %>/views/serviceCenter/serviceCenterQuestionList.jsp" title="Q&A">
				<img src="<%=request.getContextPath() %>/images/kimjaeyup/qna_off.png"
						onmouseover="this.src='<%=request.getContextPath() %>/images/kimjaeyup/qna_on.png'"
						onmouseout="this.src='<%=request.getContextPath() %>/images/kimjaeyup/qna_off.png'" border="0"
						style="width: 90px; height: 40px;">
				</a></li>
			</ul>
			<%}else{ %>
				<!-- 로그인 후 메뉴(마이페이지, 로그아웃, 고객센터, Q&A) -->
			<div id="userInfo" style="margin-top: -40px; margin-left: 40px;">
				<label><%= loginUser.getUserName() %>님의 방문을 환영합니다.</label>
				<li class="top_cart" style="list-style-type: none; display: inline-block;">
				<a href="<%=request.getContextPath() %>/views/mypage/cart/cart_myPage.jsp" title="장바구니" style="color:black; font-size:12px; text-decoration:none">
				<img src="<%=request.getContextPath() %>/images/kimjaeyup/cart.png" style="width:35px; height:35px;">
				장바구니</a></li>
			</div>
			<ul>
				<li class="top_subMenuLogin">
				<a href="<%=request.getContextPath() %>/views/mypage/member/myPage.jsp" title="마이페이지" style="margin-left: -10px;">
				<img src="<%=request.getContextPath() %>/images/kimjaeyup/mypage_off.png"
						onmouseover="this.src='<%=request.getContextPath() %>/images/kimjaeyup/mypage_on.png'"
						onmouseout="this.src='<%=request.getContextPath() %>/images/kimjaeyup/mypage_off.png'" border="0"
						style="width: 90px; height: 40px;">
				</a></li>
				<li class="top_subMenuMemberShip">
				<a title="로그아읏" onclick="logout()">
				<img src="<%=request.getContextPath() %>/images/kimjaeyup/logout_off.png"
						onmouseover="this.src='<%=request.getContextPath() %>/images/kimjaeyup/logout_on.png'"
						onmouseout="this.src='<%=request.getContextPath() %>/images/kimjaeyup/logout_off.png'" border="0"
						style="width: 90px; height: 40px; cursor:pointer;" >
				</a></li>
				<li class="top_subMenuService"><a href="<%=request.getContextPath() %>/views/serviceCenter/serviceCenter.jsp" title="고객센터">
				<img src="<%=request.getContextPath() %>/images/kimjaeyup/service_off.png"
						onmouseover="this.src='<%=request.getContextPath() %>/images/kimjaeyup/service_on.png'"
						onmouseout="this.src='<%=request.getContextPath() %>/images/kimjaeyup/service_off.png'" border="0"
						style="width: 90px; height: 40px;">
				</a></li>
				<li class="top_subMenuQnA"><a href="<%=request.getContextPath() %>/views/serviceCenter/serviceCenterQuestionList.jsp" title="Q&A">
				<img src="<%=request.getContextPath() %>/images/kimjaeyup/qna_off.png"
						onmouseover="this.src='<%=request.getContextPath() %>/images/kimjaeyup/qna_on.png'"
						onmouseout="this.src='<%=request.getContextPath() %>/images/kimjaeyup/qna_off.png'" border="0"
						style="width: 90px; height: 40px;">
				</a></li>
			</ul>
			<%} %>
		</div>
	</div>
	<script>
	function logout(){
		location.href="/MasterPiece/logout.me";
	}
	</script>
	<hr class="hrtop">
	
		<!------------------------------- 카테고리 바 ------------------------------->
	<div class="topContainer">
		<div class="categoryBox">
			<div class="categoryNav" id="categoryNav">
				<div class="categoryBox_css" id="mp" onclick="location.href='<%=request.getContextPath()%>/views/product/product_List.jsp'">
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
						<li onclick="location.href='<%=request.getContextPath()%>/prdPageList.js'">cpu</li>
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
						<li onclick="location.href='<%= request.getContextPath() %>/selectList.qc'">견적 문의</li>
						<li onclick="location.href='<%= request.getContextPath() %>/selectList.ue'">회원 견적</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>