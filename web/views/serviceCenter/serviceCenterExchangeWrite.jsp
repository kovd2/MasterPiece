<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.Date, java.text.SimpleDateFormat"%>
<%
	Date writeDate = new Date();
	
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	String today = dateFormat.format(writeDate);
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
    .list_n_menu .disabled {BORDER: #eee 1px solid;padding: 1px 4px 0px 4px;MARGIN: 2px;COLOR: #ddd;}
    
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
.menuAtt-inner
{
	padding-left: 10px;
}
.menuAtt-inner:hover
{
	cursor:pointer;
}
table
{
	border-spacing:0px;
	border-collapse:collapse;
}
.FAQBoard-Btn
{
	width:118px;
	height:40px;
	float:left;
	margin-left:-1px;
	border:1px solid lightgray;
}
.FAQBoard>div
{
	font-size:small;
	text-align:center;
	padding-top:11px;
}
.FAQBoard-Btn:hover
{
	cursor:pointer;
	background:royalblue;
	color:white;
}
.FAQBoard-Btn-trueContent:hover
{
	cursor:pointer;
}
.moreBoard:hover
{
	cursor:pointer;
}
#serviceMainImg:hover
{
	cursor:pointer;
}
.pointer:hover
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
			<div class="inb" id="sideMenu" style="width: 200px;">
				<div class="sideMenu menu menuAtt" style="height: 30px;" onclick="location.href='<%= request.getContextPath() %>/selectQuestionList.sc'">
					<span style="float:left">1:1 문의</span><span style="float: right;">></span>
				</div>
				<div class="sideMenu menu menuAtt" style="height: 30px;" onclick="location.href='<%= request.getContextPath() %>/selectMoreList.sc'">
					<span style="float:left">자주 묻는 질문</span><span style="float: right;">></span>
				</div>
				<div class="sideMenu menu menuAtt" style="height: 30px;" onclick="location.href='/MasterPiece/views/serviceCenter/serviceCenterExchangeWrite.jsp'">
					<span style="float:left">교환, 반품, AS접수 신청</span><span style="float: right;">></span>
				</div>
				<div class="sideMenu menu menuAtt" style="height: 30px;" onclick="location.href='<%= request.getContextPath() %>/selectExchange.af'">
					<span style="float:left">교환, 반품, AS접수 조회</span><span style="float: right;">></span>
				</div>
				<div class="sideMenu menu menuAtt" style="height: 30px;" onclick="location.href='<%= request.getContextPath() %>/selectNoticeList.sc'">
					<span style="float:left">공지사항</span><span style="float: right;">></span>
				</div>
			</div>
		</div>
		<!-- 게시판 -->
		<div class="container-inner inner board">
			<div class="inb" id="board" style="width:700px;">
				<!-- 중앙 게시판 -->
				<div id="serviceMainImg" onclick="location.href='<%= request.getContextPath() %>/selectList.sc'">
					<img src="/MasterPiece/images/cus_intro_pic.jpg">
				</div>
				<br>
				<form action="<%= request.getContextPath() %>/insertExchange.af" method="post">
				<div>
					<table style="width:700px; border:1px solid lightgray;">
						<thead style="background:#F5F5F5;">
							<tr>
								<th colspan="2" style="height:45px; padding-left:10px; font-size:small;">회원정보</th>
							</tr>
						</thead>
						<tbody>
							<input type="hidden" name="userId" value="<%= loginUser.getUserId() %>">
							<tr style="border:1px solid lightgray;">
								<td style="border:1px solid lightgray; height:45px; text-align:left; padding-left:10px; width:70px; font-size:small;">이름</td>
								<td style="padding-left:10px; font-size:small;"><%= loginUser.getUserName() %></td>
							</tr>
							<tr style="border:1px solid lightgray">
								<td style="border:1px solid lightgray; height:45px; padding-left:10px; font-size:small;">연락처</td>
								<td style="padding-left:10px; font-size:small;"><%= loginUser.getPhone() %></td>
							</tr>
							<tr style="border:1px solid lightgray">
								<td style="border:1px solid lightgray; height:45px; padding-left:10px; font-size:small;">이메일</td>
								<td style="padding-left:10px; font-size:small;"><%= loginUser.getEmail() %></td>
							</tr>
						</tbody>
					</table>
				</div>
				<br>
				<div>
					<table style="width:700px; border:1px solid lightgray;">
						<thead style="background:#F5F5F5;">
							<tr>
								<th colspan="2" style="height:45px; padding-left:10px; font-size:small;">상품선택</th>
							</tr>
						</thead>
						<tbody>
							<tr style="border:1px solid lightgray;">
								<td colspan="2" style="border:1px solid lightgray; text-align:left; padding-left:10px; font-size:small;">
									<input type="button" id="callBuyList" name="callBuyList" class="pointer" style="background:royalblue; width:80px; height:30px; text-align:center; color:white; border:1px solid royalblue;" value="상품검색">
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<div id="productListArea" style="font-size:small; padding-left:10px;"></div>
									<textarea id="hiddenArea" style="display:none;" name="prdCode"></textarea>
								</td>
							</tr>
							<tr>
								<td style="border:1px solid lightgray; width:100px; height:45px; font-size:small; padding-left:10px;">신청 사유</td>
								<td>
									<select name="reason" style="height:25px; margin-left:15px;">
										<option value="120">교환</option>
										<option value="130">반품</option>
										<option value="140">AS</option>
									</select>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<br>
				<div>
					<table style="width:700px; border:1px solid lightgray;">
						<thead style="background:#F5F5F5;">
							<tr>
								<th colspan="2" style="height:45px; padding-left:10px; font-size:small;">내용</th>
							</tr>
						</thead>
						<tbody>
							<tr style="border:1px solid lightgray;">
								<td colspan="2" style="border:1px solid lightgray; height:100px; text-align:left; padding-left:10px; font-size:small;">
									<textarea name="boardContent" style="width:98%; height:100px; resize:none;"></textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<br>
				<div>
					<table style="width:700px; border:1px solid lightgray;">
						<thead style="background:#F5F5F5;">
							<tr>
								<th colspan="2" style="height:45px; padding-left:10px; font-size:small;">접수 방법</th>
							</tr>
						</thead>
						<tbody>
							<tr style="border:1px solid lightgray;">
								<td style="border:1px solid lightgray; width:100px; height:50px; text-align:left; padding-left:10px; font-size:small;">
									선택
								</td>
								<td style="padding-left:10px;">
									<input type="radio" name="howToRegister" id="self" value="직접 발송">
									<label for="self" style="font-size:small;">직접 발송</label>&nbsp;&nbsp;
									<input type="radio" name="howToRegister" id="apply" value="택배 수거신청">
									<label for="apply" style="font-size:small;">택배 수거신청</label>&nbsp;&nbsp;
									<input type="radio" name="howToRegister" id="visit" value="방문">
									<label for="visit" style="font-size:small;">방문</label>
								</td>
							</tr>
							<tr>
								<td style="border:1px solid lightgray; width:100px; height:50px; text-align:left; padding-left:10px; font-size:small;">
									반송정보
								</td>
								<td style="padding-left:10px;">
									<input type="text" name="trackingNumber" id="trackingNumber" size="40" placeholder="운송장번호 - 없이 입력" style="font-size:small;">
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<br>
				<div>
					<table style="width:700px; border:1px solid lightgray;">
						<thead style="background:#F5F5F5;">
							<tr>
								<th colspan="2" style="height:45px; padding-left:10px; font-size:small;">환불 계좌정보</th>
							</tr>
						</thead>
						<tbody>
							<tr style="border:1px solid lightgray;">
								<td style="border:1px solid lightgray; width:100px; height:50px; text-align:left; padding-left:10px; font-size:small;">
									은행명
								</td>
								<td style="padding-left:10px; font-size:small;">
									<select name="bank">
											<option value="국민은행">국민은행</option>
											<option value="기업은행">기업은행</option>
											<option value="우리은행">우리은행</option>
											<option value="신한은행">신한은행</option>
											<option value="하나은행">하나은행</option>
											<option value="농협">농협</option>
											<option value="단위농협">단위농협</option>
											<option value="SC은행">SC은행</option>
											<option value="외환은행">외환은행</option>
											<option value="한국씨티은행">한국씨티은행</option>
											<option value="우체국">우체국</option>
											<option value="경남은행">경남은행</option>
											<option value="광주은행">광주은행</option>
											<option value="대구은행">대구은행</option>
											<option value="도이치">도이치</option>
											<option value="부산은행">부산은행</option>
											<option value="산림조합">산림조합</option>
											<option value="산업은행">산업은행</option>
											<option value="상호저축은행">상호저축은행</option>
											<option value="새마을금고">새마을금고</option>
											<option value="수협">수협</option>
											<option value="신협중앙회">신협중앙회</option>
											<option value="전북은행">전북은행</option>
											<option value="제주은행">제주은행</option>
											<option value="케이뱅크">케이뱅크</option>
											<option value="BOA">BOA</option>
											<option value="HSBC">HSBC</option>
											<option value="JP모간">JP모간</option>
											<option value="비엔피파리바은행">비엔피파리바은행</option>
											<option value="카카오뱅크">카카오뱅크</option>
											<option value="교보증권">교보증권</option>
											<option value="대신증권">대신증권</option>
											<option value="대우증권">대우증권</option>
											<option value="동부증권">동부증권</option>
											<option value="동양증권">동양증권</option>
											<option value="메리츠증권">메리츠증권</option>
											<option value="미래에셋">미래에셋</option>
											<option value="부국증권">부국증권</option>
											<option value="삼성증권">삼성증권</option>
											<option value="솔로몬투자증권">솔로몬투자증권</option>
											<option value="신영증권">신영증권</option>
											<option value="신한금융투자">신한금융투자</option>
											<option value="우리투자증권">우리투자증권</option>
											<option value="유진투자증권">유진투자증권</option>
											<option value="이트레이드증권">이트레이드증권</option>
											<option value="키움증권">키움증권</option>
											<option value="하나대투">하나대투</option>
											<option value="하이투자">하이투자</option>
											<option value="한국투자">한국투자</option>
											<option value="한화증권">한화증권</option>
											<option value="현대증권">현대증권</option>
											<option value="HMC증권">HMC증권</option>
											<option value="LIG투자증권">LIG투자증권</option>
											<option value="NH증권">NH증권</option>
											<option value="SK증권">SK증권</option>
									</select>
								</td>
							</tr>
							<tr>
								<td style="border:1px solid lightgray; width:100px; height:50px; text-align:left; padding-left:10px; font-size:small;">
									계좌번호
								</td>
								<td style="padding-left:10px; font-size:small">
									<input type="text" name="bankNum" id="accountNumber" size="30">
								</td>
							</tr>
							<tr>
								<td style="border:1px solid lightgray; width:100px; height:50px; text-align:left; padding-left:10px; font-size:small;">
									예금주명
								</td>
								<td style="padding-left:10px; font-size:small;">
									<input type="text" name="bankUserName" id="accountNumber" size="30">
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<br>
				<div align="center">
					<input type="button" class="pointer" style="background:white; width:80px; height:35px; text-align:center; display:inline-block; border:1px solid royalblue;" value="취소">
					<input type="submit" class="pointer" style="background:royalblue; width:80px; height:35px; text-align:center; display:inline-block; border:1px solid royalblue; color:white;" value="접수">
				</div>
				</form>
			</div>
		</div>
	</div>
	<br><br><br>
	<%@ include file="../common/footer.jsp" %>
	
	<script>
		$(function()
		{
			var prdList = null;
			
			$("#callBuyList").click(function()
			{
				var url = "<%= request.getContextPath() %>/callBuyList.po?userId=" + "<%= loginUser.getUserId() %>";
				
				console.log(url);
				
				prdList = window.open(url, "search", "width=540, height=740, toolbar=no, location=no, status=no, menubar=no, resizable=no");
				
				console.log(prdList);
			});
		});
	</script>
</body>
</html>