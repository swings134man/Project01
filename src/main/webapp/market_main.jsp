<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>market_main</title>
</head>
<body>

<h3>옥수수마켓</h3>
<hr color = "red">

<!-- 검색 -->
<div style = text-align:center>
<form action="market_read_title.jsp">
<input placeholder = "제목을 입력해주세요." name = "title">
<button>검색</button>
</form>
</div>

<a href = "market_read_all.jsp">옥수수마켓 클릭하면</a>

<!-- 등록 -->
<form action="market_create.jsp">
<button>제품등록</button>
</form>

<a href = "market_mypage_test.jsp">마이페이지</a>
</body>
</html>