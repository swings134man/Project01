<%@page import="oksusu.marketDAO"%>
<%@page import="oksusu.marketDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%	//1. market_ui에서 입력한 값을 가지고 온다.

String user_id = request.getParameter("user_id");
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
<title>market_create2</title>
</head>
<body>
</body>
</html>