<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.kh.MasterPiece.cart.model.vo.*,com.kh.MasterPiece.board.model.vo.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
.wrap {
	width: 1040px;
	height:auto;
	float:left;
}

.wrap .step {
	width: 60%;
	height: auto;
	margin: auto;
}

.wrap .step img{
	width: 700px;
	height: 110px;
}

.wrap .cart_title {
	width: 80%;
	height: 35px;
	margin: auto;
	text-align: center;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

.wrap .cart_list {
	width: 100%;
	height: auto;
	margin: auto;
	text-align: center;
	font-size:11px;
	font-weight:bold;
	border-bottom: 1px solid black;
}
.wrap .delete {
	float:right;
	
}
.wrap .cart_price_info{
	width: 100%;
	height: 350px;
	margin: auto;
	text-align: center;
	border:1px solid black;
}

.wrap .cart_price_info .price_info{
	width:100%;
	height:50px;
	border-bottom:1px solid black;
	background:lightgray;
}
.wrap .cart_price_info .total_price{
	width:100%;
	height:50px;
}
.wrap .price_area{
	width:100%;
	height:auto;
}
.wrap .price_area .go_shopping{
	width:150px;
	height:60px;
	display:table-cell;
	vertical-align:middle;
	float:right;
	line-height:60px;
	margin-top: 10px;
	
}
.wrap .price_area .purchase{
	width:150px;
	height:60px;
	display:table-cell;
	vertical-align:middle;
	float:right;
	line-height:60px;
	margin-top: 10px;
}
.wrap .price_area .priceArea{
	width:1100px;
	height:auto;
	position:absolute;
	
}
.wrap .price_area .priceArea #cart_prd_price{
	width:100px;
	height:40px;
	position:relative;
	font-size:30px;
	font-weight:bold;
}
.wrap .price_area .priceArea #cart_sale_price {
	width:100px;
	height:40px;
	position:relative;
	font-size:30px;
	font-weight:bold;
}
.wrap .price_area .priceArea #cart_total_price{
	width:100px;
	height:40px;
	position:relative;
	font-size:30px;
	font-weight:bold;
	color:red;
}
.wrap .price_area .cart_order_price #cart_won{
	font-size:15px;
}
.wrap .price_area .go_shopping{
	cursor:pointer;
}
.wrap .price_area .purchase{
	cursor:pointer;
}
.wrap .price_area .service_btn{
	cursor:pointer;
    margin-top: 1px;
    margin-left: -50px;
    width:40px;
	height:20px;
	font-size:11px;
	display: inline;
    margin: auto;
}
.wrap .price_area .service_btn2{
	cursor:pointer;
	margin-top:0px;
	margin-left: -49px;
	width:40px;
	height:20px;
	font-size:11px;
	display: inline;
    margin: auto;
}
.wrap .price_area .service_btn3{
	cursor:pointer;
	margin-top:0px;
	margin-left: -49px;
	width:40px;
	height:20px;
	font-size:11px;
	display: inline;
    margin: auto;
}
.wrap .price_area .service_btn4{
	cursor:pointer;
	margin-top:0px;
	margin-left: -49px;
	width:40px;
	height:20px;
	font-size:11px;	
	display: inline;
    margin: auto;
}
.wrap .price_area button{
	width:40px;
	height:23px;
	font-size:11px;
	margin-bottom: 1.5px;
}
 .wrap .price_area #service_price{
 	font-size:11px;
 	font-weight:bold;
 }


</style>
</head>
<body>
	<div class="wrap">
		<div class="step">
			<img src="/MasterPiece/images/jinseok/icon/step_cart.PNG">
		</div>
		<div class="cart_title">
			<table>
				<tr>
					<td style="width: 39px; height: 31px;"><input type="checkbox" name="checkAll" id="checkAll" onclick="checkAll()"></td>
					<td style="width: 100px; height: 31px;">이미지</td>
					<td style="width: 400px; height: 31px;">상품명</td>
					<td style="width: 120px; height: 31px;">상품 가격</td>
					<td style="width: 120px; height: 31px;">수량</td>
					<td style="width: 120px; height: 31px;">합계</td>
					<!-- <td style="width: 120px; height: 31px;">관리</td> -->
				</tr>
			</table>
			
			<%for(int i = 0; i < list.size(); i++){ %>
			<div>
				<table class="cart_list">
					<tr>
						<td style="width: 39px; height: 31px;"><input onchange="asdf()"type="checkbox" name="checkBoxList" value="<%=list.get(i).getOrder_no()%>" class="check" checked></td>
						<td><img src="<%=request.getContextPath()%>/images/product/<%=imgList.get(list.get(i).getPrd_code()).getChangeName()%>"style="width: 100px; height: 85px;"></td>
						<td style="width: 400px; height: 31px;">[<%=list.get(i).getPrd_code()%>]  <%=list.get(i).getPrd_name()%> </td>
						<td style="width: 120px; height: 31px;">가격 : <%=list.get(i).getPrice() %> 원</td>
						<td style="width: 120px; height: 31px;"><%=list.get(i).getOrder_count()%> 개</td>
						<td style="width: 120px; height: 31px;"><%=list.get(i).getPrice() * list.get(i).getOrder_count()%>원</td>
					</tr>
				</table>
			</div>
			<input type="hidden" class="<%=list.get(i).getOrder_no()%>price" value = "<%=list.get(i).getPrice() %>">
			<input type="hidden" class="<%=list.get(i).getOrder_no()%>" value = "<%=list.get(i).getPrd_code()%>">
			<%} %>
			<%if(list.size() != 0){ %>
			<div>
				<table class="delete">				
					<tr>
						<td style="width: 120px; height: 31px;"><button class="delete">삭제</button></td>
					</tr>
				</table>
			</div>
			<%} %>
			<%if(list.size() != 0){ %>
			<div class="pagingArea" align="center">
			<button class="ebtn" onclick="location.href='<%=request.getContextPath()%>/SelectCartList.swy?currentPage=1%>'">처음</button>
			<% if(currentPage <= 1){ %>
				<button class="ebtn" disabled><</button>
			<% }else{%>
				<button class="ebtn" onclick="location.href='<%=request.getContextPath()%>/SelectCartList.swy?currentPage=<%=currentPage - 1 %>'">< 이전</button>
			<% } %>
			<% for(int p = startPage; p <= endPage; p++){ 
					if(p == currentPage){%>
						<button class="ebtn" disabled><%= p %></button>
			<%      }else{%>
						<button class="ebtn" onclick="location.href='<%=request.getContextPath()%>/SelectCartList.swy?currentPage=<%=p%>'"><%=p %></button>
			<%      } %>
			<% } %>			
			

			<% if(currentPage >= maxPage){ %>
				<button class="ebtn" disabled>></button>
			<% }else{ %>
				<button class="ebtn" onclick="location.href='<%=request.getContextPath()%>/SelectCartList.swy?currentPage=<%=currentPage + 1 %>'">다음 ></button>

			<% } %>
			<button class="ebtn" onclick="a()">맨끝</button>
		</div>
			<%}%>
			<br><br><br><br><br>
		<div class="price_area">
				<div class="priceArea">
					<table style="margin-top: 25px; margin-left: 10px; width: 80%;">
						<tr>
							<td style="width:200px"><span id="cart_prd_price"><span><%= total%></span></span><span id="cart_won">원</span></td>
							<td style="width:200px"><span id="cart_sale_price">0</span><span id="cart_won"></span></td>
							<td style="width:200px"><span id="cart_total_price"><span><%= total%></span></span><span id="cart_total_won">원</span></td>
						</tr>
					</table>
					<!-- <div class="service_btn">
						<span id="service_price">20,000원 </span><button>신청</button>
					</div>
					<br>
					<div class="service_btn2">
						<span id="service_price">15,000원 </span><button>신청</button>
					</div>
					<br>
					<div class="service_btn3">
						<span id="service_price">2,000원  </span><button>신청</button>
					</div>
					<br>
					<div class="service_btn4">
						<span id="service_price">9,900원 </span><button>신청</button>
					</div> -->
				</div>

				<img alt="" src="/MasterPiece/images/jinseok/icon/payment.png" style="width:837px; height:200px;">
			
			
			<div class="go_shopping" onclick="goList()"><img src="/MasterPiece/images/jinseok/icon/cart_go_shopping_btn.gif"></div>
			<div class="purchase"><img src="/MasterPiece/images/jinseok/icon/cart_pay_btn.gif" class="buy"></div>
		</div>
		<br><br><br><br>
		</div>
	</div>
	<div style="width:100%; height:auto; display:inline-block;">	
	
	</div>	
		<script>
		/* ------------------------------------------상품 목록으로 가기 --------------------------------------------*/
			function goList(){
				location.href="<%=request.getContextPath()%>/prdPageList.js?category=CPU";
			}
					
			function checkAll() {
				if ($("#checkAll").is(':checked')) {
					$("input[name=checkBoxList]").prop("checked", true);
				} else {
					$("input[name=checkBoxList]").prop("checked", false);
				}
			}
		/* ------------------------------------------장바구니 상품 삭제 --------------------------------------------*/
			$(".delete").click(function(){
				var val = "";
				var value = [];
				$(".check:checked").each(function(index,item){
					if(index!=0){
						val += ",";
					}
					val += $(this).val();
					value.push($(this).val());
				})
				if(val!=""){
					location.href="<%= request.getContextPath() %>/deleteCartList?code="+val;
				}
					
			});		
		/* ------------------------------------------선택한 상품 구매하기--------------------------------------------*/
			$(".purchase").click(function(){
				var val = "";
				var val2 ="";
				var temp = "";
				var cnt = $("input[name=checkBoxList]:checkbox:checked").length;
				if(cnt < 1){
					alert("한개 이상 선택하셔야 합니다.");
				}
				$(".check:checked").each(function(index,item){
					if(index!=0){
						val += ",";
						val2 +=",";
					}
					val += $(this).val();
					temp = $(this).val();
					val2 += $("."+temp).val();
				})
				if(val!=""){
					location.href="<%= request.getContextPath() %>/insertPayment?code="+val+"&prd_code="+val2;
				}				
			});
		
			function asdf(){
				var val = "";
				var val2 = 0;
				var temp = 0;
				$(".check:checked").each(function(index,item){
					val = $(this).val() + "price";
					temp = $("."+val).val()*1;
					val2 += temp;
				})
				
				$("#cart_prd_price>*").remove();
				$span = $("<span>");
				$span.append(val2);
				$("#cart_prd_price").append($span);
				$("#cart_total_price>*").remove();
				$span2 = $("<span>");
				$span2.append(val2);
				$("#cart_total_price").append($span2);
			}
	
		</script>
</body>
</html>