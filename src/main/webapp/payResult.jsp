<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="DAO.PaymentDAO"%>
<%@page import="DTO.PaymentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String user_id = (String)session.getAttribute("memberId");

PaymentDAO dao = new PaymentDAO();
ArrayList<PaymentDTO> list = dao.read(user_id);
DecimalFormat dc = new DecimalFormat("###,###,###");
%>
<html>
<head>
<meta charset="UTF-8">
<title>옥수수마켓_결제내역</title>
<link rel="stylesheet" href="css/out.css?14">

<style>
table {
	border-collapse: collapse;
	width: 90%;
	top: 0px;
	left: 70px;
	position: relative;
}

th, td {
	text-align: center;
	padding: 8px;
	font-size: 20px;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

button {
	width: 130px;
	height: 60px;
	top: 30px;
	left: 1290px;
	position: relative;
	border: solid;
	border-color: #FFBF00;
	border-radius: 10px;
	background: white;
	font-size: 17px;
	cursor: pointer;
}
</style>
</head>
<body>
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
	<br>
	<div id="center">
		<br> <br>
		<h1><%=user_id%>님의 결제 내역<br>
			<hr>
			<br>
			<table>
				<tr>
					<td width=10%>결제번호</td>
					<td width=50%>상품명</td>
					<td width=15%>가격</td>
				</tr>
				<%
				for (int i = 0; i < list.size(); i++) {
					PaymentDTO dto = list.get(i);
					String price2 = dc.format(dto.getPrice());
				%>
				<tr>
					<td><%=dto.getPayment_no()%></td>
					<td><%=dto.getProduct_name()%></td>
					<td><%=price2%></td>
				</tr>
				<%
				}
				%>
			</table>
			<form action="marketMain.jsp">
				<button>메인으로</button>
			</form>
			<br>
		</h1>
	</div>
	<div id="footer1"></div>

	<div id="footer2">
		<h2>고객행복센터</h2>
		<h3>1555-1234 (365고객센터 오전 7시 - 오후 7시)</h3>

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