

<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bbs1.dto.BbsDTO"%>
<%@page import="bbs1.db.BbsDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

/*전체 데이텉 베이스 불러오기 */
BbsDAO dao = new BbsDAO();
ArrayList<BbsDTO> accidentlist = dao.read();

/* read로 일부 데이터 불러오기 */
BbsDTO bag = new BbsDTO();
/* 가장 높은 순위의 값 고정 가져오기 */
bag.setFav(1);
BbsDTO rankbag = dao.accidentrank(bag);
/* 변수 a 에 높은 순위의 값(공감개수) 저장*/

BbsDTO bag1 = new BbsDTO();
bag1.setFav(1);
BbsDTO rankbag1 = dao.dailyrank(bag1);

BbsDTO bag2 = new BbsDTO();
bag2.setFav(1);
BbsDTO rankbag2 = dao.hobbyrank(bag2);

BbsDTO bag3 = new BbsDTO();
bag3.setFav(1);
BbsDTO rankbag3 = dao.questionrank(bag3);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/BbsOut.css">
</head>
<body>

	<section>
		<section id="total">

			<section id="top">
				<ul id="top_lists">
					<li class="top_list"><a class="top_list_text"
						href="question.jsp">질문</a></li>
					<li class="top_list"><a class="top_list_text" href="daily.jsp">일상</a></li>
					<li class="top_list"><a class="top_list_text" href="hobby.jsp">취미</a></li>
					<li class="top_list"><a class="top_list_text"
						href="accident.jsp?" style="color: red;">사건사고</a></li>
				</ul>

				<section id="center">
				    <!-- 전체 리스트를 반복문으로 불러온 후 해당 개수만 불러옴 -->
					<!-- 리스트의 주소로 연결 / 해당 목록의 num을 파라메터로 넘김 -->
					<ul id="center_lists">
					<li class="center_list_3">번호</li>
							<li class="center_list_4">제목</li>
						<%for (int i = 0; i < 4; i++) {
							BbsDTO dto = accidentlist.get(i); %>
						<li class="center_list_1"><a class="center_list_1_text"
							href="readonly.jsp?num=<%=dto.getNum()%>"> <%=(i + 1) %>
						</a></li>
						<li class="center_list_2"><a class="center_list_2_text"
							href="readonly.jsp?num=<%=dto.getNum()%>"><%=dto.getTitle()%></a></li>
						<li class="center_list_3">공감<%=dto.getLike()%></li>
						<li class="center_list_4">조회수<%=dto.getFav()%></li>
						<% } %>	</ul>

				</section>
				<form action="contents.jsp">
					<button>글 작성하기</button>
				</form>
				<hr>
				<form action="marketMain.jsp">
					<button>메인 화면으로 가기</button>
				</form>
				<hr>

				<!-- 조회수가 높은 목록 불러오기, 각 탭별 1위 랭크 -->
				<h3 style="color: blue; font-size: 40px;">인기 글 제목</h3>
				<section id="bottom">
					<ul id="bottom_lists">
						<li class="bottom_list"><a class="bottom_list_text"
							href="readonly.jsp?num=<%=rankbag.getNum()%>"><%=rankbag.getTitle()%></a></li>
						<li class="bottom_list"><a class="bottom_list_text"
							href="readonlyD.jsp?num=<%=rankbag1.getNum()%>"><%=rankbag1.getTitle()%></a></li>
						<li class="bottom_list"><a class="bottom_list_text"
							href="readonlyH.jsp?num=<%=rankbag2.getNum()%>"><%=rankbag2.getTitle()%></a></li>
						<li class="bottom_list"><a class="bottom_list_text"
							href="readonlyQ.jsp?num=<%=rankbag3.getNum()%>"><%=rankbag3.getTitle()%></a></li>
					</ul>




				</section>

			</section>
		</section>

	</section>

</body>
</html>