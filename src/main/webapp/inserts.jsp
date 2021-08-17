<%@page import="bbs1.db.BbsDAO"%>
<%@page import="bbs1.dto.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
// 세션값으로 아이디를 가져옴
String user_id = (String)session.getAttribute("memberId");
System.out.print(user_id);
// 해당 input의 값을 받아서 저장. 목록선택에 따라서 해당 DB에 저장
String lists = request.getParameter("lists");
String day = request.getParameter("day");
String title = request.getParameter("title");
String contents = request.getParameter("contents");

// 해당 값들을 DTO에 넣음
BbsDTO bag = new BbsDTO();
bag.setUser_id(user_id);
bag.setLists(lists);
bag.setTitle(title);
bag.setContents(contents);
bag.setDay(day);

// DAO create로 DB에 val값을 넣음
BbsDAO dao = new BbsDAO();
dao.create(bag);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<h1>동네생활 글쓰기</h1> 
<body>
게시글의 주제를 선택해주세요. <br>
<form action="inserts.jsp">

<!-- val값을 달리하여 DB table을 선택 -->
<select name="lists">
			<option value="A"> 사건사고 관련 글
			<option value="D" > 일상생활 관련 글
			<option value="H"> 취미생활 관련 글 
			<option value="Q"> 질문 관련 글
		</select>
	<br>


		날짜 : 
		<input type="date" name="day"><br>
		제목 : 
		<input type="text" name="title"><br>
	<br>
		내용 : <br>
		<textarea name="contents" rows="20" cols="60">여기에 적으세요.</textarea><br>
		<button>글 올리기</button>
	</form>
	<form action="Bbs.jsp">
					<button>게시판 화면으로 가기</button>
				</form>
</body>
</html>