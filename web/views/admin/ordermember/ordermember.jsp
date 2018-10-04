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
<form action="<%=request.getContextPath() %>/InsertDelivery.swy" method="post" id="asdf">
	<div style="margin-left:20px; margin-top:20px;">
		<button style="display:inline;" type="button" onclick="pr()">결제 전</button>
		<button style="display:inline;" type="button" onclick="po()">결제 완료</button><br><br>
		<input style="display: none;" type="button" class = "delevery" value="배송">
		<button style="display: none;" type="button" class="refund">환불</button>
		<button style="display: none;" type="button" class="complete">결제 확인</button>
		<button style="display: none;" type="button" class="cancel">취소</button>
	</div><br>
	<div style="margin-left:20px;">
	주문번호 : <input type="text" id = "t"> <input type="button" onclick="search()" value="검색">
	</div><br>
	<div>
		<table id="mt" border="1">
		<tr align="center" style="background: lightgray;">
		<th><input type="checkbox" id="check"></th>
		<th style="width: 100px">주문일자</th>
		<th style="width: 100px">주문번호</th>
		<th style="width: 300px">상품정보</th>
		<th style="width: 120px">주문자</th>
		<th style="width: 90px">결제금액</th>
		<th style="width: 50px">결제<br>방법</th>
		</tr>
		<%for(int i = 0; i < list.size(); i++){ %>
		<tr>
		<td>
		<input type="checkbox" value=<%=list.get(i).getOrder_check()%> class="check" name="check">
		<input type="hidden" value=<%=list.get(i).getPay_no() %> class=<%=list.get(i).getOrder_check()%>>
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
		<tr>
		<%} %>
		</table>
	</div>
	</form>
	<script type="text/javascript">
	
	function pr(){
		
		location.href='<%=request.getContextPath()%>/OrderConfirm.swy?status=N';
	}
	
	function po(){
		
		location.href='<%=request.getContextPath()%>/OrderConfirm.swy?status=Y';
	}
	
	$(document).ready(function(){
		$('input[id="t"]').keydown(function(){
			if(event.keyCode === 13){
				return false;
			}
		})
		if("<%=(String)request.getAttribute("cate")%>"=="N"){
			$(".cancel").css("display","inline");
			$(".complete").css("display","inline");
			$(".refund").css("display","none");
			$(".delevery").css("display","none");
		}else{
			$(".refund").css("display","inline");
			$(".delevery").css("display","inline");
			$(".complete").css("display","none");
			$(".cancel").css("display","none");
		}
	})
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
		
		check = window.open('<%=request.getContextPath()%>/Detail.swy?sel='+sel,'상세보기','width=600,height='+h+',left='+x+', top='+y);
	}
	
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
	$(".delevery").click(function(){
		var val = "";
		var value = [];
		$(".check:checked").each(function(index,item){
			if(index!=0){
				val += ",";
			}
			val += $(this).val();
			value.push($(this).val());
		})
		if(val!=""){
			$("#asdf").submit();
		}
	
	});
	$(".refund").click(function(){
		var val = "";
		var value = "";
		$(".check:checked").each(function(index,item){
			if(index!=0){
				value += ",";
			}
			val = $(this).val();
			value += $("."+val).val();
		})
		if(val!=""){
			location.href='<%=request.getContextPath()%>/Refund.swy?val='+value;
		}
	
	});
	$(".cancel").click(function(){
		var val = "";
		var value = "";
		$(".check:checked").each(function(index,item){
			if(index!=0){
				value += ",";
			}
			val = $(this).val();
			value += $("."+val).val();
		})
		if(val!=""){
			location.href='<%=request.getContextPath()%>/Cancel.swy?val='+value;
		}
	
	});
	$(".complete").click(function(){
		var val = "";
		var value = "";
		$(".check:checked").each(function(index,item){
			if(index!=0){
				value += ",";
			}
			val = $(this).val();
			value += $("."+val).val();
		})
		if(val!=""){
			location.href='<%=request.getContextPath()%>/Complete.swy?val='+value;
		}
	
	});
	</script>
	<%
				if (cate.equals("N")) {
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
				}else if(cate.equals("Y")){
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