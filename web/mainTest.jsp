<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.MasterPiece.product.model.vo.*,
    							com.kh.MasterPiece.board.model.vo.*,
    							com.kh.MasterPiece.admin.model.vo.*"%>
<!DOCTYPE html>
<%
	/* graphic */
	ArrayList<Promotion> list = (ArrayList<Promotion>)request.getAttribute("list");
	HashMap<String, Promotion_ATT> imgList =
					(HashMap<String, Promotion_ATT>)request.getAttribute("imgList");

%>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
</style>
</head>
<body>
	<%@ include file="./views/common/top.jsp"%>
	
	<!--------------------------------------- 메인 배너  --------------------------------------->
	<div class="mainBanner" style="width:100%">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<div class="c_wrap">
		<div class="carousel">
			<ul class="list">
				 <% for(int i = 0; i < imgList.size(); i++){%>
					<li><img src="<%=request.getContextPath() %>/images/product/<%=imgList.get(list.get(i).getPromotion_No()).getChange_name()%>" width="405px;" height="1080px;"></li>
				<%} %>
				<!-- <li class="a1"></li>
				<li class="a2"></li>
				<li class="a3"></li>
				<li class="a4"></li>   -->
			</ul>
		</div>
		<p class="prev"><img src='./images/kimjaeyup/arrow_left.png' style="width:40px; height:50px;"></p>
		<p class="next"><img src='./images/kimjaeyup/arrow_right.png' style="width:40px; height:50px;"></p>
	</div>
	<div class="left_banner">
		<ul style="list-style:none;">
			<li><a href="http://localhost:8001/MasterPiece/"><img src="http://image5.compuzone.co.kr/img/images/main2014/H/LeftTopWingBanner_26096.jpg"></a></li>
			<li><a href="http://localhost:8001/MasterPiece/"><img src="http://image5.compuzone.co.kr/img/images/main2014/H/LeftTopWingBanner_26208.jpg"></a></li>
			<li><a href="http://localhost:8001/MasterPiece/"><img src="http://image5.compuzone.co.kr/img/images/main2014/H/LeftTopWingBanner_26103.jpg"></a></li>
		</ul>
	</div>
 	<div class="right_banner">
		<span>
			<a href="http://localhost:8001/MasterPiece/">
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
	



</body>
</html>























