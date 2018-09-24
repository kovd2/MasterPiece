<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, com.kh.MasterPiece.member.model.vo.*, com.kh.MasterPiece.board.model.vo.*"
    %>
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
</head>
<body>
 <jsp:include page="../common/menu.jsp">
    <jsp:param name="name" value="7"/>
</jsp:include>
<div id="main">
	<div style="margin-left: 30px; margin-top: 20px;">
		<select id="sel" onchange="change()">
				<option value = "6">공지사항</option>
				<option value = "2">견적게시판</option>
				<option value = "3">회원견적</option>
			</select>
	</div>
	<div>
		<table id="maintable" border="1" style="margin-left:20px;margin-top: 20px">
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
			<td><input type="button" value = "검색"></td>
			</tr>
		</table>
	</div>
	</div>
	
	<script>
	/* function change(){
			var type = $("#sel").val();
			var sel = 2;
			 $.ajax({
				url: "selectBoard.swy",
				data : {type:type,
						sel:sel},
				type : "get",
				success:function(data){
					
					var path = "images/product";
					
					$(".imageArea").children("div.imageList").remove();
					for(var i = 0; i < data.list.length; i++){
						$div = $("<div class='imageList'align='center'style='width: 350px; height:300px; border:1px solid black; display: inline-block;'>");
						$(".imageArea").append($div);
						
						$div2 = $("<div style='width:350px; height:300px; margin-left: 2px;'>");						
						$div.append($div2);
						$div2.append("<img src='"+path+"/"+data.imgList[data.list[i].prd_code].changeName+"' width='200px' height='200px'>"); 
						$span1 = $("<br><span style='font-weight:13px;'>");
						$span2 = $("<br><span style='font-color:red;'><hr>");
						$span1.append(data.list[i].prd_name)
						$span2.append("판매가격 " + data.list[i].price + "원")
						$div2.append($span1);
						$div2.append($span2);
						
					}
					
					console.log(path);	 
				}
			});  
		}; */
		
	</script>
</body>
</html>