<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>

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

<title>회원 가입</title>

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
			글 <small>작성</small>
		</h1>

		<!-- /.row -->

		<!-- Contact Form -->
		<!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
		<form action="addBoard.do" method="post" id="_ffrmForm" name="frmForm">
			<div class="row">
				<div class="col-lg-8 mb-4">

					<div class="control-group form-group">
						<div class="controls">
							<label>작성자:</label> <input type="text" readonly="readonly"
								value="${login.id}" class="form-control" name="author" id="_id"
								required
								data-validation-required-message="Please enter your name.">


							<p class="help-block"></p>
						</div>
					</div>

					<div class="control-group form-group">
						<div class="controls">
							<label>글제목:</label> <input type="text" name="title" id="_title"
								class="form-control" required
								data-validation-required-message="Please enter your email address.">
						</div>
					</div>

					<div class="control-group form-group">
						<div class="controls">
							<label>글 내용:</label>
							<textarea name="content" id="_content" class="form-control"
								rows="50" cols="80"></textarea>
						</div>
					</div>

					<div id="success"></div>
					<!-- For success/fail messages -->
					<a href="#none" id="_fbtnRegi" class="btn btn-primary" title="등록">등록</a>

				</div>

			</div>
		</form>
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
	
	<!-- Contact form JavaScript -->
	<!-- Do not edit these files! In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
	<script src="js/jqBootstrapValidation.js"></script>
	<script src="js/contact_me.js"></script>

	<script type="text/javascript">
		$("#_fbtnRegi").click(function() {
			if ($("#_id").val() == "") {
				alert($("_id").attr("data-msg") + " 입력해 주십시요.1");
				$("_id").focus();
			} else if ($("#_content").val() == "") {
				alert($("#_content").attr("data-msg") + " 입력해 주십시요.2");
				$("#_content").focus();
			} else if ($("#_title").val() == "") {
				alert($("#_title").attr("data-msg") + " 입력해 주십시요.3");
				$("#_title").focus();
			} else {
				$("#_ffrmForm").submit();
			}
		});
	</script>

</body>

</html>