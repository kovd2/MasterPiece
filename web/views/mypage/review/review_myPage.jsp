<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.* , com.kh.MasterPiece.mypage.review.model.vo.*, 
    com.kh.MasterPiece.board.model.vo.*"%>
    
<% 
ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");
PageInfo pi = (PageInfo)request.getAttribute("pi");
int listCount = pi.getListCount();
int currentPage = pi.getCurrentPage();
int maxPage = pi.getMaxPage();
int startPage = pi.getStartPage();
int endPage = pi.getEndPage();
String entire = (String)request.getAttribute("entire");
%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.bodyArea {
		text-align:center;
		width:1000px;
		background:white;
		height:1000px;
		margin:0 auto;
	}
</style>
</head>
<body>

<%@ include file="/views/common/top.jsp" %> 
<div class="bodyArea">
<%@ include file="/views/mypage/review/review_left.jsp" %> 
<%@ include file="/views/mypage/review/review_center.jsp" %> 
</div>
<%@ include file="/views/common/footer.jsp" %>
	


</body>
</html>