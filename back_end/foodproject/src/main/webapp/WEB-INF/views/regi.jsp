<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />

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
<c:choose>
			<c:when test="${login eq null }">
    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">회원
      <small>가입</small>
    </h1>
    
    <!-- /.row -->

    <!-- Contact Form -->
    <!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
    <form action="register.do" method="post" id="_ffrmForm" name="frmForm">
      <div class="row">
        <div class="col-lg-8 mb-4">
          
            <div class="control-group form-group">
              <div class="controls">
                <label>아이디:</label>
                <input type="text" class="form-control" name="sid" id="_fid" required data-validation-required-message="Please enter your name.">
                <a href="#none" id="_btnGetid" title="회원가입"><img src="image/idcheck.png" alt="회원가입" /></a>
								<div id='_rgetid'></div>
                <p class="help-block"></p>
              </div>
            </div>
            <div class="control-group form-group">
                <div class="controls">
                  <input readonly="readonly" type="text" class="form-control" name="id" id="_fuserid" required data-validation-required-message="Please enter your phone number.">
                </div>
              </div>
            <div class="control-group form-group">
              <div class="controls">
                <label>비밀번호:</label>
                <input type="password" name="pw" id="_fpwd" class="form-control" required data-validation-required-message="Please enter your phone number.">
              </div>
            </div>
            <div class="control-group form-group">
              <div class="controls">
                <label>이름:</label>
                <input type="text" name="name" id="_name" class="form-control" required data-validation-required-message="Please enter your email address.">
              </div>
            </div>
            <div class="control-group form-group">
              <div class="controls">
                <label>이메일:</label>
                <input type="email" name="email" id="_email" class="form-control" required data-validation-required-message="Please enter your email address.">
              </div>
            </div>
            <div class="control-group form-group">
              <div class="controls">
                <label>알러지:</label>
                <br>
                <input type="checkbox" name="al_1" value="대두">대두
                <input type="checkbox" name="al_2" value="땅콩">땅콩
                <input type="checkbox" name="al_3" value="우유">우유
                <input type="checkbox" name="al_4" value="게">게
                <input type="checkbox" name="al_5" value="새우">새우
                <input type="checkbox" name="al_6" value="참치">참치
                <input type="checkbox" name="al_7" value="연어">연어
                <input type="checkbox" name="al_8" value="쑥">쑥
                <input type="checkbox" name="al_9" value="소고기">소고기
                <input type="checkbox" name="al_10" value="닭고기">닭고기
                <input type="checkbox" name="al_11" value="돼지고기">돼지고기
                <input type="checkbox" name="al_12" value="복숭아">복숭아
                <input type="checkbox" name="al_13" value="계란흰자">계란흰자
              </div>
            </div>
            

            <div id="success"></div>
            <!-- For success/fail messages -->
            <a href="#none" id="_fbtnRegi" title="회원가입"><img src="image/regi.jpg" alt="회원가입" /></a>
          
        </div>

      </div>
    </form>
    
			</c:when>
			<c:otherwise>
			<h1 class="mt-4 mb-3">
					내 정보 <small>조회 및 변경</small>
				</h1>

				<form action="infoUpdate.do" method="post" id="infoUpdate"
					name="infoUpdate">
					<div class="row">
						<div class="col-lg-8 mb-4">
							<div class="control-group form-group">
								<div class="controls">
									<label>아이디:</label> <input type="text" class="form-control"
										name="sid" id="_fid" readonly="readonly" value="${login.id }"}>
									<div id='_rgetid'></div>
									<p class="help-block"></p>
								</div>
							</div>

							<div class="control-group form-group">
								<div class="controls">
									<label>비밀번호:</label> <input type="password" name="pw" id="_pw"
										class="form-control">
								</div>
							</div>
							<div class="control-group form-group">
								<div class="controls">
									<label>이름:</label> <input type="text" name="name" id="_name"
										class="form-control" value="${login.name }">
								</div>
							</div>
							<div class="control-group form-group">
								<div class="controls">
									<label>이메일:</label> <input type="email" name="email"
										id="_email" class="form-control" value="${login.email }">
								</div>
							</div>
							<div class="control-group form-group">
								<div class="controls">
									<label>알러지 : ${login.allergy}</label> <br> <input
										type="checkbox" name="al_1" value="대두">대두 <input
										type="checkbox" name="al_2" value="땅콩">땅콩 <input
										type="checkbox" name="al_3" value="우유">우유 <input
										type="checkbox" name="al_4" value="게">게 <input
										type="checkbox" name="al_5" value="새우">새우 <input
										type="checkbox" name="al_6" value="참치">참치 <input
										type="checkbox" name="al_7" value="연어">연어 <input
										type="checkbox" name="al_8" value="쑥">쑥 <input
										type="checkbox" name="al_9" value="소고기">소고기 <input
										type="checkbox" name="al_10" value="닭고기">닭고기 <input
										type="checkbox" name="al_11" value="돼지고기">돼지고기 <input
										type="checkbox" name="al_12" value="복숭아">복숭아 <input
										type="checkbox" name="al_13" value="계란흰자">계란흰자
								</div>
							</div>
							<input type="submit" value="변경">
							<input type="button" onclick="location.href='userDelete.do'" value ="탈퇴">

						</div>

					</div>
				</form>
			</c:otherwise>
		</c:choose>
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


  <!-- Contact form JavaScript -->
  <!-- Do not edit these files! In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
  

  <script type="text/javascript">
		$("#_fbtnRegi").click(function() {
			if ($("#_fuserid").val() == "") {
				alert($("#_fuserid").attr("data-msg") + " 입력해 주십시요.1");
				$("#_fuserid").focus();
			} else if ($("#_name").val() == "") {
				alert($("#_name").attr("data-msg") + " 입력해 주십시요.2");
				$("#_name").focus();
			} else if ($("#_email").val() == "") {
				alert($("#_email").attr("data-msg") + " 입력해 주십시요.3");
				$("#_email").focus();
			} else if ($("#_fpwd").val() == "") {
				alert($("#_fpwd").attr("data-msg") + " 입력해 주십시요.4");
				$("#_fpwd").focus();
			} else {
				$("#_ffrmForm").submit();
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
				url : "idCheck.do",
				async : true,
				data : "id=" + id,
				success : function(msg) {
					outputList2(msg);

				}
			});
		};
		function outputList2(msg) {

			if (msg == 'FAIL') {
				$("#_rgetid").html("사용할 수 없는 아이디 입니다.");
				$("#_rgetid").css("background-color", "#FF0000");
				$("#_fuserid").val("");
			} else {
				$("#_rgetid").html("사용할 수 있는 아이디 입니다.");
				$("#_rgetid").css("background-color", "#0000FF");
				var id = $("#_fid").val();
				$("#_fuserid").val(id);

			}

		};
	</script>

</body>

</html>
