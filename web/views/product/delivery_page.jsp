<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script charset="UTF-8" type="text/javascript" src="http://t1.daumcdn.net/postcode/api/core/180619/1529384927473/180619.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
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

.wrap .step img {
	width: 880px;
	height: 150px;
}

.wrap .prd_delivery {
	width: 80%;
	height: auto;
	margin: auto;
	align: center;
	margin-bottom: 50px;
}

.wrap .prd_delivery .delivery_tb {
	text-align: center;
}

.wrap .prd_delivery .delivery_tb th {
	border-bottom: 0.5px solid #dfdfe1;
}

.wrap .prd_delivery table {
	width: 100%;
	border: 0.5px solid #dfdfe1;
}

.wrap .shipping_info {
	width: 80%;
	height: auto;
	margin: auto;
	align: center;
	margin-bottom: 50px;
}

.wrap .shipping_info .shipping_tb {
	border-top: 1px solid black;
}

.wrap .shipping_info th {
	width: 15%;
	background-color: #f7f7f7;
	color: #5c5c5c;
	font-size: 12px;
	text-align: left !important;
	padding-left: 14px;
	height: 37px;
	font-weight: normal;
	border-right: 1px solid #dfdfe1;
	border-bottom: 1px solid #dfdfe1;
}

.wrap .shipping_info td {
	width: 850px;
	color: #5c5c5c;
	font-size: 12px;
	text-align: left;
	padding-left: 6px;
	height: 37px;
	font-weight: normal;
	border-bottom: 1px solid #dfdfe1;
}

.wrap .shipping_info input {
	border: 0.5px solid #dfdfe1;
}

.wrap .shipping_info #zipcode:hover {
	cursor: pointer;
}

.wrap .shipping_info .long_text {
	width: 585px;
}

.wrap .delivery_wrap {
	width: 80%;
	height: 500px;
	margin: auto;
	margin-bottom: 50px;
}

.wrap .delivery_wrap .delivery_left {
	width: 15%;
	background-color: #f7f7f7;
	color: #5c5c5c;
	text-align:left;
	padding-left: 14px;
	height: 500px;
	font-weight: normal;
	float: left;
	border-right: 1px solid #dfdfe1;
	border-bottom: 1px solid #dfdfe1;
}

.wrap .delivery_wrap .delivery_center {
	width: 15%;
	height: 500px;
	float: left;
	border: 0.5px solid #dfdfe1;
}

.wrap .delivery_wrap .delivery_right {
	width: 100%;
	height: 500px;
	border: 0.5px solid #dfdfe1;
}

.wrap .delivery_wrap .delivery_center ul {
	list-style: none;
	margin: 0px;
	padding: 0px;
}

.wrap .delivery_wrap .delivery_center li {
	list-style: none;
	margin-bottom: 10px;
}

.delivery_title {
	font-weight: bold;
	color: blue;
}

.wrap label:hover {
	text-decoration: underline;
}

.wrap .pay_price .pay_price_title {
	width: 100%;
	height: 50px;
	background: #575f79;
	color: white;
	float: right;
	text-align: center;
	font-size: 25px;
}

.wrap .pay_price .pay_price_title p {
	padding-left: 75px;
}

#price_inner {
	position: absolute;
	width: 95%;
	height: auto;
	left: 20px;
	top: 18px;
}

.pay_price .pay_btn_layer {
	text-align: center;
}

.pay_price .pay_btn_layer .goCart_btn {
	width: 109px;
	height: 40px;
	background: #575f79;
	flaot: left;
	display: table-cell;
	vertical-align: middle;
}

.pay_price .pay_btn_layer .goBuy_btn {
	width: 109px;
	height: 40px;
	background: orange;
	display: table-cell;
	vertical-align: middle;
}

/* 결제 방법 선택 */
#pay_price_method_layer {
	margin-bottom: 80px;
}

#pay_price_method_title {
	background: url('/pay/images/pay_pay_method_title.gif') no-repeat;
	margin-top: 10px;
}

#pay_price_method_left {
	position: relative;
	width: 868px;
	height: auto;
	float: left;
	border: 1px solid #dfdfe1;
	border-top: 1px solid #575f79;
	background-color: #f7f7f7;
	margin-left: 105px;
}

#pay_method_list {
	position: relative;
	width: 737px;
	height: auto;
}

#pay_price_method_left .pay_method_title_text {
	position: absolute;
	font-size: 12px;
	color: #5d5d5d;
	font-weight: normal;
	left: 14px;
	top: 12px;
	margin: 0px;
	padding: 0px;
}

.pay_price_table_class {
	position: relative;
	width: 752px;
	height: auto;
	border-left: 1px solid #dfdfe1;
	background-color: #ffffff;
	margin-left: 116px;
}

.pay_price_table_class table {
	position: relative;
	width: 752px;
	height: auto;
	margin: 0px;
	padding: 0px;
}

.pay_price_table_class th {
	width: 101px;
	color: #5c5c5c;
	font-size: 12px;
	text-align: left;
	padding-left: 8px;
	height: 37px;
	font-weight: normal;
	border-right: 1px solid #dfdfe1;
	border-top: 1px solid #dfdfe1;
}

.pay_price_table_class td {
	color: #5c5c5c;
	font-size: 12px;
	text-align: left;
	padding-left: 6px;
	height: 37px;
	font-weight: normal;
	border-top: 1px solid #dfdfe1;
}

.pay_price_table_class td img {
	vertical-align: -5px;
}

.orange_icon {
	vertical-align: -4px !important;
	vertical-align: 1px !important;
}

@media screen and (-webkit-min-device-pixel-ratio:0) {
	.orange_icon {
		vertical-align: -2px !important;
	}
}

.orange_btn {
	vertical-align: -7px !important;
	vertical-align: -4px !important;
}

.pay_price_table_class td input {
	vertical-align: 1px;
}

.pay_price_orage_font {
	font-size: 12px;
	color: #fb7a00;
	font-weight: bold;
}

.pay_price_table_class select {
	font-size: 12px;
	color: #5c5c5c;
	border: 1px solid #abadb3;
	width: 270px
}

/* 세금계산서, 현금영수증 */
#pay_tax_paper_list, #pay_cash_receipt_list {
	position: relative;
	width: 868px;
	height: auto;
	border-top: 1px solid #dfdfe1;
}

/*상품 가격 페이지 오른쪽*/
#pay_price_right {
	position: relative;
	float:right;
	width: 310px;
	height: auto;
	float: right;
}

#pay_box_price_title {
	position: relative;
	width: 100%;
	height: 44px;
	background-color: #575f79;
	background-repeat: no-repeat;
	background-position: center center;
	color:white;
	font-size:25px;
	text-align:center;
}

#pay_price_list_layer {
	position: relative;
	width: 308px !important;
	height: 259px;
	background-color: #f7f7f7;
	border: 1px solid #dfdfe1;
	margin-top: 0px;
}

.pay_price_underline {
	border-bottom: 1px solid #a9adb9;
}

#pay_price_print {
	position: absolute;
	width: 265px;
	height: auto;
	left: 20px;
	top: 18px;
}

#pay_price_print dl {
	position: relative;
	width: 265px;
	height: auto;
	*zoom: 1;
}

#pay_price_print dl:after {
	content: "";
	clear: both;
	display: block
}

#pay_price_print dt {
	position: relative;
	width: 140px;
	height: 19px;
	margin-top: 7px;
	float: left;
	font-size: 12px;
	color: #5c5c5c;
}

#pay_price_print dd {
	position: relative;
	width: 125px !important;
	height: 19px;
	margin-top: 7px;
	float: right;
	font-size: 12px;
	color: #5c5c5c;
	text-align: right;
}

#pay_price_total_print {
	border-top: 2px solid #6a748a;
}

#pay_price_total_print dt {
	width: 100px !important;
	padding-top: 8px;
	font-weight: bold;
}

#pay_price_total_print dd {
	width: 165px !important;
	padding-top: 1px;
	font-size: 12pt;
	font-family: µ¸¿ò;
	color: #ff6600;
	font-weight: bold;
}

#pay_price_total_print dd .pay_box_right_total {
	font-size: 17pt;
	font-family: Arial;
}

#pay_price_total_print dd .pay_box_right_total_text {
	font-size: 17pt;
	font-family: µ¸¿ò;
}

/* ¹öÆ° ·¹ÀÌ¾î */
#pay_right_btn_layer {
	position: relative;
	width: 310px;
	height: 48px;
	margin-top: 5px;
	padding: 0px;
}

#pay_right_btn_layer img {
	float: left;
	cursor: pointer;
}
.pay_price_method_right{
	float:right;
	width:310px;
	height:auto;
}
</style>
</head>
<body>
	<%@ include file="../common/top.jsp"%>
	<div class="wrap">
		<!-- 배송 및 주문 페이지 전체 div -->
		<div class="step">
			<img src="../../images/jinseok/icon/step_delivery.PNG">
		</div>
		<div class="prd_delivery">
			<!-- 주문 상품 div -->
			<div class="delivery_title">주문상품</div>
			<div class="delivery_tb">
				<table>
					<tr>
						<th style="width: 100px; height: 31px;">이미지</th>
						<th style="width: 350px; height: 31px;">상품명</th>
						<th style="width: 100px; height: 31px;">상품 가격</th>
						<th style="width: 100px; height: 31px;">수량</th>
						<th style="width: 100px; height: 31px;">합계</th>
					</tr>
					<tr>
						<td style="text-align: center;"><img
							src="../../images/jinseok/cpu/i3_7100.jpg" style="width: 85px; height: 85px;"></td>
						<td style="width: 350px; height: 31px;">[AMD] 라이젠 3 레이븐릿지
							2200G (쿼드코어/3.5GHz/쿨러포함/대리점정품) Ryean 3 2200G(3.5GHz) / 쿼드코어(4코어)
							/ 라이젠 / 소켓AM4 / 6MB버퍼 / 14nm / AMD 라데온 Vega 8 내장그래픽</td>
						<td style="width: 100px; height: 31px; font-size: 14px;">가격 :
							217000원</td>
						<td style="width: 100px; height: 31px;">수량</td>
						<td style="width: 100px; height: 31px;">217000원</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="shipping_info">
			<!-- 배송지 정보 div -->
			<div class="delivery_title">배송지 정보</div>
			<table class="shipping_tb">
				<tr>
					<th>받으시는 분</th>
					<td><input type="text"></td>
				</tr>
				<tr>
					<th>배송지 명</th>
					<td><input type="text"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="tel" name="phone"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" id="address1" name="address1">&nbsp;
					<input type="button" id="zipcode" value="우편번호" onclick="search_post()"></td>
				</tr>
				<tr>
					<th></th>
					<td><input type="text" id="address2" name="address2" class="long_text"></td>
				</tr>
				<tr>
					<th>상세주소</th>
					<td><input type="text" id="address3" name="address3" class="long_text"></td>
				</tr>
				<tr>
					<th>배송시 요구사항</th>
					<td><input type="text" class="long_text"></td>
				</tr>
			</table>
		</div>
		<div class="delivery_wrap">
			<div class="delivery_title">배송지 선택</div>

			<div class="delivery_left">
				<div class="delivery">배송지 선택</div>
			</div>
			<div class="delivery_center">
				<ul>
					<li><input type="radio" name="delivery" id="cj"><label
						for="cj">CJ대한통운</label></li>
					<li><input type="radio" name="delivery" id="post"><label
						for="post">우체국택배</label></li>
					<li><input type="radio" name="delivery" id="logen"><label
						for="logen">로젠택배</label></li>
					<li><input type="radio" name="delivery" id="hyundai"><label
						for="hyundai">현대택배</label></li>
					<li><input type="radio" name="delivery" id="hanjin"><label
						for="hanjin">한진택배</label></li>
				</ul>
			</div>
			<div class="delivery_right">택배사 별 정보사항</div>
		</div>
		<br> <br>
		<div id="pay_price_method_layer" class="div_all_layer pay_box_layer">
		<div style="width:100%; height:500px;">
			<div id="pay_price_method_left">
				<div id="pay_method_list">
					<span class="pay_method_title_text">결제방법 선택</span>

					<div id="pay_price_method_list" class="pay_price_table_class">
						<table border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<th style="border-top: none;">결제방법 선택</th>
									<td style="border-top: none;"><input type="radio"
										name="pay_price_method" id="pay_price_method_1" value="bank"><label
										for="pay_price_method_1">무통장입금</label> &nbsp; <span
										style="padding-left: 24px;"><input type="radio"
											name="pay_price_method" id="pay_price_method_2" value="card"><label
											for="pay_price_method_2">신용카드</label></span></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div id="pay_price_method_bank" class="pay_price_table_class"
						style="display: none;">
						<table border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr id="pay_input_bank_select">
									<th>입금은행 선택</th>
									<td>
										<div style="float: left;">
											<select name="input_bank_select" id="id_input_bank_select"
												style="height: 24px;">
												<option value="1">국민 015437-04-006259
													MasterPiece(주)</option>
												<option value="2">기업 284-039112-04-047
													MasterPiece(주)</option>
												<option value="3">농협 011-01-458734 MasterPiece(주)</option>
												<option value="4">신한 140-008-103125 MasterPiece(주)</option>
												<option value="5">우리 1005-101-096224 MasterPiece(주)</option>
												<option value="6">하나 113-910042-03304
													MasterPiece(주)</option>
											</select>
										</div>
										<div style="float: left; padding-left: 18px;">
											&nbsp; 입금자 <input type="textbox" name="bank_name"
												id="id_bank_name" class="pay_textbox_style"
												style="width: 142px !important;" value="">
										</div>
									</td>
								</tr>


								<tr>
									<th>증빙서류신청</th>
									<td><input type="radio" name="pay_tax_bank"
										id="pay_tax_bank_1" value="tax"><label
										for="pay_tax_bank_1">세금계산서</label> &nbsp; <span
										style="padding-left: 24px;"><input type="radio"
											name="pay_tax_bank" id="pay_tax_bank_2" value="cash"><label
											for="pay_tax_bank_2">현금영수증</label> &nbsp;</span> <span
										style="padding-left: 20px;"><input type="radio"
											name="pay_tax_bank" id="pay_tax_bank_3" value="no"><label
											for="pay_tax_bank_3">신청안함</label></span></td>
								</tr>
							</tbody>
						</table>
					</div>


					<div id="pay_price_method_no_bank" class="pay_price_table_class"
						style="display: none;">
						<table border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<th>기존적립금</th>
									<td><input type="textbox" name="point_can_use_no_bank"
										class="pay_textbox_style pay_textbox_short"
										style="text-align: right;" value="0"
										onkeyup="usePointCheck('no_bank');" readonly=""> <img
										src="./images/pay_orange_point_icon.gif" class="orange_icon">
										&nbsp; &nbsp; &nbsp; <span style="padding-left: 8px;">(보유머니
											<span class="pay_price_orage_font">0P</span>)
									</span></td>
								</tr>
								<tr>
									<th>I POINT</th>
									<td><input type="textbox" name="i_point_use_no_bank"
										class="pay_textbox_style pay_textbox_short"
										style="text-align: right;" value="0"
										onkeyup="usePointCheck('no_bank');"> <img
										src="./images/pay_orange_point_icon.gif" class="orange_icon">
										&nbsp; &nbsp; &nbsp; <span style="padding-left: 8px;">(보유
											I POINT <span class="pay_price_orage_font">0P</span>) &nbsp;
											&nbsp; &nbsp; <span style="padding-left: 40px;"><input
												type="checkbox" name="i_point_vat_use"
												id="id_i_point_vat_use_no_bank" value="use"
												onclick="iPointVatUse(this.id);"><label
												for="id_i_point_vat_use_no_bank">I POINT 세금계산서 및
													현금영수증 발행</label></span>
									</span></td>
								</tr>
								<tr>
									<th>현금반품적립금</th>
									<td><input type="textbox" name="cash_point_use_no_bank"
										class="pay_textbox_style pay_textbox_short"
										style="text-align: right;" value="0"
										onkeyup="usePointCheck('no_bank');"> <img
										src="./images/pay_orange_point_icon.gif" class="orange_icon">
										&nbsp; &nbsp; &nbsp; <span style="padding-left: 8px;">(보유
											현금반품적립금 <span class="pay_price_orage_font">0P</span>)
									</span></td>
								</tr>

								<tr>
									<th>증빙서류신청</th>
									<td><input type="radio" name="pay_tax_bank"
										id="pay_tax_card_1" value="tax"><label
										for="pay_tax_card_1">세금계산서</label> &nbsp; <span
										style="padding-left: 23px;"><input type="radio"
											name="pay_tax_bank" id="pay_tax_card_3" value="no"><label
											for="pay_tax_card_3">신청안함</label> </span></td>
								</tr>

							</tbody>
						</table>
						<table id="pay_price_method_no_bank_addbox" style="display: none;">
							<tbody>
								<tr>
									<th colspan="2" style="border-right: none">
										<p style="color: #f53843">[구버젼 운영체제 및 브라우져 결제 차단 안내]</p>

										<p>
											KISA(한국인터넷진흥원)의 권장사항에 따라<br> 보안이 취약한 구버젼의 운영체제 및 브라우져로
											접속시 결제가 차단 됩니다.
										</p>

										<p>
											대상 운영체제 : Internet Explorer 7 이하 및 기타 구버젼<br> 대상 브라우져 :
											Windows XP , Windows Vista 및 기타 구버젼
										</p>

									</th>
								</tr>
							</tbody>
						</table>
					</div>

					<div id="pay_price_method_kakao" class="pay_price_table_class"
						style="display: none;">
						<table border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<th>기존적립금</th>
									<td><input type="textbox" name="point_can_use_kakao"
										class="pay_textbox_style pay_textbox_short"
										style="text-align: right;" value="0"
										onkeyup="usePointCheck('kakao');" readonly=""> <img
										src="./images/pay_orange_point_icon.gif" class="orange_icon">
										&nbsp; &nbsp; &nbsp; <!-- <img src="./images/pay_point_apply_btn.gif" alt="포인트적용" class="orange_btn" onclick="usePointCheck('kakao');"/> -->
										<span style="padding-left: 8px;">(보유머니 <span
											class="pay_price_orage_font">0P</span>)
									</span></td>
								</tr>
								<tr>
									<th>I POINT</th>
									<td><input type="textbox" name="i_point_use_kakao"
										class="pay_textbox_style pay_textbox_short"
										style="text-align: right;" value="0"
										onkeyup="usePointCheck('kakao');"> <img
										src="./images/pay_orange_point_icon.gif" class="orange_icon">
										&nbsp; &nbsp; &nbsp; <span style="padding-left: 8px;">(보유
											I POINT <span class="pay_price_orage_font">0P</span>) &nbsp;
											&nbsp; &nbsp; <span style="padding-left: 40px;"><input
												type="checkbox" name="i_point_vat_use"
												id="id_i_point_vat_use_kakao" value="use"
												onclick="iPointVatUse(this.id);"><label
												for="id_i_point_vat_use_kakao">I POINT 세금계산서 및 현금영수증
													발행</label></span>
									</span></td>
								</tr>
								<tr>
									<th>현금반품적립금</th>
									<td>
									<input type="textbox" name="cash_point_use_kakao" class="pay_textbox_style pay_textbox_short" style="text-align: right;" value="0" onkeyup="usePointCheck('kakao');"> 
									<img src="./images/pay_orange_point_icon.gif" class="orange_icon"> &nbsp; &nbsp; &nbsp; 
									<span style="padding-left: 8px;">(보유 현금반품적립금 <span class="pay_price_orage_font">0P</span>)</span>
									</td>
								</tr>

								<tr style="display: none">
									<th>증빙서류신청</th>
									<td>
										<input type="radio" name="pay_tax_bank" id="pay_tax_kakao_1" value="tax">
										<label for="pay_tax_kakao_1">세금계산서</label> &nbsp; <span style="padding-left: 23px;">
										<input type="radio" name="pay_tax_bank" id="pay_tax_kakao_3" value="no">
										<label for="pay_tax_kakao_3">신청안함</label> </span>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
				<div class="pay_price_method_right">
					<div id="pay_price_right">
						<div id="pay_box_price_title">
							<em>결제금액</em>
						</div>
						<div id="pay_price_list_layer" style="height: 340px;">
							<div id="pay_price_print">
								<dl class="pay_price_underline">
									<dt>
										<b>제품가격</b>
									</dt>
									<dd>
										<b>222,000원</b>
									</dd>
								</dl>
								<dl>
									<dt>기존적립금 사용</dt>
									<dd id="printPointUse">0원</dd>
								</dl>
								<dl>
									<dt>배송비</dt>
									<dd id="printDeliverPay">0원</dd>
								</dl>
								<dl id="pay_price_total_print">
									<dt>총 결제금액</dt>
									<dd>
										<span class="pay_box_right_total" id="printPayPrice">222,000</span>원
									</dd>
								</dl>
							</div>
						</div>

						<div id="pay_right_btn_layer">
							<img src="../../images/jinseok/icon/pay_go_cart_btn.gif" alt="장바구니로 가기" onclick="location.replace('#');">
							<img src="../../images/jinseok/icon/pay_go_pay_btn.gif" alt="결제하기" style="float:right;" onclick="#" id="pay_submit_btn"> 
							<!-- <img src="../../images/pay_go_pay_btn_ing.gif" alt="결제중" style="float:right; display: none;" id="pay_submit_btn_ing" onclick="alert('현재 결제 처리중입니다. 잠시만 기다리세요.');"> -->
						</div>
					</div>
				</div>
			</div><!-- -------------------- -->
			</div>
		</div>
			<script>
				function search_post(){
					new daum.Postcode({
                        oncomplete: function(data) {
                            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
             
                            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                            var extraRoadAddr = ''; // 도로명 조합형 주소 변수
             
                            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                extraRoadAddr += data.bname;
                            }
                            // 건물명이 있고, 공동주택일 경우 추가한다.
                            if(data.buildingName !== '' && data.apartment === 'Y'){
                               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                            }
                            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                            if(extraRoadAddr !== ''){
                                extraRoadAddr = ' (' + extraRoadAddr + ')';
                            }
                            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                            if(fullRoadAddr !== ''){
                                fullRoadAddr += extraRoadAddr;
                            }
             
                            // 우편번호와 주소 정보를 해당 필드에 넣는다.
                            document.getElementById('address1').value = data.zonecode; //5자리 새우편번호 사용
                            document.getElementById('address2').value = fullRoadAddr;
                            /* document.getElementById('address3').value = data.jibunAddress; */
         
                            
                        }
                    }).open();
					
				}
			</script>
			<%@include file = "../common/footer.jsp" %>
</body>
</html>
