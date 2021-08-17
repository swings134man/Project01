
<%@page import="java.sql.ResultSet"%>
<%@page import="oksusupj.OksusuMemberDAO"%>
<%@page import="oksusupj.OksusuMemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	    <%
	    	String memberId = request.getParameter("memberId");
	    	String memberPw = request.getParameter("memberPw");
	    	String memberName = request.getParameter("memberName");
	    	String memberBusiness = request.getParameter("memberBusiness");
	    	String memberAddress = request.getParameter("memberAddress");
	    	String memberTel = request.getParameter("memberTel");
	    	
	    	OksusuMemberDTO memberDTO = new OksusuMemberDTO();
	    	memberDTO.setmemberId(memberId);
	    	memberDTO.setmemberPw(memberPw);
	    	memberDTO.setmemberName(memberName);
	    	memberDTO.setmemberBusinees(memberBusiness);
	    	memberDTO.setmemberAddress(memberAddress);
	    	memberDTO.setmemberTel(memberTel);
	    	
	    	OksusuMemberDAO memDAO = new OksusuMemberDAO();

	    	memDAO.create(memberDTO);
	
	    %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>짝짝! 회원가입 성공! </h3>
<h3>로그인 하시겠습니까?</h3>
<a href="login.jsp"><button>로그인</button></a>

</body>
</html>