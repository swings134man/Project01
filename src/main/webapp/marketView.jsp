<%@page import="oksusu.marketDAO"%>
<%@page import="oksusu.marketDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%--			세션값 가져와서 user_id에 저장
	
	<% %>	세션받으면활성화
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
	text-align: left;
}
tr {
background-color: lightblue;
color: black;
width: 60px;
height: 60px;
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
<table>

<tr><td>글번호 : <%=dto2.getPost_no() %><br></td></tr>
<tr><td>ID : <%=dto2.getUser_id()%><br></td>
<tr><td>카테고리 : <%=dto2.getCategory()%><br></td>
<tr><td>제목 : <%=dto2.getTitle()%><br></td>
<tr><td>내용 : <%=dto2.getContent()%><br></td>
<tr><td>가격 : <%=dto2.getPrice()%><br></td>
<tr><td>사진 :
<img style=width:480px; height=480px; src="img/<%=dto2.getImage()%>"><br></td>
<tr><td>휴대폰번호 : <%=dto2.getTel()%><br></td>
<tr><td>제품번호 : <%=dto2.getProduct_no()%><br></td>
<tr><td>제품명 : <%=dto2.getProduct_name()%><br></td>
<tr><td>수량 : <%=dto2.getQty()%><br></td></tr>
</table>
<button onclick="history.back()">뒤로가기</button>
<button onclick="location.href='marketDelete.jsp?post_no=<%= dto2.getPost_no() %>&user_id=<%=dto2.getUser_id() %>'">삭제하기</button>
<input type="button" value="연락하기" onclick="alert('판매자 전화번호: <%= dto2.getTel() %>');"></input>
<button onclick="location.href='http://localhost:8541/project1plus/marketUpdate.jsp?post_no=<%=dto2.getPost_no()%>'">수정하기</button>
<!-- <button onclick="location.href = 'delivAdd.jsp?post_no=<%= dto2.getPost_no() %>&product_name=<%=dto2.getProduct_name()%>&qty=<%=dto2.getQty()%>&price=<%=dto2.getPrice()%>'">바로 결제</button> -->
<script>
function inform() {
      var url = "payInform.jsp?post_no=<%= dto2.getPost_no() %>&product_name=<%=dto2.getProduct_name()%>&qty=<%=dto2.getQty()%>&price=<%=dto2.getPrice()%>";
      var name = "popup inform";
      var option = "width = 490, height = 550, top = 400, location = no"
      window.open(url, name, option);
   }
</script>
<button onclick="inform()" >바로결제</button>
<button onclick="location.href='basket_ins.jsp?Product_no=<%=dto2.getProduct_no()%>&Product_name=<%=dto2.getProduct_name()%>&Qty=<%=dto2.getQty()%>&Price=<%=dto2.getPrice()%>'">장바구니</button>
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