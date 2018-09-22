<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.MasterPiece.board.model.vo.*, java.util.*"%>
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	String searchCondition = (String)request.getAttribute("searchCondition");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
	/* System.out.println("list : " + list);
	System.out.println("listCount : " + listCount);
	
	System.out.println("currentPage" + currentPage);
	System.out.println("maxPage" + maxPage);
	System.out.println("startPage" + startPage);
	System.out.println("endPage" + endPage); */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
    /*서브(리스트)_페이지넘버*/
    .list_number{padding-top:25px; text-align:center;}
    .list_n_menu {padding:3px; MARGIN:3px; TEXT-ALIGN: center}
	.list_n_menu A {padding: 1px 4px 0px 4px;MARGIN: 2px;/* BORDER: #ccc 1px solid; */COLOR: #999;TEXT-DECORATION: none;}
    .list_n_menu A:hover {BORDER:#999 1px solid; COLOR: #666;}
    .list_n_menu A:active {BORDER:#999 1px solid; COLOR: #666;}
	.list_n_menu .current {BORDER: #117bff 1px solid;padding: 1px 4px 0px 4px;FONT-WEIGHT: bold;MARGIN: 2px;COLOR: #036cb4;}
    .list_n_menu .disabled {BORDER: #eee 1px solid;padding: 1px 4px 0px 4px;MARGIN: 2px;COLOR: #ddd; background:white;}
    
.container-inner /* .inb 에 대한 인라인 블록 지정 */ {
	/* width:90%; */
	display: inline-block;
	float:left;
}

.container {
	overflow:hidden;
	width:1080px;
}
.sideBlank{width:120px;}
.sideMenu{width:210px;}
.board{width:600px;}

.menu {
	width: 178px;
    background: #F5F5F5;
    border: 1px solid lightgray;
    font-weight: bold;
    font-size:0.9em;
    padding-top: 8px;
    padding-right: 10px;
}
.menuAtt {
	padding-left: 10px;
}
.menuAtt:hover
{
	background:darkgray;
	color:white;
	cursor:pointer;
}
.boardTable
{
	font-size:small;
	width:600px;
	border-spacing:0px;
}
.boardTable th, td
{
	text-align:center;
	border-bottom:1px dashed #F5F5F5;
	height:30px;
}
.boardTable th:nth-child(1), td:nth-child(1)
{
	background:#F5F5F5;
}
.boardTable th
{
	background:#F5F5F5;
}
.boardTable>tbody>tr:hover
{
	background:lightgray;
	cursor:pointer;
}
.btn:hover
{
	cursor:pointer;
}
</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	
	<!-- 전체 틀 -->
	<div class="container" style="margin:auto;">
		<!-- 사이드 메뉴 -->
		<div class="container-inner inner sideMenu">
			<div class="inb" id="sideMenu" style="width: 200px; height:80px;">
				<div class="sideMenu menu menuAtt" style="height: 30px;" onclick="location.href='<%= request.getContextPath() %>/selectList.qc'">
					<span style="float:left">견적 요청</span><span style="float: right;">></span>
				</div>
				<div class="sideMenu menu menuAtt" style="height: 30px;" onclick="location.href='<%= request.getContextPath() %>/selectList.ue'">
					<span style="float:left">유저 견적 게시판</span><span style="float: right;">></span>
				</div>
			</div>
		</div>
		<!-- 게시판 -->
		<div class="container-inner inner board" style="margin-top:-8px;">
			<div class="inb" id="board" style="width:600px; margin-left:40px;">
				<!-- 중앙 게시판 -->
				<div>
					<div>
						<hr style="border-color:#f43641;">
						<span style="padding-left:10px; font-weight:bold; font-size:large; float:left; width:290px; margin-top:-5px;">견적 요청</span>
						<br clear="both">
						<form action="<%= request.getContextPath() %>/search.qc" method="get">
						  <div style="float:right; margin-top:-26px;">
						    <input type="text" class="form-control" name="searchValue" placeholder="검색어를 입력하세요." size="40" style="height:20px; font-size:small;">
						  </div>
						  <div style="float:right; margin-top:-26px;">
						  	<button class="btn btn-default" type="submit" style="width:50px; height:26px; padding:3px 6px; font-size:small;">검색</button>
						  </div>
						  <div style="margin-top:-25px; float:right; margin-right:320px;">
							  <select style="height:24px;" name="searchCondition">
									<option value="title">제목</option>
									<option value="writer">작성자</option>
									<option value="content">내용</option>
							  </select>
						  </div>
						</form>
						<hr style="margin-top:3px; border-color:#f43641;">
						<table class="boardTable" style="margin-top:-8px;">
							<thead>
								<tr>
									<th style="width:50px;">번호</th>
									<th style="width:350px;">제목</th>
									<th style="width:100px;">작성자</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody>
								<%
									for(Board b : list)
									{
								%>
								<tr>
									<input type="hidden" value="<%= b.getBOARD_NO() %>">
									<input id="boardPassword" type="hidden" value="<%= b.getBOARD_PWD() %>">
									<td><%= b.getBOARD_NO() %></td>
									<td><%= b.getBOARD_TITLE() %></td>
									<td><%= b.getBOARD_WRITER() %></td>
									<td colspan="2"><%= b.getBOARD_DATE() %></td>
									<th style="display:disabled;"><input type="hidden" value="<%= b.getBOARD_ID() %>"></th>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>
					</div>
				</div>
				<br>
				<div>
					<button class="btn" type="button" style="padding:2px 4px; float:right; height:28px; font-size:14px; border:1px solid white; border-radius:5px; color:white; background:#d9534f;" onclick="location.href='/MasterPiece/views/board/quoteContactWrite.jsp'">견적 요청</button>
				</div>
			</div>
		</div>
		<br clear="both">
		<br>
		<!-- 페이징 -->
		<div>
			<div>
				<div class="list_n_menu" style="font-size:14px;">
				<%
					if(currentPage <= 1)
					{
				%>
				<button class="disabled"><  이전</button>
				<%
					}
					else
					{
				%>
				<button onclick="location.href='<%= request.getContextPath() %>/selectList.qc?currentPage=<%= currentPage - 1 %>'"><  이전</button>
				<%
					}
				%>
				<%
					for(int p=startPage; p<=endPage; p++)
					{
						if(p == currentPage)
						{
				%>
				<button class="disabled"><%= p %></button>
				<%
						}
						else
						{
				%>
				<button onclick="location.href='<%= request.getContextPath() %>/selectList.qc?currentPage=<%= p %>'"><%= p %></button>
				<%
						}
					}
					if(currentPage >= maxPage)
					{
				%>
				<button class="disabled">다음  ></button>
				<%
					}
					else
					{
				%>
				<button onclick="location.href='<%= request.getContextPath() %>/selectList.qc?currentPage=<%= currentPage + 1 %>'">다음  ></button>
				<%
					}
				%>
				</div>
		    </div>
		</div>
	</div>
	<br><br><br>
	<%@ include file="../common/footer.jsp" %>
	
	<script>
		$(function()
		{
			$(".boardTable td").click(function()
			{
				<%-- if("<%= loginUser.getUserId() %>" != "admin")
				{
					var password = prompt("비공개 게시글입니다. 비밀번호를 입력하세요.");
	
					var boardPassword = $("#boardPassword").val();
					console.log(boardPassword);
					
					if(password == boardPassword)
					{
						var num = $(this).parent().children("input").val();
					
						console.log(num);
					
						location.href="<%= request.getContextPath() %>/selectOne.qc?num=" + num;
					}
					else
					{
						alert("비밀번호가 맞지 않습니다.");
						
						location.href="<%= request.getContextPath() %>/selectList.qc";
					}
				}
				else
				{
					var num = $(this).parent().children("input").val();
					
					console.log(num);
				
					location.href="<%= request.getContextPath() %>/selectOne.qc?num=" + num;
				} --%>
				
				var boardNo = $(this).parent().children("input").val();
				var boardId = $(this).parent().children().children("input").val();
				
				console.log("boardNo : " + boardNo);
				console.log("boardId : " + boardId);
			
				location.href="<%= request.getContextPath() %>/selectOne.qc?boardNo=" + boardNo + "&boardId=" + boardId;
			});
		});
	</script>
</body>
</html>