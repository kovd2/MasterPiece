
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
		<jsp:param name="name" value="3" />
	</jsp:include>
	<div id="main">
		<h1 style="margin-left: 50px">회원 정보</h1>
		<div>
			<table id="mt">
				<tr style="height: 50px">
					<td><select id="option">
							<option>회원ID</option>
							<option>성명</option>
							<option>이메일</option>
					</select></td>
					<td><input type="text" size="30" id="value"></td>
					<td><input type="button" id="search" value="검색"></td>
				</tr>
			</table>
		</div>
		<div>
			<table id="mt" border="1">
				<tr align="center" style="background: lightgray;">
					<th style="width: 40px">번호</th>
					<th style="width: 60px">회원ID</th>
					<th style="width: 60px">성명</th>
					<th style="width: 200px">주소</th>
					<th style="width: 100px">연락처</th>
					<th style="width: 150px">이메일</th>
					<th style="width: 50px">탈퇴</th>
				</tr>
				<%
					for (int i = 0; i < list.size(); i++) {
				%>
				<tr>
					<td><%=list.get(i).getUserNo()%></td>
					<td><%=list.get(i).getUserId()%></td>
					<td><%=list.get(i).getUserName()%></td>
					<td><%=list.get(i).getAddress()%></td>
					<td><%=list.get(i).getPhone()%></td>
					<td><%=list.get(i).getEmail()%></td>
					<td align="center"><button class="delete">
							<input type="hidden" value=<%=list.get(i).getUserNo()%>>삭제
						</button></td>
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
					onclick="location.href='<%=request.getContextPath()%>/memberList.swy?currentPage=1'"><<</button>
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
					onclick="location.href='<%=request.getContextPath()%>/memberList.swy?currentPage=<%=currentPage - 1%>'"><</button>
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
					onclick="location.href='<%=request.getContextPath()%>/memberList.swy?currentPage=<%=p%>'"><%=p%></button>
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
					onclick="location.href='<%=request.getContextPath()%>/memberList.swy?currentPage=<%=currentPage + 1%>'">></button>
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
					onclick="location.href='<%=request.getContextPath()%>/memberList.swy?currentPage=<%=maxPage%>'">>></button>
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

</body>
<script type="text/javascript">
$(function(){
	$(".delete").click(function(){
		var code = $(this).children("input").val();
			location.href="<%=request.getContextPath()%>/deleteMember.swy?code=" + code;
	});
	$("#search").click(function(){
		var code = $("#option").val();
		var value = $("#value").val(); 
		location.href="<%=request.getContextPath()%>/searchMember.swy?code=" + code + "&val=" + value;
		
		});

	});
</script>
</html>