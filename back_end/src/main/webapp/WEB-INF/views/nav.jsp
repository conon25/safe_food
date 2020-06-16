<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="functions"
	uri="http://java.sun.com/jsp/jstl/functions"%>

<fmt:requestEncoding value="utf-8" />

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<title>Nav</title>
</head>
<body>
	<!-- Navigation -->
	<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="/">Food Manager</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					
					<c:choose>
						<c:when test="${login.name eq null }">
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#"
								id="navbarDropdownPortfolio" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> 로그인 </a>
								<div class="dropdown-menu dropdown-menu-right"
									aria-labelledby="navbarDropdownPortfolio">
									<form name="frmForm" id="_frmForm" action="login.do"
										method="post" novalidate>
										<div class="control-group form-group">
											<div class="controls">
												<label>아이디:</label> <input type="text" class="form-control"
													id="_userid" name="id" required
													data-validation-required-message="Please enter your ID.">
												<p class="help-block"></p>
											</div>
										</div>
										<div class="control-group form-group">
											<div class="controls">
												<label>비밀번호:</label> <input type="password"
													class="form-control" id="_pwd" name="pwd" required
													data-validation-required-message="Please enter your password.">
											</div>
										</div>
										<div id="success"></div>
										<!-- For success/fail messages -->
										<a class="dropdown-item" id="_btnLogin" href="#none">로그인</a> 
										<a class="dropdown-item" id="_btnRegi" href="goRegister.do">회원가입</a>
										<a class="dropdown-item" id="_btnFindpw" href="./FindpwServlet?action=findpwpage">비밀번호찾기</a>
									</form>
								</div></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a class="nav-link" href="allBoards.do?page=1">공지사항</a></li>
							<li class="nav-item"><a class="nav-link" href="allFoods.do?page=1">상품정보</a></li>
							<li class="nav-item"><a class="nav-link" href="contact.html">베스트 섭취 정보</a></li>
							<li class="nav-item"><a class="nav-link" href="./myeat">내 섭취 정보</a></li>
							<li class="nav-item"><a class="nav-link" href="contact.html">예상 섭취 정보</a></li>
							<c:if test="${login.flag eq 1}">
								<li class="nav-item"><a class="nav-link" href="userList.do">회원 관리</a></li>
							</c:if>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#"
								id="navbarDropdownPortfolio" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> 로그아웃 </a> <input
								type="hidden" value="${login.id}" id="_userAddId" />

								<div class="dropdown-menu dropdown-menu-right"
									aria-labelledby="navbarDropdownPortfolio">
									<form name="frmForm" id="_frmForm" action="logout.do"
										method="GET" novalidate>
										<a class="dropdown-item" id="_btnRegi" href="goRegister.do">정보 조회 및 변경</a>
										<a class="dropdown-item" id="_btnLogout" href="#none">로그아웃</a>
									</form>
								</div></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>

	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
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

				$("#_frmForm").submit();
			}
		});
		//Logout action
		$("#_btnLogout").click(function() {

			$("#_frmForm").submit();

		});
	</script>
</body>
</html>