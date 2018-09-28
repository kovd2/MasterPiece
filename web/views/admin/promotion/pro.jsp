<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.MasterPiece.admin.model.vo.*, com.kh.MasterPiece.board.model.vo.*"%>
<%
	ArrayList<Promotion> list = (ArrayList<Promotion>) request.getAttribute("list");
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
    <jsp:param name="name" value="8"/>
</jsp:include>
<div id="main">
	<h1 style="margin-left: 50px">프로모션 관리</h1>
	<div>
	<table align="right">
	<tr>
	<td>
	<input type="button" style="width:70px; height:30px;" value="등록" onclick="promotionAdd()">
	</td>
	</tr>
	</table>
	</div>
	<br>
	<div>
		<table id="mt" border="1" style="margin-top: 30px">
		<tr align="center" style="background: lightgray; height: 50px">
		<th style="width:50px;">번호</th>
		<th style="width:300px;">제목</th>
		<th style="width:170px;">등록일</th>
		</tr>
		<%
			for(int i=0; i< list.size(); i++){
		%>
		<tr>
			<td><%=list.get(i).getPromotion_No() %></td>
			<td><a href="<%=request.getContextPath()%>/promotionDetail.h?no=<%=list.get(i).getPromotion_No()%>"><%=list.get(i).getPromotion_Title()%></a></td>
			<%-- <td><%=list.get(i).getPromotion_Title() %></td> --%>
			<td><%=list.get(i).getPromotion_DATE() %></td>
		</tr>
		
		<%
			}
		%>
		</table>
			<%
				if (cate.equals("전체")) {
			%>
			<div class="pagingArea" align="center">
				<%
					if (cate.equals("전체")) {
				%>
				<button
					onclick="location.href='<%=request.getContextPath()%>/promotionList.h?currentPage=1'"><<</button>
				<%
					} else {
				%>
				<button
					onclick="location.href='<%=request.getContextPath()%>/productCategoryLists.swy?code=<%=cate%>&currentPage=1'"><<</button>
				<%
					}
				%>
				<%
					if (currentPage <= 1) {
				%>
				<button disabled><</button>
				<%
					} else {
							if (cate.equals("전체")) {
				%>
				<button
					onclick="location.href='<%=request.getContextPath()%>/promotionList.h?currentPage=<%=currentPage - 1%>'"><</button>
				<%
					} else {
				%>
				<button
					onclick="location.href='<%=request.getContextPath()%>/productCategoryLists.swy?code=<%=cate%>&currentPage=<%=currentPage - 1%>'"><</button>
				<%
					}
				%>
				<%
					}
				%>

				<%
					for (int p = startPage; p <= endPage; p++) {
							if (p == currentPage) {
				%>
				<button disabled><%=p%></button>
				<%
					} else {
								if (cate.equals("전체")) {
				%>
				<button
					onclick="location.href='<%=request.getContextPath()%>/promotionList.h?currentPage=<%=p%>'"><%=p%></button>
				<%
					} else {
				%>
				<button onclick="location.href='<%=request.getContextPath()%>/productCategoryLists.swy?code=<%=cate%>&currentPage=<%=p%>'"><%=p%></button>
				<%
					}
				%>
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
					} else {
							if (cate.equals("전체")) {
				%>
				<button
					onclick="location.href='<%=request.getContextPath()%>/promotionList.h?currentPage=<%=currentPage + 1%>'">></button>
				<%
					} else {
				%>
				<button
					onclick="location.href='<%=request.getContextPath()%>/productCategoryLists.swy?code=<%=cate%>&currentPage=<%=currentPage + 1%>'">></button>
				<%
					}
				%>
				<%
					}
				%>
				<%
					if (cate.equals("전체")) {
				%>
				<button
					onclick="location.href='<%=request.getContextPath()%>/promotionList.h?currentPage=<%=maxPage%>'">>></button>
				<%
					} else {
				%>
				<button
					onclick="location.href='<%=request.getContextPath()%>/productCategoryLists.swy?code=<%=cate%>&currentPage=<%=maxPage%>'">>></button>
				<%
					}
				%>
			</div>
			<%
				}
			%>
	</div>
	
	</div>
	
	<script>
			function promotionAdd(){
				
				location.href="views/admin/promotion/newpro.jsp";
			}
	</script>
</body>
</html>