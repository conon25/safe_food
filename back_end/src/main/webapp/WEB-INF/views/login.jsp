<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html lang="ko">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

 	<script type="text/javascript" src="/jquery/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="/jquery/jquery-ui.js"></script>
	<script type="text/javascript" src="/jquery/jquery.cookie.js"></script>
	<link rel="stylesheet" type="text/css" href="/jquery/jquery-ui.css" />
  <title>로그인</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/modern-business.css" rel="stylesheet">

</head>

<body>

  <!-- nav -->
	<jsp:include page="nav.jsp"></jsp:include>
  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">로
      <small>그인</small>
    </h1>
    
    <!-- /.row -->

    <!-- Contact Form -->
    <!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
    <form name="frmForm" id="_lfrmForm" action="./login" method="post" novalidate>
      <div class="row">
          <div class="col-lg-8 mb-4">
          <div class="control-group form-group">
            <div class="controls">
              <label>아이디:</label>
              <input type="text" class="form-control" id="_luserid" name="id" required data-validation-required-message="Please enter your ID.">
              <p class="help-block"></p>
            </div>
          </div>
          <div class="control-group form-group">
            <div class="controls">
              <label>비밀번호:</label>
              <input type="password" class="form-control" id="_lpwd" name="pwd" required data-validation-required-message="Please enter your password.">
            </div>
          </div>
          <div id="success"></div>
        <!-- For success/fail messages -->
          <a class="dropdown-item" id="_lbtnLogin" href="#none">로그인</a>
          <a class="dropdown-item" id="_btnRegi" href="regi.jsp">회원가입</a>
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
    //Login Form action
    $("#_lbtnLogin").click(function() {
				
				if ($("#_luserid").val() == "") {
					alert($("#_luserid").attr("data-msg") + " 입력해 주십시요!@.");
					$("#_luserid").focus();
				} else if ($("#_lpwd").val() == "") {
					alert($("#_lpwd").attr("data-msg") + " 입력해 주십시요!@.");
					$("#_lpwd").focus();
				} else {

					$("#_lfrmForm").attr({ "target":"_self", "action":"./login" }).submit();
				}
      });
      
		
		$("#_btnGetid").click(function() {

			var _luserid = $("#_luserid").val();

			if (_luserid == '') {
				alert('아이디를 넣으세요');
			} else {
				showallcust3(_luserid);
			}
		});

		
	</script>

</body>

</html>
