<%@page import="oksusupj.OksusuMemberDAO"%>
<%@page import="oksusupj.OksusuMemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

      <h3>회원가입</h3>
      <form action="member.jsp">
        ID: <input name = "memberId"><br>
        PW: <input name = "memberPw"><br>
    	이름: <input name = "memberName"><br>
    	사업자: <label><input type="radio" name="memberBusiness" value="0" checked> 일반이용자 </label>
      		<label><input type="radio" name="memberBusiness" value="1"> 사업자 </label><br>
		주소:	 <input name = "memberAddress"><br>      	
        tel: <input name = "memberTel"><br>
            <button>회원가입</button>
      </form>

</body>
</html>