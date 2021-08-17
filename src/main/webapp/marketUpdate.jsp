<%@page import="oksusu.marketDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="oksusu.marketDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%--			세션값 가져와서 user_id에 저장
	
	<% S%>	세션받으면활성화
																		--%>
	
	<%
	String user_id = (String)session.getAttribute("memberId");
//1. post_no 클릭했을 때 값을 받아야함
int post_no = Integer.parseInt(request.getParameter("post_no"));

//2. 가방을 만들어서 1번의 값들을 넣어준다.
marketDTO dto = new marketDTO();
dto.setPost_no(post_no);
//3. 게시판DAO를 만들어서 read기능을 처리하라고 메서드 호출
marketDAO dao = new marketDAO();
marketDTO dto2 = dao.read2(dto);
  
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
}
tr {
background-color: lightblue;
color: black;
}
</style>
<body>
	<div id="total"></div>
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
		<h3>물품 수정</h3>
<form action="marketUpdate2.jsp">
<table>
<tr><td>
글번호 : <%=dto2.getPost_no() %>
<input type="hidden" name="post_no" value = "<%=dto2.getPost_no() %>">
</td> </tr>
 <tr><td>아이디 : <%= session.getAttribute("memberId") %> 
					<input name ="user_id" type= "hidden" value = "<%= session.getAttribute("memberId") %>"></td></tr>
			
 			

<tr>
<td>
카테고리 : <select name = "category">
<option value ="디지털기기">디지털기기
<option value ="의류">의류
<option value ="도서">도서
<option value ="주얼리">주얼리
<option value ="가구">가구
</select> <br></td></tr>

<tr><td>제목 : <input name = "title" type ="text"><br></td></tr>
<tr><td>내용 : <input name = "content" type ="text" ><br></td></tr>
<tr><td>가격(정수만 입력) : <input name = "price" type ="text"><br></td></tr>
<tr><td>사진 : <input name = "image" type ="file"><br></td></tr> 
<tr><td>전화번호 : <input name = "tel" type ="text"><br></td></tr>
<tr><td>제품번호(정수만 입력) : <input name = "product_no" type ="text"><br></td></tr>
<tr><td>제품명 : <input name = "product_name" type ="text"><br></td></tr>
<tr><td>수량(정수만 입력) : <input name = "qty" type ="text"><br></td></tr>
</table>
<button type="submit">수정완료</button><br>
</form>
		</div> <br><br><br>

		<div id="footer1"></div>
		
		<div id="footer2">
			<br><br><h2>고객행복센터</h2><h3>1555-1234 (365고객센터 오전 7시 - 오후 7시)</h3>

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