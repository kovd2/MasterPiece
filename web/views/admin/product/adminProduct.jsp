<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.MasterPiece.product.model.vo.*, com.kh.MasterPiece.board.model.vo.*"%>
    
 <%
 ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
 HashMap<String, Attachment> imgList = (HashMap<String, Attachment>)request.getAttribute("imgList");
 String cate = (String)request.getAttribute("cate");
 	PageInfo pi = (PageInfo)request.getAttribute("pi");
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
<style>
#mt{
margin-left:20px;
}
#menubar{
background: lightblue;
    color: white;
    cursor: pointer;
    width: auto;
    height: 30px;
    display: inline-block;
}
#list{
	border: 1px solid;
}
</style>
<body>
 <jsp:include page="../common/menu.jsp">
    <jsp:param name="name" value="2"/>
</jsp:include>
<div id="main">
				<div style="display: inline-block; margin-left: 20px;"><h1>상품</h1></div>
				<div style="display: inline-block; width: 300px;"></div>
				<div style="background: lightblue; color:white;cursor: pointer;text-align: center; width: 113px; height: 40px; padding-top: 15px; display: inline-block;" onclick="location.href='<%=request.getContextPath()%>/views/admin/product/productAdd.jsp'">상품추가</div>

		<div style="margin-top: 20px;margin-left: 20px">
			<button id="menubar" class="btn"><input type="hidden" value="전체">전체</button>
			<button id="menubar" class="btn"><input type="hidden" value="CPU">CPU</button>
			<button id="menubar" class="btn"><input type="hidden" value="MAINBOARD">메인 보드</button>
			<button id="menubar" class="btn"><input type="hidden" value="GRAPHIC">그래픽카드</button>
			<button id="menubar" class="btn"><input type="hidden" value="ODD">ODD</button>
			<button id="menubar" class="btn"><input type="hidden" value="POWER">파워 서플라이</button>
			<button id="menubar" class="btn"><input type="hidden" value="COOL">쿨러</button>
			<button id="menubar" class="btn"><input type="hidden" value="CASE">케이스</button>
			<button style = "float: right; background:lightgray;" id="menubar" class="delete">삭제</button>
		</div>
		<div style="margin-top: 20px;margin-left: 20px">
			<button id="menubar" class="btn"><input type="hidden" value="PAD">패드</button>
			<button id="menubar" class="btn"><input type="hidden" value="MONITOR">모니터</button>
			<button id="menubar" class="btn"><input type="hidden" value="MOUSE">마우스</button>
			<button id="menubar" class="btn"><input type="hidden" value="KEYBOARD">키보드</button>
			<button id="menubar" class="btn"><input type="hidden" value="SPEAKER">스피커</button>
			<button id="menubar" class="btn"><input type="hidden" value="ADAPTER">어댑터</button>
			<button id="menubar" class="btn"><input type="hidden" value="HEADSET">헤드셋</button>
		</div>
		


		<div style="margin-top:20px;">
			<table style="margin-left:20px" id="list">
			<tr>
					<th style="width:50px;"><input type="checkbox" name="all" id="check"></th>
					<th style="width:100px;"><img alt="" src=""></th>
					<th style="width:200px;">상품명</th>
					<th style="width:100px;">상품코드</th>
					<th style="width:50px;">재고<br>현황</th>
					<th style="width:80px;">판매가격</th>
					<th style="width:50px;">카테<br>고리</th>
			</tr>
			<%for(int i = 0; i < list.size(); i++){%>
			<tr>
			<td style="text-align: center"><input type="checkbox" name="check" value=<%=list.get(i).getPrd_code() %> class="check"></td>
					<td><img alt="" src="<%=request.getContextPath()%>/images/product/<%=imgList.get(list.get(i).getPrd_code()).getChangeName()%>" width="50px" height="50px"></td>
					<td><%=list.get(i).getPrd_name() %></td><!-- 상품명 -->
					<td><%=list.get(i).getPrd_code() %></td><!-- 상품코드 -->
					<td><%=list.get(i).getStock() %></td><!-- 재고 -->
					<td style="text-align: right;"><%=list.get(i).getPrice() %>원</td><!-- 가격-->
					<td style="text-align: center"><%=list.get(i).getCategory() %></td><!-- 카테고리-->
			</tr>
			<%} %>
			</table>
			<!--여기부터 페이징  -->
			<div class="pagingArea" align="center">
			<%if(cate.equals("전체")){ %>
			<button onclick="location.href='<%=request.getContextPath()%>/productList.swy?currentPage=1'"><<</button>
			<%}else{ %>
			<button onclick="location.href='<%=request.getContextPath()%>/productCategoryLists.swy?code=<%=cate%>&currentPage=1'"><<</button>
			<%} %>
			<% if(currentPage <= 1){ %>
				<button disabled><</button>
			<% }else{ 
				if(cate.equals("전체")){%>
				<button onclick="location.href='<%=request.getContextPath()%>/productList.swy?currentPage=<%=currentPage - 1 %>'"><</button>
				<%}else{ %>
				<button onclick="location.href='<%=request.getContextPath()%>/productCategoryLists.swy?code=<%=cate%>&currentPage=<%=currentPage - 1 %>'"><</button>
				<%} %>	
			<% } %>
			
			<% for(int p = startPage; p <= endPage; p++){ 
					if(p == currentPage){
			%>
						<button disabled><%= p %></button>
			<%      }else{ 
						if(cate.equals("전체")){%>
							<button onclick="location.href='<%=request.getContextPath()%>/productList.swy?currentPage=<%=p%>'"><%=p %></button>
						<%}else{ %>
							<button onclick="location.href='<%=request.getContextPath()%>/productCategoryLists.swy?code=<%=cate%>&currentPage=<%=p%>'"><%=p %></button>
						<%} %>	
			<%      } %>
			<% } %>			
			
			<% if(currentPage >= maxPage){ %>
				<button disabled>></button>
			<% }else{ 
				if(cate.equals("전체")){%>
				<button onclick="location.href='<%=request.getContextPath()%>/productList.swy?currentPage=<%=currentPage + 1 %>'">></button>
				<%}else{ %>
				<button onclick="location.href='<%=request.getContextPath()%>/productCategoryLists.swy?code=<%=cate%>&currentPage=<%=currentPage + 1 %>'">></button>
				<%} %>	
			<% } %>
			<%if(cate.equals("전체")){ %>
			<button onclick="location.href='<%=request.getContextPath()%>/productList.swy?currentPage=<%=maxPage%>'">>></button>
			<%}else{ %>
			<button onclick="location.href='<%=request.getContextPath()%>/productCategoryLists.swy?code=<%=cate%>&currentPage=<%=maxPage%>'">>></button>
			<%} %>
			
			
		</div>
		</div>
	</div>
</body>
<script>


	$(function(){
		$(".btn").click(function(){
			var code = $(this).children("input").val();
			if(code == "전체"){
				location.href="<%= request.getContextPath() %>/productList.swy";
			}else{
				location.href="<%= request.getContextPath() %>/productCategoryLists.swy?code=" + code;
			}
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
		$(".delete").click(function(){
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
				location.href="<%= request.getContextPath() %>/deleteProduct.swy?code="+val;
			}
				
		});
		
	});
</script>
</html>