<%@page import="DTO.BasketDTO"%>
<%@page import="DAO.BasketDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String user_id = (String)session.getAttribute("memberId");

BasketDTO dto = new BasketDTO();
dto.setUser_id(user_id);
BasketDAO dao = new BasketDAO();
int result = dao.delete(dto);
if (result != 0) {
	out.println("<script> alert('전부 삭제했습니다.'); location.href='basket_read.jsp';</script>");
}
else{
	out.println("<script> alert('삭제할 내역이 없습니다.'); location.href='basket_read.jsp';</script>");
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