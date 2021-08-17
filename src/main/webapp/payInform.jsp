<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DTO.DeliveryDTO"%>
<%@page import="DAO.DeliveryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
  <%    //오리지널 코드
    	String user_id = (String)session.getAttribute("memberId");
    	String product_name = request.getParameter("product_name");
    	String qty = request.getParameter("qty");
    	String price = request.getParameter("price");
    	
    	//테스트용
    	/* String user_id = "test";
     	String product_name = "다리미";
     	String qty = "1";
     	String price = "1000"; */
     	
     	int qty2 = Integer.parseInt(qty);
     	int price2 = Integer.parseInt(price);
     	
     	DecimalFormat dc = new DecimalFormat("###,###,###");
     	int total = qty2 * price2;
     	String total2 = dc.format(total);
     	System.out.print("총액은 "+ total2);
     	
    	
    %>


<!DOCTYPE html>
<style type="text/css">

#b4 {
	width: 350px;
	height: 70px;
	position: absolute;
	top: 420px;
	left: 75px;
	border: none;
	border-radius: 10px;
	background: #FFBF00;
	font-size: 25px;
	color: white;
	cursor: pointer;
}
</style>
<html>
<head>
<meta charset="UTF-8">
<title>옥수수마켓</title>
<link rel="stylesheet" href="css/deliv.css?13">
<style type="text/css">

table {
	border-collapse: collapse;
	width: 90%;
	position: relative;
	top:20px;
}
th, td {
	padding: 13px;
}

td {
	text-align: center;
	font-size: 23px;
}
#td2{
    text-align: left;
	font-size: 23px;
}
div{
    width: 100%;
    text-align: center;
    font-size: 17px;
}

</style>
</head>
<body>
<h2>주문 내역</h2>
<hr>
<table>
   <tr>
	 <td>결제하실 물품은 :</td>  
	 <td id="td2"><%= product_name %></td>
   </tr>
   <tr>
	<td>결제하실 수량은 :</td>  
	<td id="td2"><%= qty %></td>
   </tr>
   <tr>
	<td>결제하실 금액은 :</td>  
	<td id="td2"><%= total2 %></td>
	</tr>
</table>
<br><br>
	<hr>
	<div>결제를 원하시면, 아래의 주문하기 버튼을 클릭해주세요!</div>
	<button id="b4" onclick= "location.href = 'payment.jsp?product_name=<%=product_name%>&total=<%=total%>'">주문하기</button>
</body>
</html>