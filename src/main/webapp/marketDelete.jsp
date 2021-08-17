<%@page import="oksusu.marketDAO"%>
<%@page import="oksusu.marketDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%--			세션값 가져와서 user_id에 저장
	
	%>	세션받으면활성화
																		--%>
	
	<%
	
	String user_id = (String)session.getAttribute("memberId");
	int post_no = Integer.parseInt(request.getParameter("post_no"));
	/* String user_id ="root";			//세션잡기전 임의값으로 설정 세션받으면 삭제후 대체 */

	//2. 가방을 만들어서 1번의 값들을 넣어준다.
	marketDTO dto = new marketDTO();
	dto.setPost_no(post_no);
	dto.setUser_id(user_id);
	

	//3. 게시판DAO를 만들어서 read기능을 처리하라고 메서드 호출
	marketDAO dao = new marketDAO();
	dao.delete(dto);
	
		out.println("<script>alert('삭제되었습니다.');location.href='marketMain.jsp';</script>");
	%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to "OKSUSU MARKET"</title>
<link rel="stylesheet" href="css/out.css">

</head>
<body>
	
	
	
	
</body>
</html>