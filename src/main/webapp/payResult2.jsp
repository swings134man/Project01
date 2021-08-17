<%@page import="DAO.PaymentDAO"%>
<%@page import="DTO.PaymentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String user_id = (String)session.getAttribute("memberId");
String product_name = request.getParameter("product_name");
String total = request.getParameter("total");
int total2 = Integer.parseInt(total);
/* System.out.println("잘 넘어왔다>>" + product_name);
System.out.println("잘 넘어왔다>>" + total); 
 String user_id = "test";
String product_name = "test외 3건";
int total2 = 3000; 
 */

PaymentDTO dto = new PaymentDTO();
dto.setUser_id(user_id);
dto.setProduct_name(product_name);
dto.setPrice(total2);
PaymentDAO dao = new PaymentDAO();
int result = dao.create(dto);
if (result != 0) {
	out.println("<script> alert('주문감사합니다.'); location.href='payResult.jsp';</script>");
}
else{
	out.println("<script> alert('결제가 완료되지 않았습니다.'); location.href='basket_read.jsp';</script>");
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니_전체삭제</title>
<link rel="stylesheet" href="css/out.css?12">
</head>
<body>
	
</body>
</html>