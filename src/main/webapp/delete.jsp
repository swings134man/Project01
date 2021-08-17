<%@page import="java.sql.ResultSet"%>
<%@page import="oksusupj.OksusuMemberDAO"%>
<%@page import="oksusupj.OksusuMemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    String memberId = request.getParameter("memberId");
	OksusuMemberDTO memberDTO = new OksusuMemberDTO();	
	memberDTO.setmemberId(memberId);
	
	OksusuMemberDAO memDAO = new OksusuMemberDAO();

    	int result = memDAO.delete(memberDTO);
      	String text = "회원 탈퇴 실패했습니다. 올바른 ID를 입력해주세요.";
       	if(result == 1){
    		text = "회원 탈퇴 성공했습니다. 축하드립니다.";
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