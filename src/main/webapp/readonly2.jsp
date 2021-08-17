<%@page import="bbs1.db.BbsDAO2"%>
<%@page import="bbs1.dto.BbsDTO2"%>
<%@page import="bbs1.db.BbsDAO"%>
<%@page import="bbs1.dto.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
/*이전 jsp에서 넘겨받은 parameter를 저장 */
String x = request.getParameter("readnum");
/* String type을 int로 변환 */
int readnum = Integer.parseInt(x);
/* DTO bag에 이전jsp에서 받은 값을 담음 */
BbsDTO bag = new BbsDTO();
bag.setNum(readnum);

/* 전달받은 값을 DB에 전달 */
BbsDAO dao = new BbsDAO();
/* read 메서드를 통해서 DB에서 DTO bag2에 값들 저장 */
BbsDTO bag2 = dao.readOneAccident(bag);
/* 클릭시 조회수를 증가시키기 위한 update 구문을 위한 DTO */

BbsDTO2 bag3 = new BbsDTO2();
/*이전 jsp에서 받은 값을 통해서 변수 및 read를 통해 다른 DTO bag에 있는 값을 새로운 가방 bag3에 저장 */
bag3.setNum(readnum);
bag3.setFav(bag2.getFav());
/* update 구문을 불러오기 위한 메서드 */
BbsDAO2 dao2 = new BbsDAO2();
/* update 메서드 호출을 통해서 update 진행  update구문에 공감 Like 항목 1증가를 시킴*/
dao2.updateALike(bag3);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<h1>동네생활 글읽기</h1>
<body>
	<!-- DTO에 담긴 값들을 각 항목에 맞게 넣음 -->
		게시물 번호 : <input id="in1" type="text" 
		name="Bbsnum" value=<%=readnum%> readonly> 
		<br> 
		제목 : <input type="text" name="title"
			value=<%=bag2.getTitle()%>> <br> 
		날짜 : <input type="date"	name="day" 
		value=<%=bag2.getDay()%> readonly> <br>
		 작성자 :	<input id="userid" type="text"
		  value=<%=bag2.getUser_id()%> readonly>
		<br> 내용 : <br>
		<textarea name="contents" rows="20" cols="60"><%=bag2.getContents()%></textarea><br>
		

	<input type="button" value="공감하기" disabled="disabled">
	<form action="Bbs.jsp">
		<button>뒤로 가기</button>
	</form>
</body>
</html>