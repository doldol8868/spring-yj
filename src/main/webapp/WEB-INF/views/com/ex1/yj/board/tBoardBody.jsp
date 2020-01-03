<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>tBoard Content</title>
<style>

</style>
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
			$(location).attr('href', '/yj/member/memberList.yj');
		});
	});
</script>
<style>
	.bodyContainer {
		width: 800px;
		margin: 0 auto;
	}
	.bodyHead {
		text-align: center;
		background-color: yellow;
		
	}
	.center{
		text-align: center;
	}
	.bodyCont{
		text-align: left;
		margin: 10px;
	}
	.border{
		border: 1px solid black;
	} 
	
	.bodyContent {
		
	}
</style>
</head>
<body>
	<div align="center">
		<h3>
			Board Content
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
		<div align="center" class="bodyContainer">
			<div class="bodyHead"><h4>제목</h4></div>
			<div class="bodyContent center"><h4>${CONT.tbtitle}</h4></div>
			<div class="bodyHead"><h4>작성자</h4></div>
			<div class="bodyContent center"><h4>${CONT.tbid}</h4></div>
			
			<div class="bodyHead"><h4>작성일</h4></div>
			<div class="bodyContent center"><h4>${CONT.sdate}</h4></div>
			
			<div class="bodyHead"><h4>내용</h4></div>
			<div class="bodyContent border"><h4 class="bodyCont">${CONT.tbbody}</h4></div>
		</div>
	</c:if>

</body>
</html>