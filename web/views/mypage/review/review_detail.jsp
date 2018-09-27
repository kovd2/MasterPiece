<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.kh.MasterPiece.board.model.vo.*, java.util.*,
	com.kh.MasterPiece.member.model.vo.Member"%>
	<%Board b = (Board)request.getAttribute("b"); 
	String userId = (String)request.getAttribute("userId");
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.container-inner /* .inb 에 대한 인라인 블록 지정 */ {
	/* width:90%; */
	display: inline-block;
	float: left;
}

.container {
	overflow: hidden;
	width: 1080px;
}

.sideMenu {
	width: 210px;
}

.board {
	width: 600px;
}

.menu {
	width: 178px;
	background: #F5F5F5;
	border: 1px solid lightgray;
	font-weight: bold;
	font-size: 0.9em;
	padding-top: 8px;
	padding-right: 10px;
}

.menuAtt {
	padding-left: 10px;
}

.menuAtt:hover {
	background: darkgray;
	color: white;
	cursor: pointer;
}

.boardHead th {
	width: 65px;
}

#detailTable {
	border-spacing: 0px;
	border-collapse: collapse;
}

#detailTable>tbody>tr>th, #detailTable>tbody>tr>td {
	border: 1px solid lightgray;
}

#detailTable>tbody>tr>th {
	text-align: left;
	padding-left: 10px;
}

.btn:hover {
	cursor: pointer;
}

.img {
	width: 70%;
	height: 80%;
}

#replyTable {
	border-spacing: 0px;
	border-collapse: collapse;
}

#replyTable>tr>td {
	border: none;
}

.pointer {
	cursor: pointer;
}

#replyListTable>tr>td {
	font-size: 14px;
}
</style>
</head>
<body>
<input type="hidden" name="boardId" id="boardId" value="<%=b.getBOARD_ID() %>">
	<div>
		<table id="detailTable" style="width: 100%;">
		
			<tbody class="boardHead" style="font-size: 14px;">
			
				<tr style="height: 50px;">
					<th style="width: 150px; border-right: none;">작성자</th>
					<td
						style="width: 250px; border-left: none; border-right: none; font-weight: bold; padding-left: 20px;"><%= userId %></td>
					<td
						style="width: 100px; border-left: none; border-right: none; font-weight: bold; text-align: right;">작성일자</td>
					<td
						style="width: 150px; border-left: none; font-weight: bold; text-align: right; padding-right: 30px;"><%= b.getBOARD_DATE() %></td>
				</tr>
				<tr>
					<th style="vertical-align: middle; height: 50px;">제목</th>
					<!-- <td colspan="3" style="text-align:center"><input type="text" placeholder="제목을 입력하세요." name="title" style="width:500px; height:30px; border:1px solid #ccc; border-radius:4px;"/></td> -->
					<td colspan="3"><input type="text" name="title" id="title" value="<%= b.getBOARD_TITLE() %>" style="width:99.2%; height:48px;" ></td>
				</tr>
				<tr>
					<th style="vertical-align: middle;">내용</th>
					<td class="boardContent" colspan="3"
						style="height: 300px; vertical-align: top;"><textarea id="content" name="content" style="resize:none; height:300px; width:99%;"><%= b.getBOARD_CONTENT() %></textarea></td>
				</tr>
			</tbody>
		</table>
		<br>
		
		<div>
			<INPUT type="button" class="btn" style="background: forestgreen; color: white; border: 1px solid white; border-radius: 5px; width: 50px; height: 28px; padding: 2px 4px; float: left;" onclick="a()" value="수정">
		</div>
		<script>
			function a(){
				alert("수정이 완료되었습니다.");
				window.close();
				var id = $("#boardId").val();
				var content = $("#content").val();
				var title = $("#title").val();
			
				$.ajax({
					url : "ReviewUpdateServlet",
					data : {
						boardId : id,
						content : content,
						title : title
					},
					type : "get"
				});
			}
		</script>
	
		<div>
			<button type="button" class="btn"
				style="background: orangered; color: white; border: 1px solid white; border-radius: 5px; width: 50px; height: 28px; padding: 2px 4px; float: right; margin-right: 5px;"
				onclick="location.href='<%= request.getContextPath() %>/ReviewDeleteServlet?boardId=<%= b.getBOARD_ID() %>'">삭제</button>
		</div>
		
	</div>
</body>
</html>