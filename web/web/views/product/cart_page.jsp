<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.wrap {
	width: 1300px;
	height: auto;
	margin: 0 auto;
	align: center;
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
.wrap .cart_list{
	display:none;
}
.wrap .empty_cart{
	text-align:center;
}
</style>
</head>
<body>
	<%@ include file="../common/top.jsp"%>
	<div class="wrap">
		<div class="step">
			<img src="/main/images/step_cart_move.PNG">
		</div>
			<div class="empty_cart">
				<div id="no_cart_item" class="div_all_layer">장바구니에 상품이 존재하지 않습니다.</div>

				<div class="div_all_layer" style="font-size: 12px; text-align: center; margin-bottom: 10px">
					<span style="color: #f02857;">특정상품의 경우 (30인치 이상 모니터,업체배송제품,파손위험제품, 고가품, 부피가 큰제품) 택배사가 변경되어 발송될수 있습니다.</span>
				</div>
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
			<div class="cart_list">
				<table>
					<tr>
						<td style="width: 39px; height: 31px;"><input type="checkbox"></td>
						<td><img src="../../images/product/cpu/i3_7100.jpg"style="width: 100px; height: 85px;"></td>
						<td style="width: 400px; height: 31px;">[AMD] 라이젠 3 레이븐릿지 2200G (쿼드코어/3.5GHz/쿨러포함/대리점정품) Ryean 3 2200G(3.5GHz) / 쿼드코어(4코어) / 라이젠 / 소켓AM4 / 6MB버퍼 / 14nm / AMD 라데온 Vega 8 내장그래픽</td>
						<td style="width: 120px; height: 31px;">가격 : 217000원</td>
						<td style="width: 120px; height: 31px;">
							<select>
								<option>----</option>
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
							</select>
						</td>
						<td style="width: 120px; height: 31px;">217000원</td>
						<td style="width: 120px; height: 31px;"><button>삭제</button></td>
					</tr>
				</table>
			</div>
			<div class="cart_list">
				<table>
					<tr>
						<td style="width: 39px; height: 31px;"><input type="checkbox"></td>
						<td><img src="../../images/product/cpu/i3_7100.jpg"style="width: 100px; height: 85px;"></td>
						<td style="width: 400px; height: 31px;">[AMD] 라이젠 3 레이븐릿지 2200G (쿼드코어/3.5GHz/쿨러포함/대리점정품) Ryean 3 2200G(3.5GHz) / 쿼드코어(4코어) / 라이젠 / 소켓AM4 / 6MB버퍼 / 14nm / AMD 라데온 Vega 8 내장그래픽</td>
						<td style="width: 120px; height: 31px;">가격 : 217000원</td>
						<td style="width: 120px; height: 31px;">
							<select>
								<option>----</option>
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
							</select>
						</td>
						<td style="width: 120px; height: 31px;">217000원</td>
						<td style="width: 120px; height: 31px;"><button>삭제</button></td>
					</tr>
				</table>
			</div><div class="cart_list">
				<table>
					<tr>
						<td style="width: 39px; height: 31px;"><input type="checkbox"></td>
						<td><img src="../../images/product/cpu/i3_7100.jpg"style="width: 100px; height: 85px;"></td>
						<td style="width: 400px; height: 31px;">[AMD] 라이젠 3 레이븐릿지 2200G (쿼드코어/3.5GHz/쿨러포함/대리점정품) Ryean 3 2200G(3.5GHz) / 쿼드코어(4코어) / 라이젠 / 소켓AM4 / 6MB버퍼 / 14nm / AMD 라데온 Vega 8 내장그래픽</td>
						<td style="width: 120px; height: 31px;">가격 : 217000원</td>
						<td style="width: 120px; height: 31px;">
							<select>
								<option>----</option>
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
							</select>
						</td>
						<td style="width: 120px; height: 31px;">217000원</td>
						<td style="width: 120px; height: 31px;"><button>삭제</button></td>
					</tr>
				</table>
			</div><div class="cart_list">
				<table>
					<tr>
						<td style="width: 39px; height: 31px;"><input type="checkbox"></td>
						<td><img src="../../images/product/cpu/i3_7100.jpg"style="width: 100px; height: 85px;"></td>
						<td style="width: 400px; height: 31px;">[AMD] 라이젠 3 레이븐릿지 2200G (쿼드코어/3.5GHz/쿨러포함/대리점정품) Ryean 3 2200G(3.5GHz) / 쿼드코어(4코어) / 라이젠 / 소켓AM4 / 6MB버퍼 / 14nm / AMD 라데온 Vega 8 내장그래픽</td>
						<td style="width: 120px; height: 31px;">가격 : 217000원</td>
						<td style="width: 120px; height: 31px;">
							<select>
								<option>----</option>
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
							</select>
						</td>
						<td style="width: 120px; height: 31px;">217000원</td>
						<td style="width: 120px; height: 31px;"><button>삭제</button></td>
					</tr>
				</table>
			</div><div class="cart_list">
				<table>
					<tr>
						<td style="width: 39px; height: 31px;"><input type="checkbox"></td>
						<td><img src="../../images/product/cpu/i3_7100.jpg"style="width: 100px; height: 85px;"></td>
						<td style="width: 400px; height: 31px;">[AMD] 라이젠 3 레이븐릿지 2200G (쿼드코어/3.5GHz/쿨러포함/대리점정품) Ryean 3 2200G(3.5GHz) / 쿼드코어(4코어) / 라이젠 / 소켓AM4 / 6MB버퍼 / 14nm / AMD 라데온 Vega 8 내장그래픽</td>
						<td style="width: 120px; height: 31px;">가격 : 217000원</td>
						<td style="width: 120px; height: 31px;">
							<select>
								<option>----</option>
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
							</select>
						</td>
						<td style="width: 120px; height: 31px;">217000원</td>
						<td style="width: 120px; height: 31px;"><button>삭제</button></td>
					</tr>
				</table>
			</div>
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
			
			<img alt="" src="../../images/payment.png" style="width:1050px; height:230px;">
			
			
			<div class="go_shopping" onclick="goList()"><img src="../../images/cart_go_shopping_btn.gif"></div>
			<div class="purchase" onclick="goBuy()"><img src="../../images/cart_pay_btn.gif"></div>
		</div>
		<br><br><br><br>
		</div>
		<script>
			function goList(){
				location.href="./product_List.jsp";
			}
			function goBuy(){
				location.href="./delivery_page.jsp";
			}
		</script>
	</div>
	
</body>
</html>