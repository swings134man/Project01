<%@page import="oksusupj.OksusuMemberDAO"%>
<%@page import="oksusupj.OksusuMemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String memberId = request.getParameter("memberId");
    	String memberPw = request.getParameter("memberPw");
    	
    	OksusuMemberDTO dto = new OksusuMemberDTO();
    	dto.setmemberId(memberId);
    	
    	OksusuMemberDAO dao = new OksusuMemberDAO();
    	
    	OksusuMemberDTO dto2 = dao.read(dto);
    	String memberBu = dto2.getmemberBusinees();
    	
    	if(memberId.equals(dto2.getmemberId()) && memberPw.equals(dto2.getmemberPw())){
    		session.setAttribute("memberId", memberId);
    		session.setAttribute("tBu", memberBu);
    	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 확인</title>
</head>
<body>

<% if(!memberId.equals(dto2.getmemberId()) || !memberPw.equals(dto2.getmemberPw())) { %>
	회원정보가 일치하지 않습니다. 아이디와 패스워드를 확인해 주세요.<br>
	<a href = "login.jsp"><button>로그인 페이지로</button></a>
	
<% } else if(memberId.equals(dto2.getmemberId()) && memberPw.equals(dto2.getmemberPw())) { %>
	<%=memberId%>회원님 안녕하세요.<br>
	<a href="marketMain.jsp"><button>홈으로</button></a>
<% } %>
</body>
</html>