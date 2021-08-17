<%@page import="java.util.ArrayList"%>
<%@page import="oksusu.marketDAO"%>
<%@page import="oksusu.marketDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    
 	// 세션 ID를 받는다.
    //<%= session.getAttribute("id")님이 로그인하셨습니다.
    String user_id = request.getParameter("user_id");
    
    //2. 가방을 만들어서 1번의 값들을 넣어준다.
    marketDTO dto = new marketDTO();
    dto.setUser_id(user_id);
    
    //3. 게시판DAO를 만들어서 read기능을 처리하라고 메서드 호출
    marketDAO dao = new marketDAO();
    ArrayList<marketDTO> list = dao.read1(dto);
    
    %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색결과</title>
</head>
<body>

<table border=1>

<tr>
	<th>게시글 번호</th>
	<th>사진</th>
	<th>아이디</th>
	<th>제목</th>
	<th>가격</th>
</tr>

<%
		for(marketDTO dto2 : list){
	
	%>

<tr onclick="location.href='http://localhost:8541/project1plus/market_view.jsp?post_no=<%=dto2.getPost_no()%>'" style="cursor:pointer;">
	<td><%=dto2.getPost_no() %></td>
	<td><%=dto2.getImage() %></td>
	<td><%=dto2.getUser_id() %></td>
 	<td><%=dto2.getTitle() %></td>
 	<td><%=dto2.getPrice() %></td>

</tr>
<%} %>





</table>




</body>
</html>