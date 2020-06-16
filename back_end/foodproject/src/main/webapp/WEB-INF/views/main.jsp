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
<html lang="EUC-KR">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<script type="text/javascript" src="/jquery/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/jquery/jquery-ui.js"></script>
<script type="text/javascript" src="/jquery/jquery.cookie.js"></script>
<link rel="stylesheet" type="text/css" href="/jquery/jquery-ui.css" />
<title>main.jsp</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">

</head>

<body>
	<jsp:include page="nav.jsp"></jsp:include>

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">
			상품 <small>정보</small>
		</h1>

		<div class="breadcrumb">
			<form action="searchBy.do" method="get" class="banner2_input"
				id="_searchForm">
				<input type="hidden" name="page" value="1" />
				<select name="items1"	id="_items1"	style="padding-left: 10px; border: none; background-color: #faff9e; width: 100px; height: 26px;">
					<option value="name" selected>상품명</option>
					<option value="maker">제조사</option>
					<option value="matarial">원재료</option>
				</select> <input type="text" onkeyup="JavaScript:foodSearch()"	name="sinfo" id="_sinfo" style="margin-left: 7px; margin-top: 15px; border: none; background-color: #faff9e; width: 200px; height: 26px;" />
			</form>
		</div>
		<!-- Content Row -->
		<div class="row" id = "foodList">
			<c:forEach items="${foodselectall}" var="m">
				<div class="col-lg-4 mb-4">
					<div class="card h-100">
						<h3 class="card-header">${m.name}</h3>
						<div class="card-body">
							<div class="display-4">
								<img src="${m.img}" width="150" height="150">
							</div>
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">${m.maker}</li>
							<li class="list-group-item">${m.allergy}</li>
							<li class="list-group-item">
								<a href="fooddetail.do?code=${m.code}" class="btn btn-primary">제품상세</a> 
								<a href="#" class="btn btn-primary" id="_addmyeat${m.code}" onclick="javascript:addmyfood(${m.code})">제품 섭취</a>
							</li>
						</ul>
					</div>
				</div>
			</c:forEach> 
			
			<c:if test="${not empty food }">
				<div class="col-lg-6">
				<img class="img-fluid rounded mb-4\" src='img/${food.name}.jpg'
				width='700' height='400'>
				</div>
				<div class="col-lg-6">
				<h2>${food.name}</h2><h2> 클릭횟수 : ${food.count}</h2>
				<p class="card-text">${food.material}</p>
				</div>
				<div>
				<div id="allergy">알레르기 : ${food.allergy}</div>
				<br>
				경고 : 
				<c:forEach items = "${warnMaterials}" var="e">
					${e} 
				</c:forEach>
				</div>
				
				<br>
				<br>
				<br>
				<div style="display: none">
				<div id=carbo>${food.carbo}</div>
				<div id=protein>${food.protein}</div>
				<div id="fat">${food.fat}</div>
				<div id="sugar">${food.sugar}</div>
				<div id="natrium">${food.natrium}</div>
				<div id="chole">${food.chole}</div>
				<div id="fattyacid">${food.fattyacid}</div>
				<div id="transfat">${food.transfat}</div>
				</div>
				
				<div id="piechart"></div>
				<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
				<script type="text/javascript">
				// Load google charts
				google.charts.load('current', {'packages':['corechart']});
				google.charts.setOnLoadCallback(drawChart);
				
				// Draw the chart and set the chart values
				function drawChart() {
				var temp
				console.log(document.getElementById("carbo").innerHTML);
				var data = google.visualization.arrayToDataTable([
				['영양', '영양표'],
				['탄수화물', parseFloat($("#carbo").text())],
				['단백질', parseFloat($("#protein").text())],
				['지방', parseFloat($("#fat").text())],
				['당류', parseFloat($("#sugar").text())],
				['나트륨', parseFloat($("#natrium").text())],
				['콜레스테롤', parseFloat($("#chole").text())],
				['포화지방산', parseFloat($("#fattyacid").text())],
				['트렌스지방', parseFloat($("#transfat").text())]
				]);
				
				
				// Optional; add a title and set the width and height of the chart
				var options = {'title':'영양소', 'width':550, 'height':400};
				
				// Display the chart inside the <div> element with id="piechart"
				var chart = new google.visualization.PieChart(document.getElementById('piechart'));
				chart.draw(data, options);
				
				//paging num
				
				};
				
				$(".addBtn").click(function(){
				var code = $(this).attr("id");
				var URL="./MainServlet?action=eatAdd&food_code="+code;
				$.ajax({
				url: URL,
				method: "GET"
				});
				});
				
				</script>
			</c:if>

		</div>
			
			
	</div>


		<!-- Pagination -->
			<ul class="pagination justify-content-center" id ="pagin">
				<c:if test="${page_size ne null }">
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Previous"> <span aria-hidden="true">«</span> <span
						class="sr-only">Previous</span>
				</a></li>
	
				<c:forEach var="i" begin="1" end="${page_size}">
					<li class="page-item"><a class="page-link"
						href="allFoods.do?page=${i}">${i}</a></li>
	
				</c:forEach>
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Next"> <span aria-hidden="true">»</span> <span
						class="sr-only">Next</span>
				</a></li>
				
				</c:if> 
			</ul>
		<!-- /.row -->

	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright © Your Website
				2019</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->

	<!-- JavaScript -->

	<script type="text/javascript">
		function fooddetail(id) {
			location.href = "./Foodcontrol?action=foodselectbycode&fcode=" + id;
		}
		function addmyfood(id) {
			var foodId = id;
			var userId = $("#_userAddId").val();
			alert(userId);
			$.ajax({
				url : "myeat?action=addFood",
				async: true,
				method : "POST",
				data : {
				"foodId" : foodId,
				"userId" : userId
				},
				success : function (msg) {
					alert(msg);
					if(msg != ""){
					alert("식품추가 성공!");
					$("#_addmyeat"+id).css( "background-color", "green" );
					}
					else{
					alert("이미 추가된 식품입니다!");
					}
				}
			})
		}
		
		function foodSearch() {
			var select = $('#_items1 option:selected').val();
			var keyWord = $('#_sinfo').val();
			$.ajax({
				type : "POST",
				url : "searchByAsync.do",
				data : {"page" : 1 , "sinfo" : keyWord , "items1" : select},
				dataType : "json",
				success: function(data){
					var result = "";
					data.foods.forEach(function(element, index, array){
						console.log(element);
						result +="<div class='col-lg-4 mb-4'><div class='card h-100'><h3 class='card-header'>"+element.name+"</h3><div class='card-body'>";
						result +="<div class='display-4'><img src='"+element.img+"' width='150' height='150'></div></div>";
						result +="<ul class='list-group list-group-flush'><li class='list-group-item'>"+element.maker+"</li>";
						result +="<li class='list-group-item'>"+element.allergy+"</li><li class='list-group-item'><a href='fooddetail.do?code="+element.code+"' class='btn btn-primary'>제품상세 </a> ";
						result +="<a href='#' class='btn btn-primary' id='_addmyeat"+element.code+"' onclick='javascript:addmyfood("+element.code+")'>제품 섭취</a></li></ul></div></div>";
					});
					var cell = document.getElementById("foodList");
					while(cell.hasChildNodes()){
						cell.removeChild(cell.firstChild);
					}
					cell.innerHTML = result;
					
					cell = document.getElementById("pagin");
					while(cell.hasChildNodes()){
						cell.removeChild(cell.firstChild);
					}
					result ="<li class='page-item'><a class='page-link' href='#' aria-label='Previous'> <span aria-hidden='true'>«</span> <span class='sr-only'>Previous</span></a></li>";
					for (var i = 1; i <=data.pageSize; i++) {
						result+="<li class='page-item'><a class='page-link' href='allFoods.do?page="+i+"'>"+i+"</a></li>";
					}
					result +="<li class='page-item'><a class='page-link' href='#' aria-label='Next'> <span aria-hidden='true'>»</span> <span class='sr-only'>Next</span></a></li>";

					cell.innerHTML = result;
				}
			});
			
			
		}
</script>

</body>

</html>