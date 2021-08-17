<%@page import="DAO.DeliveryDAO"%>
<%@page import="DTO.DeliveryDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String user_id = (String)session.getAttribute("memberId");

    String dName = request.getParameter("dName");
    String dTel = request.getParameter("dTel");
    String dAddress = request.getParameter("dAddress");

DeliveryDTO dto = new DeliveryDTO(); 
dto.setUser_id(user_id);
dto.setdName(dName);
dto.setdTel(dTel);
dto.setdAddress(dAddress);

 DeliveryDAO dao = new DeliveryDAO();
int result = dao.create(dto);
if (result != 0) {
	out.println("<script> alert('배송지가 추가되었습니다.'); location.href='basket_read.jsp';</script>");
}
else{
	out.println("<script> alert('배송지가 추가되지 않았습니다.'); location.href='basket_read.jsp';</script>");
}
%>
<html>
<head>
<meta charset="UTF-8">
<title>옥수수마켓_배송지추가</title>
<link rel="stylesheet" href="css/out.css?12">
</head>
<body>
	
</body>
</html>