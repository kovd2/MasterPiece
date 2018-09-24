<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, com.kh.MasterPiece.member.model.vo.*, com.kh.MasterPiece.board.model.vo.*"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");
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
<title>Insert title here</title>
</head>
<body>
 <jsp:include page="../common/menu.jsp">
    <jsp:param name="name" value="6"/>
</jsp:include>
<div id="main">
	<div>
		<table id="mt" border="1" style="margin-top: 80px">
		<tr align="center" style="background: lightgray; height: 50px">
		<th style="width: 100px">번호</th>
		<th style="width: 800px">제목</th>
		<th style="width: 180px">작성자</th>
		</tr>
		<%
					for (int i = 0; i < list.size(); i++) {
				%>
				<tr>
					<td><%=list.get(i).getBOARD_ID()%></td>
					<td><a href="<%=request.getContextPath()%>/questionDetail.swy?id=<%=list.get(i).getBOARD_ID()%>"><%=list.get(i).getBOARD_TITLE()%></a></td>
					<td><%=list.get(i).getBOARD_WRITER()%></td>
				</tr>
				<%
					}
				%>
		</table>
		
	</div>
	<div align = "center">
		<table align="center" style="margin-top: 30px">
			<tr style="height: 50px">
			<td><select name="">
				<option>제목</option>
				<option>작성자</option>
			</select></td>
			<td><input type="text" size="50"></td>
			<td><input type="button" onclick="search()" value = "검색"></td>
			</tr>
		</table>
	</div>
	<%
				if (cate.equals("전체")) {
			%>
			<div class="pagingArea" align="center">
				<button
					onclick="location.href='<%=request.getContextPath()%>/question.swy?currentPage=1'"><<</button>

				<%
					if (currentPage <= 1) {
				%>
				<button disabled><</button>
				<%
					} else {%>
				<button
					onclick="location.href='<%=request.getContextPath()%>/question.swy?currentPage=<%=currentPage - 1%>'"><</button>
				
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
					onclick="location.href='<%=request.getContextPath()%>/question.swy?currentPage=<%=p%>'"><%=p%></button>
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
					onclick="location.href='<%=request.getContextPath()%>/question.swy?currentPage=<%=currentPage + 1%>'">></button>
				
				<%
					}
				%>
				<button
					onclick="location.href='<%=request.getContextPath()%>/question.swy?currentPage=<%=maxPage%>'">>></button>
			</div>
			<%
				}
			%>
	</div>
</body>
</html>