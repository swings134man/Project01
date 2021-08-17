<%@page import="DTO.BasketDTO"%>
<%@page import="DAO.BasketDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String basket_no =  request.getParameter("basket_no");
int basket_no2 = Integer.parseInt(basket_no);

BasketDTO dto = new BasketDTO();
dto.setBasket_no(basket_no2);
BasketDAO dao = new BasketDAO();
int result = dao.delete2(dto);

out.println("<script> alert('삭제완료'); location.href='basket_read.jsp';</script>");

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니_삭제</title>
<link rel="stylesheet" href="css/out.css?12">
</head>
<body>
	
</body>
</html>