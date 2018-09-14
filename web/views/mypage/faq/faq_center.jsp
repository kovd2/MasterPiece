<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<style>
    /*서브(리스트)_페이지넘버*/
    .list_number{padding-top:25px; text-align:center;}
    .list_n_menu {padding:3px; MARGIN:3px; TEXT-ALIGN: center}
	.list_n_menu A {padding: 1px 4px 0px 4px;MARGIN: 2px;/* BORDER: #ccc 1px solid; */COLOR: #999;TEXT-DECORATION: none;}
    .list_n_menu A:hover {BORDER:#999 1px solid; COLOR: #666;}
    .list_n_menu A:active {BORDER:#999 1px solid; COLOR: #666;}
	.list_n_menu .current {BORDER: #117bff 1px solid;padding: 1px 4px 0px 4px;FONT-WEIGHT: bold;MARGIN: 2px;COLOR: #036cb4;}
    .list_n_menu .disabled {BORDER: #eee 1px solid;padding: 1px 4px 0px 4px;MARGIN: 2px;COLOR: #ddd;}
    
    
.centerWrapArea {
	display: inline-block;
	width: 79%;
	height: 600px;
	background: white;
	float: right;
	font-size: 12px;
}

.center_top_title {
	height: 40px;
	background: white;
	font-size: 28px;
	font-weight: bold;
	padding: 20px 22px;
	color: #000;
}
.boardTable {
	font-size: small;
	width: 700px;
}

.boardTable th, td {
	text-align: center;
	border-bottom: 1px solid #D7D7D7;
	height: 30px;
}

.boardTable>tbody>tr:hover {
	background: lightgray;
	cursor: pointer;
}

.FAQBoard-Btn {
	width: 110px;
	height: 40px;
	float: left;
	margin-left: -1px;
	border: 1px solid lightgray;
}

.FAQBoard>div {
	font-size: small;
	text-align: center;
	padding-top: 11px;
}

.FAQBoard-Btn:hover {
	cursor: pointer;
	background: royalblue;
	color: white;
}

.boardTable>tbody>tr:last-child {
	border-bottom: 2px solid darkgray;
}

.FAQBoard-Btn-trueContent:hover {
	cursor: pointer;
}

#goServiceCenter:hover {
	cursor: pointer;
}

#order-btn:hover {
	cursor: pointer;
}

#serviceMainImg:hover {
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="centerWrapArea">
		<div class="section">
			<!-- 게시판 -->
			<div class="container-inner inner board">
				<div class="inb" id="board" style="width: 700px;">
					<!-- 중앙 게시판 -->
					<div id="serviceMainImg"
						onclick="location.href='serviceCenter.jsp'">
						<img src="../../images/상담원.jpg">
					</div>
					<br>
					<div>
						<label style="float: left">자주 묻는 질문</label>
					</div>
					<br clear="both"> <br>
					<div>
						<div class="FAQBoard" style="width: 700px; margin-top: -10px;">
							<div id="order-btn"
								style="width: 115px; height: 40px; background: royalblue; color: white; float: left; border: 1px solid lightgray; margin-left: 0px;">주문결제
							</div>
							<div id="delivery-btn" class="FAQBoard-Btn">배송</div>
							<div id="afterService-btn" class="FAQBoard-Btn">환불.반품.교환.AS</div>
							<div id="point-btn" class="FAQBoard-Btn">적립금.포인트</div>
							<div id="aboutProduct-btn" class="FAQBoard-Btn">상품</div>
							<div id="etc-btn" class="FAQBoard-Btn">기타</div>
						</div>
						<br clear="both">
					</div>
					<div id="order">
						<table class="boardTable" style="margin-top: 10px;">
							<thead
								style="border-top: 2px solid darkgray; background: #DFDFDF;">
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td align="center">1</td>
									<td>1</td>
									<td>임하룡</td>
									<td>2018-08-31</td>
									<td align="center">23</td>
								</tr>
								<tr>
									<td align="center">John</td>
									<td>Doe</td>
									<td>john@example.com</td>
									<td>2018-08-31</td>
									<td align="center">2</td>
								</tr>
							</tbody>
						</table>
						<br> <br clear="both">
					</div>
					<div id="delivery" style="display: none;">
						<table class="boardTable" style="margin-top: 10px;">
							<thead
								style="border-top: 2px solid darkgray; background: #DFDFDF;">
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td align="center">1</td>
									<td>2</td>
									<td>임하룡</td>
									<td>2018-08-31</td>
									<td align="center">23</td>
								</tr>
								<tr>
									<td align="center">John</td>
									<td>Doe</td>
									<td>john@example.com</td>
									<td>2018-08-31</td>
									<td align="center">2</td>
								</tr>
							</tbody>
						</table>
						<br> <br clear="both">
					</div>
					<div id="afterService" style="display: none;">
						<table class="boardTable" style="margin-top: 10px;">
							<thead
								style="border-top: 2px solid darkgray; background: #DFDFDF;">
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td align="center">1</td>
									<td>3</td>
									<td>임하룡</td>
									<td>2018-08-31</td>
									<td align="center">23</td>
								</tr>
								<tr>
									<td align="center">John</td>
									<td>Doe</td>
									<td>john@example.com</td>
									<td>2018-08-31</td>
									<td align="center">2</td>
								</tr>
							</tbody>
						</table>
						<br> <br clear="both">
					</div>
					<div id="point" style="display: none;">
						<table class="boardTable" style="margin-top: 10px;">
							<thead
								style="border-top: 2px solid darkgray; background: #DFDFDF;">
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td align="center">1</td>
									<td>4</td>
									<td>임하룡</td>
									<td>2018-08-31</td>
									<td align="center">23</td>
								</tr>
								<tr>
									<td align="center">John</td>
									<td>Doe</td>
									<td>john@example.com</td>
									<td>2018-08-31</td>
									<td align="center">2</td>
								</tr>
							</tbody>
						</table>
						<br> <br clear="both">
					</div>
					<div id="aboutProduct" style="display: none;">
						<table class="boardTable" style="margin-top: 10px;">
							<thead
								style="border-top: 2px solid darkgray; background: #DFDFDF;">
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td align="center">1</td>
									<td>5</td>
									<td>임하룡</td>
									<td>2018-08-31</td>
									<td align="center">23</td>
								</tr>
								<tr>
									<td align="center">John</td>
									<td>Doe</td>
									<td>john@example.com</td>
									<td>2018-08-31</td>
									<td align="center">2</td>
								</tr>
							</tbody>
						</table>
						<br> <br clear="both">
					</div>
					<div id="etc" style="display: none;">
						<table class="boardTable" style="margin-top: 10px;">
							<thead
								style="border-top: 2px solid darkgray; background: #DFDFDF;">
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td align="center">1</td>
									<td>6</td>
									<td>임하룡</td>
									<td>2018-08-31</td>
									<td align="center">23</td>
								</tr>
								<tr>
									<td align="center">John</td>
									<td>Doe</td>
									<td>john@example.com</td>
									<td>2018-08-31</td>
									<td align="center">2</td>
								</tr>
							</tbody>
						</table>
						<br> <br clear="both">
					</div>
					<!-- 페이징 -->
					<div>
						<div>
							<div class="list_n_menu">
								<span class="disabled">< 이전</span> <span class="current">1</span>
								<a href="#?page=2">2</a> <a href="#?page=3">3</a> <a
									href="#?page=4">4</a> <a href="#?page=5">5</a> <a
									href="#?page=6">6</a> <a href="#?page=7">7</a>... <a
									href="#?page=2">다음 ></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script>
		/* 자주묻는 질문 버튼 클릭시 해당 메뉴 불러오기 */
		$("#order-btn").css({
			"background" : "royalblue",
			"color" : "white"
		});

		$("#order-btn").click(function() {
			$("#order-btn").css({
				"background" : "royalblue",
				"color" : "white"
			});
			$("#delivery-btn").css({
				"background" : "white",
				"color" : "black"
			});
			$("#afterService-btn").css({
				"background" : "white",
				"color" : "black"
			});
			$("#point-btn").css({
				"background" : "white",
				"color" : "black"
			});
			$("#aboutProduct-btn").css({
				"background" : "white",
				"color" : "black"
			});
			$("#etc-btn").css({
				"background" : "white",
				"color" : "black"
			});

			$("#order").css("display", "block");
			$("#delivery").css("display", "none");
			$("#afterService").css("display", "none");
			$("#point").css("display", "none");
			$("#aboutProduct").css("display", "none");
			$("#etc").css("display", "none");
		});

		$("#delivery-btn").click(function() {
			$("#order-btn").css({
				"background" : "white",
				"color" : "black"
			});
			$("#delivery-btn").css({
				"background" : "royalblue",
				"color" : "white"
			});
			$("#afterService-btn").css({
				"background" : "white",
				"color" : "black"
			});
			$("#point-btn").css({
				"background" : "white",
				"color" : "black"
			});
			$("#aboutProduct-btn").css({
				"background" : "white",
				"color" : "black"
			});
			$("#etc-btn").css({
				"background" : "white",
				"color" : "black"
			});

			$("#order").css("display", "none");
			$("#delivery").css("display", "block");
			$("#afterService").css("display", "none");
			$("#point").css("display", "none");
			$("#aboutProduct").css("display", "none");
			$("#etc").css("display", "none");
		});

		$("#afterService-btn").click(function() {
			$("#order-btn").css({
				"background" : "white",
				"color" : "black"
			});
			$("#delivery-btn").css({
				"background" : "white",
				"color" : "black"
			});
			$("#afterService-btn").css({
				"background" : "royalblue",
				"color" : "white"
			});
			$("#point-btn").css({
				"background" : "white",
				"color" : "black"
			});
			$("#aboutProduct-btn").css({
				"background" : "white",
				"color" : "black"
			});
			$("#etc-btn").css({
				"background" : "white",
				"color" : "black"
			});

			$("#order").css("display", "none");
			$("#delivery").css("display", "none");
			$("#afterService").css("display", "block");
			$("#point").css("display", "none");
			$("#aboutProduct").css("display", "none");
			$("#etc").css("display", "none");
		});

		$("#point-btn").click(function() {
			$("#order-btn").css({
				"background" : "white",
				"color" : "black"
			});
			$("#delivery-btn").css({
				"background" : "white",
				"color" : "black"
			});
			$("#afterService-btn").css({
				"background" : "white",
				"color" : "black"
			});
			$("#point-btn").css({
				"background" : "royalblue",
				"color" : "white"
			});
			$("#aboutProduct-btn").css({
				"background" : "white",
				"color" : "black"
			});
			$("#etc-btn").css({
				"background" : "white",
				"color" : "black"
			});

			$("#order").css("display", "none");
			$("#delivery").css("display", "none");
			$("#afterService").css("display", "none");
			$("#point").css("display", "block");
			$("#aboutProduct").css("display", "none");
			$("#etc").css("display", "none");
		});

		$("#aboutProduct-btn").click(function() {
			$("#order-btn").css({
				"background" : "white",
				"color" : "black"
			});
			$("#delivery-btn").css({
				"background" : "white",
				"color" : "black"
			});
			$("#afterService-btn").css({
				"background" : "white",
				"color" : "black"
			});
			$("#point-btn").css({
				"background" : "white",
				"color" : "black"
			});
			$("#aboutProduct-btn").css({
				"background" : "royalblue",
				"color" : "white"
			});
			$("#etc-btn").css({
				"background" : "white",
				"color" : "black"
			});

			$("#order").css("display", "none");
			$("#delivery").css("display", "none");
			$("#afterService").css("display", "none");
			$("#point").css("display", "none");
			$("#aboutProduct").css("display", "block");
			$("#etc").css("display", "none");
		});

		$("#etc-btn").click(function() {
			$("#order-btn").css({
				"background" : "white",
				"color" : "black"
			});
			$("#delivery-btn").css({
				"background" : "white",
				"color" : "black"
			});
			$("#afterService-btn").css({
				"background" : "white",
				"color" : "black"
			});
			$("#point-btn").css({
				"background" : "white",
				"color" : "black"
			});
			$("#aboutProduct-btn").css({
				"background" : "white",
				"color" : "black"
			});
			$("#etc-btn").css({
				"background" : "royalblue",
				"color" : "white"
			});

			$("#order").css("display", "none");
			$("#delivery").css("display", "none");
			$("#afterService").css("display", "none");
			$("#point").css("display", "none");
			$("#aboutProduct").css("display", "none");
			$("#etc").css("display", "block");
		});
	</script>
	<%@ include file="../common/footer.jsp"%>

</body>
</html>