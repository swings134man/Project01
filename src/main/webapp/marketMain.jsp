<%@page import="oksusu.marketDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="oksusu.marketDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%
       marketDAO dao = new marketDAO();
    ArrayList<marketDTO> list = dao.read();   //ArrayList<marketDTO>
       
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to "OKSUSU MARKET"</title>
<link rel="stylesheet" href="css/out2.css?1">

</head>
<style>
#center{
   width: 1500px;
   height: 1000px;
   position: relative;
   top: 220px;
   left: 250px;
}
#center1{
   width: 1000px;
   height: 50px;
   position: relative;
   top: 10px;
   left: 0px;
   font-size: 25px;
}
input{
   width: 300px;
   height: 30px;
}
#b1{
   width: 70px;
   height: 30px;
   font-size: 15px;

}
#center2{
   width: 500px;
   height: 50px;
   position: absolute;
   top: 0px;
   left: 1000px;
   font-size: 25px;
}
#center3{/* 테이블부분 */
   width: 1500px;
   height: 900px;
   position: relative;
   top: 10px;
   left: 0px;
}

table {
   border: 1;
   width: 1500px;
   height: 800px;
   background-color: yellow;
   text-align: center;
}
tr {
background-color: lightblue;
color: black;
width: 60px;
height: 60px;
}
</style>
<body>
   <div id="total"></div>
      <div id="top">
         <jsp:include page="top/top.jsp"></jsp:include><!--html고정되는부분 연결 코드-->
      </div>
      <div id="top2">
         <jsp:include page="top/top2.jsp"></jsp:include>
      </div>
      <div id="top3">
         <jsp:include page="top/top3.jsp"></jsp:include>
      </div>
      <div id="top4">
         <jsp:include page="top/top4.jsp"></jsp:include>
      </div>
      <div id="top5"></div>

      <div id="center" >
<!-- 제목으로 검색 -->
<div id="center1">
<div style = text-align:center>
<form action="marketSearch.jsp" >
<input placeholder = "제목을 입력해주세요." name = "title"></input>
<button id="b1">검색</button>
</form>
</div>
<div id="center2">

<form action="marketCreate.jsp">
<button style="float: right; width: 100; height:30px; margin-left: 10px; margin-top: 5px;">제품등록</button>
</form>
<form action="marketMypage.jsp">
<button style="float: right; width: 150; height:30px; margin-top: 5px;">내가 작성한 글</button>
</form>
</div>
<!-- 전체글목록 -->
<div id="center3">
<table>
<tr>
   <th>글번호</th>
   <th>사진</th>
   <th>아이디</th>
   <th>제목</th>
   <th>가격</th>
</tr>

<%
   for(marketDTO dto : list){

%>
<tr onclick="location.href='http://localhost:8541/project1plus/marketView.jsp?post_no=<%=dto.getPost_no()%>'" style="cursor:pointer;">
   <td><%=dto.getPost_no() %></td>

   <td><img style=width:300px; height=200px; src="img/<%= dto.getImage() %>" ></td>

   <td><%=dto.getUser_id() %></td>
   
   <td><%=dto.getTitle() %></td>
   
   <td><%=dto.getPrice() %></td>
</tr>
<%} %>
</table>
</div>
      </div>

      <div id="footer1"></div>
      <div id="footer2">
         <h2>고객행복센터</h2><h3>1555-1234 (365고객센터 오전 7시 - 오후 7시)</h3>
      </div>
      <div id="footer3">
         법인명 (상호) : 주식회사 옥수수 <span class="bar">I</span> 사업자등록번호 : 111-88-12345<br>
         통신판매업 : 제 2021-서울종로-0000 호 <span class="bar">I</span> 개인정보보호책임자 : 홍길동
         <br> 주소 : 서울특별시 종로구 옥수수밭 1, 1층(옥수수동) <span class="bar">I</span>
         대표이사 : 더조은 <br> 팩스: 070 - 1234 - 0728 <span class="bar">I</span>
         이메일 : <a href="mailto:2554mj@gmail.com">help@oksusu.com</a> <em
            class="copy">© OKSUSU CORP. ALL RIGHTS RESERVED</em>
      </div>
   
</body>
</html>