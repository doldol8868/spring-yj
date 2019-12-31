<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>tBoardList2</title>
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
		$('#tBoardForm2').click(function(){
			$(location).attr('href', '/yj/board/tBoardForm2.yj');
		});
		$('#tBoardForm3').click(function(){
			$(location).attr('href', '/yj/board/tBoardForm3.yj');
		});
	});
</script>
<style>
	.boardContainer{
		width: 600px;
		margin-top: 30px;
		margin: 0 auto;
		
	}
	.boardListHead{
		border: 1px solid black;
		width: 100%;
		padding-top: 3px;
		padding-bottom: 3px;
		margin-top: 6px; 
		margin-bottom: 6px;
		display: grid;
		grid-template-columns: 1fr 3fr 1fr 1fr;
	}
	.boardNo{
		width: 100%;
		border-right: 1px solid black;
	}
	.boardTitle{
		width: 100%;
		border-right: 1px solid black;
	}
	.boardUserName{
		width: 100%;
		border-right: 1px solid black;
	}
	.boardDate{
		border-right: 1px solid black;
		width: 100%;
		
	}

	.boardList{
		border: 1px solid black;
		width: 100%;
		padding-top: 3px;
		padding-bottom: 3px;
		margin-top: 6px; 
		margin-bottom: 6px;
		display: grid;
		grid-template-columns: 1fr 3fr 1fr 1fr;
	}
</style>
</head>
<body>
	<div align="center">
		<h3>
			게시판 리스트
		</h3>
		<h3>
			333333333333
		</h3>
	</div>
	<c:if test="${empty SID}">
		<div align="center">
			<input type="button" id="main" value="메인으로">
			<input type="button" id="login" value="로그인">
			<input type="button" id="tBoardForm" value="글 작성">
			<input type="button" id="tBoardForm2" value="글 작성2">
			<input type="button" id="tBoardForm3" value="글 작성3">
		</div>
	</c:if>
	<c:if test="${not empty SID}">
		<div align="center">
			<input type="button" id="main" value="메인으로">
			<input type="button"    id="logout" value="로그아웃">
			<input type="button" id="tBoardForm" value="글 작성">
			<input type="button" id="tBoardForm2" value="글 작성2">
			<input type="button" id="tBoardForm3" value="글 작성3">
		</div>
	</c:if>
	<div align="center" class="boardContainer">
		<div class="boardListHead">
			<span class="boardNo">글 번호</span>
			<span class="boardTitle">글 제목</span>
			<span class="boardUserName">작성자</span>
			<span class="boardDate">작성일</span>
		</div>
		<c:forEach var="data" items="${LIST}">
		<div class="boardList">
			<span class="boardNo">${data.tbno}</span>
			<span class="boardTitle">${data.tbtitle}</span>
			<span class="boardUserName">${data.tbid}</span>
			<span class="boardDate">${data.sdate}</span>
		</div>
		</c:forEach>
	</div>

</body>
</html>