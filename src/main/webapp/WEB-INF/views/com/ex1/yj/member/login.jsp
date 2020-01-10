<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<script type="text/javascript" src="/yj/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#goToMain').click(function(){
			$(location).attr('href', '/yj/main.yj');
		});
	});
	
	function inputCheck(){
		// 아이디 입력 여부 검사  
		if($('#m_id').val() == "") {
			$('#idCheckInfo').attr('class', "");
			$('#idCheckInfo').toggleClass('info');
			$('#idCheckInfo').html('아이디를 입력하세요.')

		return false;
	}
		
		// 비밀번호 입력 여부 검사
		if($('#m_pw').val() == "") {
			$('#pwCheckInfo').attr('class', "");
			$('#pwCheckInfo').toggleClass('info');
			$('#pwCheckInfo').html('비밀번호를 입력하세요.')
				
			return false;
		}
	}
</script>
<style>
	.submit{
		display: block;
		margin-top: 1em;
	}

	.none{
		display: none;
	}
	.info{
		color: red;
		display: block;
	}
</style>

</head>
<body>
	<div align="center">
		<h3>
			Login Test
		</h3>
	</div>
<c:if test="${not empty isFail}">
	<script type="text/javascript">
		alert("로그인에 실패했습니다. \n아이디 또는 비밀번호를 확인해주세요.")
	</script>
</c:if>
<c:if test="${empty SID}">
	<center>
			<form method="POST" action="/yj/member/loginProc.yj" onsubmit="return inputCheck()">
			<p>ID</p>
			<input type="text" id="m_id" name="m_id">
			<p id="idCheckInfo" class="none"></p>
			<p>PW</p>
			<input type="password" id="m_pw" name="m_pw">
			<p id="pwCheckInfo" class="none"></p>
			<input class="submit" type="submit">
		</form>
	</center>
</c:if>
<c:if test="${not empty SID}">
	<center>
		<br><br><br>
		<h2>${SID}님은 이미 로그인하셨습니다.</h2>
		<input type="button" id="goToMain" value="메인으로">
	</center>
</c:if>
</body>
</html>