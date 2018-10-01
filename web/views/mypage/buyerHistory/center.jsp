<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.gshr {
	 border-color: #f43641; 
	 width:2000px;
	 margin-left:-500px;
}

.centerWrapArea {
	display: inline-block;
	width: 79%;
	height: auto;
	background: white;
	float: right;
	font-size: 12px;
	font-family: dotum;
	color: #464646;
	box-sizing: border-box;
}

div {
	display: block;
}

.center_top_title {
	height: 40px;
	background: white;
	font-size: 28px;
	font-weight: bold;
	padding: 17px 22px;
}

.section_header_table {
	border-spacing: 0px;
	border-collapse: collapse;
	box-sizing: border-box;
}

.section_header_table tr td {
	border: 1px solid #ccc;
	background-color: #fff;
	box-sizing: border-box;
	width: 59px;
	height: 27px;
	text-align: center;
	cursor: pointer;
}

@media screen and (min-width:0\0) {
	.section_header_table tr td {
		padding-top: 4px;
	}
	.fa {
		padding-top: 3px;
	}
}

.section_header_table tr td:hover {
	background-color: #454c5f;
	color: #fff;
}

.section_header_table .current {
	background-color: #454c5f;
	color: #fff;
}

#ui-datepicker-div {
	font-family: "Trebuchet MS", "Helvetica", "Arial", "Verdana",
		"sans-serif";
	font-size: 70%;
}

.text_wave {
	margin: 0px 5px;
	float: left;
	line-height: 28px;
	height: 28px;
}

@media screen and (min-width:0\0) {
	.text_wave {
		line-height: 32px;
	}
	#ui-datepicker-div {
		font-size: 73%;
	}
}

.article {
	padding: 27px 10px;
}

.float_left {
	float: left;
}

.middle_article>div>select {
	padding: 5px 10px;
	width: 280px;
	border: 1px solid #ccc;
}

.text-red {
	color: #e31738;
}

.text-bold {
	font-weight: bold;
}

.label {
	width: 935px;
	height: 38px;
	vertical-align: middle;
	border: 1px #ccc solid;
	background-color: #f3f4f6;
}

.label>span {
	height: 12px;
	padding: 12px 0px;
	vertical-align: middle;
}

.main_list .label>span, .main_list .label>div {
	display: inline-block;
	text-align: center;
}

.no_data {
	text-align: center;
	line-height: 110px;
	background-color: #e9ecef;
	border-left: 1px solid #ccc;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

.data {
	text-align: center;
	line-height: 110px;
	background-color: #e9ecef;
	border-left: 1px solid #ccc;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

.main_list .contents {
	width: 937px;
	box-sizing: border-box;
	padding: 9px 0px;
	text-align:left;
	display: inline-block;
}


.label>.nth-child1 {
	width: 90px;
}

.label>.nth-child2 {
	width: 300px;
	margin-left: 8px;
}

.label>.nth-child3 {
	width: 105px;
}

.label>.nth-child4 {
	width: 40px;
}

.label>.nth-child5 {
	width: 65px;
}

.label>.nth-child6 {
	width: 80px;
}

.label>.nth-child7 {
	width: 75px;
}


.contents>.data1{
	width:85px;
	height:30px;
	display: inline-block;
	text-align:center;
	margin-left:25px;
}
.contents>.data2{
	width:50px;
	height:30px;
	display:inline-block;

}
.contents>.productdata{
	width:330px;
	height:150px;
	display:inline-block;
}
.contents>.data3{
	width: 100px;
    height: 100px;
   	display:inline-block;
}
.contents>.data4{
 	width:250px;
 	height:50px;
 	display: contents;
}
.contents>.data5{
	width:70px;
	height:30px;
	font-weight:bold;
	color:red;
	text-align:center;
	display: inline-block;
}
.contents>.data6{
	width:40px;
	height:30px;
	text-align:center;
	display: inline-block;
}
.contents>.data7{
	width:65px;
	height:30px;
	text-align:center;
	display: inline-block;
}

.contents>.data8{
	width:80px;
	height:30px;
	text-align:center;
	display: inline-block;
}
.contents>.data9{
	width:70px;
	height:30px;
	text-align:center;
	display: inline-block;
	
}

#ui-datepicker-div {
	font-family: "Trebuchet MS", "Helvetica", "Arial", "Verdana",
		"sans-serif";
	font-size: 70%;
}

.text_wave {
	margin: 0px 5px;
	float: left;
	line-height: 28px;
	height: 28px;
}

@media screen and (min-width:0\0) {
	.text_wave {
		line-height: 32px;
	}
	#ui-datepicker-div {
		font-size: 73%;
	}
}
</style>
</head>
<body>
	<div class="centerWrapArea">
		<div class="center_top_content">
			<div class="center_top_title" align="left">주문목록/배송조회</div>
			<input type="hidden" name="date_num" id="date_num" value="2">
			<div class='section_header_v2'	style='width: 937px; height: 140px; border: 1px #ccc solid; 
				box-sizing: border-box; background-color: #F3F4F6;'>
				
				<form action = "<%= request.getContextPath() %>/BuyerHistorySearch">
				<div style='float: left; padding-top: 7px; width: 774px;'>
					<div>
						<!-- <div
							style='font-weight: bold; float: left; font-weight: bold; float: left; padding: 0px 10px; margin-top: 7px;'>조회기간</div>
						<div style='float: left;'>
							<table class='section_header_table'>
								<tr>
									<td>어제</td>
									<td>오늘</td>
									<td class='current'>1주일</td>
									<td>1개월</td>
									<td>6개월</td>
									<td>1년</td>
								</tr>
							</table>
						</div>

						<div style='float: left; margin-left: 40px;'>
							<input name="date_1" type='text'
								style='float: left; box-sizing: border-box; height: 28px; width: 111px; padding-left: 15px;'
								value='2018-09-01' id='datepicker1' />
							<div id='t_datepicker1'
								style='cursor: pointer; background-color: #fff; height: 28px; float: left; box-sizing: border-box; border: 1px solid #ccc; border-left: 0px; padding: 0px 5px; font-size: 18px;'>
								<i class="fa fa-calendar fa-2" style='vertical-align: bottom;'
									aria-hidden="true"></i>
							</div>
							<div class='text_wave'>~</div>
							<input name="date_2" type='text'
								style='float: left; box-sizing: border-box; height: 28px; width: 111px; padding-left: 15px;'
								value='2018-09-08' id='datepicker2' />
							<div id='t_datepicker2'
								style='cursor: pointer; background-color: #fff; height: 28px; float: left; box-sizing: border-box; border: 1px solid #ccc; border-left: 0px; padding: 0px 5px; font-size: 18px;'>
								<i class="fa fa-calendar fa-2" style='vertical-align: bottom;'
									aria-hidden="true"></i>
							</div>
							<span></span>
						</div> -->
						<!-- 	<script>
							//기간조회
							function period_views() {
								location.href = "index.php?menu_type=&date_num="
										+ $('#date_num').val()
										+ "&date_1="
										+ $('#datepicker1').val()
										+ "&date_2="
										+ $('#datepicker2').val()
										+ "&search_type="
										+ $("#search_type").val()
										+ "&search_text="
										+ $("#search_text").val();
							}

							$(document).ready(function() {
								$('#search_text').on('keydown', function(e) {
									if (e.keyCode == 13) {
										period_views();
									}
								});
							});
						</script>
						<script type='text/javascript'>
function calDateRange(val1, val2){
	var FORMAT = "-";

	// FORMAT을 포함한 길이 체크
	if (val1.length != 10 || val2.length != 10)
		return null;

	// FORMAT이 있는지 체크
	if (val1.indexOf(FORMAT) < 0 || val2.indexOf(FORMAT) < 0)
		return null;

	// 년도, 월, 일로 분리
	var start_dt = val1.split(FORMAT);
	var end_dt = val2.split(FORMAT);

	// 월 - 1(자바스크립트는 월이 0부터 시작하기 때문에...)
	// Number()를 이용하여 08, 09월을 10진수로 인식하게 함.
	start_dt[1] = (Number(start_dt[1]) - 1) + "";
	end_dt[1] = (Number(end_dt[1]) - 1) + "";

	var from_dt = new Date(start_dt[0], start_dt[1], start_dt[2]);
	var to_dt = new Date(end_dt[0], end_dt[1], end_dt[2]);

	return (to_dt.getTime() - from_dt.getTime()) / 1000 / 60 / 60 / 24;
}

 function js_today(val){
	var date = new Date();

	date.setDate(date.getDate()+Number(val));

	var year  = date.getFullYear();
	var month = date.getMonth() + 1; // 0부터 시작하므로 1더함 더함
	var day   = date.getDate();


	if (("" + month).length == 1) { month = "0" + month; }
	if (("" + day).length   == 1) { day   = "0" + day;   }
	return (year+"-"+month+"-"+day);
}

//달력
$(function() {
	$( "#datepicker1" ).datepicker({
		dateFormat: 'yy-mm-dd',
		changeYear: true,
		changeMonth: true,
		prevText: '이전 달',
		nextText: '다음 달',
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dayNames: ['일','월','화','수','목','금','토'],
		dayNamesShort: ['일','월','화','수','목','금','토'],
		dayNamesMin: ['일','월','화','수','목','금','토'],
		showMonthAfterYear: true,
		yearSuffix: '년',
		maxDate: '0',

		onClose: function( selectedDate ) {

			// 시작일(fromDate) datepicker가 닫힐때
			// 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
//			$("#datepicker2").datepicker( "option", "minDate", selectedDate );

			if(calDateRange(selectedDate,$( "#datepicker2" ).val()) > 180){
				
				s_date_array = selectedDate.split("-");
				s_date_array[1] = (Number(s_date_array[1]) - 1) + "";

				var theBigDay = new Date(s_date_array[0], s_date_array[1], s_date_array[2]); // 1962-07-07
				theBigDay.setDate(theBigDay.getDate()+180);

				var year  = theBigDay.getFullYear();
				var month = theBigDay.getMonth() + 1; // 0부터 시작하므로 1더함 더함
				var day   = theBigDay.getDate();
				if(month < 10)month="0"+month;
				if(day < 10)day="0"+day;
				alert("180일이 넘습니다.");
				$("#datepicker2").val(year+"-"+month+"-"+day);
				
			}else if(calDateRange(selectedDate,$( "#datepicker2" ).val()) < 0){
				alert("시작일이 종료일보다 큽니다");
				$("#datepicker2").val(selectedDate);
			}
		}
	});

	$( "#datepicker2" ).datepicker({
		dateFormat: 'yy-mm-dd',
		changeYear: true,
		changeMonth: true,
		prevText: '이전 달',
		nextText: '다음 달',
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dayNames: ['일','월','화','수','목','금','토'],
		dayNamesShort: ['일','월','화','수','목','금','토'],
		dayNamesMin: ['일','월','화','수','목','금','토'],
		showMonthAfterYear: true,
		yearSuffix: '년',
		maxDate: '-0',

		onClose: function( selectedDate ) {

			if(calDateRange(selectedDate,$( "#datepicker1" ).val()) < -180){
				e_date_array = selectedDate.split("-");
				e_date_array[1] = (Number(e_date_array[1]) - 1) + "";

				var theBigDay = new Date(e_date_array[0], e_date_array[1], e_date_array[2]); // 1962-07-07
				theBigDay.setDate(theBigDay.getDate() - 180);

				var year  = theBigDay.getFullYear();
				var month = theBigDay.getMonth() + 1; // 0부터 시작하므로 1더함 더함
				var day   = theBigDay.getDate();
				if(month < 10)month="0"+month;
				if(day < 10)day="0"+day;
				alert("180일이 넘습니다.");
				$("#datepicker1").val(year+"-"+month+"-"+day);

			}else if(calDateRange(selectedDate,$( "#datepicker1" ).val()) > 0){
				alert("종료일이 시작일보다 작습니다");
				$("#datepicker1").val(selectedDate);
			}
		}
	});

	
	$("#t_datepicker1").click(function(){
		$("#datepicker1").trigger( "focus" );
		$(".section_header_table td").eq(5).click();
	});

	$("#t_datepicker2").click(function(){
		$("#datepicker2").trigger('focus');
		$(".section_header_table td").eq(5).click();
	});
	

	$( "#datepicker1,#datepicker2" ).click(function(){
		$("#date_num").val(10);
	});


	//조회 기간 클릭
	$(".section_header_table td").click(function(e){
		$(".section_header_table td").attr("class","");
		$(this).attr("class","current");
		$("#date_num").val($(this).index());

		index=$(this).index();
		switch(index){
			case 0:$("#datepicker1").val(js_today(-1));$("#datepicker2").val(js_today(-1));break;
			case 1:$("#datepicker1").val(js_today(0));$("#datepicker2").val(js_today(0));break;
			case 2:$("#datepicker1").val(js_today(-7));$("#datepicker2").val(js_today(0));break;
			case 3:$("#datepicker1").val(js_today(-30));$("#datepicker2").val(js_today(0));break;
			case 4:$("#datepicker1").val(js_today(-180));$("#datepicker2").val(js_today(0));break;
			case 5:$("#datepicker1").val(js_today(-365));$("#datepicker2").val(js_today(0));break;
			case 10:break;
		}
	});

});
</script> -->
						<!-- 선택조회 끝 -->
						<div style='clear: both;'></div>
					</div>

					<div style='padding-top: 30px;'>
						<div
							style='font-weight: bold; float: left; padding: 0px 10px; margin-top: 7px;'>상품검색</div>
						<div style='float: left;'>
							<select name="search_type" id="search_type"
								style='box-sizing: border-box; height: 28px; width: 118px; vertical-align: bottom;'
								onchange="$('#search_text').val('')">
								<option value="1">상품명</option>
								<option value="2">상품번호</option>
							</select> <input id="search_text" name="search_text" type='text'
								style='margin-left: 10px; box-sizing: border-box; height: 28px; width: 559px; padding-left: 10px;'
								placeholder='상품명 또는 상품번호를 입력하세요.' value="" />
							<div
								style='padding-top: 6px; padding-left: 3px; font-size: 11px; color: #666;'>상품명과
								상품번호로만 조회 가능합니다.</div>
						</div>

						<div style='clear: both;'></div>
					</div>

				</div>

				<div style='float: left; padding-top: 30px;'>
					<input class="mypage_input1" type="submit" value="조회하기" style='cursor: pointer; display: inline-block; 
							width: 152px; height: 63px; background-color: #454c5f; color: #fff; 
							line-height: 62px; text-align: center;'>
				</div>

				<div style='clear: both;'></div>
			</form>
			</div>

			<!-- 선택조회창 -->
			<div class='article middle_article'>

				<div class='float_left'>
					<div >
						<span class='text-bold text-red'></span> 구매하신 <span
							class='text-bold text-red'>주문</span> 내역입니다.
					</div>
				</div>

				<!-- <div class='float_right'>
					<select id='myzone_select_menu'
						tails="date_num=2&date_1=2018-09-01&date_2=2018-09-08&search_type=&search_text=&">

						<option value='MY 쇼핑정보'>MY 쇼핑정보</option>
						<option value='신규주문' selected>신규주문</option>
						<option value='입금확인'>입금확인</option>
						<option value='발송완료'>발송완료</option>
						<option value='주문취소'>주문취소</option>
						<option value='카드영수증'>카드영수증</option>
						<option value='미발행'>미발행</option>

						<option value='M-POINT'>M-POINT</option>
						<option value='기존적립금'>기존적립금</option>
						<option value='교환.반품.AS 조회'>교환.반품.AS 조회</option>
					</select>
				</div> -->
				<div class='clear'></div>
			</div>
			<!-- 리스트 -->
			<div class='article main_list'>

				<div class='label'>

					<span class='nth-child1'>주문일/주문번호</span>
					<span class='nth-child2'>상품정보</span> 
					<span class='nth-child3'>결제금액</span>
					<span class='nth-child4'>총수량</span> 
					<span class='nth-child5'>결제수단</span>
					<span class='nth-child6'>처리현황</span> 
					<span class='nth-child7'>배송방법</span>

				</div>
				<% if(list==null) {%>
				<div class='contents no_data'>1주일 이내에 구매하신 내역이 없습니다.</div>
				<%}else{ 
						for(int i =0; i<list.size(); i++){%>

					<div class='contents data'>
						<div class='contents data1'><%=list.get(i).getPayDate()%>/</div>
						<div class='contents data2'><%=list.get(i).getOrderCheck()%></div>
						<div class='contents productdata'>
						<div class='contents data3'><img alt=""
							src="<%=request.getContextPath()%>/images/product/<%=map.get(list.get(0).getPrdCode()).getChangeName()%>" width="100px" height="100px"></div>
						<div class='contents data4'><%=list.get(i).getPrdName() %> </div>
						</div>
						<div class='contents data5'><%=list.get(i).getPayPrice()%>원</div>
						<div class='contents data6'><%=list.get(i).getOrderCount() %>개</div>
						<div class='contents data7'><%=list.get(i).getBuyStatus()%></div>
						<div class='contents data8'><%=list.get(i).getPayType() %></div>
						<div class='contents data9'><%=list.get(i).getDeliveryOption() %></div>
					</div>
					
					<%} %>
				<%} %>
			</div>
						<%-- 페이징 처리 --%>
						<div class="pagingArea" align="center">
							<button	onclick="location.href='<%=request.getContextPath()%>/view_history?currentPage=1'"><<</button>
							<%if (currentPage <= 1) {	%>
							<button disabled><</button>
							<%} else { %>
							<button	onclick="location.href='<%=request.getContextPath()%>/view_history?currentPage=<%=currentPage - 1%>'"><</button>
							<%}%>
							<%for (int p = startPage; p <= endPage; p++) {
									if (p == currentPage) {	%>
							<button disabled><%=p%></button>
							<%} else {%>
							<button	onclick="location.href='<%=request.getContextPath()%>/view_history?currentPage=<%=p%>'"><%=p%></button>
							<%}%>
							<%}%>
							<%if (currentPage >= maxPage) {%>
							<button disabled>></button>
							<%} else {%>
							<button	onclick="location.href='<%=request.getContextPath()%>/view_history?currentPage=<%=currentPage + 1%>'">></button>
							<%}%>
							<button	onclick="location.href='<%=request.getContextPath()%>/view_history?currentPage=<%=maxPage%>'">>></button>

<hr class="gshr">

		</div>
	</div>

</body>
</html>