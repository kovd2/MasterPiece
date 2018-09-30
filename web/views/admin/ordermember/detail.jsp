<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.MasterPiece.product.model.vo.*"%>
    <% 
    ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list"); 
    
    
    
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1" id="main">
<tr>
<th>카테 고리</th>
<th>상품 이름</th>
<th>개수</th>
</tr>
<%for(int i = 0; i < list.size(); i++){ %>
<tr>
<td><%=list.get(i).getCategory() %></td>
<td><%=list.get(i).getPrd_name() %></td>
<td><%=list.get(i).getSell_count() %></td>
<%} %>
</table>

</body>
</html>