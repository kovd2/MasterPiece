<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
.centerWrapArea {
	display: inline-block;
	width: 79%;
	height: 600px;
	background: white;
	float: right;
	font-family: dotum;
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

.section_header_table tr td {
	border: 1px solid #ccc;
	background-color: #fff;
	box-sizing: border-box;
	width: 59px;
	height: 27px;
	text-align: center;
	cursor: pointer;
}
.section_header_table tr td:hover{
	
	background-color: #454c5f;
	color:white;
}

div, li, dd, dt, table, td {
	word-break: break-all;
	word-wrap: break-word;
}

td, th {
	display: table-cell;
	vertical-align: inherit;
}
.section_header_table {
	border-spacing: 0px;
	border-collapse: collapse;
	box-sizing: border-box;
}

.mypage_input[type="text"], select {
	padding: 0px;
	box-shadow: none;
	border: 1px solid #ccc;
	font-size: 12px;
}

.mypage_input, textarea, select, button {
	text-rendering: auto;
	color: initial;
	letter-spacing: normal;
	word-spacing: normal;
	text-transform: none;
	text-indent: 0px;
	text-shadow: none;
	display: inline-block;
	text-align: start;
	margin: 0em;
	font: 400 13.3333px Arial;
}

.mypage_input {
	-webkit-appearance: textfield;
	background-color: white;
	-webkit-rtl-ordering: logical;
	cursor: text;
	padding: 1px;
	border-width: 2px;
	border-style: inset;
	border-color: initial;
	border
}

div {
	display: block;
}

.text_wave {
	margin: 0px 5px;
	float: left;
	line-height: 28px;
	height: 28px;
}

/* 아래 테이블 */
.faq_figure {
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	width: 935px;
}

.faq_figure .faq_caption {
	background-color: #f3f4f6;
	padding: 15px;
	margin-top: 50px;
}

.faq_figure .faq_caption>div, .centerWrapArea .faq_figure .faq_text>div
	{
	float: left;
	text-align: center;
}

.faq_figure>div .nth-child1 {
	width: 100px !important;
}

.faq_figure>div .nth-child2 {
	width: 115px !important;
}

.faq_figure>div .nth-child3 {
	width: 500px !important;
}

.faq_figure>div .nth-child4 {
	width: 100px !important;
}

.faq_figure>div .nth-child5 {
	width: 100px !important;
}

.middle_article {
	padding: 27px 10px;
}

.text-red {
	color: #e31738;
}

.text-bold {
	font-weight: bold;
}

.m_top10 {
	margin-top: 10px;
}

.middle_article>div>select {
	padding: 5px 10px;
	width: 280px;
	border: 1px solid #ccc;
	/* vertical-align: top; */
}

.float_left {
	float: left;
}

.float_right {
	float: right;
}

select {
	padding-left: 10px !important;
}

.faq_figure {
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	width: 935px;
}

.page_box {
	text-align: center;
	margin-bottom: 20px;
}

.contents {
	width: 937px;
	box-sizing: border-box;
	padding: 9px 0px;
	text-align: left;
	background-color: #f3f4f6;
}

.board_data1 {
	width: 120px !important;
	text-align: center;
	display: inline-block;
	margin-bottom: 5px;
}

.board_data2 {
	width: 105px !important;
	text-align: center;
	display: inline-block;
}

.board_data3 {
	width: 500px;
	display: inline-block;
}

.board_data3:hover{
	cursor:pointer;
	font-weight: bold;
	color: #c70000;
}

.board_data4 {
	text-align: center;
	width: 100px;
	display: inline-block;
}

.no_data {
	text-align: center;
}
</style>
</head>
<body>
	<div class="centerWrapArea">
		<div class="section">
			<div class='figure'>
				<div class="center_top_title" align="left">내가 쓴 게시물</div>

				<input class="mypage_input" type="hidden" name="date_num" id="date_num" value="2">
				<div class='section_header_v2'
					style='width: 937px; height: 140px; border: 1px #ccc solid; box-sizing: border-box; background-color: #F3F4F6;'>
					
					<form action = "<%= request.getContextPath() %>/ReviewSearchServlet"> 
					
					<div style='float: left; padding-top: 18px; width: 774px;'>
						 <div>
							<div style='font-weight: bold; float: left; font-weight: bold; float: left; padding: 0px 10px; margin-top: 7px;'>조회기간</div>
							<div style='float: left;'>
								<table class='section_header_table'>
									<tr>
										<td onclick = 'location.href="<%= request.getContextPath()%>/DateSearch?date=yesterday"'>어제</td>
										<td onclick = 'location.href="<%= request.getContextPath()%>/DateSearch?date=today"'>오늘</td>
										<td class='current' onclick = 'location.href="<%= request.getContextPath()%>/DateSearch?date=aweek"'>1주일</td>
										<td onclick = 'location.href="<%= request.getContextPath()%>/DateSearch?date=amonth"'>1개월</td>
										<td onclick = 'location.href="<%= request.getContextPath()%>/DateSearch?date=sixmonth"'>6개월</td>
										<td onclick = 'location.href="<%= request.getContextPath()%>/DateSearch?date=ayear"'>1년</td>
									</tr>
								</table>
							</div>
							<div style='clear: both;'></div>
						</div>
						<div id="search" class="search_review" style='padding-top: 30px;'>
							<div style='font-weight: bold; float: left; padding: 0px 10px; margin-top: 7px;'>
								검색
							</div>
							<div style='float: left;'>
								<select name="search_type" id="search_type"
									style='box-sizing: border-box; height: 28px; width: 118px; vertical-align: bottom;'>
									<option value="1">견적게시판</option>
									<option value="2">유저게시판</option>
									<option value="3">문의</option>
								</select> 
								<input class="mypage_input" id="search_text" name="search_text" type='text'
									style='margin-left: 10px; box-sizing: border-box; height: 28px; 
									width: 559px; padding-left: 10px;'
									value="" >
								<div style='padding-top: 6px; padding-left: 3px; font-size: 11px; color: #666;'>지금까지
									작성하신 모든 게시글을 확인 가능합니다.</div>
							</div>

							<div style='clear: both;'></div>
						</div>

					</div>
					<div style='float: left; padding-top: 35px;'>
						
							<input class="mypage_input1" type="submit" value="조회하기" style='cursor: pointer; display: inline-block; 
							width: 152px; height: 63px; background-color: #454c5f; color: #fff; 
							line-height: 62px; text-align: center;'>
						
					</div>
				
					<div style='clear: both;'></div>
					</form>
				</div>


				<div class='faq_figure'>

					<div class='faq_caption'>
						<div class='nth-child1'>번호</div>
						<div class='nth-child2'>유형</div>
						<div class='nth-child3'>제목</div>
						<div class='nth-child4'>작성일자</div>
						<div class='clear'></div>
					</div>

					<div>
						<div class="contents data">
							<%
								if (list == null) {
							%>
							<div class='contents no_data'>작성하신 글이 없습니다.</div>
							<%
								} else {
									for (int i = 0; i < list.size(); i++) {
							%>
							<div class="board_data1"><%=list.get(i).getBoardNo()%></div>
							<div class="board_data2"><%=list.get(i).getBoardCategory()%></div>
							<div class="board_data3">
								<span onclick="selectone(<%=list.get(i).getBoardId()%>)"><%=list.get(i).getBoardTitle()%></span>
							</div>
							<div class="board_data4"><%=list.get(i).getBoardDate()%></div>
							<%
									}
								}
							%>
							<script>
								function selectone(no){
									var no = no;
									<%-- location.href = "<%=request.getContextPath()%>/ReviewSelectOne?num="+no; --%>
									window.open("<%=request.getContextPath()%>/ReviewSelectOne?num="+no+"&userId=<%=loginUser.getUserId()%>",'게시글팝업','top=100px, left=100px, height=600px, width=800px');
								}
							</script>
						</div>
						
						
						
						

						<%-- 페이징 처리 --%>
						<div class="pagingArea" align="center">
							<%if(entire.equals("전체")){ %>
							
							<button	onclick="location.href='<%=request.getContextPath()%>/ReviewServlet?currentPage=1'"><<</button>
							<%if (currentPage <= 1) {	%>
							<button disabled><</button>
							<%} else { %>
							<button	onclick="location.href='<%=request.getContextPath()%>/ReviewServlet?currentPage=<%=currentPage - 1%>'"><</button>
							<%}%>
							<%for (int p = startPage; p <= endPage; p++) {
									if (p == currentPage) {	%>
							<button disabled><%=p%></button>
							<%} else {%>
							<button	onclick="location.href='<%=request.getContextPath()%>/ReviewServlet?currentPage=<%=p%>'"><%=p%></button>
							<%}%>
							<%}%>
							<%if (currentPage >= maxPage) {%>
							<button disabled>></button>
							<%} else {%>
							<button	onclick="location.href='<%=request.getContextPath()%>/ReviewServlet?currentPage=<%=currentPage + 1%>'">></button>
							<%}%>
							<button	onclick="location.href='<%=request.getContextPath()%>/ReviewServlet?currentPage=<%=maxPage%>'">>></button>
						
						
						<%}else{ %>
					
							<button	onclick="location.href='<%=request.getContextPath()%>/ReviewSearchServlet?currentPage=1'"><<</button>
							<%if (currentPage <= 1) {	%>
							<button disabled><</button>
							<%} else { %>
							<button
								onclick="location.href='<%=request.getContextPath()%>/ReviewSearchServlet?currentPage=<%=currentPage - 1%>'"><</button>
							<%}%>
							<%for (int p = startPage; p <= endPage; p++) {
									if (p == currentPage) {%>
							<button disabled><%=p%></button>
							<%} else {%>
							<button onclick="location.href='<%=request.getContextPath()%>/ReviewSearchServlet?currentPage=<%=p%>'"><%=p%></button>
							<%}%>
							<%}%>
							<%if (currentPage >= maxPage) {%>
							<button disabled>></button>
							<%} else {%>
							<button	onclick="location.href='<%=request.getContextPath()%>/ReviewSearchServlet?currentPage=<%=currentPage + 1%>'">></button>
							<%}%>
							<button onclick="location.href='<%=request.getContextPath()%>/ReviewSearchServlet?currentPage=<%=maxPage%>'">>></button>
					
						<%} %>
										
						</div>
						
					</div>
				</div>
				<div class='m_top20'></div>
				<div class="page_box"></div>
			</div>
			<div class='clear'></div>
			<div class='m_top20'></div>
		</div>
	</div>

</body>
</html>