<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String msg = (String)request.getAttribute("msg"); 
String values[] = (String[])request.getAttribute("value");


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 align="center"><%= msg %></h1>
	<%for(int i = 0; i < values.length; i++){ %>
	<h1><%=values[i] %></h1>
	<%} %>
</body>
</html>