<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.MasterPiece.product.model.vo.*,com.kh.MasterPiece.board.model.vo.*"%>
<%	
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
	HashMap<String, Attachment> imgList = (HashMap<String, Attachment>)request.getAttribute("imgList");
	
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
.wrap {
	width: 1100px;
	height: auto;
	margin: 0 auto;
	align:center;
}

.categorylist_area {
	width: 1000px;
	margin: 0 auto;
	border: 5px solid #efefef;
}

.categorylist_box {
	width: 950px;
	height: 100px;
	margin: 0 auto;
	padding: 0px;
}

.categorylist {
	width: 990px;
	margin-left: 1px;
	overflow: hidden;
	padding-left: 0px;
	padding-top: 10px;
	display: inline-block;
}

.categorylist li {
	width: 195px;
	height: 25px;
	line-height: 25px;
	text-align: left;
	display: inline-block;
	float: left;
	border-right: 1px solid #eaeaea;
	margin-right: -1px;
}

.categorylist li a {
	width: 100%;
	line-height: 25px;
	color: #727275;
	font-size: 12.5px;
	margin-left: 20px;
	display: inline-block;
	text-decoration:none;
}

.categorylist .category_menu a {
	width: 100%;
	color: #727275;
	font-size: 13px;
	line-height: 25px;
	margin-left: 20px;
	display: inline-block;
}

.categorylist li a:hover {
	font-size: 15px;
	font-weight: bold;
	color: black;
	text-decoration: underline;
	cursor:pointer;
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

.wrap .Prd_wrap .search_wrap_area {
	width: 20%;
	height:800px;
	float: left;
	border:1px solid #dee0e4;
    display: inline-block;
    margin-left: 0px;
}

.wrap .Prd_wrap .Prd_list_area {
	width: 80%;
	height: auto;
	margin-left:0px;
	border-right:1px solid #dee0e4;
}

.wrap .Prd_wrap .Prd_list_area .top_menu .top_menu_area {
	width: 100%;
	height: 30px;
	padding-left: 0px;
	margin-top:0px;
}

.wrap .Prd_wrap .Prd_list_area .top_menu ul{
	width:100%;
	height:44px;
}

.wrap .Prd_wrap .Prd_list_area .top_menu li {
	width: 155px;
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
	height: 44px;
	line-height: 44px;
	color: #434343;
	font-size: 15px;
	letter-spacing: -1px;
	font-family: Noto-M;
	text-align: center;
	display: block;
	margin:0 auto;
	text-decoration:none;
}
.Prd_list_area .top_menu .top_menu_list:hover{
	width: 130px;
	height: 44px;
	background:#c70000;
	font-size:16px;
	color:white;
	font-weight: bold;
	line-height: 44px;
	letter-spacing: -1px;
	font-family: Noto-M;
	text-align: center;
	display: block;
	margin:0 auto;
	text-decoration:none;
	cursor:pointer;
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
.Prd_wrap .price_list .btnArea .basketBtn {
	width:85px;
	height:30px;
	text-align:center;
	display:table-cell;
	vertical-align:middle;
	border:none;
	background:white;
	line-height: 30px;
}
.Prd_wrap .price_list .btnArea .basketBtn:hover{
	background:lightgray;
	cursor:pointer;
}
.Prd_wrap .price_list .btnArea .buyBtn {
	width:85px;
	height:30px;
	text-align:center;
	display:table-cell;
	vertical-align:middle;
	border:none;
	background:white;
	line-height: 30px;
}
.Prd_wrap .price_list .btnArea .buyBtn:hover{
	background:lightgray;
	cursor:pointer;
}
.Prd_wrap .search_wrap_area .title {
	width:100%;
	height:44px;
	line-height:44px;
	color:#434343;
	font-size:14px;
	letter-spacing:-1px;
	font-family:Noto-M;
	text-align:center;
	display:block;
	margin:0 auto;
	border-bottom:1px solid #dee0e4;
}

.Prd_wrap .search_wrap_area .box .search_box{
	width: 165px;
    padding: 15px 10px 5px 10px;
    float: left;
    border-top: 1px solid #dee0e4;
}
.Prd_wrap .search_wrap_area .box .search_box #search_text{
    width: 125px;
    height: 31px;
    font-size: 12.5px;
    color: #4a4a4a;
    text-align: left;
    border:1px solid #dee0e4;
    line-height: 31px;
    font-family: Malgun Gothic;
    padding-left: 10px;
    float: left;   
}

</style>
</head>
<body>
	<%@ include file="../common/top.jsp"%>
	<!-- 카테고리 div -->
	<div class="wrap">
		<div class="categorylist_area">
			<div class="categorylist_box">
				<ul class="categorylist">
					<li class="category_menu"><a href="#">전체</a></li>
					<li class=""><a onclick="location.href='<%=request.getContextPath()%>/prdPageList.js'">CPU</a></li>
					<li class=""><a href="#">메인보드</a></li>
					<li class=""><a href="#">메모리카드</a></li>
					<li class=""><a href="#">그래픽카드</a></li>
					<li class=""><a href="#">HDD</a></li>
					<li class=""><a href="#">SDD</a></li>
					<li class=""><a href="#">파워</a></li>
					<li class=""><a href="#">쿨러</a></li>
					<li class=""><a href="#">케이스</a></li>
				</ul>
			</div>
		</div>
		<!-- 추천상품 div -->
		<div class="bestPrd_area">
			<div class="sec_tit"
				style="font-weight: bold; font-size: 25px; font-family: inherit;">
				MasterPiece <span style="color: blue; font-size: 20px;">강/력/추/천</span><span
					style="color: #717171; font-size: 13px;">믿을 수 있는
					MasterPiece의 추천 상품! </span>
			</div>
			<div class="bestPrd_box">
				<ul class="bestPrd_list">
					<li class="bestPrd">
						<div class="product_img">
							<img src="/MasterPiece/images/jinseok/cpu/i7_8700K.jpg">
							<div class="Prd_name">
								[대리점정품]인텔 코어8세대 i7-8700K 커피레이크 (CPU/3.7GHz/12MB/LGA1151-V2)
								<div class="Prd_price">569,000원</div>
							</div>
						</div>
					</li>
					<li class="bestPrd">
						<div class="product_img">
							<img src="/MasterPiece/images/jinseok/cpu/i7_8700.jpg">
							<div class="Prd_name">
								[대리점정품]인텔 코어8세대 i7-8700 커피레이크 (CPU/3.2GHz/12MB/LGA1151-V2)
								<div class="Prd_price">555,000원</div>
							</div>
						</div>
					</li>
					<li class="bestPrd">
						<div class="product_img">
							<img src="/MasterPiece/images/jinseok/cpu/i7_7740X.jpg">
							<div class="Prd_name">
								[AMD] 라이젠 3 레이븐릿지 2200G (쿼드코어/3.5GHz/쿨러포함/대리점정품)
								<div class="Prd_price">89,900원</div>
							</div>
						</div>
					</li>
					<li class="bestPrd">
						<div class="product_img">
							<img src="/MasterPiece/images/jinseok/cpu/i5_8600K.jpg">
							<div class="Prd_name">
								[AMD] 라이젠 3 레이븐릿지 2200G (쿼드코어/3.5GHz/쿨러포함/대리점정품)
								<div class="Prd_price">89,900원</div>
							</div>
						</div>
					</li>
					<li class="bestPrd">
						<div class="product_img">
							<img src="/MasterPiece/images/jinseok/cpu/i5_8600.jpg">
							<div class="Prd_name">
								[AMD] 라이젠 3 레이븐릿지 2200G (쿼드코어/3.5GHz/쿨러포함/대리점정품)
								<div class="Prd_price">89,900원</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<div class="Prd_wrap">
			<div class="search_wrap_area">
				<div class="title">리스트 내 검색</div>
				<div class="box">
					<div class="search_box">
						<input type="text" id="search_text" placeholder="검색어 입력">
					</div>
				</div>
				
			</div>
			<div class="Prd_list_area">
				<div class="top_menu">
					<ul class="top_menu_area">
						<li class="top_menu_list">인기상품순</li>
						<li class="top_menu_list">신규등록순</li>
						<li class="top_menu_list">추천상품순</li>
						<li class="top_menu_list">낮은가격순</li>
						<li class="top_menu_list">높은가격순</li>
					</ul>
				</div>
			
			<%for(int i = 0; i < list.size(); i++){ %>
				<div class="Prd_list">
					<div id="Prd_img" onclick="goDetail(<%= list.get(i).getPrd_code()%>)">
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
							<select>
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
							</select>
						</div>
						<div class="btnArea">&nbsp;
							<div class="basketBtn"onclick="addCart();">
								<img src="/MasterPiece/images/jinseok/icon/go_cart_btn.gif">
							</div>&nbsp;&nbsp;
							<div class="buyBtn" onclick="goBuy();">
								<img src="/MasterPiece/images/jinseok/icon/go_pay_btn.gif">
							</div>
						</div>
					</div>
				</div>
			<% } %>
			<div class="pagingArea" align="center">
			<button onclick="location.href='<%=request.getContextPath()%>/prdPageList.js?currentPage=1'"><<</button>
			<% if(currentPage <= 1){ %>
				<button disabled><</button>
			<% }else{ %>
				<button onclick="location.href='<%=request.getContextPath()%>/prdPageList.js?currentPage=<%=currentPage - 1 %>'"><</button>
			<% } %>
			
			<% for(int p = startPage; p <= endPage; p++){ 
					if(p == currentPage){
			%>
						<button disabled><%= p %></button>
			<%      }else{ %>
						<button onclick="location.href='<%=request.getContextPath()%>/prdPageList.js?currentPage=<%=p%>'"><%= p %></button>
			<%      } %>
			<% } %>			
			
			<% if(currentPage >= maxPage){ %>
				<button disabled>></button>
			<% }else{ %>
				<button onclick="location.href='<%=request.getContextPath()%>/prdPageList.js?currentPage=<%=currentPage + 1%>'">></button>
			<% } %>
			
			<button onclick="location.href='<%=request.getContextPath()%>/prdPageList.js?currentPage=<%=maxPage%>'">>></button>
			
		</div>
			</div>	
		</div>
	</div>
	<script>
		function goDetail(No){
			var code = No;
			
			location.href="<%= request.getContextPath()%>/prdDetail?code=" + code;
		}
		
		function goBuy(){
			location.href="./delivery_page.jsp";
		};
		
		function addCart(){
			if(confirm("장바구니에 추가 하시겠습니까?")== true){
				location.href="./cart_page.jsp";
			}else{
				return false;
			}
		};
			
	</script>
	
	<%@include file = "../common/footer.jsp" %>
</body>
</html>





















