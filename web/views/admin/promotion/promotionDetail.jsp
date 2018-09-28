<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.MasterPiece.admin.model.vo.*"%>
<%
	Promotion p = (Promotion)request.getAttribute("Promotion");
	Promotion_ATT pa = (Promotion_ATT)request.getAttribute("Promotion_ATT");
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
	<form id="promotionDetailForm" action="<%=request.getContextPath() %>/promotionModify.h" method="post" encType="multipart/form-data">
	<h1 style="margin-left: 50px">프로모션 등록</h1>
	<table border="1" style="margin-top: 20px;width: 600px" id="mt">
	<tr>
	<td align="center" style="width:70px;height: 30px;">제목</td>
	<td>
	<input type="text" name="proTitle" id="proTitle" style="border-style:none; width:530px; height:30px;" value="<%=p.getPromotion_Title()%>">
	</td>
	</tr>
	<tr>
	<td align="center" style="width:70px;height: 30px;">URL</td>
	<td>
	<input type="text" name="proUrl" id="proUrl" style="border-style:none; width:530px; height:30px;" value="<%=p.getPromotion_URL() %>">
	</td>
	</tr>
	<tr>
	<td align="center" style="width:70px">첨부파일</td>
	<td align="center">
	<div id="proImageArea">
		<img id="proImage" width="500px" height="200px" style="margin:20px;" src="<%=request.getContextPath() %>/images/promotion/<%=pa.getChange_name() %>">
	</div>
	</td>
	</tr>
	</table>
	<input type="hidden" name="proNo" id="proNo" value="<%=p.getPromotion_No() %>">
	<table align="center" style="margin-top: 40px">
	<tr>
	<td><input type="button" style="width:100px; height:50px;" value="수정" onclick="promotionModifyBtn()"></td>
	<td><input type="button" style="width:100px; height:50px;" value="삭제" onclick="promotionDeleteBtn()"></td>
	</tr>
	</table>
	<input type="file" id="proImg1" name="proImg1" onchange="loadImg(this,1);">
	</div>
	
	<script>
		$(function(){
			$("#proImg1").hide();
			
			$("#proImageArea").click(function(){
				$("#proImg1").click();
			})
			
		});
		
		function loadImg(value, num){
			
			if(value.files && value.files[0]){
				
				var reader = new FileReader();
				reader.onload = function(e){
					
					switch(num){
					case 1 : $("#proImage").attr("src", e.target.result); break;
					
					}
				}
				
				reader.readAsDataURL(value.files[0]);
			}
			
		}
		
		function promotionModifyBtn(){
			
			$("#promotionDetailForm").submit();
			
		}
		
		function promotionDeleteBtn(){
			
			location.href = "<%=request.getContextPath()%>/promotionDelete.h";
			
		}
	</script>
</body>
</html>