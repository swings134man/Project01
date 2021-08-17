<%@page import="java.util.ArrayList"%>
<%@page import="oksusu.marketDAO"%>
<%@page import="oksusu.marketDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	marketDAO dao = new marketDAO();
    ArrayList<marketDTO> list = dao.read();	//ArrayList<marketDTO>
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>market_read_all</title>
</head>
<body>

<table border=1>
<tr bgcolor="yellow">
	<th>게시글번호</th>
	<th>사진</th>
	<th>아이디</th>
	<th>제목</th>
	<th>가격</th>
</tr>

<%
	for(marketDTO dto : list){

%>
<tr bgcolor ="pink" onclick="location.href='http://localhost:8541/project1plus/market_view.jsp?post_no=<%=dto.getPost_no()%>'" style="cursor:pointer;">
	<td><%=dto.getPost_no() %></td>

	<td><%=dto.getImage() %></td>

	<td><%=dto.getUser_id() %></td>
	
	<td><%=dto.getTitle() %></td>
	
	<td><%=dto.getPrice() %></td>
</tr>
<%} %>
</table>

<button onclick="history.back()">Back</button>


</body>
</html>