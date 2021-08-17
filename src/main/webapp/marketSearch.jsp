<%@page import="java.util.ArrayList"%>
<%@page import="oksusu.marketDAO"%>
<%@page import="oksusu.marketDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
    
    //1. 게시판에 입력한 값을 가지고 와야함.
    String title = request.getParameter("title");
    
    //2. 가방을 만들어서 1번의 값들을 넣어준다.
    marketDTO dto = new marketDTO();
    dto.setTitle(title);
    
    //3. 게시판DAO를 만들어서 read기능을 처리하라고 메서드 호출
    marketDAO dao = new marketDAO();
    ArrayList<marketDTO> list = dao.read(dto);
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to "OKSUSU MARKET"</title>
<link rel="stylesheet" href="css/out.css">

</head>
<style>
table {
	border: 1;
	width: 1500px;
	height: 800px;
	background-color: yellow;
	text-align: center;
}
tr {
background-color: lightblue;
color: black;
width: 60px;
height: 60px;
}
</style>
<body>
	<div id="total">
		<div id="top">
			<jsp:include page="top/top.jsp"></jsp:include><!--html고정되는부분 연결 코드-->
		</div>
		<div id="top2">
			<jsp:include page="top/top2.jsp"></jsp:include>
		</div>
		<div id="top3">
			<jsp:include page="top/top3.jsp"></jsp:include>
		</div>
		<div id="top4">
			<jsp:include page="top/top4.jsp"></jsp:include>
		</div>
		<div id="top5"></div>

		<div id="center">
<table>


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
<tr onclick="location.href='http://localhost:8541/project1plus/marketView.jsp?post_no=<%=dto2.getPost_no()%>'" style="cursor:pointer;">
	<td><%=dto2.getPost_no() %></td>
	<td><img style=width:300px; height=200px; src="img/<%= dto2.getImage()%>"></td>
	<td><%=dto2.getUser_id() %></td>
 	<td><%=dto2.getTitle() %></td>
 	<td><%=dto2.getPrice() %></td>
</tr>
<%} %>
</table>
</div>

		<div id="footer1"></div>
		
		<div id="footer2">
			<h2>고객행복센터</h2><h3>1555-1234 (365고객센터 오전 7시 - 오후 7시)</h3>

		</div>
		<div id="footer3">
			법인명 (상호) : 주식회사 옥수수 <span class="bar">I</span> 사업자등록번호 : 111-88-12345<br>
			통신판매업 : 제 2021-서울종로-0000 호 <span class="bar">I</span> 개인정보보호책임자 : 홍길동
			<br> 주소 : 서울특별시 종로구 옥수수밭 1, 1층(옥수수동) <span class="bar">I</span>
			대표이사 : 더조은 <br> 팩스: 070 - 1234 - 0728 <span class="bar">I</span>
			이메일 : <a href="mailto:2554mj@gmail.com">help@oksusu.com</a> <em
				class="copy">© OKSUSU CORP. ALL RIGHTS RESERVED</em>
		</div>
	
</body>
</html>