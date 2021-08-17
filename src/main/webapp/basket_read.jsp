<%@page import="java.text.DecimalFormat"%>
<%@page import="DAO.DeliveryDAO"%>
<%@page import="DTO.DeliveryDTO"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="org.eclipse.jdt.internal.compiler.ast.WhileStatement"%>
<%@page import="DTO.BasketDTO"%>
<%@page import="DAO.BasketDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String user_id = (String)session.getAttribute("memberId");


BasketDAO dao = new BasketDAO();
ArrayList<BasketDTO> list = dao.read(user_id);

DeliveryDAO delDao = new DeliveryDAO();
ArrayList<DeliveryDTO> delList = delDao.read(user_id);

//숫자 세 자리마다 콤마 찍기
DecimalFormat dc = new DecimalFormat("###,###,###");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>옥수수마켓_장바구니</title>
<link rel="stylesheet" href="css/out.css?20">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0518358d739a04cf7e091d4c708fe499&libraries=services"></script>
<script>
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();

    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수
                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {
                        var result = results[0]; //첫번째 결과의 값을 활용
                   }
                });
            }
        }).open();
    } 

    function dAdd() {
   	 dNameValue = document.getElementById("dName").value
		 dTelValue = document.getElementById("dTel").value
		 dAdressValue = document.getElementById("sample5_address").value +" "+ document.getElementById("sample6_address").value;
		 alert(dNameValue +", "+ dTelValue +", "+dAdressValue);	
		 location.href = "delivAdd.jsp?dName="+dNameValue+"&dTel="+dTelValue+"&dAddress="+dAdressValue
	}

</script>

<style type="text/css">
#b1 {
	width: 80px;
	height: 50px;
	border: none;
	background: white;
	font-size: 16px;
	cursor: pointer;
	font-weight: bold;
}

#b2 {
	width: 50px;
	height: 30px;
	border: none;
	background: white;
	font-size: 16px;
	cursor: pointer;
	font-weight: 600;
}

table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	border-bottom: 1px solid #ddd;
	padding: 13px;
}

tr:hover {
	background-color: #f5f5f5;
}

td {
	text-align: center;
	font-size: 23px;
}

#center1 { /* 주문목록테이블영역 */
	width: 1000px;
	height: 800px;
	position: relative;
	top: 0px;
	left: 10px;
}

#center2 { /* 배송지 영역 */
	border: solid;
	border-color: #f5f5f5;
	width: 430px;
	height: 600px;
	position: absolute;
	top: 0px;
	left: 1030px;
}

select { /* 배송지 셀렉트 */
	display: inline;
	width: 400px;
	height: 60px;
	padding: 3px 5px;
	background-color: #f5f5f5;
	border-color: #f5f5f5;
	font-size: 17px;
	font-weight: 900;
	position: absolute;
	top: 75px;
	left: 15px;
}
#tb2 {
	width: 80%;
	position: absolute;
	top: 170px;
	left: 35px;
	
}

#tb2r:hover {
	background: white;
	border-bottom: none;
}


#tb2d {
	text-align: conter;
	font-size: 17px;
	padding: 2px;
	border-bottom: none;
}
#tb2d2 {
	text-align: left;
	font-size: 17px;
	padding: 2px;
	border-bottom: none;
}
.in{
    width: 200px;
	height: 25px;

}


#b3 { /* 배송지추가 버튼 */
	width: 100px;
	height: 30px;
	position: absolute;
	top: 340px;
	left: 150px;
	border: solid;
	border-color: #FFBF00;
	border-radius: 10px;
	background: white;
	font-size: 16px;
	cursor: pointer;
}

#center3 { /* 결제금액 영역 */
	border: #f5f5f5;
	background: #f5f5f5;
	width: 435px;
	height: 300px;
	position: absolute;
	top: 400px;
	left: 1030px;
	text-align: center;
	font-size: 20px;
}

#ol1 {
	font-size: 20px;
	list-style: none;
	text-align: left;
	font-size: 25px;
	line-height: 40px;
}

#ol2 {
	font-size: 20px;
	list-style: none;
	text-align: right;
	font-size: 25px;
	position: absolute;
	top: 0px;
	left: 250px;
	line-height: 40px;
}

#b4 { /* 주문하기버튼 */
	width: 350px;
	height: 70px;
	position: absolute;
	top: 610px;
	left: 1080px;
	border: none;
	border-radius: 10px;
	background: #FFBF00;
	font-size: 25px;
	color: white;
	cursor: pointer;
}
</style>


</head>
<body>
	<div id="top">
		<jsp:include page="top/top.jsp"></jsp:include>
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
	<br>

	<div id="center">
		<br> <br>
		<h1 align="center">장바구니</h1>
		<br> <br>
		<form action="basket_del.jsp">
			<button id="b1">전체삭제</button>
		</form>
		<hr>
		<br> <br>

		<div id="center1">
			<table>
				<tr>
					<td width=48%>물품명</td>
					<td width=18%>수량</td>
					<td width=25%>가격</td>
					<td></td>
				</tr>
				<%
				int sum = 0;
				String result = null;
				for (int i = 0; i < list.size(); i++) {
					
					BasketDTO dto = list.get(i);
					int orderQty = list.get(i).getQty();
					int orderPrice = list.get(i).getPrice();
					sum = sum + (orderQty * orderPrice);

					String price2 = dc.format(dto.getPrice());
					result = list.get(0).getProduct_name();
				%>
				<tr>
					<td><%=dto.getProduct_name()%></td>
					<td><%=dto.getQty()%></td>
					<td><%=price2%></td>
					<td><a href="basket_del2.jsp?basket_no=<%=dto.getBasket_no()%>">
							<button id="b2">X</button>
					</a></td>
				</tr>
				<% }  String result2 =  result + "외 "+ (list.size() - 1) + "건";%>
				
			</table>


			<div id="center2">
				<h2 align="center">배송지</h2>
				
				<select>
					<%
					for (DeliveryDTO dto : delList) {
					%>
					<option value="<%=dto.getDelivery_No()%>">
						<%=dto.getdAddress()%> /
						<%=dto.getdName()%> / <%=dto.getdTel()%>
					</option>
					<%
					}
					%>
				</select>
				<table id="tb2">
				  <tr id="tb2r">
				    <td id="tb2d"><input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"></td>
				    <td id="tb2d2"><input type="text" id="sample5_address" placeholder="주소" class="in"></td></tr>
				  <tr id="tb2r">
				    <td id="tb2d">상세주소</td>
				    <td id="tb2d2"><input class="in" type="text" id="sample6_address" placeholder="건물명/동,호수를 기재해주세요"></td></tr>
				  <tr id="tb2r">
				    <td id="tb2d">성   함</td>
				    <td id="tb2d2"><input class="in" type="text" id="dName" placeholder="배송받으실 분 성함"></td></tr>
				  <tr id="tb2r">
				    <td id="tb2d">전화번호</td>
				    <td id="tb2d2"><input class="in" type="text" id="dTel" placeholder="배송받으실 분 연락처"></td></tr>
                </table>
                <button id="b3" text-align="center" onclick="dAdd()">배송지추가</button>


			</div>

			<div id="center3">
				<ol id="ol1">
					<li>상품금액 :</li>
					<li>배송비 :</li>
					<li>결제예정금액 :</li>
				</ol>
				<%
				String sum2 = dc.format(sum);
				%>
				<ol id="ol2">
					<li><%=sum2%> 원</li>
					<li>3,000 원</li>
					<li>
						<%
						int total = sum + 3000;
						String total2 = dc.format(total);
						%> <%=total2%>원
					</li>
				</ol>
			</div>
			<button id="b4" onclick= "location.href = 'payment.jsp?product_name=<%=result2%>&total=<%=total%>'">주문하기</button>
		</div>
	</div>
	<!-- center end -->

	<div id="footer1"></div>

	<div id="footer2">
		<h2>고객행복센터</h2>
		<h3>1555-1234 (365고객센터 오전 7시 - 오후 7시)</h3>
	</div>
	<div id="footer3">
		법인명 (상호) : 주식회사 옥수수 <span class="bar">I</span> 사업자등록번호 : 111-88-12345<br>
		통신판매업 : 제 2021-서울종로-0000 호 <span class="bar">I</span> 개인정보보호책임자 : 홍길동
		<br> 주소 : 옥수수시 옥수수구 옥수수밭 1, 1층(옥수수동) <span class="bar">I</span>
		대표이사 : 더조은 <br> 팩스: 070 - 1234 - 0728 <span class="bar">I</span>
		이메일 : <a href="mailto:2554mj@gmail.com">help@oksusu.com</a> <em
			class="copy">© OKSUSU CORP. ALL RIGHTS RESERVED</em>
	</div>
</body>
</html>