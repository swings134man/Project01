<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% //스크립트릿 : 자바코드의 일부분
    	String id = request.getParameter("id");//입력값받기
    	String pw = request.getParameter("pw");//입력값받기
    	String id2 = "root";		//db에 있는걸로 가정하고 임의값설정
    	String pw2 = "pass";		//db에 있는걸로 가정하고 임의값설정
    	String result = "로그인 실패";
    	if(id.equals(id2) && pw.equals(pw2)){
    		result = "로그인 성공";
    		//로그인 성공하고 나서, id를 세션으로 잡아주어야 한다.
    		//세션도 내장된 객체로 제공된다.
    		//내장된 객체: 미리 객체를 만들어서 서버에서 제공
    		//HttpSession session = new HttpSession();
    		//---> request, response, session, out, application
    		//자바스크립트의 내장된 객체 : location, window, document,history,console
    		session.setAttribute("id", id);
    	}else{
    		out.print("재로그인해주세요<br>");
    	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
로그인 결과 : <%= result %> <!-- 표현식 -->
<!-- 세션이 잡혀있는지 아닌지 체크하고자 하는 경우 세션이 null인지를 체크하면 된다. -->
<!-- id세션이 잡혀있다라는 것은(null이 아니라는것은) 로그인이 성공했다라는 의미로 해석 -->
<% if(session.getAttribute("id") != null){%>
	세션 id값은 :<%= session.getAttribute("id") %>
<a href = "logout.jsp">로그아웃 처리</a>
<%} %>
</body>
</html>