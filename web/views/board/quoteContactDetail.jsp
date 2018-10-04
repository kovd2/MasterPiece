<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.MasterPiece.board.model.vo.*, java.util.*"%>
<%
	Board b = (Board)request.getAttribute("b");
	Board answerBoard = (Board)request.getAttribute("answerBoard");
	ArrayList<Board> replyList = (ArrayList<Board>)request.getAttribute("replyList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.container-inner /* .inb 에 대한 인라인 블록 지정 */ {
	/* width:90%; */
	display: inline-block;
	float:left;
}

.container {
	overflow:hidden;
	width:1080px;
}
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
.boardHead th
{
	width:65px;
}
#detailTable
{
	border-spacing:0px;
	border-collapse: collapse;
}
#detailTable>tbody>tr>th, #detailTable>tbody>tr>td
{
	border:1px solid lightgray;
}
#detailTable>tbody>tr>th
{
	text-align:left;
	padding-left:10px;
}
.btn:hover
{
	cursor:pointer;
}
.img
{
	width:70%;
	height:80%;
}
#replyTable
{
	border-spacing:0px;
	border-collapse:collapse;
}
#replyTable>tr>td
{
	border:none;
}
.pointer
{
	cursor:pointer;
}
#replyListTable>tr>td
{
	font-size:14px;
}

#answerTable
{
	border-spacing:0px;
	border-collapse: collapse;
}
#answerTable>tbody>tr>th, #answerTable>tbody>tr>td
{
	border:1px solid lightgray;
}
#answerTable>tbody>tr>th
{
	text-align:left;
	padding-left:10px;
}
</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	<%
		if(loginUser != null)
		{
	%>
	
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
					<hr style="margin-top:3px; border-color:#f43641;">
					<form action="<%= request.getContextPath() %>/gotoupdate.qc" method="post">
						<table id="detailTable" style="width:100%;">
							<tbody class="boardHead" style="font-size:14px;">
								<tr style="height:50px;">
									<input type="hidden" name="boardId" value="<%= b.getBOARD_ID() %>">
									<th style="width:150px; border-right:none;">작성자</th>
									<td style="width:250px; border-left:none; border-right:none; font-weight:bold; padding-left:20px;"><%= b.getBOARD_WRITER() %></td>
									<td style="width:100px; border-left:none; border-right:none; font-weight:bold; text-align:right;">작성일자</td>
									<td style="width:150px; border-left:none; font-weight:bold; text-align:right; padding-right:30px;"><%= b.getBOARD_DATE() %></td>
								</tr>
								<tr>
									<th style="vertical-align:middle; height:50px;">제목</th>
									<!-- <td colspan="3" style="text-align:center"><input type="text" placeholder="제목을 입력하세요." name="title" style="width:500px; height:30px; border:1px solid #ccc; border-radius:4px;"/></td> -->
									<td colspan="3"><span><%= b.getBOARD_TITLE() %></span></td>
									<input type="hidden" name="title" value="<%= b.getBOARD_TITLE() %>">
								</tr>
								<tr>
									<th style="vertical-align:middle;">내용</th>
									<%
										b.setBOARD_CONTENT(b.getBOARD_CONTENT().replace("\n", "<br>"));
									%>
									<td class="boardContent" colspan="3" style="height:300px; vertical-align:top;">
										<span><%= b.getBOARD_CONTENT() %></span>
									<%
										b.setBOARD_CONTENT(b.getBOARD_CONTENT().replace("<br>", "\n"));
									%>
										<input type="hidden" name="content" value="<%= b.getBOARD_CONTENT() %>">
									</td>
								</tr>
							</tbody>
						</table>
						<%
							if(b.getBOARD_WRITER().equals(loginUser.getUserId()))
							{
						%>
						<br>
						<div>
							<button type="submit" class="btn" style="background:forestgreen; color:white; border:1px solid white; border-radius:5px; width:50px; height:28px; padding:2px 4px; float:left;">수정</button>
						</div>
						<div>
							<button type="button" class="btn" style="background:orangered; color:white; border:1px solid white; border-radius:5px; width:50px; height:28px; padding:2px 4px; float:right; margin-right:5px;" onclick="location.href='<%= request.getContextPath() %>/deleteOne.qc?boardId=<%= b.getBOARD_ID() %>'">삭제</button>
						</div>
					</form>
					<%
						}
					%>
					</div>
					<br clear="both"><br>
					<%
						if(b.getQUE_STATUS().equals("Y"))
						{
					%>
					<div style="background:#D5D5D5; font-size:14px;">
						<table id="answerTable" style="width:100%;">
						<tbody class="boardHead" style="font-size:14px;">
							<tr>
								<th style="vertical-align:middle; width:100px;">답변</th>
								<td class="boardContent" colspan="3" style="vertical-align:middle;">
									<textarea readonly="readonly"style="resize: none; width: 90%;height: 200px"><%= answerBoard.getBOARD_CONTENT() %></textarea>
								</td>
							</tr>
						</tbody>
						</table>
					</div>
					<%
						}
					%>
					<br clear="both">
					<!-- 댓글 -->
					<div id="replyArea">
						<table id="replyListTable" align="center">
							<%
								for(Board replyBoard : replyList)
								{
							%>
							<tr>
								<td style="width:100px; font-size:14px;"><%= replyBoard.getBOARD_WRITER() %></td>
								<td style="width:440px; font-size:14px;"><%= replyBoard.getBOARD_CONTENT() %></td>
								<%
									if(replyBoard.getBOARD_WRITER().equals(loginUser.getUserId()))
									{
								%>
								<td style="font-size:14px;"><input type="button" value="X"><input type="hidden" value="<%= replyBoard.getBOARD_ID() %>"></td>
								<%
									}
								%>
							</tr>
							<!-- #replyListTable>tr>td { font-size:14px; } -->
							<%
								}
							%>
						</table>
					</div>
					<div class="container" style="margin:auto; border:1px solid lightgray; width:600px; height:100px;">
						<table id="replyTable" style="margin-top:20px;">
							<tr>
								<td style="width:100px; text-align:center; font-size:14px;"><%= loginUser.getUserId() %></td>
							<td style="width:440px;"><textarea id="replyContent" rows="3" cols="55" style="resize:none; margin-top:4px;"></textarea></td>
								<td><button type="button" id="addReply" class="pointer" style="width:50px; height:50px; background:dodgerblue; color:white; border:1px solid white; border-radius:5px;">등록</button></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br clear="both">
	<br><br><br>
	<%@ include file="../common/footer.jsp" %>
	<%
		}
		else
		{
			request.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
			request.getRequestDispatcher("../common/errorPage.jsp").forward(request, response);
		}
	%>
	
	<script>
	$(function()
	{
		$("#addReply").click(function()
		{
			var writer = "<%= loginUser.getUserId() %>";
			var boardId = <%= b.getBOARD_ID() %>;
			var replyContent = $("#replyContent").val();
			
			$.ajax(
			{
				url:"/MasterPiece/insertReply.qc",
				context:this,
				data:{writer:writer, replyContent:replyContent, boardId:boardId},
				type:"post",
				success:function(data)
				{
					console.log(data);
					
					var $replyListTable = $("#replyListTable");
					$replyListTable.html('');
					
					for(var key in data)
					{
						var $tr = $("<tr>");
						var $writerTd = $("<td>").text(data[key].BOARD_WRITER).css("width", "100px");
						var $replyContentTd = $("<td>").text(data[key].BOARD_CONTENT).css("width", "440px");
						var $td = $("<td>");
						var $hiddenValue = $("<input type='hidden'>").val(data[key].BOARD_ID);
						
						var hiddenVal = $hiddenValue.val();
						
						/* alert(hiddenVal); */
						
						/* $td.append("<input type='button' value='X'>"); */
						$td.append($hiddenValue);
						
						$tr.append($writerTd);
						$tr.append($replyContentTd);
						$tr.append($td);
						$replyListTable.append($tr);
						
						location.href="<%= request.getContextPath() %>/selectOne.qc?boardNo=" + <%= b.getBOARD_NO() %> + "&boardId=" + <%= b.getBOARD_ID() %>;
					}
				}
			});
		});
	});
	
	$(document).on('click',"input[type='button']", function()
	{
		var replyBoardId = $(this).parent().children("input[type='hidden']").val();
		var boardId = <%= b.getBOARD_ID() %>;
		var boardNo = <%= b.getBOARD_NO() %>;
		
		location.href="<%= request.getContextPath() %>/deleteReply.qc?replyBoardId=" + replyBoardId + "&boardId=" + boardId + "&boardNo=" + boardNo;
	});
	
	</script>
</body>
</html>