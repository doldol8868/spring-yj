<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member List222</title>
<script type="text/javascript" src="/yj/js/jquery-3.4.1.min.js"></script>
<style>
	.memberListContainer{
		width: 750px;
		margin-top: 30px;
		margin: 0 auto;
		
	}
	.memberListHead{
		background-color: yellow;
		border: 1px solid black;
		width: 100%;
		padding-top: 3px;
		padding-bottom: 3px;
		margin-top: 6px; 
		margin-bottom: 6px;
		display: grid;
		grid-template-columns: 1fr 2fr 2fr 2fr 2fr;
	}
	.memberNo{
		width: 100%;
		border-right: 1px solid black;
	}
	.memberId{
		width: 100%;
		border-right: 1px solid black;
	}
	.memberName{
		width: 100%;
		border-right: 1px solid black;
	}
	.memberTel{
		width: 100%;
		border-right: 1px solid black;
	}
	.memberDate{
		width: 100%;
		
	}

	.memberList{
		border: 1px solid black;
		width: 100%;
		padding-top: 3px;
		padding-bottom: 3px;
		margin-top: 6px; 
		margin-bottom: 6px;
		display: grid;
		grid-template-columns: 1fr 2fr 2fr 2fr 2fr;
	}
</style>
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
		
		$('#info').click(function(){
			$(location).attr('href', '/yj/member/memberInfo.yj');
		});
		
	});
</script>
</head>
<body>
	<div align="center">
		<h3>
			회원 리스트
		</h3>
		<h3>
			2222222222222222
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
		<div align="center" class="memberListContainer">
			<div class="memberListHead">
				<span class="memberNo"><strong>No</strong></span>
				<span class="memberId"><strong>ID</strong></span>
				<span class="memberName"><strong>이름</strong></span>
				<span class="memberTel"><strong>전화번호</strong></span>
				<span class="memberDate"><strong>가입일</strong></span>
			</div>
			<c:forEach var="m_data" items="${LIST}">
				<div class="memberList">
					<span class="memberNo">${m_data.m_no}</span>
					<span class="memberId">${m_data.m_id}</span>
					<span class="memberName">${m_data.m_name}</span>
					<span class="memberTel">${m_data.m_tel}</span>
					<span class="memberDate">${m_data.m_join}</span>
				</div>
			</c:forEach>
			<input type="button" id="main" value="메인으로">
			<input type="button" id="logout" value="로그아웃">
			<input type="button" id="info" value="내 정보 조회">
		</div>
	</c:if>

</body>
</html>