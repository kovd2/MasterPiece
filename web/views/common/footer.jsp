<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.footerHr { border-color: #f43641; }
.footerP { text-align:center; }
.footerLogo{padding-top:-50px;}
</style>
</head>
<body>
	  <hr class="footerHr" id="gwangseong">
	
	<div class="footerCopyright" align="center">
		<div class="footerLogo">
			<img src="<%=request.getContextPath() %>/images/kimjaeyup/footer.png" usemap="#mainFooter"> 
		</div>
			<map name="mainFooter">
				<!-- <area shape="rect" coords="501,71,582,89" id="question" href="http://www.google.co.kr" title="사업자정보확인">
				<area shape="rect" coords="519,157,579,174" id="road" href="http://www.google.co.kr" title="자세히보기"> -->
				<area shape="rect" coords="875,67,1075,105" id="road" href="<%=request.getContextPath() %>/views/serviceCenter/serviceCenterQuestionWrite.jsp" title="1:1 문의하기">
				<area shape="rect" coords="979,116,1050,137" id="delivery" href="<%=request.getContextPath() %>/selectMoreList.sc" title="전화 전 클릭">
			</map>
		<br><br>
	</div>
		<p class="footerP" align="center" style="font-size:14px;">Copyrightⓒ. All Rights Reserved </p>
	<br><br>

</body>
</html>