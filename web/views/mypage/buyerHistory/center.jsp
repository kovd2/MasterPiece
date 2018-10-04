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
	width: 50px;
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

	display: inline-block;
	text-align:center;
	margin-left:25px;
}
.contents>.data2{
	width:65px;

	display:inline-block;

}
.contents>.productdata{
	width:350px;
	height:150px;
	display:inline-block;
}
.contents>.data3{
	width: 100px;
    height: 100px;
   	display:inline-block;
}
.contents>.data4{
 	width:300px;
 	
 	display: contents;
}
.contents>.data5{
	width:70px;

	font-weight:bold;
	color:red;
	text-align:center;
	display: inline-block;
}
.contents>.data6{
	width:40px;

	text-align:center;
	display: inline-block;
}
.contents>.data7{
	width:65px;

	text-align:center;
	display: inline-block;
}

.contents>.data8{
	width:80px;

	text-align:center;
	display: inline-block;
}
.contents>.data9{
	width:130px;

	text-align:center;
	display: inline-block;
	
}
.data9 > btn{
	font-size:13px;
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
						<div style='font-weight: bold; float: left; font-weight: bold; float: left; 
							padding: 0px 10px; margin-top: 7px;'>조회기간</div>
						<div style='float: left;'>
							<table class='section_header_table'>
								<tr>
									<td onclick = 'location.href="<%= request.getContextPath()%>/DateSearchServlet?date=yesterday"'>어제</td>
									<td onclick = 'location.href="<%= request.getContextPath()%>/DateSearchServlet?date=today"'>오늘</td>
									<td onclick = 'location.href="<%= request.getContextPath()%>/DateSearchServlet?date=aweek"'>1주일</td>
									<td onclick = 'location.href="<%= request.getContextPath()%>/DateSearchServlet?date=amonth"'>1개월</td>
									<td onclick = 'location.href="<%= request.getContextPath()%>/DateSearchServlet?date=sixmonth"'>6개월</td>
									<td onclick = 'location.href="<%= request.getContextPath()%>/DateSearchServlet?date=ayear"'>1년</td>
								</tr>
							</table>
						</div>


						<!-- 선택조회 끝 -->
						<div style='clear: both;'></div>
					</div>

					<div style='padding-top: 30px;'>
						<div
							style='font-weight: bold; float: left; padding: 0px 10px; margin-top: 7px;'>상품검색</div>
						<div style='float: left;'>
							<select name="search_type" id="search_type"
								style='box-sizing: border-box; height: 28px; width: 118px; vertical-align: bottom;'>
								<option value="1">상품명</option>
								<option value="2">주문번호</option>
							</select> <input id="search_text" name="search_text" type='text'
								style='margin-left: 10px; box-sizing: border-box; height: 28px; width: 559px; padding-left: 10px;'
								placeholder='상품명 또는 주문번호를 입력하세요.' value="" />
							<div
								style='padding-top: 6px; padding-left: 3px; font-size: 11px; color: #666;'>상품명과
								주문번호로만 조회 가능합니다.</div>
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
					<span class='nth-child4'>주문수량</span> 
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
							src="<%=request.getContextPath()%>/images/product/<%=map.get(list.get(i).getPrdCode()).getChangeName()%>" width="100px" height="100px"></div>
						<div class='contents data4'><a onclick="detail2(<%=list.get(i).getOrderCheck()%>,<%=list.get(i).getOrderCount() %>)"><%=list.get(i).getPrdName() %></a> </div>

						</div>
						<div class='contents data5'><%=list.get(i).getPayPrice()%>원</div>
						<div class='contents data6'><%=list.get(i).getOrderCount() %>개</div>
						<div class='contents data7'><%=list.get(i).getBuyStatus()%></div>
						<div class='contents data9'>
							<button class='data9 btn' onclick="detail()"
								style='cursor: pointer; display: inline-block; 
							width: 70px; height: 23px; background-color: #454c5f; color: #fff';>배송추적</button></div>
						
					</div>
					
					<%} %>
				<%} %>
				
				<script type="text/javascript">
               function trace(i){
                  window.open("http://service.epost.go.kr/trace.RetrieveRegiPrclDeliv.postal?sid1="+i,"배송추적","width=600,height=900");
               }
               function detail(){
           		window.open('<%=request.getContextPath()%>/views/admin/delivery/deliveryDetail.jsp','배송추적', 'width=500, height=700');
           	}
               var x = 0;
           	var y = 0;
           	var check;
           	document.onmousedown=function(){
           		if(check != null){
           			check.close();
           			check = null;
           		}
           	}
           	document.onmousemove=function(){
           		  x=event.x;
           		  y=event.y;
           	}
           	
           	function detail2(sel,count){
           		
           		var h = 100+(50*count);
           		
           		check = window.open('<%=request.getContextPath()%>/Detail.swy?sel='+sel,'상세보기','width=600,height='+h+',left='+x+', top='+y);
           	}
            </script>
            
			</div>
						<%-- 페이징 처리 --%>
						<div class="pagingArea" align="center">
							<%if(entire.equals("전체")){ %>
							
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
							
							
							<%}else{ %>
							
							<button	onclick="location.href='<%=request.getContextPath()%>/BuyerHistorySearch?currentPage=1'"><<</button>
							<%if (currentPage <= 1) {	%>
							<button disabled><</button>
							<%} else { %>
							<button	onclick="location.href='<%=request.getContextPath()%>/BuyerHistorySearch?currentPage=<%=currentPage - 1%>'"><</button>
							<%}%>
							<%for (int p = startPage; p <= endPage; p++) {
									if (p == currentPage) {	%>
							<button disabled><%=p%></button>
							<%} else {%>
							<button	onclick="location.href='<%=request.getContextPath()%>/BuyerHistorySearch?currentPage=<%=p%>'"><%=p%></button>
							<%}%>
							<%}%>
							<%if (currentPage >= maxPage) {%>
							<button disabled>></button>
							<%} else {%>
							<button	onclick="location.href='<%=request.getContextPath()%>/BuyerHistorySearch?currentPage=<%=currentPage + 1%>'">></button>
							<%}%>
							<button	onclick="location.href='<%=request.getContextPath()%>/BuyerHistorySearch?currentPage=<%=maxPage%>'">>></button>
							
							<%} %>
<hr class="gshr">

		</div>
	</div>

</body>
</html>