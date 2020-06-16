<%@page import="com.ssafy.foodproject.model.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="functions"
	uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html lang="en">

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

<title>공지사항</title>

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
		<h1 class="mt-4 mb-3">
			공지 <small>사항</small>
		</h1>
		<c:if test="${login.flag eq 1 }">
		<a href="addBoardForm.do" class="btn btn-primary">글작성 →</a> <br>
		</c:if>
		<div class="row">

			<!-- Blog Entries Column -->
			<div class="col-md-8">
				<c:forEach var="b" items="${boardList}" varStatus="status">

					<div class="card mb-4">
						<img class="card-img-top" src="http://placehold.it/750x300"
							alt="Card image cap">
						<div class="card-body">
							<h2 class="card-title">${b.title}</h2>
							<p class="card-text">${b.content}</p>
							<a href="boardDetail.do?num=${b.num}" class="btn btn-primary">상세보기
								→</a>
						</div>
						<div class="card-footer text-muted">
							${b.author} <a href="#">Start Bootstrap</a>
						</div>
					</div>

				</c:forEach>

				<!-- Blog Post -->

				<!-- Pagination -->
				<ul class="pagination justify-content-center">
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">«</span> <span
							class="sr-only">Previous</span>
					</a></li>


					<c:forEach var="i" begin="1" end="${page_size}">
						<li class="page-item"><a class="page-link"
							href="allBoards.do?page=${i}">${i}</a></li>

					</c:forEach>
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next"> <span aria-hidden="true">»</span> <span
							class="sr-only">Next</span>
					</a></li>
				</ul>

			</div>

			<!-- Sidebar Widgets Column -->
			
		</div>
		<!-- /.row -->

	</div>
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

	

</body>

</html>