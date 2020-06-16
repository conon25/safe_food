<%@page import="com.ssafy.foodproject.model.Food"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="functions"
	uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>main_list</title>
 	<script type="text/javascript" src="/jquery/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="/jquery/jquery-ui.js"></script>
	<script type="text/javascript" src="/jquery/jquery.cookie.js"></script>
	<link rel="stylesheet" type="text/css" href="/jquery/jquery-ui.css" />
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
       


<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" media="screen,print"	href="css/login.css" />
<link href="css/main.css" rel="stylesheet" type="text/css" media="all">
<link href="css/fonts.css" rel="stylesheet" type="text/css" media="all">
</head>
<body>

	<div id="header-wrapper">

		<div id="header" class="container">
			<div id="logo">
				<a href="index.jsp"><img src="picture/ssafy.png" height="75"
					width="100" alt="오류"></a>
			</div>

			<div id="menu">
				<ul>
					<li class="m1"><a href="boardList.jsp" accesskey="1" title="">공지사항</a></li>
					<li class="m1"><a href="./Foodcontrol?action=foodselectall&page=1" accesskey="2"
						title="">상품 정보</a></li>
					<li class="m1"><a href="" accesskey="3" title="">베스트 섭취 정보</a></li>
					<li class="m1"><a href="./myeat
            " accesskey="4" title="">내 섭취 정보</a></li>
					<li class="m1"><a href="" accesskey="5" title="">예상 섭취 정보</a></li>
				</ul>
			</div>

		</div>

	</div>

	<div id="banner">
		<div class="container">
			<div class="title">
				<img src="picture/main.png" width="500" height="250" alt="오류">
				<h2>WHAT WE PROVIDE</h2>
				<p>건강한 삶을 위한 먹거리 프로젝트</p>
			</div>

		</div>
	</div>

	<%
		Object foodobjes = request.getAttribute("foods");
		List<Food> foods = null;
		if (foodobjes != null) {
			foods = (List<Food>) foodobjes;
		}
	%>
<style>
table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  text-align: left;
  padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
  background-color: #4CAF50;
  color: white;
}
</style>

	<table class="list_table" style="width: 85%;">
		<colgroup>
			<col style="width: 70px;" />
			<col style="width: auto;" />
			<col style="width: 100px;" />
		</colgroup>
		<tr>
			<th>code</th>
			<th>img</th>
			<th>name</th>
			<th>supportpereat</th>
			<th>calory</th>
			<th>carbo</th>
			<th>protein</th>
			<th>fat</th>
			<th>sugar</th>
			<th>natrium</th>
			<th>chole</th>
			<th>fattyacid</th>
			<th>transfat</th>
			<th>maker</th>
			<th>material</th>
			<th>allergy</th>

		</tr>
		<%
			if (foodobjes == null || foods.size() == 0) {
		%>
		<tr>
			<td colspan="3">목록이 없습니다.</td>
		</tr>
		<%
			} else {
				for (Food m : foods) {
		%>
		<tr>
			<td><%=m.getCode()%></td>
			<td><img src="<%=m.getImg()%>" width="150" height="150"></td>
			<td><%=m.getName()%></td>
			<td><%=m.getSupportpereat()%></td>
			<td><%=m.getCalory()%></td>
			<td><%=m.getCarbo()%></td>
			<td><%=m.getProtein()%></td>
			<td><%=m.getFat()%></td>
			<td><%=m.getSugar()%></td>
			<td><%=m.getNatrium()%></td>
			<td><%=m.getChole()%></td>
			<td><%=m.getFattyacid()%></td>
			<td><%=m.getTransfat()%></td>
			<td><%=m.getMaker()%></td>
			<td><%=m.getMaterial()%></td>
			<td><%=m.getAllergy()%></td>
		</tr>
		<%
			}
			}
		%>
	</table>
	
<div id="piechart" style="width: 900px; height: 500px;"></div>
	
<div>

<script type="text/javascript">
google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
    	  <%
			for (Food m : foods) {
	%>
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['supportpereat',    <%=m.getSupportpereat()%>],
          ['calory',      <%=m.getCalory()%>],
          ['carbo',  <%=m.getCarbo()%>],
          ['protein', <%=m.getProtein()%>],
          ['fat',    <%=m.getFat()%>],
          ['sugar', <%=m.getSugar()%>],
          ['natrium', <%=m.getNatrium()%>],
          ['chole', <%=m.getChole()%>],
          ['fattyacid', <%=m.getFattyacid()%>],
          ['transfat', <%=m.getTransfat()%>]
        ]);
<%}%>
        var options = {
          title: '상세영양정보'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
      </script>
</div>

</body>
</html>