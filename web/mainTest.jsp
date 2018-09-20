<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.MasterPiece.product.model.vo.*,
    							com.kh.MasterPiece.board.model.vo.*,
    							com.kh.MasterPiece.main.model.vo.*"%>
<!DOCTYPE html>
<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
	HashMap<String, Attachment> imgList =
					(HashMap<String, Attachment>)request.getAttribute("imgList");
	MainPageInfo pi = (MainPageInfo)request.getAttribute("pi");
		 /* int listCount = pi.getListCount();
		 int currentPage = pi.getCurrentPage();
		 int maxPage = pi.getMaxPage();
		 int startPage = pi.getStartPage();
		 int endPage = pi.getEndPage(); */
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.imageArea {
		width:1080px;
		height:550px;
		margin-left:auto;
		margin-right:auto;
	}
.imageList{
	width:360px;
	border:1px solid white;
	display:inline-block;
	margin:10px;
	align:center;
}
</style>
</head>
<body>
<div align="left">
	<div class="imageArea">
		<% for(int i = 0; i < list.size(); i++){
			Product pro = list.get(i);
			String key = pro.getPrd_code();
			Attachment ath = imgList.get(key);
		%> 
		 	<div class="imageList" align="center">
		 		<div>
		 			<img src="<%=request.getContextPath() %>/images/product/<%=ath.getChangeName()%>"
		 						width="350px" height="300px">
		 		</div>
		 	</div>
		 <%} %>
	</div>
</div>
</body>
</html>
















