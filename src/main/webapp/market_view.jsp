<%@page import="oksusu.marketDTO"%>
<%@page import="oksusu.marketDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

    
<%

//1. post_no 클릭했을 때 값을 받아야함
int post_no = Integer.parseInt(request.getParameter("post_no"));

//2. 가방을 만들어서 1번의 값들을 넣어준다.
marketDTO dto = new marketDTO();
dto.setPost_no(post_no);

//3. 게시판DAO를 만들어서 read기능을 처리하라고 메서드 호출
marketDAO dao = new marketDAO();
marketDTO dto2 = dao.read2(dto);

%>  
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>market_view</title>
</head>
<body>
<table>

<tr><td>글번호 : <%=dto2.getPost_no() %><br></td></tr>
<tr><td>ID : <%=dto2.getUser_id()%><br></td>
<tr><td>카테고리 : <%=dto2.getCategory()%><br></td>
<tr><td>제목 : <%=dto2.getTitle()%><br></td>
<tr><td>내용 : <%=dto2.getContent()%><br></td>
<tr><td>가격 : <%=dto2.getPrice()%><br></td>
<tr><td>사진 :
<img width="200px" height="200px" src="../img/<%=dto2.getImage()%>"><br></td>
<tr><td>휴대폰번호 : <%=dto2.getTel()%><br></td>
<tr><td>제품번호 : <%=dto2.getProduct_no()%><br></td>
<tr><td>제품명 : <%=dto2.getProduct_name()%><br></td>
<tr><td>수량 : <%=dto2.getQty()%><br></td></tr>
</table>
<button onclick="history.back()">뒤로가기</button>
</body>
</html>