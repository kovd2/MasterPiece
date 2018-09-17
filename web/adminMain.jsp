<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int depositWait = (int)request.getAttribute("0"); 
int depositComplate = (int)request.getAttribute("1");
int delivery = 4;
int deliveryComplate = 5;
int a = (int)request.getAttribute("2");
int b = (int)request.getAttribute("3");
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
h3{
	margin-top : 5px;
	margin-bottom : 0px;
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
				<td style="width:400px;"><h3>판매 진행</h3></td>
				<td><h3>발주</h3></td>
			</tr>
			<tr>
				<td><table>
						<tr>
							<td align="center"><img alt="" src="./images/sinwooyang/d.png"></td>
							<td align="center"><img alt="" src="./images/sinwooyang/c.png"></td>
							<td align="center"><img alt="" src="./images/sinwooyang/b.png"></td>
							<td align="center"><img alt="" src="./images/sinwooyang/a.png"></td>
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
							<td align="center" style="width:100px" ><img alt="" src="./images/sinwooyang/g.png"></td>
							<td align="center" style="width:100px" ><img alt="" src="./images/sinwooyang/f.png"></td>
							<td align="center" style="width:100px" ><img alt="" src="./images/sinwooyang/e.png"></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td><h3>판매 취소</h3></td>
				<td><h3>고객 문의 현황</h3></td>
			</tr>
			<tr>
				<td><table>
						<tr>
							<td align="center" style="width:100px" ><img alt="" src="./images/sinwooyang/j.png"></td>
							<td align="center" style="width:100px"><img alt="" src="./images/sinwooyang/i.png"></td>
							<td align="center" style="width:100px"><img alt="" src="./images/sinwooyang/h.png"></td>
						</tr>
						<tr>
							<td align="center">3건</td><!-- 주문 취소 요청 -->
							<td align="center"><%=a %>건</td><!-- 반품 요청 -->
							<td align="center"><%=b %>건</td><!-- 교환 요청 -->
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
				<td><h3>공지 사항</h3></td>
				<td><h3>견적</h3></td>
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