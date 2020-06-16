	<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

 	<script type="text/javascript" src="/jquery/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="/jquery/jquery-ui.js"></script>
	<script type="text/javascript" src="/jquery/jquery.cookie.js"></script>
	<link rel="stylesheet" type="text/css" href="/jquery/jquery-ui.css" />
  <title>비밀번호 찾기</title>

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
    <h1 class="mt-4 mb-3">비밀번호
      <small>찾기</small>
    </h1>
    
    <!-- /.row -->

    <!-- Contact Form -->
    <!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
    <form action="" method="post" id="_ffrmForm" name="frmForm">
      <div class="row">
        <div class="col-lg-8 mb-4">
          
            <div class="control-group form-group">
              <div class="controls">
                <label>아이디:</label>
                <input type="text" class="form-control" name="sid" id="_fid" required data-validation-required-message="Please enter your name.">
                <a href="#none" id="_btnGetid" title="아이디확인"><img src="image/idcheck.png" alt="아이디확인" /></a>
								<div id='_rgetid'></div>
                <p class="help-block"></p>
              </div>
            </div>

            <div class="control-group form-group">
              <div class="controls">
                <label>이메일:</label>
                <input type="email" name="email" id="_email" class="form-control" required data-validation-required-message="Please enter your email address.">
              </div>
            </div>
            
            

            <div id="success"></div>
            <!-- For success/fail messages -->
            <a href="#none" id="_fbtnRegi" title="비밀번호확인">확인해보기!</a>
          
        </div>

      </div>
    </form>
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

  <!-- Contact form JavaScript -->
  <!-- Do not edit these files! In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
  <script src="js/jqBootstrapValidation.js"></script>
  <script src="js/contact_me.js"></script>

  <script type="text/javascript">
		$("#_fbtnRegi").click(function() {
			if ($("#_fuserid").val() == "") {
				alert($("#_fuserid").attr("data-msg") + " 입력해 주십시요.");
				$("#_fuserid").focus();
			} else if ($("#_email").val() == "") {
				alert($("#_email").attr("data-msg") + " 입력해 주십시요.");
				$("#_email").focus();
			} else {
// 				alert($("#_fid").val());
// 				alert($("#_email").val());
				$("#_ffrmForm").attr({
					"target" : "_self",
					"action" : "./FindpwServlet?action=pwconfirm"
				}).submit();
			}
		});
		$("#_btnGetid").click(function() {

			var _fid = $("#_fid").val();
			if (_fid == '') {
				alert('아이디를 넣으세요');
			} else {
				showallcust3(_fid);
			}
		});
		function showallcust3(id) {
			$.ajax({
				type : "GET",
				url : "./getID",
				async : true,
				data : "id=" + id,
				success : function(msg) {
					outputList2(msg);
				}
			});
		};
		function outputList2(msg) {

			if (msg.message == 'FAIL') {
				$("#_rgetid").html("존재하는 아이디 입니다. 진행해주세요");
				$("#_rgetid").css("background-color", "#77ff59");
				$("#_fuserid").val("");
			} else {
				$("#_rgetid").html("아이디를 확인해주시고 진행해주세요");
				$("#_rgetid").css("background-color", "#FF0000");
				var id = $("#_fid").val();
				$("#_fuserid").val(id);
			}
		};
	</script>

</body>

</html>
