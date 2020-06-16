<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8");%>
	<a href='./memcontrol?action=myself'>자신의 정보</a> | <!-- url매핑 알리아스(별명) ? actio으로 분기하겠다  -->
	<a href='./Foodcontrol?action=foodselectall'>다보여주기</a> | 
	<a href='./memcontrol?action=books2'>책찾기</a> | 
<hr/>
