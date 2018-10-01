<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.* , com.kh.MasterPiece.mypage.buyerhistory.model.vo.*, com.kh.MasterPiece.board.model.vo.*" %>    
<% 
ArrayList<BuyerHistory> list = (ArrayList<BuyerHistory>)request.getAttribute("list");
HashMap<String, Attachment> map = (HashMap<String,Attachment>)request.getAttribute("imageList");
PageInfo pi = (PageInfo)request.getAttribute("pi");
int listCount = pi.getListCount();
int currentPage = pi.getCurrentPage();
int maxPage = pi.getMaxPage();
int startPage = pi.getStartPage();
int endPage = pi.getEndPage();
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
		height:auto;
		background:white;
		margin:0 auto;
	}
	
	#gwangseong{
		visibility: hidden;
	}
</style>
</head>
<body>
<%@ include file="/views/common/top.jsp" %> 
<div class="bodyArea">
<%@ include file="/views/mypage/buyerHistory/left.jsp" %> 
<%@ include file="/views/mypage/buyerHistory/center.jsp" %>
 

<%@ include file="/views/common/footer.jsp" %>
</div>	
</body>
</html>