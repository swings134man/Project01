<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
      <h3>회원수정</h3>
      <form action="update.jsp">
         ID: <input name = "memberId"><br>
         pw: <input name = "memberPw"><br>
   	          이름: <input name = "memberName"><br>
       	  주소: <input name = "memberAddress"><br>
         tel: <input name = "memberTel"><br><br>
            <button>회원수정 처리</button>
      </form>
      <hr>
      <form action="delete.jsp">
         탈퇴하실 ID: <input name = "memberId"><br>
            <button>회원탈퇴</button>
      </form><br>
       <form  action="marketMain.jsp">
            <button style="background : pink;">메인화면</button>
      </form>
</body>
</html>