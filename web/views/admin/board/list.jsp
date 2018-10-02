<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.MasterPiece.product.model.vo.*"
%>
<%
ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<table>
<%for(int i = 0; i < list.size(); i++){ %>
<tr>
<td style="cursor: pointer;"onclick = "collback(<%=list.get(i).getPrd_code()%>,<%=list.get(i).getPrice()%>)"><span class="<%=list.get(i).getPrd_code()%>"><%=list.get(i).getPrd_name()%>    <%=list.get(i).getPrice()%>원</span></td>
</tr>
<%} %>
</table>
<script type="text/javascript">
function collback(code, price){
	var s = $("."+code).html();
	var p = price *1;
	opener.setContent(p);
	opener.document.getElementById("cont").value += (s+"\n");
	this.close();
}
</script>
</body>
</html>