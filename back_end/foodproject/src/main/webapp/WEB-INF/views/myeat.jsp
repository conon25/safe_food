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
  <title>MYEAT_jsp</title>

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
        <form action="" method="post" class="banner2_input" id="_searchForm">
            <select name="items1" id="_items1"
              style="padding-left: 10px; border: none; background-color: #B2CCFF; width: 100px; height: 26px;">
              <option value="name" selected>상품명</option>
              <option value="maker">제조사</option>
              <option value="code">식품코드</option>
            </select> 
            <input type="text" onkeydown="JavaScript:Enter_Check();" name="sinfo" id="_sinfo" style="margin-left: 7px; margin-top: 15px; border: none; background-color: #B2CCFF; width: 200px; height: 26px;">
            <input type="button" value="검색 " id="cc" onclick="foodSearch()" class="button" style="width: 50px; margin-left: 7px;">
        </form>
    </ol>

    <% 
      List<Food> foods = (List) request.getAttribute("foods");
      List<Boolean> res = (List) request.getAttribute("res");
    %>

    <!-- Content Row -->
    <div class="row">
      <%
        for(int i = 0 ; i < foods.size() ; i++){
          Food m = foods.get(i);
          boolean b = res.get(i);
        
      %>
      <div class="col-lg-4 mb-4">
        <div class="card h-100">
          <h3 class="card-header" ><%=m.getName()%><%=!b ? "!!" : ""%></h3>
          <div class="card-body">
            <div class="display-4"><img src="<%=m.getImg()%>" width="150" height="150"></div>
          </div>
          <ul class="list-group list-group-flush">
            <li class="list-group-item"><%=m.getMaker()%></li>
            <li class="list-group-item"><%=m.getAllergy()%></li>
            <li class="list-group-item">
              <a href="#"	class="btn btn-primary"	onclick="javascript:fooddetail('<%=m.getCode()%>')">제품상세</a>
              <a href="./myeat?action=deleteFood&foodId=<%=m.getCode()%>"	class="btn btn-primary">제품삭제</a>
              
            </li>
          </ul>
        </div>
      </div>
      <%
      }
      %>
    </div>
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
  
  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- JavaScript -->

  <script type="text/javascript">
	  //Login action
	  $("#_btnLogin").click(function() {
					
					if ($("#_userid").val() == "") {
						alert($("#_userid").attr("data-msg") + " 입력해 주십시요!@.");
						$("#_userid").focus();
					} else if ($("#_pwd").val() == "") {
						alert($("#_pwd").attr("data-msg") + " 입력해 주십시요!@.");
						$("#_pwd").focus();
					} else {
	
						$("#_frmForm").attr({ "target":"_self", "action":"./login" }).submit();
					}
	    });
	    //Logout action
	    $("#_btnLogout").click(function() {
					
	    	$("#_frmForm").attr({ "target":"_self", "action":"./logout" }).submit();
	    	
	      });
  
		function fooddetail(id) {
			location.href = "./Foodcontrol?action=foodselectbycode&fcode=" + id;
		}

		function foodSearch() {
			var select = $('#_items1 option:selected').val();
			var keyword = $('#_sinfo').val();

			$('#_searchForm').attr("action", "./Foodcontrol?action=searchfind")
					.submit();

			// 	location.href="./Foodcontrol?action=serchfind&select="+select+"&keyword="+keyword;
		}
		
		function fooddetail(id) {
			location.href = "./Foodcontrol?action=foodselectbycode&fcode=" + id;
		}
	</script>

</body>

</html>
