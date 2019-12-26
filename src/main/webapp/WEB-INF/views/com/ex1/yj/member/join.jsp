<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join</title>
</head>
<body>
	<div align="center">
		<form method="POST" action="/yj/member/joinProc.yj">
			<label for="m_id">아이디</label>
			<input name="m_id" type="text" id="m_id">
			<br><br>
			
			<label for="m_pw">비밀번호</label>
			<input name="m_pw" type="password" id="m_pw">
			<br><br>
			
			<label for="m_name">이름</label>
			<input name="m_name" type="text" id="m_name">
			<br><br>
			
			<label for="m_mail">이메일</label>
			<input name="m_mail" type="text" id="m_mail">
			<br><br>
			
			<label for="m_tel">전화번호</label>
			<input name="m_tel" type="text" id="m_tel">
			<br><br>
			
			<label for="m_avt">아바타</label>
			<div>
			<input type="radio" name="m_avt" value="11" checked="checked">
			<input type="radio" name="m_avt" value="12">
			<input type="radio" name="m_avt" value="13">
			<input type="radio" name="m_avt" value="14">
			<input type="radio" name="m_avt" value="15">
			<input type="radio" name="m_avt" value="16">
			</div>
			
			<label for="m_gen">성별</label>
			<div>
			<input type="radio" name="m_gen" value="M" checked="checked">
			<input type="radio" name="m_gen" value="F">
			</div>
			<br>
			<br>
			<input type="submit">
		</form>
	</div>
</body>
</html>