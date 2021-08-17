<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고물품 등록 페이지</title>
</head>
<body>

<h3>중고물품 등록</h3>

<form action="market_create2.jsp">
<table>
<tr>
<td>아이디 : <input name = "user_id" type ="text"><br></td></tr>
<tr><td>
카테고리 : <select name = "category">
<option value ="디지털기기">디지털기기
<option value ="의류">의류
<option value ="도서">도서
<option value ="주얼리">주얼리
<option value ="가구">가구
</select> <br></td></tr>

<tr><td>제목 : <input name = "title" type ="text"><br></td></tr>
<tr><td>내용 : <input name = "content" type ="text"><br></td></tr>
<tr><td>가격(정수만 입력) : <input name ="price" type="text"><br></td></tr>
<tr><td>사진 : <input name = "image" type ="file"><br></td></tr> 
<tr><td>전화번호 : <input name = "tel" type ="text"><br></td></tr>
<tr><td>제품번호(정수만 입력) : <input name = "product_no" type ="text"><br></td></tr>
<tr><td>제품명 : <input name = "product_name" type ="text"><br></td></tr>
<tr><td>수량(정수만 입력) : <input name = "qty" type ="text"><br></td></tr>
</table>
<button type = "submit">완료(결과페이지로)</button>
</form>
<button onclick="history.back()">뒤로가기</button>
</body>
</html>