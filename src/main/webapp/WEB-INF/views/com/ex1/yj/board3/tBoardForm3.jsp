<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>tBoard2</title>
<script type="text/javascript" src="/yj/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#cancle').click(function(){
			$(location).attr('href', '/yj/board/tBoardList3.yj');
		});
		$('#login').click(function(){
			$(location).attr('href', '/yj/member/login.yj');
		});
	});
</script>

</head>
<body>
	<c:if test="${empty SID}">
		<div align="center">
		<h3>로그인을 하셔야 이용하실 수 있습니다.</h3>
		<input type="button" id="login" value="로그인 페이지로">
		</div>
	</c:if>
	
	<c:if test="${not empty SID}">
		<div align="center">
			<form method="POST" action="/yj/board/tBoardAction3.yj">
				<input name="tbid" type="hidden" id="tbid" value="${SID}">
				<label for="title">제목</label>
				<input name="tbtitle" id="title" type="text">
				<br>
				<br>
				<label for="title">본문</label>
				<textarea name="tbbody" id="body" rows="5"></textarea>
				<br>
				<br>
				<div>
				<button type="button" id="cancle">취소</button>
				<button type="submit">제출</button>
				</div>
			</form>
		</div>
	</c:if>
</body>
</html>