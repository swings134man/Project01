<%@page import="bbs1.db.BbsDAO2"%>
<%@page import="bbs1.dto.BbsDTO2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
//이전 jsp에서 넘겨받은 parameter를 저장 
String x = request.getParameter("num");
    System.out.print(x);
// String type을 int로 변환 
int readnum = Integer.parseInt(x);
// DTO bag에 이전jsp에서 받은 값을 담음 
BbsDTO2 bag = new BbsDTO2();
bag.setNum(readnum);

//전달받은 값을 DB에 전달 
BbsDAO2 dao = new BbsDAO2();
// delete 메서드를 통해서 해당 게시물 삭제  
dao.deleteAccident(bag);
        %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
//자바스크립트 수정메시지 띄운다음 update사항을 저장하고 이전 페이지로 돌려보냄 
function back() {
     alert('삭제되었습니다.')
     location.href="Bbs.jsp";
    	}
 </script>

 </head>

<body onload="back()">

</body>
</html>