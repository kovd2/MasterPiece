<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.kh.MasterPiece.member.model.vo.*, com.kh.MasterPiece.board.model.vo.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");
	String cate = (String) request.getAttribute("cate");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	int listCount = 0;
	int currentPage = 0;
	int maxPage = 0;
	int startPage = 0;
	int endPage = 0;

	listCount = pi.getListCount();
	currentPage = pi.getCurrentPage();
	maxPage = pi.getMaxPage();
	startPage = pi.getStartPage();
	endPage = pi.getEndPage();
%>
<style>
.pagingArea>.btn{
	margin:2.8px;
}
</style>
</head>
<body>
	<jsp:include page="../common/menu.jsp">
		<jsp:param name="name" value="7" />
	</jsp:include>
	<div id="main">
		<div style="margin-left: 30px; margin-top: 20px;">
			<select id="sel" onchange="change()">
				<option value="6">공지사항</option>
				<option value="1">견적게시판</option>
			</select>
			<button style="margin-left:30px;" id="add">공지사항 추가</button>
		</div>
		<div>
			<table id="maintable" border="1"
				style="margin-left: 20px; margin-top: 20px">
				<tr align="center" style="background: lightgray; height: 50px">
					<th style="width: 100px">번호</th>
					<th style="width: 800px">제목</th>
					<th style="width: 180px">작성자</th>
				</tr>
				<%
					for (int i = 0; i < list.size(); i++) {
				%>
				<tr class="content">
					<td><%=list.get(i).getBOARD_ID()%></td>
					<td><a
						href="<%=request.getContextPath()%>/questionDetail.swy?id=<%=list.get(i).getBOARD_ID()%>"><%=list.get(i).getBOARD_TITLE()%></a></td>
					<td><%=list.get(i).getBOARD_WRITER()%></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
		<div align="center">
			<table align="center" style="margin-top: 30px">
				<tr style="height: 50px">
					<td><select name="">
							<option>제목</option>
							<option>작성자</option>
					</select></td>
					<td><input type="text" size="50"></td>
					<td><input type="button" value="검색"></td>
				</tr>
			</table>
		</div>
		<div class="pagingArea" align="center">
			<button onclick="location.href='<%=request.getContextPath()%>/selectBoard.swy?currentPage=1'"><<</button>
			<% if(currentPage <= 1){ %>
				<button disabled><</button>
			<% }else{%>
				<button onclick="location.href='<%=request.getContextPath()%>/selectBoard.swy?currentPage=<%=currentPage - 1 %>'"><</button>
			<% } %>
			<% for(int p = startPage; p <= endPage; p++){ 
					if(p == currentPage){%>
						<button disabled><%= p %></button>
			<%      }else{%>
						<button onclick="location.href='<%=request.getContextPath()%>/selectBoard.swy?currentPage=<%=p%>'"><%=p %></button>
			<%      } %>
			<% } %>			
			
			<% if(currentPage >= maxPage){ %>
				<button disabled>></button>
			<% }else{ %>
				<button onclick="location.href='<%=request.getContextPath()%>/selectBoard.swy?currentPage=<%=currentPage + 1 %>'">></button>

			<% } %>
			<button onclick="location.href='<%=request.getContextPath()%>/selectBoard.swy?currentPage=<%=maxPage%>'">>></button>
		</div>
	</div>

	<script>
		function change() {
			var type = $("#sel").val();
			if(type != 6){
				$("#add").css("visibility","hidden")
			}else{
				$("#add").css("visibility","visible")
			}
			$.ajax({
				url : "selectBoardAjax.swy",
				data : {
					type : type
				},
				type : "get",
				success : function(data) {
					$(".content").remove();
						for (var i = 0; i < data.boardList.length; i++) {
							$tr = $("<tr class='content'>");
							$td = $("<td>");
							$td.append(data.boardList[i].BOARD_ID);
							$td2 = $("<td>");
							if(type == 6){
								$td2.append(data.boardList[i].BOARD_TITLE);	
							}else{
								$td2.append(data.boardList[i].BOARD_TITLE);
							}
							$td3 = $("<td>");
							$td3.append(data.boardList[i].BOARD_WRITER);
							$tr.append($td);
							$tr.append($td2);
							$tr.append($td3);
							$("#maintable").append($tr);
						}
						
					$(".pagingArea>*").remove();
						
						if(data.bpi.maxPage!=0){
						$button = $("<button class='btn' onclick = a(1)>");
						$button.append("<<");
						$(".pagingArea").append($button);
						if(data.bpi.currentPage <= 1){ 
							$button2  = $("<button class='btn' disabled>");	 
						}else{
							$button2  = $("<button class='btn' onclick = a("+(data.bpi.currentPage - 1)+")>");
						}
						$button2.append("<");
						$(".pagingArea").append($button2);
						for(var p = data.bpi.startPage; p <= data.bpi.endPage; p++){ 
							if(p == data.bpi.currentPage){
								$page = $("<button class='btn' disabled>");
						    }else{
						    	$page = $("<button class='btn' onclick=a("+p+")>");
						   } 
							$page.append(p);
							$(".pagingArea").append($page);
						} 			
						
						if(data.bpi.currentPage >= data.bpi.maxPage){ 
							$button3 = $("<button class='btn' disabled>");
						}else{ 
							$button3 = $("<button class='btn' onclick=a("+(data.bpi.currentPage + 1)+")>");
						} 
						$button3.append(">");
						$(".pagingArea").append($button3);
						$button4 = $("<button class='btn' onclick=a("+data.bpi.maxPage+")>");
						$button4.append(">>");
						$(".pagingArea").append($button4);
				}
				}

			});
		};
	</script>
	<script>
	function a(cp){
		var type = $("#sel").val();
		 $.ajax({
			url: "selectBoardAjax.swy",
			data : {currentPage:cp,
					type:type},
			type : "get",
			success : function(data) {
				$(".content").remove();
					for (var i = 0; i < data.boardList.length; i++) {
						$tr = $("<tr class='content'>");
						$td = $("<td>");
						$td.append(data.boardList[i].BOARD_ID);
						$td2 = $("<td>");
						if(type == 6){
							$td2.append(data.boardList[i].BOARD_TITLE);	
						}else{
							$td2.append(data.boardList[i].BOARD_TITLE);
						}
						$td3 = $("<td>");
						$td3.append(data.boardList[i].BOARD_WRITER);
						$tr.append($td);
						$tr.append($td2);
						$tr.append($td3);
						$("#maintable").append($tr);
					}
					$(".pagingArea>*").remove();
					
					if(data.bpi.maxPage!=0){
					$button = $("<button class='btn' onclick = a(1)>");
					$button.append("<<");
					$(".pagingArea").append($button);
					if(data.bpi.currentPage <= 1){ 
						$button2  = $("<button class='btn' disabled>");	 
					}else{
						$button2  = $("<button class='btn' onclick = a("+(data.bpi.currentPage - 1)+")>");
					}
					$button2.append("<");
					$(".pagingArea").append($button2);
					for(var p = data.bpi.startPage; p <= data.bpi.endPage; p++){ 
						if(p == data.bpi.currentPage){
							$page = $("<button class='btn' disabled>");
					    }else{
					    	$page = $("<button class='btn' onclick=a("+p+")>");
					   } 
						$page.append(p);
						$(".pagingArea").append($page);
					} 			
					
					if(data.bpi.currentPage >= data.bpi.maxPage){ 
						$button3 = $("<button class='btn' disabled>");
					}else{ 
						$button3 = $("<button class='btn' onclick=a("+(data.bpi.currentPage + 1)+")>");
					} 
					$button3.append(">");
					$(".pagingArea").append($button3);
					$button4 = $("<button class='btn' onclick=a("+data.bpi.maxPage+")>");
					$button4.append(">>");
					$(".pagingArea").append($button4);
			}
			}
		 });
	}
	
	</script>
</body>
</html>