<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.kh.MasterPiece.product.model.vo.*,com.kh.MasterPiece.board.model.vo.*"%>
<%
	Product p = (Product)request.getAttribute("p");
	ArrayList<Attachment> imgList = (ArrayList<Attachment>)request.getAttribute("imgList");
	String beforeBuyIntelCpu = (String)request.getAttribute("beforeBuyIntelCpu");
	String intelCpuDevision = (String)request.getAttribute("intelCpuDevision");
	String beforeBuyAMDCpu = (String)request.getAttribute("beforeBuyAMDCpu");
	String i3_8100InfoImage = (String)request.getAttribute("i3_8100InfoImage");
	String R5_1500X_info = (String)request.getAttribute("R5_1500X_info");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.wrap {
	width: 1100px;
	height: 1000px;
	align: center;
	margin: auto;
}

.wrap .info_layout {
	width: 100%;
	height: 500px;
	border: 0.5px solid #dee0e4;
}

.wrap .info_layout .item_info_layout {
	width: 49.5%;
	height: 500px;
	float: left;
	border-right: 0.5px solid #dee0e4;
}

.wrap .info_layout .item_info_layout .item_img {
	width: 300px;
	height: 300px;
	margin: auto;
	margin-top: 15%;
}

.wrap .info_layout .item_info_layout .item_img img {
	width: 100%;
	height: 100%;
}

.wrap .info_layout .item_spec {
	width: 49.5%;
	height: 500px;
	float: right;
}

.wrap .info_layout .item_spec .item_spec_layout .info-layout {
	width: 95%;
	height: 95%;
	margin: auto;
	margin-top: 50px;
}

.wrap .info_layout .item_spec .item_spec_layout .info-layout ul {
	width: 100%;
	height: 30px;
	align: center;
	list-style: none;
	padding-left: 0px;
	border-bottom: 1px solid black;
}

.wrap .info_layout .item_spec .item_spec_layout .info-layout li {
	width: 50%;
	text-align: center;
	margin: 0 0 0 0;
	padding: 0 0 0 0;
	border: 0;
	float: left;
	font-size:13px;
}

.wrap .info_layout .item_spec .item_spec_layout .btn_layout {
	width: 100%;
	height: 100px;
	margin-left: 110px;
	text-align: center;
}

.wrap .info_layout .item_spec .item_spec_layout .btn_layout .goCart {
	width: 150px;
	height: 50px;
	background: #c70000;
	color: white;
	font-size: 20px; 
	display : table-cell;
	vertical-align: middle;
	border-right:2px solid white;
}
.wrap .info_layout .item_spec .item_spec_layout .btn_layout .goCart:hover{
	cursor:pointer;
}

.wrap .info_layout .item_spec .item_spec_layout .btn_layout .goBuy {
	width: 150px;
	height: 50px;
	color: white;
	font-size: 20px;
	display: table-cell;
	vertical-align: middle;
	background: #373737;
	border-left:2px solid white;
}
.wrap .info_layout .item_spec .item_spec_layout .btn_layout .goBuy:hover{
	cursor:pointer;
}

.detail_tab_layer {
	position: relative;
	width: 1059px;
	height: 34px;
	margin: auto;
	margin-top: 7px;
	background-color: red;
	margin-left: 0px;
}

.detail_tab_layer ul {
	position: relative;
	width: 1059px;
	height: 34px;
	border: 1px solid #cccccc;
	border-top: none;
	background-color: #ececec;
	border-top: 1px solid #384053;
	list-style: none;
	*zoom: 1
}

.detail_tab_layer ul:after {
	content: "";
	clear: both;
	display: block
}

.detail_tab_layer li {
	position: relative;
	width: 173px;
	height: 23px;
	float: left;
	font-size: 12px;
	color: black;
	background-color: #ececec;
	border-right: 1px solid #cccccc;
	text-align: center;
	padding: 11px 0px 0px 0px;
	border-bottom: 1px solid #cccccc;
	cursor: pointer;
}

.detail_tab_layer li:hover, .detail_tab_select {
	background-color: #384053 !important;
	border-bottom: 1px solid #384053 !important;
	border-right: 1px solid #384053 !important;
	color: #ffffff !important;
}

.detail_tab_select {
	cursor: default !important;
}

.detail_tab_layer li {
	padding: 10px 0px 1px 0px
}

.wrap .detail_div {
	width: 100%;
	height: auto;
	margin: auto;
	align: center;
}

.wrap .detail_div .before_buy {
	width: 100%;
	height: auto;
	border-top: 1px solid black;
}

.wrap .detail_div .cpu_division {
	width: 100%;
	height: auto;
	border-top: 1px solid black;
}

.wrap .detail_div .detail_info {
	width: 100%;
	height: auto;
	border-top: 1px solid black;
}

.detail_info_box {
	position: relative;
	width: 1181px;
	height: auto;
	margin: auto;
	padding: 15px 10px 30px;
	10
	px;
}

.detail_info_box ul {
	position: relative;
	width: 1181px;
	height: auto;
	*zoom: 1
}

.detail_info_box ul:after {
	content: "";
	clear: both;
	display: block
}

.detail_info_box .detail_info_guide_title {
	position: relative;
	width: 71px;
	padding-top: 1px;
	padding-left: 9px;
	height: auto;
	background: url('/goods/images/detail_info_guide_dot.gif') no-repeat
		left 5px;
	color: #373737;
	font-weight: bold;
	font-size: 12px;
	font-family: µ¸¿ò;
	float: left;
}

.detail_info_box .detail_info_guide_body {
	position: relative;
	width: 950px;
	height: auto;
	line-height: 150%;
	font-size: 12px;
	font-family: µ¸¿ò;
	color: #747474;
	float: left;
	padding-bottom: 10px;
}

.detail_info_guide_highlight {
	color: #ff5400;
}

.detail_info_guide_fulltext {
	position: relative;
	width: 1070px;
	height: auto;
	line-height: 150%;
	font-size: 12px;
	font-family: µ¸¿ò;
	color: #747474;
	padding-bottom: 10px;
	padding-left: 9px;
	background: url('/goods/images/detail_info_guide_dot.gif') no-repeat
		left 6px;
}

.detail_info_guide_fulltext table {
	position: relative;
	width: auto;
	height: auto;
	border-collapse: collapse;
	border-color: #cccccc;
	word-break: break-all;
	border: 1px solid #cccccc;
	border-top: 1px solid #373737;
}

.detail_info_guide_fulltext td {
	width: 891px;
	padding: 4px 0px 0px 10px;
	font-size: 12px;
	color: #747474;
	font-family: µ¸¿ò;
	border-color: #cccccc;
}

.detail_info_guide_fulltext th {
	width: 100px;
	text-align: left;
	padding-top: 4px;
	padding-left: 11px;
	font-size: 12px;
	color: #373737;
	font-family: µ¸¿ò;
	background-color: #f5f5f5;
	border-color: #cccccc;
	font-weight: normal;
}

</style>
</head>
<body>
	<%@ include file="../common/top.jsp"%>
	<div class="wrap">
		<div class="info_layout">
			<div class="item_info_layout">
				<div class="item_img">
					<img src="<%=request.getContextPath()%>/images/product/<%=imgList.get(0).getChangeName()%>">
				</div>
			</div>
			<div class="item_spec">
				<div class="item_spec_layout">
					<div class="info-layout">
						<ul>
							<li>상품명</li>
							<li><%=p.getPrd_name() %></li>
						</ul>
						<ul>
							<li>판매가</li>
							<li><%=p.getPrice() %>원</li>
						</ul>
						<ul>
							<li>수량</li>
							<li>
								<div>
									<select>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
									</select>
								</div>
							</li>
						</ul>
						<ul>
							<li>배송정보</li>
							<li style="font-size: 10px">입금확인 후 평균 1~2일 소요(공휴일 제외)</li>
						</ul>
						<ul>
							<li>등록일</li>
							<li><%=p.getRelease_date() %></li>
						</ul>
						<ul>
							<li>제조사</li>
							<li><%=p.getManufacturer() %></li>
						</ul>
						<ul>
							<li>원산지</li>
							<li>made in korea</li>
						</ul>
					</div>
					<div class="btn_layout">
						<div class="goCart" onclick="goCart()">장바구니</div>
						<div class="goBuy" onclick="goBuy()">바로구매</div>
					</div>
				</div>
			</div>
		</div>
		<br>
		<!-- 상세정보 -->
		<div class="detail_tab_layer" id="id_detail_tab_info"
			style="padding-top: -0px; margin-left: 0px;">
			<ul>
				<li class="detail_tab_info detail_tab_select"><b>상세정보</b></li>
				<li class="detail_tab_comment"><b>상품리뷰</b></li>
				<li class="detail_tab_deliver"><b>배송정보</b></li>
				<li class="detail_tab_change"><b>반품ㆍ교환</b></li>
			</ul>
		</div>
		<br>
		<div class="detail_div">
			<div class="before_buy">
			<%if(beforeBuyIntelCpu != null){ %>
				<img src="<%=request.getContextPath()%>/images/jinseok/icon/<%=beforeBuyIntelCpu%>">
			<%} %>
			<%if(beforeBuyAMDCpu != null){ %>
				<img src="<%=request.getContextPath()%>/images/jinseok/icon/<%=beforeBuyAMDCpu%>" style="margin-left:150px;">
			<%} %>
				
			</div>
			<div class="cpu_division">
				<%if(intelCpuDevision != null){ %>
					<img src="<%=request.getContextPath()%>/images/jinseok/icon/<%=intelCpuDevision%>">
				<%} %>
			</div>
			<div class="detail_info">
				<%if(i3_8100InfoImage != null){ %>
					<p align="center"><img src="<%=request.getContextPath()%>/images/jinseok/cpu/<%=i3_8100InfoImage%>"></p>
				<%} %>
				<%if(R5_1500X_info != null){ %>
					<p align="center"><img src="<%=request.getContextPath()%>/images/jinseok/cpu/<%=R5_1500X_info%>"></p>
				<%} %>
			</div>
		</div>
		<br>
		<!-- 상품리뷰 -->
		<div class="detail_tab_layer" id="id_detail_tab_info"
			style="padding-top: -0px; margin-left: 0px;">
			<ul>
				<li class="detail_tab_info"><b>상세정보</b></li>
				<li class="detail_tab_comment  detail_tab_select"><b>상품리뷰</b></li>
				<li class="detail_tab_deliver"><b>배송정보</b></li>
				<li class="detail_tab_change"><b>반품ㆍ교환</b></li>
			</ul>
		</div>
		<div class="review_area" style="width:100%; height:auto;">
			
		</div>
		<!-- 배송정보 -->
		<div class="detail_tab_layer" id="id_detail_tab_info"
			style="padding-top: -0px; margin-left: 0px;">
			<ul>
				<li class="detail_tab_info"><b>상세정보</b></li>
				<li class="detail_tab_comment"><b>상품리뷰</b></li>
				<li class="detail_tab_deliver detail_tab_select"><b>배송정보</b></li>
				<li class="detail_tab_change"><b>반품ㆍ교환</b></li>
			</ul>
		</div>
		<div id="detail_deliver_info" class="detail_info_box">
			<ul>
				<li class="detail_info_guide_title">배송기간</li>
				<li class="detail_info_guide_body"><span
					class="detail_info_guide_highlight">입금 확인후 평균 3일 이내</span>로 배송됩니다.
					토요일/공휴일은 배송기간에 포함되지 않습니다.<br> 도서/산간지역은 2∼3일 정도 추가 소요됩니다.<br>
					불가항력적(일시품절, 제조사 상품수급 문제, 천재지변 등)인 사유로 배송이 늦어질수 있습니다.<br> <span
					class="detail_info_guide_highlight">가전제품의 배송일은 3~7일 정도 소요</span>되며,
					배송이 지연될 경우 별도의 연락을 드립니다.</li>
			</ul>
			<ul>
				<li class="detail_info_guide_title">배송지역</li>
				<li class="detail_info_guide_body">전국 (일부지역 제외)</li>
			</ul>
			<ul>
				<li class="detail_info_guide_title">배송비</li>
				<li class="detail_info_guide_body">1박스당 2,500원(택배) (도서 산간지역
					추가비용 있을수 있습니다.)<br> 부피나 중량이 큰 제품은 배송 방법이 변경 될 수 있으며 이에 따른 운임비가
					추가 될 수 있습니다.<br> 배송이 늦어지는 경우 미리 연락드립니다.<br> 상품 이미지의 색상은
					실제 상품과 차이가 있을 수 있습니다.<br>
				<br> 업체배송 시 도서 산간지역 운임<br> 무료배송 : 기본 배송비 무료 지원되며, 도서
					산간지역으로의 추가운임은 소비자에게 청구됩니다.<br> 착불배송: 상품 수령후 배송비 결제 시 기본 배송료 +
					도서 산간지역 추가운임을 결제 하셔야 합니다
				</li>
			</ul>
		</div>

		<!-- 반품 .교환 -->
		<div class="detail_tab_layer" id="id_detail_tab_info"
			style="padding-top: -0px; margin-left: 0px;">
			<ul>
				<li class="detail_tab_info"><b>상세정보</b></li>
				<li class="detail_tab_comment"><b>상품리뷰</b></li>
				<li class="detail_tab_deliver"><b>배송정보</b></li>
				<li class="detail_tab_change detail_tab_select"><b>반품ㆍ교환</b></li>
			</ul>
		</div>
		<div id="detail_return_info" class="detail_info_box">
			<ul>
				<li class="detail_info_guide_fulltext">MasterPiece 쇼핑몰에서는 <span
					class="detail_info_guide_highlight">별도로 A/S 기간이 정해진 제품을 제외한
						나머지 제품들은 1년간 A/S를 보장</span>하며,<br> 서울지역을 포함한 지방 출장 A/S는 오렌지 PC와 내
					맘대로 PC를 제외하고는 실시하지 않습니다.
				</li>
				<li class="detail_info_guide_fulltext">MasterPiece 쇼핑몰에서 <span
					class="detail_info_guide_highlight">구매하신 후 1년이 경과한 제품은 해당
						제조회사를 통해 A/S</span>를 받으셔야 합니다.
				</li>
				<li class="detail_info_guide_fulltext">천재지변을 포함해 소비자 과실에 의한 파손인
					경우에는 유상 A/S처리가 되며 경우에 따라 A/S가 불가능할 수 있습니다.</li>
				<li class="detail_info_guide_fulltext"><span
					class="detail_info_guide_highlight">제품 구매 인수 후 15일 이내의 제품 불량
						발생시 A/S에 관한 택배 운임비는 전액 MasterPiece가 부담합니다.</span><br> 구매 인수 후 15일이상
					30일 이내 제품 불량인 경우에는 운임비 반액(편도 택배비)을 MasterPiece에서 부담합니다.<br> 구매
					인수 후 30일 이후 발생하는 모든 배송에 관한 운임비는 소비자분께서 부담하시게 되므로 유의하시기 바랍니다.<br>
					구매 인수 후 15일 이내의 초기불량 포함한 제품 불량 발생시 A/S에 관해서는 택배로만 처리되며, CJ택배을 이용하실
					경우에만 왕복 운임비 지원이 가능합니다.<br> <span
					class="detail_info_guide_highlight">※ 소비자 변심에 의해 반품하는 경우
						운송비는 고객님이 부담하셔야 합니다.</span></li>
				<li class="detail_info_guide_fulltext">MasterPiece 쇼핑몰에서 <span
					class="detail_info_guide_highlight">브랜드PC인 MasterPiece
						오렌지PC는 1년 동안 무상 A/S처리</span>가 됩니다. (단, 부속품 중 단종이 된 상품은 해당 서비스 업체의 처리 기준에
					의해 보상됩니다.)
				</li>
				<li class="detail_info_guide_fulltext">MasterPiece 쇼핑몰에서 판매하는
					상품 중 소프트웨어는 A/S항목에 포함되지 않으므로 소프트웨어는 해당 제작사로 문의하셔야 합니다.</li>
				<li class="detail_info_guide_fulltext">
				<span style="color: #373737 !important;"><b>교환/반품/환불시 주의사항</b></span>
					<table border="1" cellpadding="0" cellspacing="0" bordercolor="#cccccc">
						<tbody>
							<tr>
								<th rowspan="3" scope="col">교환/반품</th>
								<td>제품 구매 인수 후 15일 이내의 제품은 초기 불량에 한해 1:1 상품 교환 또는 환불이
									가능합니다. 단, 제품의 박스 및 구성물이 정상 상태에서만 가능 합니다.</td>
							</tr>
							<tr>
								<td>개봉을 안하신 제품중 변심에 의한 반품도 15일 이내에만 가능합니다.</td>
							</tr>
							<tr>
								<td>교환의 경우 동일 상품으로 1:1 교환은 가능하나 다른 상품으로 교환은 불가합니다.</td>
							</tr>
							<tr>
								<th rowspan="2" scope="col">환불</th>
								<td>제품을 환불받으시기 위해서는 제품의 포장상태와 내용물이 훼손되지 않아야 하며 스티커, 테이프를
									붙여서 제품의 박스 포장이 훼손되면 환불이 불가합니다.</td>
							</tr>
							<tr>
								<td>초기불량 포함한 AS 처리는 택배로만 가능합니다.</td>
							</tr>
							<tr>
								<th rowspan="2" scope="col">교환/환불 불가</th>
								<td>소프트웨어 상품일 경우, 제품의 개봉 후엔 교환/환불이 절대 불가합니다.</td>
							</tr>
							<tr>
								<td>가전제품의 경우 포장 개봉/포장훼손 및 상품가치가 상실된 경우에는 교환/반품이 불가능합니다.</td>
							</tr>
						</tbody>
					</table></li>
				<li class="detail_info_guide_fulltext">MasterPiece 쇼핑몰의 <span
					class="detail_info_guide_highlight">주문 유효기간은 주문후 3일이며 입금이 되지
						않는 주문은 자동 삭제</span> 처리됩니다.
				</li>
				<li class="detail_info_guide_fulltext">MasterPiece 쇼핑몰에 표기된 모든
					가격은 <span class="detail_info_guide_highlight">부가세가 포함된 금액</span>입니다.
				</li>
			</ul>
		</div>
	<div style="width:auto; height:auto; display:inline-block;">	
	<%@include file = "../common/footer.jsp" %>
	</div>
	</div>
		<script>
			function goCart(){
				location.href="./cart_page.jsp";
			}
			function goBuy(){
				location.href="./delivery_page.jsp";
			}
		</script>
</body>
</html>








