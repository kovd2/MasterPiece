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
	int listCount2 = pi2.getListCount();
	int currentPage2 = pi2.getCurrentPage();
	int maxPage2 = pi2.getMaxPage();
	int startPage2 = pi2.getStartPage();
	int endPage2 = pi2.getEndPage(); 

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
.imageArea2 {
		height:360px;
		display: inline-block;
		border: 1px solid red;
	}
.imageList2{
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
		 <%if(currentPage1 <= 1){ %>
		 	<button class="leftBtn"><</button>
		 <% } %>		 
		 
		 <% for(int p = startPage1; p <= maxPage1; p++){ %>
		 				<button class="thisBtn" value=<%=p %>><%= p %></button>
		 <% 	} %>
		 
		 <% if(currentPage1 >= maxPage1){ %>
		 	<button dlsabled>></button>
		 <% }else{ %>
		 	<button class="rightBtn">></button>
		 <% } %>
		 </div>
	</div>
	<br><br><br><br><br>
	<div class="imageArea2">
		<% for(int i = 0; i < list2.size(); i++){
			Product pro = list2.get(i);
			String key = pro.getPrd_code();
			Attachment ath = imgList.get(key);
		%>
		
		 	<div class="imageList2" align="center">
		 		<div style="width:350px; height:300px; margin-left: 2px;">
		 			<img src="<%=request.getContextPath() %>/images/product/<%=ath.getChangeName()%>"
		 						width="200px" height="200px"><br>
		 			<span><%=list2.get(i).getPrd_name()%></span><br><hr class="product_hr">
		 			<span>판매가격</span>
		 			<span><%=list2.get(i).getPrice() %>원</span>
		 		</div>
		 	</div>
		 <%} %>
	</div>
	<div>
		 <div class="pageArea" align="center">
		 <%if(currentPage2 <= 1){ %>
		 	<button disabled><</button>
		 <% }else{ %>
		 	<button class="leftBtn2"><</button>
		 <% } %>		 
		 
		 <% for(int p = startPage2; p <= maxPage2; p++){ %>
		 				<button class="thisBtn2" value=<%=p %>><%= p %></button>
		 <% 	} %>
		 
		 <% if(currentPage2 >= maxPage2){ %>
		 	<button dlsabled>></button>
		 <% }else{ %>
		 	<button class="rightBtn2">></button>
		 <% } %>
		 </div>
	</div>
	
	
	<script>
		$(".thisBtn").click(function(){
			var cp = $(this).val();

			 $.ajax({
				url: "selectMain.tn",
				data : {cp:cp},
				type : "get",
				success:function(data){
					var path = "images/product";
					
					$(".imageArea").children("div.imageList").remove();
					for(var i = 0; i < data.list.length; i++){
						$div = $("<div class='imageList'align='center'style='width: 350px; height:300px; border:1px solid black; display: inline-block;'>");
						$(".imageArea").append($div);
						
						$div2 = $("<div style='width:350px; height:300px; margin-left: 2px;'>");						
						$div.append($div2);
						$div2.append("<img src='"+path+"/"+data.imgList[data.list[i].prd_code].changeName+"' width='200px' height='200px'>"); 
						$span1 = $("<br><span style='font-weight:13px;'>");
						$span2 = $("<br><span style='font-color:red;'><hr>");
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
						$div = $("<div class='imageList2'align='center'style='width: 350px; height:300px; border:1px solid black; display: inline-block;'>");
						$(".imageArea2").append($div);
						
						$div2 = $("<div style='width:350px; height:300px; margin-left: 2px;'>");						
						$div.append($div2);
						$div2.append("<img src='"+path+"/"+data.imgList[data.list[i].prd_code].changeName+"' width='200px' height='200px'>"); 
						$span1 = $("<br><span style='font-weight:13px;'>");
						$span2 = $("<br><span style='font-color:red;'><hr>");
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
		$(".leftBtn").click(function(){
			var cp = $(this).val();
			
			$.ajax({
				url: "selectMain.tn",
				data: {cp:cp},
				type : "get",
				success:function(data){
					if(currentPage1 == 0) return;
					currentPage1 = currentPage1 - 1;
					
					
					
				}
				
			});
			
		});
	</script>

	<br><br><br><br>
	
</body>
</html>























