<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int depositWait = (int)request.getAttribute("0"); 
int depositComplate = (int)request.getAttribute("1");
int delivery = (int)request.getAttribute("2");
int deliveryComplate = (int)request.getAttribute("3");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style type="text/css">

#mt{
	margin-left: 30px;
}

</style>
</head>
<body>
 <jsp:include page="./views/admin/common/menu.jsp">
    <jsp:param name="name" value="1"/>
</jsp:include>
	<div id="main">
		<table align="center" id="mt">
			<tr>
				<td colspan="2"><h1>판매 현황</h1></td>
			</tr>
			<tr>
				<td>판매 진행</td>
				<td>발주</td>
			</tr>
			<tr>
				<td><table>
						<tr>
							<td align="center"><img alt="" src="./images/a.png"></td>
							<td align="center"><img alt="" src="./images/a.png"></td>
							<td align="center"><img alt="" src="./images/a.png"></td>
							<td align="center"><img alt="" src="./images/a.png"></td>
						</tr>
						<tr>
							<td align="center"><%=depositWait%>건</td><!-- 입금대기 -->
							<td align="center"><%=depositComplate%>건</td><!-- 입금완료-->
							<td align="center"><%=delivery%>건</td><!-- 배송중 -->
							<td align="center"><%=deliveryComplate%>건</td><!-- 배송완료 -->
						</tr>
					</table>
				</td>
				<td><table>
						<tr>
							<td align="center"><img alt="" src="./images/a.png"></td>
							<td align="center"><img alt="" src="./images/a.png"></td>
							<td align="center"><img alt="" src="./images/a.png"></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>판매 취소</td>
				<td>고객 문의 현황</td>
			</tr>
			<tr>
				<td><table align="center">
						<tr>
							<td align="center"><img alt="" src="./images/a.png"></td>
							<td align="center"><img alt="" src="./images/a.png"></td>
							<td align="center"><img alt="" src="./images/a.png"></td>
						</tr>
						<tr>
							<td align="center">3건</td><!-- 주문 취소 요청 -->
							<td align="center">3건</td><!-- 반품 요청 -->
							<td align="center">3건</td><!-- 교환 요청 -->
						</tr>
					</table>
				</td>
				<td><table>
						<tr>
							<td align="center">문의 내용</td>
						</tr>
						<tr>
							<td align="center">문의 내용</td>
						</tr>
						<tr>
							<td align="center">문의 내용</td>
						</tr>
						<tr>
							<td align="center">문의 내용</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>공지 사항</td>
				<td>견적</td>
			</tr>
			<tr>
				<td><table>
						<tr>
							<td align="center">문의 내용</td>
						</tr>
						<tr>
							<td align="center">문의 내용</td>
						</tr>
						<tr>
							<td align="center">문의 내용</td>
						</tr>
						<tr>
							<td align="center">문의 내용</td>
						</tr>
					</table>
				</td>
				<td><table>
						<tr>
							<td align="center">문의 내용</td>
						</tr>
						<tr>
							<td align="center">문의 내용</td>
						</tr>
						<tr>
							<td align="center">문의 내용</td>
						</tr>
						<tr>
							<td align="center">문의 내용</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>