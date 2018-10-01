<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.MasterPiece.mypage.buyerhistory.model.vo.*, java.util.*, com.kh.MasterPiece.board.model.vo.*"%>
<%
	ArrayList<BuyerHistory> buyList = (ArrayList<BuyerHistory>)request.getAttribute("buyList");
	HashMap<String, Attachment> imageList = (HashMap<String, Attachment>)request.getAttribute("imageList");
	
	/* for(BuyerHistory bh : buyList)
	{
		Attachment image = imageList.get(bh.getPrdName());
		System.out.println(bh.getPrdName());
		System.out.println("아니 왜 null이야 : " + image);
	} */
	
	/* System.out.println("ㅎㅎ : " + imageList);
	System.out.println("ㅋ"); */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
body
{
	padding:0px;
	margin:0px;
	width:540px;
	font-size:9pt;
	font-family:dotum;
	line-height:13px;
	display:block;
}
.header
{
	background-color:#e31738;
	color:#fff;
	padding:14px 10px;
	font-size:18px;
	font-weight:bold;
	height:30px;
	line-height:30px;
}
table>thead
{
	border:1px solid lightgray;
}
table>tbody
{
	border:1px solid lightgray;
}
table>thead>tr
{
	height:50px;
}
table
{
	border-spacing:0px;
	border-collapse:collapse;
}
.pointer
{
	cursor:pointer;
}
</style>
</head>
<body>
	<div class="header">구매내역</div>
	<br><br>
	<div align="center">
		<table style="width:520px; text-align:center;" align="center">
			<thead>
				<tr>
					<th>
						<input type="checkbox" name="checkAll" id="checkAll" onclick="checkAll()"> 
					</th>
					<th>이미지</th>
					<th>상품정보</th>
					<th>수량</th>
					<th>합계</th>
				</tr>
			</thead>
			<tbody>
				<%
					for(BuyerHistory bh : buyList)
					{
						Attachment image = imageList.get(bh.getPrdName());
						
						System.out.println("$%^& : " + image);
				%>
				<tr>
					<td style="width: 39px; height: 31px;"><input type="checkbox" name="checkBoxList"></td>
					<td style="width:100px; height:100px;"><img style="width:100%; height:100%;" src="<%= request.getContextPath() %>/images/product/<%= image.getChangeName() %>"></td>
					<td><input type="hidden" name="prdCode" value="<%= bh.getPrdCode() %>"><%= bh.getPrdCode() %></td>
					<td><input type="hidden" name="orderCount" value="<%= bh.getOrderCount() %>"><%= bh.getOrderCount() %></td>
					<td><%= bh.getPayPrice() %>원</td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<br><br>
		<div>
			<input type="button" onclick="cancle();" class="pointer" style="background:white; border:1px solid #e31738; border-radius:2px; color:#e31738; width:80px; height:35px;" value="취소">
			<input type="button" onclick="submit();" class="pointer" style="background:#e31738; border:1px solid #e31738; border-radius:2px; color:white; width:80px; height:35px;" value="확인">
		</div>
	</div>
	
	<script>
	function checkAll()
	{
		if ($("#checkAll").is(':checked'))
		{
			$("input[name='checkBoxList']").prop("checked", true);
		}
		else
		{
			$("input[name=checkBoxList]").prop("checked", false);
		}
	}
	
	function cancle()
	{
		window.close();
	}
	
	function submit()
	{
		if($("input[type='checkbox']").is(':checked'))
		{
			var prdTxt = $("input[name='prdCode']").val() + " " + "[" + $("input[name='orderCount']").val() + "개]";
			
			opener.document.getElementById("content").value = prdTxt;
			
			window.close();
		}
		else
		{
			alert("1개 이상의 상품을 선택하세요.");
		}
	}
	</script>
</body>
</html>