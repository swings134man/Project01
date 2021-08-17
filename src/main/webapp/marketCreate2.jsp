<%@page import="oksusu.marketDAO"%>
<%@page import="oksusu.marketDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%--			세션값 가져와서 user_id에 저장
	
	<% %>	세션받으면활성화
																		--%>
	
	
	<%	//1. market_ui에서 입력한 값을 가지고 온다.
	String user_id = (String)session.getAttribute("memberId");

String category = request.getParameter("category");
String title = request.getParameter("title");
String content = request.getParameter("content");
int price = Integer.parseInt(request.getParameter("price"));
String image = request.getParameter("image");
String tel = request.getParameter("tel");
int product_no = Integer.parseInt(request.getParameter("product_no"));
String product_name = request.getParameter("product_name");
int qty = Integer.parseInt(request.getParameter("qty"));

//2. dto를 만들어서 1번의 값들을 넣어준다.
marketDTO dto = new marketDTO();

dto.setUser_id(user_id);
dto.setCategory(category);
dto.setTitle(title);
dto.setContent(content);
dto.setPrice(price);
dto.setImage(image);
dto.setTel(tel);
dto.setProduct_no(product_no);
dto.setProduct_name(product_name);
dto.setQty(qty);

//3. marketDAO를 만들어서 create 기능을 처리하라고 메서드 호출
marketDAO dao = new marketDAO();
int result = dao.create(dto);	//0 or 1

//4. 등록완료
out.println("<script>alert('등록되었습니다.');location.href='marketMain.jsp';</script>");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to "OKSUSU MARKET"</title>
<link rel="stylesheet" href="css/out.css">

</head>
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

		<div id="center">마켓 내용 들어가는 곳</div>

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