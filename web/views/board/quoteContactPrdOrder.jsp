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
				<tr>
					<td style="width: 39px; height: 31px;"><input type="checkbox" name="checkBoxList" class="check" value="<%= p.getPrdCode() %> [<%= p.getOrderCount() %>개]"></td>
					<td style="width:100px; height:100px;"><img style="width:100%; height:100%;" src="<%= request.getContextPath() %>/images/product/<%= image.getChangeName() %>"></td>
					<td><input type="hidden" name="prdCode" class="prdCode" value="<%= p.getPrdCode() %>"><%= p.getPrdCode() %></td>
					<td><input type="hidden" name="orderCount" class="orderCount" value="<%= p.getOrderCount() %>"><%= p.getOrderCount() %></td>
					<td><%= p.getPrice() %>원</td>
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
		var tf = "";
		
		$(".check:checked").each(function(index,item)
		{
			if(index != 0)
			{
				val += "\n";
			}
			val += $(this).val();
			
			var examTextCPU = "인텔(소켓1151-V2)/64(32)비트/헥사코어/쓰레드 12개/3.2GHz/터보부스트 4.6Ghz 지원/14나노/65W/AS3년/쿨러포함/윈도 7이하 운영체제 사용 시 반드시 사용하시는 보드가 지원하는지 확인 바랍니다.";
			var splitTextCPU = examTextCPU.split("/");
			var examTextMB = "인텔(소켓1151-V2)/(인텔) B360/M-ATX (24.4x24.4cm)/전원부: 10페이즈/DDR4/메모리 용량: 최대 64GB/XMP/VGA 연결: PCIe3.0 x16/멀티 GPU: CrossFire X/PCIe 슬롯 수: 4개/SATA3: 6개/M.2: 3개/7.1ch/그래픽 출력: D-SUB, DVI, HDMI/PS/2: 2개/USB2.0: 후면 2개/USB3.0: 후면 2개/USB3.1: 후면 2개/기가비트 LAN/UEFI/인텔 옵테인";
			var splitTextMB = examTextMB.split("/");
			
			/* alert(splitTextCPU[0]);
			alert(splitTextMB[0]); */
			
			if(splitTextCPU[0] == splitTextMB[0])
			{
				tf = "true";
			}
			else
			{
				tf = "false";
				$(this).parent().parent().css({"background":"red", "color":"white"});
			}
		});
		
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
			alert("호환성 다름!");
		}
	}
	</script>
</body>
</html>