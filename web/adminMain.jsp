<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int depositWait = (int)request.getAttribute("0"); 
int depositComplate = (int)request.getAttribute("1");
int delivery = 4;
int deliveryComplate = 5;
int a = (int)request.getAttribute("2");
int b = (int)request.getAttribute("3");
HashMap<String, String[]> hmap = (HashMap<String, String[]>)request.getAttribute("hmap"); 
String[] str1 = hmap.get("a");
String[] str2 = hmap.get("b");
String[] str3 = hmap.get("c");
int count = (int)request.getAttribute("count");

int cnt = (int)request.getAttribute("cnt");
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
				<td><h3>회원 현황</h3></td>
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
							<td>방문자 수 : <%=cnt%></td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;신규 가입자 : <%=count%></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td><h3 style="display: inline;">판매 취소</h3></td>
				<td><h3 style="display: inline;">고객 문의 현황</h3><a style="margin-left:111px;" href="<%=request.getContextPath()%>/question.swy">더보기</a></td>
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
				<%for(int i = 0; i < 4; i++){ %>
						<tr>
							<td><%=str2[i] %></td>
						</tr>
				<%} %>
					</table>
				</td>
			</tr>
			<tr>
				<td><h3 style="display: inline;">공지 사항</h3><a style="margin-left:200px;" href="<%=request.getContextPath()%>/selectBoard.swy">더보기</a></td>
				<td><h3 style="display: inline;">견적</h3><a style="margin-left:200px;" href="<%=request.getContextPath()%>/selectBoard.swy?a=1">더보기</a></td>
			</tr>
			<tr>
				<td><table>
				<%for(int i = 0; i < 4; i++){ %>
						<tr>
							<td><%=str1[i] %></td>
						</tr>
				<%} %>
					</table>
				</td>
				<td><table>
				<%for(int i = 0; i < 4; i++){ %>
						<tr>
							<td><%=str3[i] %></td>
						</tr>
				<%} %>
					</table>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>