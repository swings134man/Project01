<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@page import="oksusupj.OksusuMemberDAO" %>
	<%@page import="oksusupj.OksusuMemberDTO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>	
	<form action="loginConfirm.jsp" method="post">
ID: <input name="memberId" type="text"><br>
PW: <input name="memberPw" type="password"><br>
<button>login</button>
</form>
</body>
</html>