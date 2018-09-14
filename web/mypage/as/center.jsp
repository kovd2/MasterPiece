<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.centerWrapArea {
	display: inline-block;
	width: 79%;
	height: 1200px;
	background: white;
	float: right;
	font-size: 12px;
	font-family: dotum;
	color: #464646;
	box-sizing: border-box;
}

.section {
	float: left;
	margin-left: 10px;
}

.center_top_title {
	height: 40px;
	background: white;
	font-size: 28px;
	font-weight: bold;
	padding: 17px 22px;
}

.div {
	word-break: break-all;
	word-wrap: break-word;
}

div {
	display: block;
}

.header {
	width: 935px;
	height: 38px;
	vertical-align: middle;
	border: 1px #ccc solid;
	background-color: #f3f4f6;
}

.box_header {
	width: 925px;
	line-height: 38px;
	height: 38px;
	font-weight: bold;
	padding-left: 10px;
	background-color: #F3F4F6;
}

.first-child {
	border: 1px solid #ccc;
	border-top: 0px;
	width: 100px;
}

.last-child {
	border: 1px solid #ccc;
	border-left: 0px;
	border-top: 0px;
	width: 814px;
}

.box_2>div {
	float: left;
	padding-left: 10px;
	height: 37px;
	line-height: 37px;
}

.clear {
	clear: both !important;
	height: 0px !important;
	float: none !important;
	border: 0px !important;
	padding: 0px !important;
}

.section .as_box {
	border: 1px solid #ccc;
	margin-top: 20px;
}

.box_1 {
	width: 925px;
	padding-left: 10px;
	border-top: 1px solid #ccc;
	/* border-bottom: 1px solid #ccc; */
	height: 38px;
	line-height: 38px;
}

.btn_142_bg_red {
	margin-left: 7px;
	display: inline-block;
	background-color: #E01737;
	color: #fff;
	height: 12px;
	font-size: 12px;
	padding: 8px 0px;
	width: 142px;
	text-align: center;
	cursor: pointer;
	line-height: 12px;
}

.box_1 .info_text {
	color: #E31738;
	padding-left: 10px;
	vertical-align: sub;
}

.m_top20 {
	margin-top: 20px;
}

.section .as_memo {
	border: 1px solid #ccc;
	border-top: 0px;
}

.as_memo>textarea {
	width: 930px;
	border: 0px;
	height: 80px;
	font-size: 12px;
}

textarea {
	font-family: monospace;
	border-color: rgb(169, 169, 169);
}

textarea {
	-webkit-appearance: textarea;
	background-color: white;
	-webkit-rtl-ordering: logical;
	flex-direction: column;
	resize: auto;
	cursor: text;
	white-space: pre-wrap;
	overflow-wrap: break-word;
	border-width: 1px;
	border-style: solid;
	border-color: initial;
	border-image: initial;
	padding: 2px;
}

.scell {
	display: table-cell !important;
	height: 37px;
	vertical-align: middle;
}

input[type="radio" i] {
	margin: 3px 3px 0px 5px;
}

input[type="radio" i] {
	-webkit-appearance: radio;
	box-sizing: border-box;
}

input[type="radio" i], input[type="checkbox" i] {
	background-color: initial;
	cursor: default;
	margin: 3px 0.5ex;
	padding: initial;
	border: initial;
}

.box_2 .last-child input[type="text"] {
	width: 90px;
	padding-left: 5px;
	border: 1px solid #ccc;
	height: 24px;
	vertical-align: middle;
	line-height: 20px;
}

input[type="text"], select {
	padding: 0px;
	box-shadow: none;
	border: 1px solid #ccc;
	font-size: 12px;
}

.last-child select {
	width: 97px;
	padding-left: 5px;
	border: 1px solid #ccc;
	height: 28px;
	vertical-align: middle;
	/* padding: 0px; */
	margin-top: -2px;
}

.pd5 {
	padding: 0px 5px !important;
	text-align: center !important;
}

.wd200 {
	width: 200px !important;
}

.btn_ffffff {
	height: 26px;
	border: 1px solid #454C5F;
	color: #454C5F;
	width: 48px;
	background: #fff;
	vertical-align: middle;
	font-size: 12px;
	font-weight: lighter;
}

.btn_97_bg_blue {
	margin-left: 7px;
	display: inline-block;
	background-color: #454C5F;
	color: #fff;
	height: 12px;
	font-size: 12px;
	padding: 8px 0px;
	width: 97px;
	text-align: center;
	cursor: pointer;
	line-height: 12px;
}

.btn_red_bg {
    background-color: #fff;
    cursor: pointer;
    width: 140px;
    display: inline-block;
    text-align: center;
    height: 33px;
    color: #e31738;
    border: 1px solid #e31738;
    padding: 0px;
    vertical-align: bottom;
}

.btn_red_border {
    background-color: #e31738;
    color: #fff;
    padding: 0px;
    cursor: pointer;
    width: 140px;
    display: inline-block;
    text-align: center;
    height: 33px;
    border: 0px;
    vertical-align: bottom;
}
</style>

</head>
<body>
	<div class="centerWrapArea">
		<div class="section">
			<div class='header box_header'>회원정보</div>

			<div class='box_2'>
				<div class='first-child'>이름</div>
				<div class='last-child'>안광성</div>
				<div class='clear'></div>
			</div>

			<div class='box_2'>
				<div class='first-child'>휴대전화</div>
				<div class='last-child'>010-9484-3365</div>
				<div class='clear'></div>
			</div>

			<div class='box_2'>
				<div class='first-child'>전화번호</div>
				<div class='last-child'>--</div>
				<div class='clear'></div>
			</div>

			<div class='box_2'>
				<div class='first-child'>이메일</div>
				<div class='last-child'>syong9233@naver.com</div>
				<div class='clear'></div>
			</div>


			<div class='as_box'>
				<div class='box_header'>상품선택</div>

				<div class='box_1'>
					<span id="img_scroll" class='btn_142_bg_red'
						onclick="as_item_list_pop();">회원 주문상품 검색</span> <span
						class='info_text'>주문하신 상품을 검색 및 선택해 주세요.</span>
				</div>

				<div id="item_div"></div>
			</div>

			<div class='header box_header m_top20'>증상 및 내용</div>
			<div class='as_memo'>
				<textarea name="msg_v"></textarea>
			</div>


			<div class='header box_header m_top20'>접수방법</div>

			<div class='box_2'>
				<div class='first-child'>선택</div>
				<div class='last-child'>
					<span class='chk_received1 text-red'><label><input
							type='radio' name="chk_received" value="1" checked />택배 직접발송</label></span>
				</div>
				<div class='clear'></div>
			</div>

			<!-- 택배 직접발송 start -->
			<div id="chk_received1">

				<div class='box_2'>
					<div class='first-child'>택배사 선택</div>
					<div class='last-child'>
						<div>
							<span class='scell'> <select name="delivery_name[]"
								class='wd207'>
									<option>cj</option>
									<option>롯데택배</option>
							</select>
							</span> <span class='scell pd5'></span> <span class='scell'> <input
								name="delivery_num[]" class='wd200' type='text'
								placeholder="운송장번호를 '-' 없이 입력해주세요 " />
							</span> <span class='scell pd5'></span> <span class='scell'> <input
								type='button' id="add_chk_received1" class='btn_ffffff'
								value='추가' style='cursor: pointer' />
							</span>

						</div>
					</div>
					<div class='clear'></div>
				</div>

				<div id='append_HTML1'></div>

				<!-- <div class='m_top10 text-red ml10'>＊ 발송전일경우 발송 후 > MY쇼핑정보 > 송장번호를 등록해주세요.</div> -->
			</div>
			<!-- 택배 직접발송 end -->

			<div id="div_type1" style="display: block">
				<div class='header box_header m_top20'>배송받을 주소</div>

				<div class='box_2'>
					<div class='first-child'>선택</div>
					<div class='last-child' id="deliver_list_btn_layer2">
						<div></div>
					</div>
					<div class='clear'></div>
				</div>
				<div class='box_2'>
					<div class='first-child'>받으시는 분</div>

					<div class='last-child'>
						<span class='scell'><input type='text' name="d2_id_name"
							id="d2_id_name" /></span>
					</div>
					<div class='clear'></div>
				</div>

				<div class='box_2'>

					<div class='first-child div2'>배송지 주소</div>

					<div class='last-child  div2_info'>

						<div class='div2_info_first'>
							<span class='scell'><input type='text' name="d2_id_zip1"
								id="d2_id_zip1" /></span> <span class='scell pd5'>-</span> <span
								class='scell'><input type='text' name="d2_id_zip2"
								id="d2_id_zip2" /></span> <span class='scell pd5'></span> <span
								class='scell cursor'> <span class='btn_97_bg_blue'
								onclick="execDaumPostcode2(); return false;">주소검색</span>
							</span>


							<script
								src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
							<script>
								//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
								function execDaumPostcode2() {
									new daum.Postcode(
											{
												oncomplete : function(data) {
													// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

													//console.log(data);

													// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
													// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
													var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
													var extraRoadAddr = ''; // 도로명 조합형 주소 변수

													// 법정동명이 있을 경우 추가한다. (법정리는 제외)
													// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
													if (data.bname !== ''
															&& /[동|로|가]$/g
																	.test(data.bname)) {
														extraRoadAddr += data.bname;
													}
													// 건물명이 있고, 공동주택일 경우 추가한다.
													if (data.buildingName !== ''
															&& data.apartment === 'Y') {
														extraRoadAddr += (extraRoadAddr !== '' ? ', '
																+ data.buildingName
																: data.buildingName);
													}
													// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
													if (extraRoadAddr !== '') {
														extraRoadAddr = ' ('
																+ extraRoadAddr
																+ ')';
													}
													// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
													if (fullRoadAddr !== '') {
														fullRoadAddr += extraRoadAddr;
													}

													if (data.postcode) {
														document
																.getElementById('d2_id_zip1').value = data.postcode1; //old
														document
																.getElementById('d2_id_zip2').value = data.postcode2; //old
													} else {
														document
																.getElementById('d2_id_zip1').value = data.zonecode
																.substr(0, 2); //new
														document
																.getElementById('d2_id_zip2').value = data.zonecode
																.substr(2, 5); //new
													}

													if (data.userSelectedType == 'J') {
														document
																.getElementById('d2_id_addr1').value = data.jibunAddress; //old
													} else {
														document
																.getElementById('d2_id_addr1').value = fullRoadAddr; //new
													}

												}
											}).open();
								}
							</script>




						</div>

						<div class='div2_info_last'>
							<span class='scell'><input type='text' name="d2_id_addr1"
								id="d2_id_addr1" /></span>
						</div>
						<div class='div2_info_last'>
							<span class='scell'><input type='text' name="d2_id_addr2"
								id="d2_id_addr2" /></span>
						</div>

					</div>
					<div class='clear'></div>


				</div>

				<div class='box_2'>
					<div class='first-child'>휴대전화</div>
					<div class='last-child'>

						<div>
							<span class='scell'><input type='text' name="d2_id_hp1"
								id="d2_id_hp1" /></span> <span class='scell pd5'>-</span> <span
								class='scell'><input type='text' name="d2_id_hp2"
								id="d2_id_hp2" /></span> <span class='scell pd5'>-</span> <span
								class='scell'><input type='text' name="d2_id_hp3"
								id="d2_id_hp3" /></span>
						</div>

					</div>
					<div class='clear'></div>
				</div>
				<div class='box_2'>
					<div class='first-child'>전화번호</div>
					<div class='last-child'>

						<div>
							<span class='scell'><input type='text' name="d2_id_tel1"
								id="d2_id_tel1" /></span> <span class='scell pd5'>-</span> <span
								class='scell'><input type='text' name="d2_id_tel2"
								id="d2_id_tel2" /></span> <span class='scell pd5'>-</span> <span
								class='scell'><input type='text' name="d2_id_tel3"
								id="d2_id_tel3" /></span>
						</div>

					</div>
					<div class='clear'></div>
				</div>

			</div>
			<div id="div_type2" style="display: block">

				<div class='header box_header m_top20'>환불계좌정보</div>

				<div class='box_2'>
					<div class='first-child'>은행명</div>
					<div class='last-child'>
						<div>
							<span class='scell'> <select name="return_bank_name"
								id="return_bank_name" class='wd207'>
									<option value="">선택하세요</option>

									<option value="국민은행">국민은행</option>
									<option value="기업은행">기업은행</option>
									<option value="우리은행">우리은행</option>
									<option value="신한은행">신한은행</option>
									<option value="하나은행">하나은행</option>
									<option value="농협">농협</option>
									<option value="단위농협">단위농협</option>
									<option value="SC은행">SC은행</option>
									<option value="외환은행">외환은행</option>
									<option value="한국씨티은행">한국씨티은행</option>
									<option value="우체국">우체국</option>
									<option value="경남은행">경남은행</option>
									<option value="광주은행">광주은행</option>
									<option value="대구은행">대구은행</option>
									<option value="도이치">도이치</option>
									<option value="부산은행">부산은행</option>
									<option value="산림조합">산림조합</option>
									<option value="산업은행">산업은행</option>
									<option value="상호저축은행">상호저축은행</option>
									<option value="새마을금고">새마을금고</option>
									<option value="수협">수협</option>
									<option value="신협중앙회">신협중앙회</option>
									<option value="전북은행">전북은행</option>
									<option value="제주은행">제주은행</option>
									<option value="케이뱅크">케이뱅크</option>
									<option value="BOA">BOA</option>
									<option value="HSBC">HSBC</option>
									<option value="JP모간">JP모간</option>
									<option value="비엔피파리바은행">비엔피파리바은행</option>
									<option value="카카오뱅크">카카오뱅크</option>
									<option value="교보증권">교보증권</option>
									<option value="대신증권">대신증권</option>
									<option value="대우증권">대우증권</option>
									<option value="동부증권">동부증권</option>
									<option value="동양증권">동양증권</option>
									<option value="메리츠증권">메리츠증권</option>
									<option value="미래에셋">미래에셋</option>
									<option value="부국증권">부국증권</option>
									<option value="삼성증권">삼성증권</option>
									<option value="솔로몬투자증권">솔로몬투자증권</option>
									<option value="신영증권">신영증권</option>
									<option value="신한금융투자">신한금융투자</option>
									<option value="우리투자증권">우리투자증권</option>
									<option value="유진투자증권">유진투자증권</option>
									<option value="이트레이드증권">이트레이드증권</option>
									<option value="키움증권">키움증권</option>
									<option value="하나대투">하나대투</option>
									<option value="하이투자">하이투자</option>
									<option value="한국투자">한국투자</option>
									<option value="한화증권">한화증권</option>
									<option value="현대증권">현대증권</option>
									<option value="HMC증권">HMC증권</option>
									<option value="LIG투자증권">LIG투자증권</option>
									<option value="NH증권">NH증권</option>
									<option value="SK증권">SK증권</option>

							</select>
							</span>
						</div>
					</div>
					<div class='clear'></div>
				</div>
				<div class='box_2'>
					<div class='first-child'>계좌정보</div>
					<div class='last-child'>
						<div>
							<span class='scell'> <input name="return_bank_number"
								id="return_bank_number" class='wd200' type='text' value="" />
							</span>
						</div>
					</div>
					<div class='clear'></div>
				</div>
				<div class='box_2'>
					<div class='first-child'>예금주명</div>
					<div class='last-child'>
						<div>
							<span class='scell'> <input name="return_bank_owner"
								id="return_bank_owner" class='wd200' type='text' value="" />
							</span> <span class='scell pd5'></span> <span class='scell'> <span
								class='btn_97_bg_blue vmiddle' onclick="bank_reset()">초기화</span>
							</span>
						</div>
					</div>
					<div class='clear'></div>
				</div>
			</div>
			<div class='header box_header m_top20'>
				이용안내
				<!--<span class='all_view float_right m_right5'>전체보기 > </span>-->
			</div>
			<div class='as_memo'>
				<textarea readonly>
교환

교환 가능
- 상품포장이 미개봉인 경우에 한하여 상품 수령일로부터 15일 이내 가능.
- 배송된 상품이 주문내용과 상이하거나 쇼핑몰이 제공한 정보와 상이한 경우.
(단, 배송완료일 기준 또는 알 수 있었던 날로부터 30일 이내 가능)
- 배송받으신 상품이 초기불량 및 하자의 사유인 경우.
(단, 일부 제조사 제품의 경우 자체 AS센터에서 불량제품 판정 받은 후 교환 가능)


교환 불가능
- 단순변심으로 포장 개봉 후 당사가 정한 기준에 의해 재판매가 불가한 경우.
- 상품 및 구성품의 일부를 분실하였거나 취급 부주의로 인해 파손/고장/오염된 경우.
- 박스개봉으로 재판매가 어렵다고 판단되는 경우.
- 배송완료 후 15일이 경과한 경우. (미개봉 상품 포함)
- 복제가 가능한 상품 등의 포장을 훼손한 경우. (DVD타이틀, 게임타이틀, 소프트웨어 등)
- 천재지변으로 인한 제품의 손상 및 분실한 경우.


일반 교환 운임료 정책
-아래 언급된 운송료는 CJ대한통운/롯데택배를 이용하는 경우에만 해당합니다.
 (다른 운송방법을 이용하는 경우 운송료는 고객님께서 부담해야 합니다.)
- 제품구입 후 15일 이내 제품불량 / 제품정보와 상이 / 오배송 발생시 교환에 필요한 운송료를 전액(왕복) 아이코다에서 부담합니다.
- 제품구입 후 15일 이상 30일 이내에 제품불량 / 제품정보와 상이 / 오배송 발생시 교환에 필요한 운송료는 반액(편도 택배비) 아이코다에서 부담합니다.
- 제품구입 후 30일 이후 발생하는 제품불량 / 제품정보와 상이 / 오배송의 경우 운송료 전액을 고객님께서 부담해야 합니다.
- 구매 인수 후 15일 이내의 초기불량 포함한 제품 불량 발생시에 관해서는 택배로만 처리되며, CJ대한통운/롯데택배를 이용하실 경우에만 운임비 지원이 가능합니다.


변심 교환 운임료 정책
- 변심에 의해 교환하는 경우 상품 수령일 기준 15일 이내 처리 가능하며, 운송비 전액을 고객님께서 부담해야 합니다.




반품

반품 가능
- 상품포장이 미개봉인 경우에 한하여 상품 수령일로부터 15일 이내 가능.
- 배송된 상품이 주문내용과 상이하거나 쇼핑몰이 제공한 정보와 상이한 경우.
(단, 배송완료일 기준 또는 알 수 있었던 날로부터 15일 이내 가능.)
- 배송받으신 상품이 초기불량 및 하자의 사유인 경우.
(단, 일부 제조사 제품의 경우 자체 AS센터에서 불량제품 판정 받은 후 반품 가능)



반품 불가능
- 단순변심으로 포장 개봉 후 당사가 정한 기준에 의해 재판매가 불가한 경우.
- 상품 및 구성품의 일부를 분실하였거나 취급 부주의로 인해 파손/고장/오염된 경우.
- 제품박스 개봉으로 재판매가 어렵다고 판단되는 경우.
- 배송완료 후 15일이 경과한 경우. (미개봉 상품 포함)
- 복제가 가능한 상품 등의 포장을 훼손한 경우. (DVD타이틀, 게임타이틀, 소프트웨어 등)
- 천재지변으로 인한 제품의 손상 및 분실한 경우.


일반 반품 운임료 정책
- 아래 언급된 운송료는 CJ대한통운/롯데택배를 이용하는 경우에만 해당합니다. (다른 운송방법을 이용하는 경우 운송료는 고객님께서 부담해야 합니다.)
- 제품구입 후 15일 이내 제품불량 / 제품정보와 상이 / 오배송 발생시 반품에 필요한 운송료를 전액 아이코다에서 부담합니다.
- 구매 인수 후 15일 이내의 초기불량 포함한 제품 불량 발생시에 관해서는 택배로만 처리되며, CJ대한통운/롯데택배를 이용하실 경우에만 운임비 지원이 가능합니다.


변심 반품 운임료 정책
- 변심에 의해 반품하는 경우 상품 수령일 기준 15일 이내 처리 가능하며, 운송비 전액을 고객님께서 부담해야 합니다.






대금 환불

 신용카드 결제 : 신용카드 취소처리
(단, 청구된 이후 취소처리가 된 경우 각 카드사 취소/환불규정에 의거하여 다음 달 카드대금에서 통장으로 환불 처리됩니다.)
- 결제 취소시 i - POINT는 재적립 처리 됩니다.

온라인 송금(무통장) :
- 월, 화, 수, 목, 금요일 확인 접수 시 : 환불 요청 접수 당일 오후에 환불 처리됩니다.
  단, 오후 6시 이후 환불 요청은 다음 영업일 오후에 환불 처리됩니다.
  금(오후 6시 이후), 토, 확인 접수 시 : 다음 근무일 오후에 환불 처리 됩니다.
- 결제 취소시 i - POINT는 재적립 처리 됩니다.

신용카드로 결제하신 제품을 반품하시는 경우 법률에 의거하여 반품 금액을 현금으로 입금하여 드리지 아니하며, 고객님께서 해당 차액을 결제하시는 즉시
종전 결제의 승인 취소를 하여 드립니다.








 A/S 기준
- 아이코다에서 품질 보증(A/S) 기간은 제품 구입일자를 기준으로 1년이며, 구입일자의 확인은 영수증을 기준으로 합니다. (단, 제품특성상 일부제품은 예외적 A/S정책에 따름.)
- 영수증 확인이 불가능한 경우에는 아이코다 사용하고 있는 고객관리 프로그램의 DB 출고일자를 기준으로 하며, 영수증 및 아이코다 자체 DB 내역의 조회가 불가능한 경우 A/S가 불가능합니다.
- 아이코다의 보증기간 이후 제품 A/S, 교환은 각 부품의 제조/유통사에서 받을 수 있습니다.
- 아이코다는 이상제품을 입고처리 한 뒤 점검하여 제품 교환/수리/반품을 진행하는 선입고, 후발송 규정을 따르며, 제품의 선출고 또는 맞교환은 하지 않습니다.
- 제조사, 유통사의 부도로 인하여 더 이상의 A/S 처리가 불가능할 경우 무상 보증이 조기 종료될 수 있습니다.
- 즉시 교환이 가능한 제품은 입고 후 1~3 영업일에 처리가 완료되나, 제조사/유통사 입고를 거치는 제품은 처리에 시간이 길어질 수 있습니다. 이 경우 고객님께 안내를 드립니다.
- 제품의 단종으로 동일한 제품의 교환 또는 수리가 어려운 경우 고객님의 동의하에 동급 또는 상위 제품으로 교환하여 보내드립니다.
- 저장장치(HDD,SSD,NAS,USB메모리,플레쉬메모리)에 있는 데이터 유실에 대해서 아이코다에서는 책임지지 않습니다. 저장관련 제품은 A/S 보내주시기 전에 반드시 백업을 하신후 보내주시기 바랍니다.
- 이벤트를 통한 무상 증정제품은 특수상품군에 해당되며 15일 이내의 초기불량시에만 교환처리를 해드립니다.
- 입고한 제품의 수리가 완료되고 고객님께 수리 완료를 통보한 이후 3개월 이내에 제품 수령 또는 배송요청을 하지 않으시는 경우 해당 제품을 폐기처리하며, 청구한 유상 수리 비용 및 배송 비용을 납부하지 않으시는 경우 또한 폐기처리 됩니다.
- 제품 교환/반품시에는 구입 당시 증정된 사은품/증정품을 함께 동봉해 주셔야하며, 미 동봉시 운송비를 부담하시어 따로 보내주시거나 물품 가격에서 차감될 수 있습니다.


예외적 A/S제품
브랜드 제품 (LG,삼성, HP, 엡손, 캐논, 소니 등 대기업 브랜드 PC, 모니터, 서버, 노트북, 프린터/복합기, 태블릿PC, 허브, 멀티미디어 기기)
- 해당 제품은 제조사/유통사의 정책에 따라서 해당 제조 및 서비스센터에서 직접 고객지원 업무를 처리합니다.
  아이코다는 해당 제조사/유통사 서비스센터에서 인정하는 경우(불량판정서)에 한해서만 부분적으로 A/S 대행 업무를 처리합니다.
- LCD모니터 및 LED 디스플레이를 쓰는 제품의 결점인정 기준, 무결점 제품의 보증기간은 각 제조사/유통사의 기준을 따르며 해당 제조사로부터 문의하시면 자세한 안내를 받으실 수 있습니다.
- 아이코다에서 대행 A/S(교환,반품 등)가 가능한 경우 먼저 해당 제품의 제조사/유통사 서비스센터에서 제품의 점검을 받은 뒤 서비스센터가 인정하는 불량판정서(DOA 판정서)또는 담당기사의 명함을 제품과 함께 첨부하여 아이코다로 보내주시면 A/S가 가능합니다.

소모품(키보드, 마우스, 잉크/토너, 용지, 청소용품, 공CD/DVD, 케이블, 쿨러, 네트워크 자재, 젠더, 헤드폰, 이어폰, 마이크, 핸드폰 주변기기 등)
- 소모품 제품은 초기보증기간(구매일로부터 3~6개월) 이내에 발생한 명확한 불량에 대해서만 아이코다에서 대행 A/S를 하여 드리며, 이후에는 제품의 제조사/유통사로 문의하시면 자세한 안내를 받으실 수 있습니다.
- 입력장치 제품(키보드, 마우스)은 구매일로부터 6개월동안 아이코다에서 대행 A/S를 하며, 이후에는 각 제품의 제조사/유통사에서 고객지원을 합니다. 또한 일부 제조사 제품은 아이코다에서 직접 교환이 불가능 하오니 이 점을 참고하여 주십시오.
- 정품 잉크,토너의 경우 아이코다에서 대행 A/S를 시행하지 않습니다. 사용하시는 기기의 모델명, 시리얼을 확인 하신 후 각 제조사 서비스센터에서 A/S 가능합니다.
- 호환 잉크,토너의 경우 중량확인을 위해 수입사/유통사로 입고되며 약 1주일 가량의 기간이 소요됩니다,
- 개봉하신 제품은 변심,반품, 다른 제품으로 교환/환불이 원칙적으로 불가능 합니다.

소프트웨어
- 소프트웨어 제품은 CD-Key 유출 등 제품의 특성상 출고 이후 변심반품, 교환이 불가능합니다.
- 미디어의 불량, 호환성 문제 등 제품에 대한 모든 고객지원은 각 소프트웨어의 제조, 유통사에서 담당합니다.


오렌지 PC
- 아이코다 조립PC와 오렌지PC는 1년동안 하드웨어적인 문제에 대해 아이코다에서 제품 보증합니다.
- 임의로 추가, 탈착한 부품에 대해서는 고장 발생 시 무상 보증을 하지 아니하며, 그로 인한 2차 고장에 대해서도 무상 보증을 하지 않습니다.
- 아이코다 조립PC, 오렌지PC는 구매일로부터 1년 이후에 A/S를 요청하실 경우 소정의 수리공임(20,000원)과 부품 실비를 청구합니다.
- 운영체제, 드라이버 및 기타 소프트웨어적인 모든 문제에 대해서는 유상 A/S가 이뤄집니다.
- 아이코다는 불법 소프트웨어 또는 불법적인 작업, 규격 외 이용과 관련한 기술 지원을 하지 않습니다.
- 1년 이후 제조사 기준 서비스 기간이 남아있는 부품의 경우 제품 제조사 서비스센터로 직접 서비스를 신청하셔야 합니다.
			</textarea>
			</div>

			<div class='m_bottom18'></div>

		</div>

		<div class='clear'></div>

		<div class='footer text-center'>
			<!--<div><label><input name="agree" id="agree" class='vsub' type='checkbox' />동의합니다.</label></div>-->

			<div class="btn_box m_top20">
				<input type="button" class="btn_red_bg" onclick="history.back();"
					value="취소"> <input type="button" class="btn_red_border"
					onclick="save();" value="접수">
			</div>

			<div class='m_top20'></div>
		</div>

	</div>







	</div>
	</div>

</body>
</html>