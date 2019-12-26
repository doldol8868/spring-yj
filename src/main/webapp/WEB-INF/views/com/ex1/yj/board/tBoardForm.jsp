<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>tBoard</title>
<script type="text/javascript" src="/yj/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#cancle').click(function(){
			$(location).attr('href', '/yj/board/tBoardList.yj');
		});
	});
</script>

</head>
<body>
	<div align="center">
		<form method="POST" action="/yj/board/tBoardAction.yj">
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
</body>
</html>