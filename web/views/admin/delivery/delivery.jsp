<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, com.kh.MasterPiece.admin.model.vo.*, com.kh.MasterPiece.board.model.vo.*"
    %>
    <%
	ArrayList<Delivery> list = (ArrayList<Delivery>) request.getAttribute("list");
	String cate = (String) request.getAttribute("cate");
	String[] adress = null;
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>

<jsp:include page="../common/menu.jsp">
		<jsp:param name="name" value="9" />
	</jsp:include>
	<div id="main">
	<div style="margin-left: 20px; margin-top: 20px;margin-bottom: 30px"><button class="delevery"style="width: 80px;height: 50px">배송완료</button></div>
	<div style="margin-left: 20px;"><button class="po">배송 완료 목록</button>&nbsp;&nbsp;&nbsp;&nbsp;<button class="pr">배송 중 목록</button></div>
	<form action="DeliveryCompletion.swy" method="post" id="com">
	<table border="1" style="margin-left: 20px; margin-top: 20px;margin-bottom: 30px">
	<tr>
	<th><input type="checkbox" id="check">
	<th style="width:80px">송장번호</th>
	<th style="width:100px">배송 일시</th>
	<th style="width:100px">주문확인번호</th>
	<th style="width:300px">주소</th>
	<th style="width:120px">전화번호</th>
	<th style="width:200px">기타사항</th>
	<th style="width:100px">배송상태</th>
	</tr>
	<%for(int i = 0; i < list.size(); i++){ %>
	<tr>
	<td><input type="checkbox" class="check" value=<%=list.get(i).getORDER_CHECK() %> name="check">
	<td style="width:80px"><%=list.get(i).getINVOICE_NO() %></td>
	<td style="width:100px"><%=list.get(i).getDELIVERY_DATE() %></td>
	<td style="width:100px"><%=list.get(i).getORDER_CHECK() %></td>
	<%adress = list.get(i).getSHIPPING_ADDRESS().split(","); %>
	<td style="width:300px">
	<%for(int j = 0; j < adress.length; j++){ %>
		<%if(j<adress.length-1){ %>
		<%=adress[j] %><br>
		<%}else{ %>
		<%=adress[j] %>
		<%} %>
	<%} %>
	</td>
	<td style="width:120px"><%=list.get(i).getSHIPPING_PHONE() %></td>
	<td style="width:200px"><%=list.get(i).getETC() %></td>
	<td style="width:100px;cursor: pointer;" onclick="detail()"><%=list.get(i).getStatus() %></td>
	</tr>
	<%} %>
	</table>
	</form>
	<script type="text/javascript">
	function detail(){
		window.open('<%=request.getContextPath()%>/views/admin/delivery/deliveryDetail.jsp','배송추적', 'width=500, height=700');
	}
	$(".delevery").click(function(){
		var val = null;
		var value = [];
		$(".check:checked").each(function(index,item){
			if(index!=0){
				val += ",";
			}
			val += $(this).val();
			value.push($(this).val());
			
		})
		
		if(val != null){
			
			$("#com").submit();
		}
	
	});
	$(".pr").click(function(){
		location.href='<%=request.getContextPath()%>/Delivery.swy?st=배송중'
	});
	$(".po").click(function(){
		location.href='<%=request.getContextPath()%>/Delivery.swy?st=배송완료' 
	});
	
	
	$("#check").click(function(){
	if($(this).prop("checked")){
		$(".check").prop("checked", true);
	}else{
		$(".check").prop("checked", false);
	}
});
$(".check").click(function(){
	if($(this).prop("checked")){
		$(this).prop("checked", true)
	}else{
		if($("#check").prop("checked")){
			$("#check").prop("checked",false)
		}
		$(this).prop("checked", false)
	}
});
</script>
	<%
				if (cate.equals("배송중")) {
			%>
			<div class="pagingArea" align="center">
				<button
					onclick="location.href='<%=request.getContextPath()%>/Delivery.swy?st=배송중&currentPage=1'"><<</button>

				<%if (currentPage <= 1) {%>
				<button disabled><</button>
				<%	} else {%>
				<button
					onclick="location.href='<%=request.getContextPath()%>/Delivery.swy?st=배송중&currentPage=<%=currentPage - 1%>'"><</button>
				
				<%}
					for (int p = startPage; p <= endPage; p++) {
					if (p == currentPage) {
				%>
				<button disabled><%=p%></button>
				<%
					} else {%>
				<button
					onclick="location.href='<%=request.getContextPath()%>/Delivery.swy?st=배송중&currentPage=<%=p%>'"><%=p%></button>
				<%
					}
				
					}
				
					if (currentPage >= maxPage) {
				%>
				<button disabled>></button>
				<%
					} else {%>
				<button
					onclick="location.href='<%=request.getContextPath()%>/Delivery.swy?st=배송중&currentPage=<%=currentPage + 1%>'">></button>
				
				<%
					}
				%>
				<button
					onclick="location.href='<%=request.getContextPath()%>/Delivery.swy?st=배송중&currentPage=<%=maxPage%>'">>></button>
			</div>
			<%
				}else{
			%>
			<div class="pagingArea" align="center">
				<button
					onclick="location.href='<%=request.getContextPath()%>/Delivery.swy?st=배송완료&currentPage=1'"><<</button>

				<%
					if (currentPage <= 1) {
				%>
				<button disabled><</button>
				<%
					} else {%>
				<button
					onclick="location.href='<%=request.getContextPath()%>/Delivery.swy?st=배송완료&currentPage=<%=currentPage - 1%>'"><</button>
				
				<%
					}
				
					for (int p = startPage; p <= endPage; p++) {
							if (p == currentPage) {
				%>
				<button disabled><%=p%></button>
				<%
					} else {%>
				<button
					onclick="location.href='<%=request.getContextPath()%>/Delivery.swy?st=배송완료&currentPage=<%=p%>'"><%=p%></button>
				<%
					}
				
					}
			
					if (currentPage >= maxPage) {
				%>
				<button disabled>></button>
				<%
					} else {%>
				<button
					onclick="location.href='<%=request.getContextPath()%>/Delivery.swy?currentPage=<%=currentPage + 1%>'">></button>
				
				<%
					}
				%>
				<button
					onclick="location.href='<%=request.getContextPath()%>/Delivery.swy?currentPage=<%=maxPage%>'">>></button>
			</div>
			
			<%} %>
	</div>
</body>
</html>