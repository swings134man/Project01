<%@page import="java.util.ArrayList"%>
<%@page import="DTO.DeliveryDTO"%>
<%@page import="DAO.DeliveryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>옥수수마켓</title>
<link rel="stylesheet" href="css/deliv.css?13">
<%
String user_id = (String)session.getAttribute("memberId");


DeliveryDAO delDao = new DeliveryDAO();
ArrayList<DeliveryDTO> delList = delDao.read(user_id);
%>
<script>
	function popAdd(){
        var url = "delivAdd";
        var name = "popup add";
        var option = "width = 490, height = 550, top = 400, location = no"
        window.open(url, name, option);
    }
	function popChk(){
		window.close();		
    }
</script>

</head>
<body>
	<div id="top">
		<h1>배송지</h1>
		<hr>
		<ul>
		<li id="li1">선택</li>
		<li id="li2">배송정보</li>
		</ul>
		<br>
		<hr>
	</div>
	<div id="top2">
	<%
	for (DeliveryDTO dto : delList) {
	%>
	<table>
		<tr>
			<td width=10%><input onclick="popChk()" type="checkbox" name="addrNo" value="<%=dto.getdAddress()%>"></td>
			<td width=60%>
				<ol id="ol2">
					<li id="li1"><%=dto.getdAddress()%></li>
					<br>
					<li class="ol" id="li2"><%=dto.getdName()%></li>
					<li class="ol" id="li3"><%=dto.getdTel()%></li>
				</ol>
			</td>
		</tr>
	</table>
	<%
	}
	%>
	</div>
	<div id="top3"><br>
	<a href="delivAdd" id=atop3 onclick="popAdd()">+ 새 배송지 추가</a>
	</div>
</body>
</html>