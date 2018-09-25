<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.MasterPiece.main.model.vo.*, com.kh.MasterPiece.product.model.vo.*,
								com.kh.MasterPiece.product.model.vo.*,
    							com.kh.MasterPiece.board.model.vo.*,
    							com.kh.MasterPiece.main.model.vo.*"%>
<%
	ArrayList<MainTest> list = (ArrayList<MainTest>)request.getAttribute("list");
	/* ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list"); */
	
	/* 모든 상품 */
	ArrayList<Product> list3 = (ArrayList<Product>)request.getAttribute("list3");
	
	/* graphic */
	ArrayList<Product> list1 = (ArrayList<Product>)request.getAttribute("list1");
	HashMap<String, Attachment> imgList =
					(HashMap<String, Attachment>)request.getAttribute("imgList");
	MainPageInfo pi1 = (MainPageInfo)request.getAttribute("pi");
	int listCount1 = pi1.getListCount();
	int currentPage1 = pi1.getCurrentPage();
	int maxPage1 = pi1.getMaxPage();
	int startPage1 = pi1.getStartPage();
	int endPage1 = pi1.getEndPage(); 
	
	/* cpu */
	ArrayList<Product> list2 = (ArrayList<Product>)request.getAttribute("list2");
	MainPageInfo pi2 = (MainPageInfo)request.getAttribute("pi");
	int listCount2 = pi2.getListCount();
	int currentPage2 = pi2.getCurrentPage();
	int maxPage2 = pi2.getMaxPage();
	int startPage2 = pi2.getStartPage();
	int endPage2 = pi2.getEndPage(); 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
/******************************* 메인배너 CSS *******************************/

.list{
	list-style: none;
	margin: 0px;
	padding: 0px;
}

.c_wrap {
	width: 1080px;
	height:450px;
	margin: 0 auto;
	margin-top:-8px;
	position: relative;
	/* border: 2px solid #000; */
}

.carousel {
	/* width: 1080px; */
	/* height:450px; */
	margin: 0 auto;
	overflow: hidden;
	/* border: 2px solid yellowgreen; */
}

.carousel .list {
	width: 4320px;
	margin-left: -1080px;
}

.carousel .list:after {
	content: "";
	display: block;
	clear: both;
}

.carousel .list li {
	float: left;
	height: 450px;
	width: 1080px;
	color: white;
	font-size: 50px;
}

.carousel .list li.a1 { background-image:url('./images/kimjaeyup/test/banner_1.png'); background-repeat: no-repeat;}
.carousel .list li.a2 { background-image:url('./images/kimjaeyup/test/banner_2.png'); background-repeat: no-repeat; }
.carousel .list li.a3 { background-image:url('./images/kimjaeyup/test/banner_3.png'); background-repeat: no-repeat; }
.carousel .list li.a4 { background-image:url('./images/kimjaeyup/test/banner_4.png'); background-repeat: no-repeat; }
	
.prev {
	position: absolute;
	left: 0px;
	top: 50%;
	/* width: 25px;
	height: 50px;
	background-color: #000;
	color: #fff;  */
	margin-top: -25px;
	margin-left:20px;
	opacity: 0.5;
}

.next {
	position: absolute;
	right: 0px;
	top: 50%;
	/* width: 25px;
	height: 50px;
	background-color: #000;
	color: #fff; */
	margin-top: -25px;
	margin-right:20px;
	opacity: 0.5;
}
.prev:hover{opacity: 1.0;}
.next:hover{opacity: 1.0;}

/******************************* 상품 CSS *******************************/
.productList{ width:1080px; /* border:2px solid red; */}
a{ text-decoration:none }
.product_best{width:480px; height:280px; /* border:1px solid black; */ margin-left:5px;}
.product_sale{width:480px; height:280px; /* border:1px solid black; */ margin-left:77px;}
.product_1{ padding-top: 6px; display: inline-block;}
.product_mp1{ width:260px; height:330px; /* border:1px solid black; */ margin-left:5px; text-align:center; padding-top: 5px; background:white;}
.product_mp2{ width:260px; height:330px; /* border:1px solid black; */ margin-left:5px; text-align:center; padding-top: 5px; background:white;}
.product_mp3{ width:260px; height:330px; /* border:1px solid black; */ margin-left:5px; text-align:center; padding-top: 5px; background:white;}
.product_mp4{ width:260px; height:330px; /* border:1px solid black; */ margin-left:5px; text-align:center; padding-top: 5px; background:white;}
.product_2{ padding-top:8px; display:inline-block; }
.product_graphic1{ width:350px; height:300px; /* border:1px solid black; */ margin-left:2px;text-align:center; padding-top: 5px; background:white;}
.product_graphic2{ width:350px; height:300px; /* border:1px solid black; */ margin-left:2px;text-align:center; padding-top: 5px; background:white;}
.product_graphic3{ width:350px; height:300px; /* border:1px solid black; */ margin-left:2px;text-align:center; padding-top: 5px; background:white;}
.product_3{ padding-top:8px; display: inline-block; border: 1px solid red;}
.product_monitor1{ width:350px; height:300px; /* border:1px solid black; */ margin-left:5px; text-align:center; padding-top: 5px; background:white;}
.product_monitor2{ width:350px; height:300px; /* border:1px solid black; */ margin-left:6px;text-align:center; padding-top: 5px; background:white;}
.product_monitor3{ width:350px; height:300px; /* border:1px solid black; */ margin-left:6px;text-align:center; padding-top: 5px; background:white;}
.product_4{ padding-top:8px; display: inline-block;}
.product_mp1:hover, .product_mp2:hover, .product_mp3:hover, .product_mp4:hover,
.product_graphic1:hover, .product_graphic2:hover, .product_graphic3:hover,
.product_monitor1:hover, .product_monitor2:hover, .product_monitor3:hover{ box-shadow: 3px 3px 10px #b5b5b5;}	

.product_comment{font-size: 15px; font-weight:bold; letter-spacing: -2px;}
.product_name{font-size: 12px;}
.product_btm1{font-size:13px; font-weight:bold; letter-spacing: -2px; padding-right: 5px}
.product_btm2{font-size:17px; font-weight:bold; color: #ee2929; letter-spacing: -2px;}
.product_hr{border-color: #efefef42;}

.product_gcomment{font-size: 15px; font-weight:bold; letter-spacing: -2px;}
.product_gname{font-size: 12px;}
.product_gbtm1{font-size:13px; font-weight:bold; letter-spacing: -2px; padding-right: 5px}
.product_gbtm2{font-size:17px; font-weight:bold; color: #ee2929; letter-spacing: -2px;}


/* 상품 리스트 */
.imageArea {display: inline-block;}
.imageList{ display: inline-block; margin: 4.5px; background:white;}
.imageList:hover{ box-shadow: 3px 3px 10px #b5b5b5; }
.imageArea2 {display: inline-block;}
.imageList2{ display: inline-block; margin: 4.5px; background:white;}
.imageList2:hover{ box-shadow: 3px 3px 10px #b5b5b5; }


/* 1경품 2리뷰 3무료배송 4사은품  5이용후기 6특가 */
.product_event1{background-image:url('./images/kimjaeyup/경품.png'); width:28px; height:28px; text-indent:-10000px; float:right; margin-right: 1px; }
.product_event2{background-image:url('./images/kimjaeyup/리뷰.png'); width:28px; height:28px; text-indent:-10000px; float:right; margin-right: 1px; }
.product_event3{background-image:url('./images/kimjaeyup/무료배송.png'); width:28px; height:28px; text-indent:-10000px; float:right; margin-right: 1px; }
.product_event4{background-image:url('./images/kimjaeyup/사은품.png'); width:28px; height:28px; text-indent:-10000px; float:right; margin-right: 1px; }
.product_event5{background-image:url('./images/kimjaeyup/이용후기.png'); width:28px; height:28px; text-indent:-10000px; float:right; margin-right: 1px; }
.product_event6{background-image:url('./images/kimjaeyup/특가.png'); width:28px; height:28px; text-indent:-10000px; float:right; margin-right: 1px; }

#footerCenter, #footerDeposit, #footerAs, #footerQuick{cursor:pointer;}

.product_subBest1{ margin-left:-90px;/* font-family: Noto-M; *//* 글꼴 */ font-size: 24px; padding-left:5px; letter-spacing: -2px; color: black; font-weight:bold;}
.product_subBest2{ font-size: 13px; letter-spacing: -1.5px; margin-left: 5px; color: #5d5d5d; }
.product_subSale1{ margin-left:220px;/* font-family: Noto-M; *//* 글꼴 */ font-size: 24px; padding-left:5px; letter-spacing: -2px; color: black; font-weight:bold;}
.product_subSale2{ font-size: 13px; letter-spacing: -1.5px; margin-left: 5px; color: #5d5d5d; }
.product_subMp1{ /* font-family: Noto-M; *//* 글꼴 */ font-size: 24px; padding-left:5px; letter-spacing: -2px; color: #d9534f; font-weight:bold;}
.product_subMp2{ font-size: 13px; letter-spacing: -1.5px; margin-left: 5px; color: #5d5d5d;}
.product_subGh1{ /* font-family: Noto-M; *//* 글꼴 */ font-size: 24px; padding-left:5px; letter-spacing: -2px; color: black; font-weight:bold;}
.product_subMo1{ /* font-family: Noto-M; *//* 글꼴 */ font-size: 24px; padding-left:5px; letter-spacing: -2px; color: black; font-weight:bold;}

.productContainer{width:100%;background:#efefef; padding-bottom: 40px;}

.mainHr{border-color: #f43641;}

	/* 고객센터 CSS */
	.information{
	width: 100%;
    background: white;
	}
	/* 팝업창 css */
	#popupDiv {  
    top : 0px;
    position: absolute;
    width: 1080px;
    height: 500px;
    display: none; 
    }
    
    #popup_mask { /* 팝업 배경 css */
        position: fixed;
        width: 100%;
        height: 100%;
        top: 0px;
        left: 0px;
         display: none; 
         background-color:#000;
         opacity: 0.5;
    }
    #closePicture:hover
    {
    cursor:pointer;
    }
    
.view {width: 466px;height: 287px;text-align: center;overflow: hidden;float: left;position: relative;cursor: default;}
.view .mask {	left: 0px; top: 0px; width: 466px; height: 287px; overflow: hidden; position: absolute;}
.view .product_content {	left: 0px; top: 0px; width: 466px; height: 287px; overflow: hidden; position: absolute;}
.view .viewContent {	margin: 0px auto;	margin-top:-10px;height: 73px; text-align: center; color: rgb(255, 255, 255); overflow: hidden; font-size: 12px; margin-bottom: 0px; position: relative;}
.view a.info {	 padding: 7px 15px;line-height:17px;height:15px; color: white; font-size: 12px; text-decoration: none; float: left;border:1px solid white;}
.view-show img {	transition:0.2s ease-in; -webkit-transition: all 0.2s ease-in; -moz-transition: all 0.2s ease-in; -o-transition: all 0.2s ease-in;}
.view-show .mask {	width:500px;padding: 60px;transition:0.2s ease-in-out;height: 550px;opacity: 0;transform: translate(265px, 145px);background-color: rgba(48, 47, 47, 0.7); -webkit-transition: all 0.2s ease-in-out; -moz-transition: all 0.2s ease-in-out; -webkit-transform: translate(265px, 145px); -moz-transform: translate(265px, 145px); -o-transition: all 0.2s ease-in-out; -o-transform: translate(265px, 145px);}
.view-show .productName {	margin: 40px auto;	margin-top:90px;	width:300px;	background:none; transition:0.2s ease-in-out; border-bottom-color: rgba(0, 0, 0, 0.3); border-bottom-width: 1px; border-bottom-style: solid; transform: translate(200px, -200px); -webkit-transition: all 0.2s ease-in-out; -moz-transition: all 0.2s ease-in-out; -webkit-transform: translate(200px, -200px); -moz-transform: translate(200px, -200px); -o-transition: all 0.2s ease-in-out; -o-transform: translate(200px, -200px);color:white;font-size:13px;}
.view-show .viewContent {	margin-bottom:30px;	font-weight:bold;	font-size:13px;transition:0.2s ease-in-out; transform: translate(-200px, 200px); -webkit-transition: all 0.2s ease-in-out; -moz-transition: all 0.2s ease-in-out; -webkit-transform: translate(-200px, 200px); -moz-transform: translate(-200px, 200px); -o-transition: all 0.2s ease-in-out; -o-transform: translate(-200px, 200px);}
.view-show a.info {	margin-top:-50px;	margin-left: 180px;;	transition:0.2s ease-in-out 0.1s; transform: translate(0px, 100px); -webkit-transition: all 0.2s 0.1s ease-in-out; -moz-transition: all 0.2s 0.1s ease-in-out; -webkit-transform: translate(0px, 100px); -moz-transform: translate(0px, 100px); -o-transition: all 0.2s 0.1s ease-in-out; -o-transform: translate(0px, 100px);}
.view-show:hover .mask {	opacity: 1; transform: translate(-80px, -125px) rotate(45deg); -webkit-transform: translate(-80px, -125px) rotate(45deg); -moz-transform: translate(-80px, -125px) rotate(45deg); -o-transform: translate(-80px, -125px) rotate(45deg);}
.view-show:hover .productName {	transform: translate(0px, 0px); transition-delay: 0.3s; -webkit-transform: translate(0px, 0px); -moz-transform: translate(0px, 0px); -o-transform: translate(0px, 0px); -webkit-transition-delay: 0.3s; -moz-transition-delay: 0.3s; -o-transition-delay: 0.3s;}
.view-show:hover .viewContent {	text-align:center;width:400px;transform: translate(0px, 0px); transition-delay: 0.4s; -webkit-transform: translate(0px, 0px); -moz-transform: translate(0px, 0px); -o-transform: translate(0px, 0px); -webkit-transition-delay: 0.4s; -moz-transition-delay: 0.4s; -o-transition-delay: 0.4s;}
.view-show:hover a.info {	transform: translate(0px, 0px); transition-delay: 0.5s; -webkit-transform: translate(0px, 0px); -moz-transform: translate(0px, 0px); -o-transform: translate(0px, 0px); -webkit-transition-delay: 0.5s; -moz-transition-delay: 0.5s; -o-transition-delay: 0.5s;}
.left_banner{width:105px; left:30px; top:140px; position: absolute;}
.right_banner{width: 105px; top:151px; left:1341px; position: absolute;}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

	<%@ include file="./views/common/top.jsp"%>
	
	<!--------------------------------------- 메인 배너  --------------------------------------->
	<div class="mainBanner" style="width:100%">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<div class="c_wrap">
		<div class="carousel">
			<ul class="list">
				<li class="a1"></li>
				<li class="a2"></li>
				<li class="a3"></li>
				<li class="a4"></li>
			</ul>
		</div>
		<p class="prev"><img src='./images/kimjaeyup/arrow_left.png' style="width:40px; height:50px;"></p>
		<p class="next"><img src='./images/kimjaeyup/arrow_right.png' style="width:40px; height:50px;"></p>
	</div>
	<div class="left_banner">
		<ul style="list-style:none;">
			<li><a href="http://google.co.kr"><img src="http://image5.compuzone.co.kr/img/images/main2014/H/LeftTopWingBanner_26096.jpg"></a></li>
			<li><a href="http://google.co.kr"><img src="http://image5.compuzone.co.kr/img/images/main2014/H/LeftTopWingBanner_26208.jpg"></a></li>
			<li><a href="http://google.co.kr"><img src="http://image5.compuzone.co.kr/img/images/main2014/H/LeftTopWingBanner_26103.jpg"></a></li>
		</ul>
	</div>
 	<div class="right_banner">
		<span>
			<a href="../event_zone/eventzone_view.htm?EventNo=17607&amp;bannerid=LeftTopWingBanner">
				<img src='./images/kimjaeyup/right_banner.jpg'>
			</a>
		</span>
	</div> 
	</div>
	
	<!--------------------------------------- 메인 배너 스크립트 --------------------------------------->
	<script>
	var auto = setInterval(function(){
   		$('.list').stop().animate({'margin-left':'0px'},function(){
           $('.list>li').eq(2).prependTo('.list');
           $('.list').css({'margin-left':'-1080px'});
       });
   },4000);
	$(document).ready(function() {
	  $('.prev').click(function() {
	    $('.list').stop().animate({
	      'margin-left': '-2160px'
	    }, function() {
	      $('.list li:first-child').appendTo('.list');
	      $('.list').css({
	        'margin-left': '-1080px'
	      });
	    });
	  });
	  $('.next').click(function() {
	    $('.list').stop().animate({
	      'margin-left': '0px'
	    }, function() {
	      $('.list li:last-child').prependTo('.list');
	      $('.list').css({
	        'margin-left': '-1080px'
	      });
	    });
	  });
	  /* 마우스 올렸을때 캐러셀 자동 멈춤 */
	   $('.carousel').mouseenter(function(){
	        clearInterval(auto);  
	   });
	   
	   /* 마우스 내렸을때 캐러셀 자동 다시실행 */
	   $('.carousel').mouseleave(function(){
	        auto = setInterval(function(){
	         		$('.list').stop().animate({'margin-left':'0px'},function(){
	           $('.list>li').eq(2).prependTo('.list');
	           $('.list').css({'margin-left':'-1080px'});
	        });
	    },4000);
	   });
	});
	</script>
	
		<br>
		<!--------------------------------------- 상품 목록  --------------------------------------->
		<div class="productContainer" align="center"  style="margin-top: 30px;">
		<div class="productList"><br>
			<span class="product_subBest1">추천상품</span>
			<span class="product_subBest2">할인, 행사, 독점판매 등 혜택이 있는 상품을 추천합니다.</span>
			<span class="product_subSale1">특가세일</span>
			<span class="product_subSale2">일정 기간동안 할인된 가격의 상품을 구매할 수 있습니다.</span>
			<div class="product_1">
				<!-- <link rel="stylesheet" type="text/css" href="/main/css/index_renew_addmask.css?t=godo150414" media="all"> -->
				<div class="view view-show" style="margin-right:140px;">
					<img src="./images/kimjaeyup/best.jpg" width="466" height="287" >
						<div class="mask"></div>
						<div class="product_content">
						<p class="productName">기가바이트 Z370 AORUS Ultra Gaming 2.0 제이씨현 [일반/LGA1151v2/DDR4]</p>
						<p class="viewContent">229,000 원</p>
						<p class="viewDetail">
							<a class="info" href="http://www.google.co.kr"title="">자세히 보기 &gt;</a>
						</p>
					</div>
				</div>
				<div class="view view-show">
					<img src="./images/kimjaeyup/sale.jpg" width="466" height="287">
						<div class="mask"></div>
						<div class="product_content">
						<p class="productName">AORUS ROG STRIX 3D프린팅 친화적인 설계, <br>Aura RGB 조명</p>
						<p class="viewContent">375,000 원</p>
						<p class="viewDetail">
							<a class="info" href="http://www.google.co.kr"title="">자세히 보기 &gt;</a>
						</p>
					</div>
				</div>
			</div><br><br><br>
			<div align="left">
				<!-- MasterPiece 글씨 좌측 정렬 -->
				<span class="product_subMp1">MasterPiece PC</span>
				<span class="product_subMp2">당사에서 제작한 걸작을 만나보실 수 있습니다.</span><br>
				<div class="product_2">
					<div class="product_mp1 product_2" style="cursor: pointer;" title="MasterPiece PC" onclick="location.href='http://www.google.co.kr'" >
						<img src="./images/kimjaeyup/mp1.png" style="width: 200px; height: 220px;"> <br>
						<span class="product_comment">비주얼도 성능도 만족하는 조립PC!</span><br>
						<span class="product_name">[MasterPiece] 추천 조립PC! <%=list.get(0).getPrdName()%></span><br><hr class="product_hr">
						<span class="product_btm1">판매가격 </span>
						<span class="product_btm2"><%=list.get(0).getPrice() %>원</span>
						<span class="product_event1" style="margin-right:10px;">경품</span>
						<span class="product_event4">사은품</span>
						<span class="product_event3">무료배송</span>
					</div>
					<div class="product_mp2 product_2" style="cursor: pointer;" title="MasterPiece PC" onclick="location.href='http://www.google.co.kr'">
						<img src="./images/kimjaeyup/mp2.png" style="width: 200px; height: 220px;"> <br>
						<span class="product_comment">비주얼도 성능도 만족하는 조립PC!</span><br>
						<span class="product_name">[MasterPiece] 추천 조립PC! <%=list.get(1).getPrdName() %></span><br><hr class="product_hr">
						<span class="product_btm1">판매가격 </span>
						<span class="product_btm2"><%=list.get(1).getPrice() %>원</span>
						<span class="product_event4" style="margin-right:10px;">사은품</span>
						<span class="product_event3">무료배송</span>
					</div>
					<div class="product_mp3 product_2" style="cursor: pointer;" title="MasterPiece PC" onclick="location.href='http://www.google.co.kr'">
						<img src="./images/kimjaeyup/mp3.png" style="width: 200px; height: 220px;"> <br>
						<span class="product_comment"">비주얼도 성능도 만족하는 조립PC!</span><br>
						<span class="product_name">[MasterPiece] 추천 조립PC! <%=list.get(2).getPrdName() %></span><br><hr class="product_hr">
						<span class="product_btm1" style="text-decoration: line-through;">1,230,000원 </span>
						<span class="product_btm2"><%=list.get(2).getPrice() %>원</span>
						<span class="product_event6" style="margin-right:10px;">특가</span>
						<span class="product_event3">무료배송</span>
					</div>
					<div class="product_mp4 product_2" style="cursor: pointer;" title="MasterPiece PC" onclick="location.href='http://www.google.co.kr'">
						<img src="./images/kimjaeyup/mp4.png" style="width: 200px; height: 220px;"> <br>
						<span class="product_comment"">비주얼도 성능도 만족하는 조립PC!</span> <br>
						<span class="product_name">[MasterPiece] 추천 조립PC! <%=list.get(3).getPrdName() %></span><br><hr class="product_hr">
						<span class="product_btm1" style="text-decoration: line-through;">1,100,000원 </span>
						<span class="product_btm2"><%=list.get(3).getPrice() %>원</span>
						<span class="product_event6" style="margin-right:10px;">특가</span>
						<span class="product_event3">무료배송</span>
					</div>
				</div>
			</div><br><br><br>
			
			<!------------------------------- 그래픽카드 ------------------------------->
			<div align="left">
				<span class="product_subGh1">그래픽카드</span>
				<span class="product_subMp2">이전과는 다르다. 더욱 더 강력해진 성능</span><br>
				<div class="imageArea">
				<% for(int i = 0; i < list1.size(); i++){
						Product pro = list1.get(i);
						String key = pro.getPrd_code();
						Attachment ath = imgList.get(key);

				%>
		
			 	<div class="imageList" align="center">
			 		<div style="width:345px; height:300px;">
			 			<img src="<%=request.getContextPath() %>/images/product/<%=ath.getChangeName()%>"
			 						width="200px" height="200px" style="margin-top:15px;"><br>
		 				<span><%=list1.get(i).getPrd_name()%></span><br><hr class="product_hr">
		 				<span>판매가격</span>
		 				<span><%=list1.get(i).getPrice() %>원</span>
		 			</div>
			 	</div>
				<%} %>
				</div>
				<div>
					 <div class="pageArea" align="center">
		 
						 <% for(int p = startPage1; p <= maxPage1; p++){ %>
		 			
		 						<button class="thisBtn1" value=<%=p %>><%= p %></button>
						 <% 	} %>
		 
					 </div>
				</div>
			</div><br><br><br>
			
			<!------------------------------- CPU ------------------------------->
			<div align="left">
				<span class="product_subGh1">CPU</span>
				<span class="product_subMp2">기존 제품의 성능을 뛰어 넘는 강력함!</span><br>
				<div class="imageArea2">
				<% for(int i = 0; i < list2.size(); i++){
						Product pro = list2.get(i);
						String key = pro.getPrd_code();
						Attachment ath = imgList.get(key);
				%>
		
			 	<div class="imageList2" align="center">
			 		<div style="width:345px; height:300px;">
			 			<img src="<%=request.getContextPath() %>/images/product/<%=ath.getChangeName()%>"
			 						width="200px" height="200px" style="margin-top:15px;"><br>
		 				<span><%=list2.get(i).getPrd_name()%></span><br><hr class="product_hr">
		 				<span>판매가격</span>
		 				<span><%=list2.get(i).getPrice() %>원</span>
		 			</div>
			 	</div>
				<%} %>
				</div>
				<div>
					 <div class="pageArea" align="center">
		 
						 <% for(int p = startPage2; p <= maxPage2; p++){ %>
		 			
		 						<button class="thisBtn2" value=<%=p %>><%= p %></button>
						 <% 	} %>
		 
					 </div>
				</div>
			
			
			<!-- <div align="left">
				<span class="product_subMo1">CPU</span>
				<span class="product_subMp2">기존 제품의 성능을 뛰어 넘는 강력함!</span><br>
				<div class="product_4">
					<div class="product_monitor1 product_4" style="cursor: pointer;" title="모니터" onclick="location.href='http://www.google.co.kr'">
						<img src="./images/kimjaeyup/monitor4.jpg" style="width: 200px; height: 200px;"><br>
						<span class="product_comment"">[LG전자] LG모니터 32MP58HQ</span> <br>
						<span class="product_name">32형(80cm) LED LCD(와이드) / IPS패널 / 1920*1080 / 1,200:1 </span><br><hr class="product_hr">
						<span class="product_btm1">판매가격 </span>
						<span class="product_btm2">277,000원</span>
						<span class="product_event3" style="margin-right:10px;">무료배송</span>	
					</div>
					<div class="product_monitor2 product_4" style="cursor: pointer;" title="모니터" onclick="location.href='http://www.google.co.kr'">
						<img src="./images/kimjaeyup/monitor5.jpg" style="width: 200px; height: 200px;"><br>
						<span class="product_comment"">[삼성전자] 삼성모니터 LS27F350F[무결점]</span> <br>
						<span class="product_name">27형(68.6cm) LED(와이드) / PLS패널 / 1920*1080 / 1,000:1 </span><br><hr class="product_hr">
						<span class="product_btm1">판매가격 </span>
						<span class="product_btm2">199,000</span>
						<span class="product_event3" style="margin-right:10px;">무료배송</span>
						<span class="product_event4">사은품</span>
					</div>
					<div class="product_monitor3 product_4" style="cursor: pointer;" title="모니터" onclick="location.href='http://www.google.co.kr'">
							<img src="./images/kimjaeyup/monitor6.jpg" style="width: 200px; height: 200px;"><br>
						<span class="product_gcomment"">[한성컴퓨터] ULTRON 2757C 커브드 144HZ [무결점]</span><br>
						<span class="product_gname">27형(68.6cm) LED LCD(와이드) / PVA패널 / 1920*1080</span><br><hr class="product_hr">
						<span class="product_gbtm1" style="text-decoration: line-through;">279,000 </span>
						<span class="product_gbtm2">259,000원</span>
						<span class="product_event2" style="margin-right:10px;">리뷰</span>
						<span class="product_event6">특가</span>
					</div>
				</div>
			</div> -->
		</div>
	</div>
		
		<br>
		<hr class="mainHr">
		<!--------------------------------------- 하단 고객센터  --------------------------------------->
		<div class="information" align="center">
			<img  src="./images/kimjaeyup/information_1.gif" usemap="#informationFooter">
			<map name="informationFooter">
				<area shape="rect" coords="0,153,174,186" id="question" href="http://www.google.co.kr" title="1:1 상담센터">
				<area shape="rect" coords="207,153,381,186" id="road" href="http://www.google.co.kr" title="찾아오시는길">
				<area shape="rect" coords="412,153,588,187" id="road" href="http://www.google.co.kr" title="찾아오시는길">
				<area shape="rect" coords="641,50,756,192" id="delivery" href="http://www.google.co.kr" title="운송수단 마감시간">
				<area shape="rect" coords="785,49,901,191" id="bank" href="http://www.google.co.kr" title="입금계좌안내">
				<area shape="rect" coords="928,50,1042,192" id="ASsenter" href="http://www.google.co.kr" title="A/S이용안내">
			</map>
		</div>

	<!--------------------------------------- Modal(광고팝업) --------------------------------------->
	<div id="popup_mask"></div>
	<div id="popupDiv">

		<div style="margin-left: 1200px; margin-bottom: -110px; opacity: 0.6; width: 32px; height: 32px; " id="closePicture" >
			<img src="<%=request.getContextPath() %>/images/kimjaeyup/X1.png" title="창닫기">
		</div>
		<form name="pop_form">
				<div id="check" style=" margin-left: 500px; margin-top: 100px; color:white; font-size:18px;">
					<input type="checkbox" name="chkbox" value="checkbox" style="margin-right:5px; width:15px; height:15px;" id="chkbox">
					<label for="chkbox" style="cursor:pointer">오늘 하루 안보기</label>
				</div>
				<div id="close" style="margin-top: -23px; margin-left: 675px;">
					<a href="javascript:closePop();" style="font-weight:bold;">닫기</a>
				</div>
			</form>
		<br>
		<br>
		<div class="modalContainer" style="width: 100%;">
			<div id="myCarousel" style="position: unset;" class="carousel slide" data-ride="carousel" align="center">
				<div class="carousel-inner">
					<div class="item active" style="margin-top: 20px; margin-bottom: 20px;">
						<img src="./images/kimjaeyup/intro.png"  alt="Los Angeles">
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	$(".thisBtn1").click(function(){
		var cp = $(this).val();

		 $.ajax({
			url: "selectMain.tn",
			data : {cp:cp},
			type : "get",
			success:function(data){
				var path = "images/product";
				
				$(".imageArea").children("div.imageList").remove();
				for(var i = 0; i < data.list.length; i++){
					$div = $("<div class='imageList'align='center'style='width: 350px; height:300px; display: inline-block; margin: 4.5px;'>");
					$(".imageArea").append($div);
					
					$div2 = $("<div style='width:350px; height:300px;'>");						
					$div.append($div2);
					$div2.append("<img src='"+path+"/"+data.imgList[data.list[i].prd_code].changeName+"' width='200px' height='200px' style='margin-top:15px;'>"); 
					$span1 = $("<br><span style='font-weight:13px;'>");
					$span2 = $("<br><span style='font-color:red;'><hr class='product_hr'>");
					$span1.append(data.list[i].prd_name)
					$span2.append("판매가격 " + data.list[i].price + "원")
					$div2.append($span1);
					$div2.append($span2);
					
					console.log(data);
					console.log(data.list[i].price);
					console.log(data.imgList[data.list[i].prd_code].changeName);
				}
				
				console.log(path);	
			}
		}); 
	});

	$(".thisBtn2").click(function(){
		var cp = $(this).val();

		 $.ajax({
			url: "selectMain2.tn",
			data : {cp:cp},
			type : "get",
			success:function(data){
				var path = "images/product";
				
				$(".imageArea2").children("div.imageList2").remove();
				for(var i = 0; i < data.list.length; i++){
					$div = $("<div class='imageList2'align='center'style='width: 350px; height:300px; display: inline-block; margin: 4.5px;'>");
					$(".imageArea2").append($div);
					
					$div2 = $("<div style='width:350px; height:300px;'>");						
					$div.append($div2);
					$div2.append("<img src='"+path+"/"+data.imgList[data.list[i].prd_code].changeName+"' width='200px' height='200px' style='margin-top:15px;'>"); 
					$span1 = $("<br><span style='font-weight:13px;'>");
					$span2 = $("<br><span style='font-color:red;'><hr class='product_hr'>");
					$span1.append(data.list[i].prd_name)
					$span2.append("판매가격 " + data.list[i].price + "원")
					$div2.append($span1);
					$div2.append($span2);
					
					console.log(data);
					console.log(data.list[i].price);
					console.log(data.imgList[data.list[i].prd_code].changeName);
				}
				
				console.log(path);	
			}
		}); 
	});
		 $(document).ready(function() {
			$("#popupDiv").css({"top" : "100px","width" : "100%","position" : "fixed"
			//팝업창을 가운데로 띄우기 위해 현재 화면의 가운데 값과 스크롤 값을 계산하여 팝업창 CSS 설정
			});
	
			$("#popup_mask").css("display", "block"); //팝업 뒷배경 display block
			$("#popupDiv").css("display", "block"); //팝업창 display block
	
			/* $("body").css("overflow", "hidden");  *///body 스크롤바 없애기
	
			$("#closePicture").click(function(event) {
				$("#popup_mask").css("display", "none"); //팝업창 뒷배경 display none
				$("#popupDiv").css("display", "none"); //팝업창 display none
				/* $("body").css("overflow", "auto"); //body 스크롤바 생성 */
			});
		});
	</script>
	
	<!-- 오늘 하루 팝업 안보기 -->
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script language="JavaScript">
	<!--
		function setCookie(name, value, expiredays) {
			var todayDate = new Date();
			todayDate.setDate(todayDate.getDate() + expiredays);
			document.cookie = name + "=" + escape(value) + "; path=/; expires="
					+ todayDate.toGMTString() + ";"
		}
		function closePop() {
			if (document.pop_form.chkbox.checked) {
				setCookie("maindiv", "done", 1);
			}
			document.all['popup_mask'].style.visibility = "hidden";
			document.all['popupDiv'].style.visibility = "hidden";
		}
	//-->
	</script>
	<script language="Javascript">
		cookiedata = document.cookie;
		if (cookiedata.indexOf("maindiv=done") < 0) {
			document.all['popup_mask'].style.visibility = "visible";
			document.all['popupDiv'].style.visibility = "visible";
		} else {
			document.all['popup_mask'].style.visibility = "hidden";
			document.all['popupDiv'].style.visibility = "hidden";
		}
	</script>
	
	<!--------------------------------------- footer include  --------------------------------------->
		<%@ include file="./views/common/footer.jsp"%>
</body>
</html>

























