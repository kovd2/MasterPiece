<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import ="java.util.*, com.kh.MasterPiece.product.model.vo.*,
			 com.kh.MasterPiece.main.model.vo.*,
			 com.kh.MasterPiece.board.model.vo.*,
			 com.kh.MasterPiece.main.model.vo.*"
%>
<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
	HashMap<String, Attachment> imgList =
					(HashMap<String, Attachment>)request.getAttribute("imgList");
	MainPageInfo pi = (MainPageInfo)request.getAttribute("pi");
	
	String search = (String)request.getAttribute("search");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();

%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=request.getAttribute("search") %>의 검색결과 : 컴퓨터 구매는 MasterPiece!</title>

<style>

.wrap {
	width: 1100px;
	height: auto;
	margin: 0 auto;
	align:center;
}

.bestPrd_area {
	width: 1000px;
	margin: 0 auto;
	height: 300px;
}

.bestPrd_box {
	width: 995px;
	float: left;
	height: 250px;
	padding: 16px 2px;
	border: 1px solid #e6e6e6;
	margin-bottom: 30px;
}

.bestPrd_box .bestPrd_list {
	margin-top: 0px;
	font-size: 12px;
}

.bestPrd_list .bestPrd {
	width: 190px;
	height: 200px;
	display: block;
	float: left;
	border-right: 1px solid #e6e6e6;
	cursor: pointer;
}

.bestPrd_list .bestPrd:last-child {
	border: none;
}

.bestPrd_list .bestPrd .product_img {
	width: 95%;
	height: 90%;
}
.bestPrd_list .bestPrd .product_img img{
	width:150px;
	height:150px;
}

.wrap .Prd_wrap {
	width: 1000px;
	height: auto;
	margin: 0 auto;
	display: flex;
}

.Prd_list_area{width:1080px; margin: 0px auto;}

.wrap .Prd_wrap .Prd_list_area {
	width: 80%;
	height: auto;
	margin-left:0px;
	border-right:1px solid #dee0e4;
}

.wrap .Prd_wrap .Prd_list_area .top_menu{
	width: 100%;
	height: 30px;
	padding-left: 0px;
	margin-top:0px;
}
.top_menu_area{width:100px; height:50px; border:1px solid #dee0e4; margin-bottom: -1px;}

.wrap .Prd_wrap .Prd_list_area .top_menu ul{
	width:100%;
	height:44px;
}

.wrap .Prd_wrap .Prd_list_area .top_menu li {
	width: 158.5px;
	height: 44px;
	border-top:1px solid black;
	border-right: 1px solid #dee0e4;
	border-bottom: 1px solid #dee0e4;
	float: left;
	list-style:none;
	margin: 0px;
}
.Prd_list_area .top_menu .top_menu_list{
	width: 130px;
	line-height: 44px;
	color: #434343;
	font-size: 15px;
	letter-spacing: -1px;
	display: block;
	margin-left: -22px;
	
}

.Prd_list_area .Prd_list {
	width:100%;
	height:200px;
	border:1px solid #dee0e4;
	display: flex;
}

.Prd_list_area .Prd_list #Prd_img{
	width:25%;
	height:100%;
	border-right:1px solid #dee0e4;
	margin:0 auto;
}

.Prd_list_area .Prd_list #Prd_img .Prd_img{
	width:75%;
	height:75%;
	margin:25px;
	margin-top:25px;
	cursor:pointer;
}

.Prd_list_area .Prd_list .Prd_Info{
	width:50%;
	height:100%;
	border-right:1px solid #dee0e4;
}

.Prd_list_area .Prd_list .price_list{
	width:25%;
	height:100%;
	border-right:1px solid #dee0e4;
}

.Prd_wrap .price_list .priceArea{
	width:100%;
	height:auto;
}

.Prd_wrap .price_list .priceArea dl dt{
	width:50%;
	height:auto;
	margin:0px auto;
	float:left;
}
.Prd_wrap .price_list .priceArea dl dd{
	width:50%;
	height:auto;
	margin:0px auto;
	float:right;
}
.Prd_wrap .price_list .prd_count{
	margin-top:90px;
}
.Prd_wrap .price_list .btnArea {
	width:200px;
	height:50px;
	margin-top:50px;
	display:flex;
}

.pbtn{ cursor: pointer; background-color: white; border:#eaeaea 1px solid;font-size: 15px; padding: 5px 10px; margin:2px;}
.pbtn:hover{border:#727272 1px solid;}

</style>

</head>
<body>
	<%@ include file="../../views/common/top.jsp"%>
	
	<div class="Prd_wrap">
			<div class="Prd_list_area">
				<div class="top_menu">
					<ul class="top_menu_area">
						<li class="top_menu_list">검색한 상품 목록</li>
					</ul>
				</div>
				
				<!-- 상품 리스트 -->				
				<%if(!list.isEmpty()){ %>
				<%for(int i = 0; i < list.size(); i++){ %>
				<div class="Prd_list">			
					<div id="Prd_img" onclick="goDetail('<%= list.get(i).getPrd_code()%>')">
							<input type="hidden" class="prdDetail" value="<%= list.get(i).getPrd_code()%>">
							<img src="<%=request.getContextPath()%>/images/product/<%=imgList.get(list.get(i).getPrd_code()).getChangeName()%>" class="Prd_img">
					</div>
					<div class="Prd_Info" id="prd_info">
						[<%=list.get(i).getPrd_code()%>]
						<%=list.get(i).getPrd_name()%> 							
					</div>
					<div class="price_list">
						<div class="priceArea">
							<dl class="Prd_price">
								<dt>판매가격</dt>
								<dd><%=list.get(i).getPrice() %> 원</dd>
							</dl>
						</div>
						<div class="prd_count">수량
							<select id="prd_count">
								<option value="1" selected>1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
							</select>
						</div>
						<div class="btnArea">&nbsp;
							<div class="basketBtn"onclick="addCart('<%=list.get(i).getPrd_code()%>','<%=list.get(i).getPrice() %>')">
								<img src="/MasterPiece/images/jinseok/icon/go_cart_btn.gif">
							</div>&nbsp;&nbsp;
							<div class="buyBtn" onclick="goBuy();">
								<img src="/MasterPiece/images/jinseok/icon/go_pay_btn.gif">
							</div>
						</div>
					</div>
				</div>
			<% } %>
			
			<% }else{ %>
				<div class="searchNull" style="text-align:center; margin-top:2px;">
					<img src="<%=request.getContextPath() %>/images/kimjaeyup/noSearch.png">
				</div>
			
			<% } %>
		</div>
		<!-- 페이징 처리 -->
		<div class="pagingArea" align="center" style="margin-top: 15px; margin-bottom: 50px;">
		<%if(!list.isEmpty()){ %>
		<button class="pbtn" onclick="location.href='<%=request.getContextPath()%>/serch.tn?query=<%=search%>&currentPage=1'">처음</button>
		<% if (currentPage <= 1) { %>
			<button class="pbtn" disabled>< 이전</button>
		<% } else { %>
			<button class="pbtn" onclick="location.href='<%=request.getContextPath()%>/serch.tn?query=<%=search%>&currentPage=<%=currentPage - 1%>'">< 이전</button>
		<% } %>

		<% for (int p = startPage; p <= endPage; p++) {
				if (p == currentPage) {
			%>
				<button class="pbtn" disabled><%=p%></button>
			<% } else { %>
			<button class="pbtn" onclick="location.href='<%=request.getContextPath()%>/serch.tn?query=<%=search%>&currentPage=<%=p%>'"><%=p%></button>
			<% } %>	
		<% } %>

		<% if (currentPage >= maxPage) { %>
			<button class="pbtn" disabled>다음 ></button>
		<% } else { %>
			<button class="pbtn" onclick="location.href='<%=request.getContextPath()%>/serch.tn?query=<%=search%>&currentPage=<%=currentPage + 1%>'">다음 ></button>
		<% } %>
			<button class="pbtn" onclick="location.href='<%=request.getContextPath()%>/serch.tn?query=<%=search%>&currentPage=<%=maxPage%>'">맨끝</button>
		<%}else{ %>
		
		<%} %>
		</div>
	</div>
	
	<%@ include file="../../views/common/footer.jsp"%>
			
	<script>
		function goDetail(No){
			var code = No;
			location.href="<%= request.getContextPath()%>/prdDetail?code=" + code;
		}
	
		function goBuy(){
			location.href="./delivery_page.jsp";
		};
		
		function addCart(Code1, price1){
			var code1 = Code1;
			var price = price1;
			var count = $("#prd_count option:selected").val();
		
			if(confirm("장바구니에 추가 하시겠습니까?") == true){
				location.href="<%= request.getContextPath()%>/insertCart?code=" + code1 + "&price=" + price + "&count=" + count;
			}else{
				return false;
			}
		};
	</script>
</body>
</html>





























