
<%@page import="java.sql.ResultSet"%>
<%@page import="oksusupj.OksusuMemberDAO"%>
<%@page import="oksusupj.OksusuMemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	    <%
	    	String memberId = request.getParameter("memberId");
	    	String memberPw = request.getParameter("memberPw");
	    	String memberName = request.getParameter("memberName");
	       	String memberAddress = request.getParameter("memberAddress");
	    	String memberTel = request.getParameter("memberTel");
	    	
	    	OksusuMemberDTO memberDTO = new OksusuMemberDTO();
	    	memberDTO.setmemberId(memberId);
	    	memberDTO.setmemberPw(memberPw);
	    	memberDTO.setmemberName(memberName);
	    	memberDTO.setmemberAddress(memberAddress);
	    	memberDTO.setmemberTel(memberTel);
	    	
	    	OksusuMemberDAO memDAO = new OksusuMemberDAO();
	    	
       int result = memDAO.update(memberDTO);
       String text = "회원정보 수정 실패했습니다.";
       if(result == 1){
    	   text = "회원정보 수정 성공했습니다. 축하드립니다.";
       }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

function back(){
     alert("<%=text%>");
    location.href="memberUpdate.jsp"
	}
 
 </script>
</head>

<body onload="back()">

</body>
</html>