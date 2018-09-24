<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.kh.MasterPiece.member.model.vo.*, com.kh.MasterPiece.board.model.vo.*"%>
<%
	ArrayList<Member> list = (ArrayList<Member>) request.getAttribute("list");
	String cate = (String) request.getAttribute("cate");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	int listCount = 0;
	int currentPage = 0;
	int maxPage =0;
	int startPage = 0;
	int endPage = 0;
	if(cate.equals("전체")){
	 listCount = pi.getListCount();
	 currentPage = pi.getCurrentPage();
	 maxPage = pi.getMaxPage();
	 startPage = pi.getStartPage();
	 endPage = pi.getEndPage();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <jsp:include page="../common/menu.jsp">
    <jsp:param name="name" value="4"/>
</jsp:include>
<div id="main">
	<div style="margin-left:20px; margin-top:20px;margin-bottom:20px;">
		<button>결제 전</button>
		<button>결제 후</button>
	</div>
	<div>
		<table id="mt" border="1">
		<tr align="center" style="background: lightgray;">
		<th style="width: 100px">주문일자</th>
		<th style="width: 100px">주문번호</th>
		<th style="width: 100px">상품정보</th>
		<th style="width: 90px">주문자</th>
		<th style="width: 200px">결제금액</th>
		<th>결제방법</th>
		<th>결제상태</th>
		<th>주문상태</th>
		<th>상세정보</th>
		</tr>
		</table>
	</div>
	<%
				if (cate.equals("전체")) {
			%>
			<div class="pagingArea" align="center">
				<button
					onclick="location.href='<%=request.getContextPath()%>/orderList.swy?currentPage=1'"><<</button>

				<%
					if (currentPage <= 1) {
				%>
				<button disabled><</button>
				<%
					} else {%>
				<button
					onclick="location.href='<%=request.getContextPath()%>/orderList.swy?currentPage=<%=currentPage - 1%>'"><</button>
				
				<%
					}
				%>

				<%
					for (int p = startPage; p <= endPage; p++) {
							if (p == currentPage) {
				%>
				<button disabled><%=p%></button>
				<%
					} else {%>
				<button
					onclick="location.href='<%=request.getContextPath()%>/orderList.swy?currentPage=<%=p%>'"><%=p%></button>
				<%
					}
				%>
				<%
					}
				%>

				<%
					if (currentPage >= maxPage) {
				%>
				<button disabled>></button>
				<%
					} else {%>
				<button
					onclick="location.href='<%=request.getContextPath()%>/orderList.swy?currentPage=<%=currentPage + 1%>'">></button>
				
				<%
					}
				%>
				<button
					onclick="location.href='<%=request.getContextPath()%>/orderList.swy?currentPage=<%=maxPage%>'">>></button>
			</div>
			<%
				}
			%>
	</div>
</body>
</html>