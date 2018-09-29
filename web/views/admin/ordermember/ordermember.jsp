<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.kh.MasterPiece.admin.model.vo.*, com.kh.MasterPiece.board.model.vo.*"%>
<%
	ArrayList<OrderConfirm> list = (ArrayList<OrderConfirm>) request.getAttribute("list");
	String cate = (String) request.getAttribute("cate");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#main div table tr td{
text-align: center
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
 <jsp:include page="../common/menu.jsp">
    <jsp:param name="name" value="4"/>
</jsp:include>


<div id="main">
	<div style="margin-left:20px; margin-top:20px;">
		<button>배송</button>
		<button>환불</button>
	</div><br>
	<div style="margin-left:20px;">
	주문번호 : <input type="text" id = "t"> <input type="button" onclick="search()" value="검색">
	</div><br>
	<div>
		<table id="mt" border="1">
		<tr align="center" style="background: lightgray;">
		<th><input type="checkbox"></th>
		<th style="width: 100px">주문일자</th>
		<th style="width: 100px">주문번호</th>
		<th style="width: 300px">상품정보</th>
		<th style="width: 120px">주문자</th>
		<th style="width: 90px">결제금액</th>
		<th style="width: 50px">결제<br>방법</th>
		<th style="width: 50px">결제<br>상태</th>
		</tr>
		<%for(int i = 0; i < list.size(); i++){ %>
		<tr>
		<td>
		<%if(list.get(i).getPay_status().equals("N")){ %>
			<input type="checkbox" disabled>
		<%}else{ %>
			<input type="checkbox">
		<%} %>
		</td>
		<td><%=list.get(i).getPay_date() %></td>
		<td><%=list.get(i).getOrder_check() %></td>
		<td><a style="cursor: pointer;" onclick="detail(<%=list.get(i).getOrder_check() %>,<%=list.get(i).getCount()%>)" class="test"><%=list.get(i).getPrd_name() %>
		<%if(list.get(i).getCount()>1){ %>
		<br>외 <%=list.get(i).getCount()-1 %>개
		<%} %></a>
		</td>
		<td><%=list.get(i).getUser_id() %></td>
		<td style="text-align: right"><%=list.get(i).getPay_price() %>원</td>
		<td><%=list.get(i).getPay_way() %></td>
		<td><%=list.get(i).getPay_status() %></td>		
		<tr>
		<%} %>
		</table>
	</div>
	<script type="text/javascript">
	function search(){
		location.href="<%= request.getContextPath() %>/SearchOrder.swy?a="+$("#t").val();
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
	
	function detail(sel,count){
		
		var h = 30+(32*count);
		
		check = window.open('<%=request.getContextPath()%>/Detail.swy?sel='+sel,'상세보기','width=300,height='+h+',left='+x+', top='+y);
	}
	
	</script>
	<%
				if (cate.equals("전체")) {
			%>
			<div class="pagingArea" align="center">
				<button
					onclick="location.href='<%=request.getContextPath()%>/OrderConfirm.swy?currentPage=1'"><<</button>

				<%
					if (currentPage <= 1) {
				%>
				<button disabled><</button>
				<%
					} else {%>
				<button
					onclick="location.href='<%=request.getContextPath()%>/OrderConfirm.swy?currentPage=<%=currentPage - 1%>'"><</button>
				
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
					onclick="location.href='<%=request.getContextPath()%>/OrderConfirm.swy?currentPage=<%=p%>'"><%=p%></button>
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
					onclick="location.href='<%=request.getContextPath()%>/OrderConfirm.swy?currentPage=<%=currentPage + 1%>'">></button>
				
				<%
					}
				%>
				<button
					onclick="location.href='<%=request.getContextPath()%>/OrderConfirm.swy?currentPage=<%=maxPage%>'">>></button>
			</div>
			<%
				}else{
			%>
			<div class="pagingArea" align="center">
				<button
					onclick="location.href='<%=request.getContextPath()%>/SearchOrder.swy?currentPage=1&a=<%=cate%>'"><<</button>

				<%
					if (currentPage <= 1) {
				%>
				<button disabled><</button>
				<%
					} else {%>
				<button
					onclick="location.href='<%=request.getContextPath()%>/SearchOrder.swy?currentPage=<%=currentPage - 1%>&a=<%=cate%>'"><</button>
				
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
					onclick="location.href='<%=request.getContextPath()%>/SearchOrder.swy?currentPage=<%=p%>&a=<%=cate%>'"><%=p%></button>
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
					onclick="location.href='<%=request.getContextPath()%>/SearchOrder.swy?currentPage=<%=currentPage + 1%>&a=<%=cate%>'">></button>
				
				<%
					}
				%>
				<button
					onclick="location.href='<%=request.getContextPath()%>/SearchOrder.swy?currentPage=<%=maxPage%>&a=<%=cate%>'">>></button>
			</div>
			
			<%} %>
	</div>
</body>
</html>