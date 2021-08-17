<%@page import="bbs1.db.BbsDAO2"%>
<%@page import="bbs1.dto.BbsDTO2"%>
<%@page import="bbs1.db.BbsDAO"%>
<%@page import="bbs1.dto.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
/*이전 jsp에서 넘겨받은 parameter를 저장 */
String contents1 = request.getParameter("contents");
String title1 = request.getParameter("title");
String num1 = request.getParameter("Bbsnum");
int num = Integer.parseInt(num1);

/* 각 변수값을 DTO에 넣음 */
BbsDTO2 bag = new BbsDTO2();
bag.setContents(contents1);
bag.setTitle(title1);
bag.setNum(num);

/* update 내용을 DB에 넣음 */
BbsDAO2 dao = new BbsDAO2();
dao.updateAmodi(bag);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

<%-- 자바스크립트 수정메시지 띄운다음 update사항을 저장하고 이전 페이지로 돌려보냄--%> 
function back(){
     alert("수정되었습니다.");
    location.href="readonly.jsp?num=<%=num%>"
	}
 
 </script>
</head>

<body onload="back()">

</body>
</html>