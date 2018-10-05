<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.MasterPiece.prdOrder.model.vo.*, java.util.*, com.kh.MasterPiece.board.model.vo.*"%>
<%
	ArrayList<PrdOrder> prdList = (ArrayList<PrdOrder>)request.getAttribute("prdList");
	HashMap<String, Attachment> imageList = (HashMap<String, Attachment>)request.getAttribute("imageList");
	
	/* for(PrdOrder p : prdList)
	{
		Attachment image = imageList.get(p.getPrdCode());
		System.out.println("ㅋㅋ : " + image);
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
	<div class="header">장바구니</div>
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
					for(PrdOrder p : prdList)
					{
						Attachment image = imageList.get(p.getPrdCode());
						
						/* System.out.println("PPOOOIII : " + image); */
				%>
				<tr class = "<%= p.getPrdCode() %>">
					<td style="width: 39px; height: 31px;"><input type="checkbox" name="checkBoxList" class="check" value="<%= p.getContent() %> [<%= p.getOrderCount() %>개]★<%= p.getPrdName() %>☆<%= p.getCategory() %>☆<%= p.getPrdCode() %>"></td>
					<td style="width:100px; height:100px;"><img style="width:100%; height:100%;" src="<%= request.getContextPath() %>/images/product/<%= image.getChangeName() %>"></td>
					<td><input type="hidden" name="prdCode" class="prdCode" value="<%= p.getPrdName() %>"><%= p.getPrdName() %></td>
					<td style="width:50px;"><input type="hidden" name="orderCount" class="orderCount" value="<%= p.getOrderCount() %>"><%= p.getOrderCount() %></td>
					<td style="width:80px;"><%= p.getPrice() %>원</td>
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
		var val = "";
		var tf = "true";
		var category = new Array();
		var prd = new Array();
		var vval = "";
		var vvval = "";
		
		$(".check:checked").each(function(index,item)
		{
			if(index != 0)
			{
				val += "\n";
			}
			vval = $(this).val().split("★");
			vvval = vval[1].split("☆");
			console.log(vval[0]);
			val += vvval[0];
			
			prd[index] = $(this).val().split("/");
			category[index] = $(this).val().split("☆");
		});
		
		for(var i=0; i<prd.length; i++)
		{
			if(category[i][1] == "CPU")
			{	
				for(var j=0; j<prd.length; j++)
				{
					if(category[j][1] == "MAINBOARD")
					{
						if(prd[i][0].substring(0, 9) != prd[j][0].substring(0, 9))
						{
							tf = "false";

							$("."+category[j][2]).css({"background":"orangered", "color":"white"});
							$("."+category[i][2]).css({"background":"orangered", "color":"white"});
							
							alert("CPU와 메인보드의 호환이 맞지 않습니다.");
							
							break;
						}
					}
				}
			}
			else if(category[i][1] == "MAINBOARD")
			{
				for(var j=0; j<prd.length; j++)
				{
					if(category[j][1] == "MEMORY")
					{
						if(prd[i][4].substring(1, 5) != prd[j][0].substring(0, 4))
						{
							tf = "false";
							
							$("."+category[j][2]).css({"background":"orangered", "color":"white"});
							$("."+category[i][2]).css({"background":"orangered", "color":"white"});
							
							alert("메인보드와 메모리의 호환이 맞지 않습니다.");
							
							break;
						}
					}
				}
			}
		}
		
		if(tf == "true")
		{
			if(val != "")
			{
				opener.document.getElementById("content").value += val;
				
				window.close();
			}
			else
			{
				alert("1개 이상의 상품을 선택하세요.");
			}
		}
		else
		{
			if(confirm("계속하시겠습니까?"))
			{
				if(val != "")
				{
					opener.document.getElementById("content").value += val;
					
					window.close();
				}
				else
				{
					alert("1개 이상의 상품을 선택하세요.");
				}
			}
		}
	}
	</script>
</body>
</html>