<%@page import="oksusu.marketDAO"%>
<%@page import="oksusu.marketDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%	//1. market_ui에서 입력한 값을 가지고 온다.
int post_no = Integer.parseInt(request.getParameter("post_no"));

//2. dto를 만들어서 1번의 값들을 넣어준다.
marketDTO dto = new marketDTO();
dto.setPost_no(post_no);

//3. marketDAO를 만들어서 delete 기능을 처리하라고 메서드 호출
marketDAO dao = new marketDAO();
dao.delete(dto);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>market_delete</title>
</head>
<body>

글번호: <%=post_no %><br>

</body>
</html>