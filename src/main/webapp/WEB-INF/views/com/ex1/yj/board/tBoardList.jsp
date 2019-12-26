<%@page import="org.springframework.context.annotation.Import"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>tBoardList</title>
<script type="text/javascript" src="/yj/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#main').click(function(){
			$(location).attr('href', '/yj');
		});
		$('#login').click(function(){
			$(location).attr('href', '/yj/member/login.yj');
		});
		$('#logout').click(function(){
			$(location).attr('href', '/yj/member/logout.yj');
		});
		$('#tBoardForm').click(function(){
			$(location).attr('href', '/yj/board/tBoardForm.yj');
		});
	});
</script>
</head>
<body>
	<div align="center">
		<h3>
			게시판 리스트
		</h3>
	</div>
	<c:if test="${empty SID}">
		<div align="center">
			<input type="button" id="main" value="메인으로">
			<input type="button" id="login" value="로그인">
			<input type="button" id="tBoardForm" value="글 작성">
		</div>
	</c:if>
	<c:if test="${not empty SID}">
		<div align="center">
			<input type="button" id="main" value="메인으로">
			<input type="button" id="logout" value="로그아웃">
			<input type="button" id="tBoardForm" value="글 작성">
		</div>
	</c:if>
	<div>
	</div>
	
	

</body>
</html>