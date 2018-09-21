<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.MasterPiece.product.model.vo.*,
    							com.kh.MasterPiece.board.model.vo.*,
    							com.kh.MasterPiece.main.model.vo.*"%>
<!DOCTYPE html>
<%
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
	int listCount2 = pi1.getListCount();
	int currentPage2 = pi1.getCurrentPage();
	int maxPage2 = pi1.getMaxPage();
	int startPage2 = pi1.getStartPage();
	int endPage2 = pi1.getEndPage(); 
%>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
.imageArea {
		height:360px;
		display: inline-block;
		border: 1px solid red;
	}
.imageList{
	border:1px solid black;
	display: inline-block;
	margin: 4.5px;
}
.product_hr{border-color: #efefef42;}
</style>
</head>
<body>
	<div class="imageArea">
		<% for(int i = 0; i < list1.size(); i++){
			Product pro = list1.get(i);
			String key = pro.getPrd_code();
			Attachment ath = imgList.get(key);
		%>
		
		 	<div class="imageList" align="center">
		 		<div style="width:350px; height:300px; margin-left: 2px;">
		 			<img src="<%=request.getContextPath() %>/images/product/<%=ath.getChangeName()%>"
		 						width="200px" height="200px"><br>
		 			<span><%=list1.get(i).getPrd_name()%></span><br><hr class="product_hr">
		 			<span>판매가격</span>
		 			<span><%=list1.get(i).getPrice() %>원</span>
		 		</div>
		 	</div>
		 <%} %>
	</div>
	<div>
		 <div class="pageArea" align="center">
		 
		 <button id="leftLastBtn"><<</button>
			<% if(currentPage1 <= 1){ %>
		 		<button disabled><</button>
		 	<% }else{ %>
		 		<button id="leftBtn"><</button>
		 	<% } %>
		 <% for(int p = startPage1; p <= endPage1; p++){ 
		 			if(p == currentPage1){
		 %>
		 				<button disabled><%= p %></button>
		 <% 		}else{ %>
		 				<button class="thisBtn" value=<%=p %>><%= p %></button>
		 <%			} %>
		 <% 	} %>
		 
		 <% if(currentPage1 >= maxPage1){ %>
		 	<button disabled>></button>
		 <% }else{ %>
		 	<button id="rightBtn">></button>
		 <% } %>
		 <button id="rightLastBtn">>></button>
		 </div>
	</div>
	
			 <%-- <%=request.getContextPath()%>/graphic.tn?currentPage1=<%=p%> --%>
	
	<script>
		$("#leftLastBtn").click(function(){
			$.ajax({
				url: "graphic.tn",
				type : "get",
				data : {
				/* ds */	
				}
			});
		});
		
		$(".thisBtn").click(function(){
			var cp = $(this).val();

			 $.ajax({
				url: "graphic.tn",
				data : {cp:cp},
				type : "get",
				success:function(data){
					$(".imageArea").children("div.imageList").remove();
					for(i = 0; i <= list1.size(); i++){
						Product pro = list1.get(i);
						String key = pro.getPrd_code();
						Attachment ath = imgList.get(key);
							
						var $div = $("<div class='imageList' align='center'>");
						var $div2 = $("<div css.("width":"350px", "height":"300px", "margin-left" : "2px");">")
						var $img = $("<img src=>")
						
							 	<div class="imageList" align="center">
							 		<div style="width:350px; height:300px; margin-left: 2px;">
							 			<img src="<%=request.getContextPath() %>/images/product/<%=ath.getChangeName()%>"
							 						width="200px" height="200px"><br>
							 			<span><%=list1.get(i).getPrd_name()%></span><br><hr class="product_hr">
							 			<span>판매가격</span>
							 			<span><%=list1.get(i).getPrice() %>원</span>
							 		</div>
							 	</div>

							
						
					}
				}
			}); 
			
		});
	</script>
	
	<br><br><br><br>
	<%-- 
	<!-- cpu -->
	<div class="imageArea">
		<% for(int i = 0; i < list2.size(); i++){
			Product pro = list2.get(i);
			String key = pro.getPrd_code();
			Attachment ath = imgList.get(key);
		%>
		
		 	<div class="imageList" align="center">
		 		<div style="width:350px; height:300px; margin-left: 2px;">
		 			<img src="<%=request.getContextPath() %>/images/product/<%=ath.getChangeName()%>"
		 						width="200px" height="200px"><br>
		 			<span><%=list2.get(i).getPrd_name()%></span><br><hr class="product_hr">
		 			<span>판매가격</span>
		 			<span><%=list2.get(i).getPrice() %>원</span>
		 		</div>
		 	</div>
		 <%} %>
		 
		 <div class="pageArea" align="center">
		 
		 <button id="leftLastBtn"><<</button>
			<% if(currentPage2 <= 1){ %>
		 		<button disabled><</button>
		 	<% }else{ %>
		 		<button id="leftBtn"><</button>
		 	<% } %>
		 
		 <% for(int p = startPage2; p <= endPage2; p++){ 
		 			if(p == currentPage2){
		 %>
		 				<button disabled><%= p %></button>
		 <% 		}else{ %>
		 				<button id="thisBtn"><%= p %></button>
		 <%			} %>
		 <% 	} %>
		 
		 <% if(currentPage2 >= maxPage2){ %>
		 	<button disabled>></button>
		 <% }else{ %>
		 	<button id="rightBtn">></button>
		 <% } %>
		 <button id="rightLastBtn">>></button>
		 </div>
	</div> --%>
	
	<br><br><br><br><br><br><br><br>
</body>
</html>























