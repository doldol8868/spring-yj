<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Information</title>
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
		$('#list').click(function(){
			$(location).attr('href', '/yj/member/memberList2.yj');
		});
	});
</script>
<style>
	*{box-sizing: border-box;}

	.memberInfoContainer{
		width: 700px;
		margin: 0 auto;
	}
	.memberInfo{
		padding: 4px;
		margin-bottom: 4px;
		display: grid;
		grid-template-columns: 1fr 3fr;
	}
	.box1{
		background-color: yellow;
		border: 1px solid black;
		text-align: center;
	}
	.box2{
		border: 1px solid black;
		text-align: center;
	}
</style>
</head>
<body>
	<div align="center">
		<h3>
			회원 정보 상세보기
		</h3>
	</div>
	<c:if test="${empty SID}">
		<div align="center">
			<h2>
				로그인 후 조회하실 수 있습니다.
			</h2>
			<input type="button" id="login" value="로그인">
		</div>
	</c:if>
	<c:if test="${not empty SID}">
		<div align="center" class="memberInfoContainer">
			<div class="memberInfo">
				<div class="box1"><h3>아이디</h3></div>
				<div class="box2"><h3>${INFO.m_id}</h3></div>
			</div>
			<div class="memberInfo">
				<div class="box1"><h3>이름</h3></div>
				<div class="box2"><h3>${INFO.m_name}</h3></div>
			</div>
			<div class="memberInfo">
				<div class="box1"><h3>이메일</h3></div>
				<div class="box2"><h3>${INFO.m_mail}</h3></div>
			</div>
			<div class="memberInfo">
				<div class="box1"><h3>전화번호</h3></div>
				<div class="box2"><h3>${INFO.m_tel}</h3></div>
			</div>
			<div class="memberInfo">
				<div class="box1"><h3>가입일</h3></div>
				<div class="box2"><h3>${INFO.m_join}</h3></div>
			</div>
			<input type="button" id="main" value="메인으로">
			<input type="button" id="list" value="목록">
		</div>
	</c:if>

</body>
</html>