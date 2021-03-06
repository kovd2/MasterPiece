<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.kh.MasterPiece.product.model.vo.*,com.kh.MasterPiece.board.model.vo.*,com.kh.MasterPiece.member.model.vo.*"%>
<%
Product p = (Product)request.getAttribute("p");
Member m = (Member)request.getAttribute("m");
ArrayList<Attachment> imgList = (ArrayList<Attachment>)request.getAttribute("imgList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
.wrap {
	width: 1300px;
	margin: 0 auto;
	align: center;
	overflow:hidden;
}

.wrap .step {
	width: 80%;
	height: 150px;
	margin: auto;
}

.wrap .step img{
	width: 880px;
	height: 150px;
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
	border-bottom: 1px solid black;
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
	margin-top: 15px;
    margin-left: 200px;
}
.wrap .price_area .service_btn2{
	cursor:pointer;
	margin-top:3px;
	margin-left: 200px;
}
.wrap .price_area button{
	width:40px;
	height:25px;
	font-size:11px;
}
 .wrap .price_area #service_price{
 	font-size:11px;
 	font-weight:bold;
 }


</style>
</head>
<body>
	<%@ include file="../common/top.jsp"%>
	<div class="wrap">
		<div class="step">
			<img src="../..//images/jinseok/icon/step_cart.PNG">
		</div>
		<div class="cart_title">
			<table>
				<tr>
					<td style="width: 39px; height: 31px;"><input type="checkbox"></td>
					<td style="width: 100px; height: 31px;">이미지</td>
					<td style="width: 400px; height: 31px;">상품명</td>
					<td style="width: 120px; height: 31px;">상품 가격</td>
					<td style="width: 120px; height: 31px;">수량</td>
					<td style="width: 120px; height: 31px;">합계</td>
					<td style="width: 120px; height: 31px;">관리</td>
				</tr>
			</table>
			<%for(int i = 0; i < list.size(); i++){ %>
			<div class="cart_list">
				<table>
					<tr>
						<td style="width: 39px; height: 31px;"><input type="checkbox"></td>
						<td><img src="../../images/jinseok/cpu/i3_7100.jpg"style="width: 100px; height: 85px;"></td>
						<td style="width: 400px; height: 31px;"><%p.getPrd_name();%></td>
						<td style="width: 120px; height: 31px;">가격 : <%p.getPrice();%> 원</td>
						<td style="width: 120px; height: 31px;">
							<select id="prd_count">
								<option value="1" selected>1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
							</select>
						</td>
						<td style="width: 120px; height: 31px;"><%p.getPrice();%> 원</td>
						<td style="width: 120px; height: 31px;"><button>삭제</button></td>
					</tr>
				</table>
			</div>
			<%} %>
			<br><br><br><br><br>
		<div class="price_area">
			<div class="priceArea">
				<table style="margin-top: 25px; margin-left: 10px; width:100%;">
					<tr>
						<td><span id="cart_prd_price">777777</span><span id="cart_won">원</span></td>
						<td><span id="cart_sale_price">000000</span><span id="cart_won">원</span></td>
						<td><span id="cart_total_price">7777777</span><span id="cart_total_won">원</span></td>
					</tr>
				</table>
			<div class="service_btn">
				<span id="service_price">20,000원</span><button>신청</button>
			</div>
			<div class="service_btn2">
				<span id="service_price">15,000원</span><button>신청</button>
			</div>
			<div class="service_btn2">
				<span id="service_price">2,000원</span><button>신청</button>
			</div>
			<div class="service_btn2">
				<span id="service_price">9,900원</span><button>신청</button>
			</div>
			</div>
			
			<img alt="" src="../../images/jinseok/icon/payment.png" style="width:1050px; height:230px;">
			
			
			<div class="go_shopping" onclick="goList()"><img src="../../images/jinseok/icon/cart_go_shopping_btn.gif"></div>
			<div class="purchase" onclick="goBuy()"><img src="../../images/jinseok/icon/cart_pay_btn.gif"></div>
		</div>
		<br><br><br><br>
		</div>
	</div>
	<div style="width:100%; height:auto; display:inline-block;">	
	
	</div>
	<%@include file = "../common/footer.jsp" %>
	
		<script>
			function goList(){
				location.href="./product_List.jsp";
			}
			function goBuy(){
				location.href="./delivery_page.jsp";
			}
		</script>
</body>
</html>