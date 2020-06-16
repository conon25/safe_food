<%@page import="com.ssafy.foodproject.model.Food"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />

<!DOCTYPE html>
<html lang="EUC-KR">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  	<script type="text/javascript" src="/jquery/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="/jquery/jquery-ui.js"></script>
	<script type="text/javascript" src="/jquery/jquery.cookie.js"></script>
	<link rel="stylesheet" type="text/css" href="/jquery/jquery-ui.css" />
  <title>MAIN_2</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/modern-business.css" rel="stylesheet">

</head>

<body>

  <!-- Navigation -->
  <jsp:include page="nav.jsp"></jsp:include>

  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">내
      <small>섭취 정보</small>
    </h1>

    <ol class="breadcrumb">
        <form action="searchByName.do" method="get" class="banner2_input" id="_searchForm">
            <select name="items1" id="_items1"
              style="padding-left: 10px; border: none; background-color: #faff9e; width: 100px; height: 26px;">
              <option value="name" selected>상품명</option>
              <option value="maker">제조사</option>
              <option value="code">식품코드</option>
            </select> 
            <input type="text" onkeydown="JavaScript:Enter_Check();" name="sinfo" id="_sinfo" style="margin-left: 7px; margin-top: 15px; border: none; background-color: #faff9e; width: 200px; height: 26px;">
            <input type="button" value="검색 " id="cc" onclick="foodSearch()" class="button" style="width: 50px; margin-left: 7px;">
        </form>
    </ol>

    <% 
      List<Food> foods = (List) request.getAttribute("foods");
      int pagesize = (int) request.getAttribute("page_size");
    %>

    <!-- Content Row -->
    <div class="row">
      <%
        for(int i = 0 ; i < foods.size() ; i++){
          Food m = foods.get(i);
        
      %>
      <div class="col-lg-4 mb-4">
        <div class="card h-100">
          <h3 class="card-header" ><%=m.getName()%></h3>
          <div class="card-body">
            <div class="display-4"><img src="<%=m.getImg()%>" width="150" height="150"></div>
          </div>
          <ul class="list-group list-group-flush">
            <li class="list-group-item"><%=m.getMaker()%></li>
            <li class="list-group-item"><%=m.getAllergy()%></li>
            <li class="list-group-item">
              <a href="#" class="btn btn-primary">제품상세</a>
            </li>
          </ul>
        </div>
      </div>
      <%
      }
      %>
    </div>

    <!-- Pagination -->
    <ul class="pagination justify-content-center">
        <li class="page-item">
          <a class="page-link" href="#" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
            <span class="sr-only">Previous</span>
          </a>
        </li>
        <%for(int i=1;i<=pagesize;i++){ %>
          <li style="display:inline-block;" class="page-item" ><a href="./Foodcontrol?action=foodselectall&page=<%=i%>"><%=i%></a></li>
        <%}%>
        <li class="page-item">
          <a class="page-link" href="#" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
            <span class="sr-only">Next</span>
          </a>
        </li>
      </ul>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>


  <script type="text/javascript">
		function fooddetail(id) {
			location.href = "./Foodcontrol?action=foodselectbycode&fcode=" + id;
		}

		function foodSearch() {
			var select = $('#_items1 option:selected').val();
			var keyword = $('#_sinfo').val();

			$('#_searchForm').submit();

			// 	location.href="./Foodcontrol?action=serchfind&select="+select+"&keyword="+keyword;
		}
	</script>

</body>

</html>
