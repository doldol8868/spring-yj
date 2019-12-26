<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MainPage</title>
<script type="text/javascript" src="/yj/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#login').click(function(){
			$(location).attr('href', '/yj/member/login.yj');
		});
		$('#join').click(function(){
			$(location).attr('href', '/yj/member/join.yj');
		});
		$('#logout').click(function(){
			$(location).attr('href', '/yj/member/logout.yj');
		});
		
		$('#tBoardList').click(function(){
			$(location).attr('href', '/yj/board/tBoardList.yj');
		});
	});
</script>
</head>
<body>
	<div align="center">
		<h3>
			Main Page
		</h3>
	</div>
<c:if test="${empty SID}">
	<div align="center">
		<input type="button" id="login" value="로그인">
		<input type="button" id="join" value="회원가입">
		<input type="button" id="tBoardList" value="게시판">
	</div>
</c:if>
<c:if test="${not empty SID}">
	<div align="center">
		<h2>${SID}님 환영합니다.</h2>
		<input type="button" id="logout" value="로그아웃">
		<input type="button" id="tBoardList" value="게시판">
	</div>
</c:if>
</body>
</html>