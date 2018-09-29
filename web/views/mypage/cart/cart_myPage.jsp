<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.MasterPiece.board.model.vo.*,
    com.kh.MasterPiece.cart.model.vo.*,
    java.util.*"%>
    <%
    PageInfo pi = (PageInfo)request.getAttribute("pi");
    HashMap<String, Attachment> imgList = (HashMap<String, Attachment>)request.getAttribute("imgList");
    ArrayList<Cart> list = (ArrayList<Cart>)request.getAttribute("list");
    int listCount = pi.getListCount();
    int currentPage = pi.getCurrentPage();
    int maxPage = pi.getMaxPage();
    int startPage = pi.getStartPage();
    int endPage = pi.getEndPage();	
    int total = 0;
    for(int i = 0; i < list.size(); i++){
    	total += list.get(i).getHap();
    }
    
    
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<style>
	.bodyArea {
		text-align:center;
		width:1300px;
		background:white;
		height:auto;
		margin:0 auto;
	}
</style>
</head>
<body>
<%@ include file="/views/common/top.jsp" %> 
<div class="bodyArea">

<%@ include file="/views/mypage/cart/cart_left.jsp" %> 
<%@ include file="/views/mypage/cart/cart_center.jsp" %> 
</div>
<%@ include file="/views/common/footer.jsp" %>
	
</body>
</html>