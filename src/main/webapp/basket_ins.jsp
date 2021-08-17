<%@page import="DTO.BasketDTO"%>
<%@page import="DAO.BasketDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
///user_id, product_no, product_name, qty, price 값 가져오기
String user_id = (String)session.getAttribute("memberId");
String Product_no = request.getParameter("Product_no");
String Product_name = request.getParameter("Product_name");
String Qty = request.getParameter("Qty");
String Price = request.getParameter("Price");
System.out.print(user_id + "@@@@@@@" );
int Product_no2 = Integer.parseInt(Product_no);
int Qty2 = Integer.parseInt(Qty);
int Price2 = Integer.parseInt(Price);

//basket_no를 dto에 넣어서 dao에 delete2를 실행
BasketDTO dto = new BasketDTO();
dto.setUser_id(user_id);
dto.setProduct_no(Product_no2);
dto.setProduct_name(Product_name);
dto.setQty(Qty2);
dto.setPrice(Price2);


BasketDAO dao = new BasketDAO();
int result = dao.create(dto); 
out.println("<script> alert('장바구니에 추가되었습니다.'); location.href='basket_read.jsp'; </script>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니_담기</title>
<link rel="stylesheet" href="css/out.css?12">
</head>
<body>

</body>
</html>