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
	Board b = (Board)request.getAttribute("Board");    
%>
</head>
<body>
 <jsp:include page="../common/menu.jsp">
    <jsp:param name="name" value="7"/>
</jsp:include>
<div id="main">
		<div align="center">
		<form action="<%=request.getContextPath()%>/Que.swy" id="que" method="post">
		<input type="hidden" name="id" value = "<%=b.getBOARD_ID() %>">
			<table style="margin-left: 20px; margin-top: 20px; width: 1080px"
				border="1">
				<tr>
					<th align="center" style="width: 20%; background: lightgray">제목</th>
					<td style="width: 80%"><input readonly="readonly" name = "title" style="border:0px; width: 99%;background: white; color: black" type="text" value="<%=b.getBOARD_TITLE()%>"></td>
				</tr>
				<tr>
					<th align="center" style="width: 20%; background: lightgray">작성자</th>
					<td style="width: 80%"><input readonly="readonly" name = "title" style="border:0px; width: 99%;background: white; color: black" type="text" value="<%=b.getBOARD_TITLE()%>"></td>
				</tr>
				<tr>
					<th align="center" style="width: 20%; background: lightgray">작성일자</th>
					<td style="width: 80%"><input readonly="readonly" name = "title" style="border:0px; width: 99%;background: white; color: black" type="text" value="<%=b.getBOARD_TITLE()%>"></td>
				</tr>
				<tr>
					<th align="center"
						style="width: 20%; background: lightgray; height: 150px">내용</th>
					<td style="width: 80%"><textarea name="content" style="border:0px;width: 99%; height: 150px; resize: none" readonly="readonly"><%=b.getBOARD_CONTENT()%></textarea></td>
				</tr>
				<tr>
				<th align="center"
						style="width: 20%; background: lightgray;">상품 선택</th>
				<td style="width: 80%">
				<button type="button" style="height: 30px" onclick="listPop('CPU')">CPU</button>
				<button type="button"  style="height: 30px" onclick="listPop('MAINBOARD')">MAINBOARD</button>
				<button type="button"  style="height: 30px" onclick="listPop('MEMORY')">MEMORY</button>
				<button type="button"  style="height: 30px" onclick="listPop('GRAPHIC')">GRAPHIC</button> 
				<button type="button"  style="height: 30px" onclick="listPop('HDD/SDD')">HDD/SDD</button>
				<button type="button"  style="height: 30px" onclick="listPop('ODD')">ODD</button>
				<button type="button"  style="height: 30px" onclick="listPop('POWER')">POWER</button>
				<button type="button"  style="height: 30px" onclick="listPop('COOLER')">COOLER</button>
				<button type="button"  style="height: 30px" onclick="listPop('CASE')">CASE</button>
				</td>
				</tr>
				<tr>
					<th align="center"
						style="width: 20%; background: lightgray; height: 150px">답변 내용</th>
					<td style="width: 80%"><textarea id="cont" name="content1" style="border:0px;width: 99%; height: 150px; resize: none" readonly="readonly"></textarea>
					<textarea id="cont2" name="content2" style="border:0px;width: 99%; height: 30px; resize: none" readonly="readonly"></textarea>
					<textarea id="cont3" name="content3" style="border:0px;width: 99%; height: 150px; resize: none"></textarea>
					</td>
				</tr>
			</table>
			<input type ="hidden" name = "qc" id="qc" value="asdf">
			<input type ="button" onclick="sub()" value="등록" style="margin-top:20px;width: 80px;height: 40px">
			</form>
		</div>
	</div>
	<script type="text/javascript">
	
	
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
	function sub(){
		var str = $("#cont").val() +"\n"+ $("#cont2").val() + "\n" + $("#cont3").val();
		$("#qc").val(str);  
		$("#que").submit(); 
	}
	function listPop(category){
		check = window.open('<%=request.getContextPath()%>/List.swy?category='+category,'리스트','width=600,height=700,left='+x+', top='+(y-200));
	}
	var price = 0;
	function setContent(p){
		$br = $("<br>");
		price = price + p;
		$("#cont2").val("총 "+price+"원");
	}
	</script>
</body>
</html>