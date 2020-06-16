<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="functions"
	uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<!-- <!DOCTYPE html> -->
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

</head>
<body>
	<form method="get" action="adminSearch.do">
		<select name="select_option" id="select_option" style="margin: 0px 7px" name="select_option">
			<option value="1" selected="selected">전체</option>
			<option value="2">id</option>
			<option value="3">이름</option>
		</select> <input type="text" name="value" /> <input type="submit">
	</form>
	<div>
		<table class="list_table" style="width: 85%;">
			<colgroup>
				<col style="width: 20%;" />
				<col style="width: 40%;" />
				<col style="width: 20%;" />
				<col style="width: auto;" />
			</colgroup>
			<tr>
				<th>ID</th>
				<th>이름</th>
				<th>이메일</th>
				<th>알러지</th>
				<th>
				<th>
			</tr>

			<c:if test='${empty userList}'>
				<tr>
					<td colspan="4">목록이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach items="${userList}" var="l">
				<tr >
					<td align="center">${l.id}</td>
					<td align="center">${l.name}</td>
					<td align="center">${l.email}</td>
					<td align="center">${l.allergy}</td>
					<td><button class="_delBtn" id="${l.id}">삭제</button></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<button id="_bkbtn">뒤로가기</button>
	</div>
	<script type="text/javascript">
		$("#_bkbtn").click(function() {
			location.href = "/";
		})
		$("._delBtn").click(function() {
			var id = $(this).attr("id");
			location.href = "adminDelete.do?id=" + id;
		});
	</script>
</body>
</html>