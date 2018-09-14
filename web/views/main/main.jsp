<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
	/* 컨테이너 가로 사이즈 1280 */
	/* .container{
		padding:8px 10px; 0;
		width:1280px;
		align:center;
		zoom:1;
	} */
	
	
	#popupDiv {  /* 팝업창 css */
    top : 0px;
    position: absolute;
    width: 1080px;
    height: 500px;
    display: none; 
    }
    
    #popup_mask { /* 팝업 배경 css */
        position: fixed;
        width: 100%;
        height: 1000px;
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
	
</style>
</head>
<body>
<%@ include file="../common/top.jsp" %>
	<div class="container">
	
	</div>

	<!-- Modal(광고팝업) -->
    <div id ="popup_mask" ></div> <!-- 팝업 배경 DIV --> 
    <div id="popupDiv"> <!-- 팝업창 -->
    	<div style="margin-left:50px;" id="closePicture">
    		<img src="../../images/X.png">
    	</div>
        <div class="modalContainer" style="width:100%;">
		  <div id="myCarousel" style="position:unset;" class="carousel slide" data-ride="carousel" align="center">
		    <!-- Indicators -->
		    <ol class="carousel-indicators">
		      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		      <li data-target="#myCarousel" data-slide-to="1"></li>
		      <li data-target="#myCarousel" data-slide-to="2"></li>
		    </ol>
		
		    <!-- Wrapper for slides -->
		    <div class="carousel-inner">
		      <div class="item active" style="margin-top:20px; margin-bottom:20px;">
		        <img src="../../images/cus_intro_pic.jpg" style="width:800px; height:300px;" alt="Los Angeles">
		      </div>
		      <div class="item" style="margin-top:20px; margin-bottom:20px;">
		        <img src="../../images/fish.png" alt="Chicago">
		      </div>
		      <div class="item" style="margin-top:20px; margin-bottom:20px;">
		        <img src="../../images/dog.png" alt="New York">
		      </div>
		  
		    </div>
		
		    <!-- Left and right controls -->
		    <a class="left carousel-control" href="#myCarousel" data-slide="prev" style="width:5%;">
		      <span class="glyphicon glyphicon-chevron-left"></span>
		      <span class="sr-only">Previous</span>
		    </a>
		    <a class="right carousel-control" href="#myCarousel" data-slide="next" style="width:5%">
		      <span class="glyphicon glyphicon-chevron-right"></span>
		      <span class="sr-only">Next</span>
		    </a>
		  </div>
		</div>
    </div>
	<script>
	    $(document).ready(function()
	    {
	        $("#popupDiv").css({
	            "top": (($(window).height()-$("#popupDiv").outerHeight())/2+$(window).scrollTop())+"px",
	            "left": (($(window).width()-$("#popupDiv").outerWidth())/2+$(window).scrollLeft())+"px"
	            //팝업창을 가운데로 띄우기 위해 현재 화면의 가운데 값과 스크롤 값을 계산하여 팝업창 CSS 설정
	         });
	        
	        $("#popup_mask").css("display","block"); //팝업 뒷배경 display block
	        $("#popupDiv").css("display","block"); //팝업창 display block
	        
	        $("body").css("overflow","hidden");//body 스크롤바 없애기
	        
	        $("#closePicture").click(function(event){
	            $("#popup_mask").css("display","none"); //팝업창 뒷배경 display none
	            $("#popupDiv").css("display","none"); //팝업창 display none
	            $("body").css("overflow","auto");//body 스크롤바 생성
	        });
	    });
    </script>
</body>
</html>