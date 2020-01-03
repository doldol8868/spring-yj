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
	
	function loginCheck(){
		// 아이디 입력 여부 검사  
		if(check.m_id != null) {
			if(check.m_id.value == "") {
				alert("아이디를 입력하세요.")
				check.m_id.ficus()
				
				return false;
			}
		}
		// 비밀번호 입력 여부 검사
		if(check.m_pw != null) {
			if(check.m_pw.value == "") {
				alert("패스워드를 입력하세요.")
				check.m_pw.ficus()
				
				return false;
			}
		}
	}
</script>

</head>
<body>
	<div align="center">
		<h3>
			Login Test
		</h3>
	</div>
<c:if test="${empty SID}">
	<center>
			<form method="POST" action="/yj/member/loginProc.yj">
			<p>ID</p>
			<input type="text" id="m_id" name="m_id">
			<p>PW</p>
			<input type="password" id="m_pw" name="m_pw">
			<br>
			<br>
			<input type="submit" onclick="loginCheck()">
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