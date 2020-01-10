<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join</title>
</head>
<script language="javascript" src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<style>
	.font-red {
		color: red;
	}
	.font-blue {
		color: blue;
	}
</style>
<script>
	var ck = 0;
	var getCheckId= RegExp(/^[a-zA-Z0-9]{4,12}$/);
	var getCheckPw= RegExp(/^[a-zA-Z0-9]{4,8}$/);
	var getCheckName= RegExp(/^[가-힣a-zA-Z]{1,14}$/);
	var getCheckMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	
	function ckFunc(data){	// 중복확인 하면 이 함수로 ck의 값을 바꿈
		ck = data;
	}
	
	$('#main').click(function(){
		$(location).attr('href', '/yj/main.yj');
	});
	
	$(document).ready(function(){
		
		$('#m_id').change(function(){
			ck = 0;
			$('#idCheckInfo').html("중복확인을 해주세요. " + ck);
		})
		$('#idCheck').click(function(){
			var sid = $('#m_id').val();
			
			if(sid == ''){
				$('#idCheckInfo').toggleClass('font-red');
				$('#idCheckInfo').html("아이디를 입력해주세요.");
				
				return false;
			}
			
			$.ajax({
				url : "idCheck.yj",
				type : "post",
				dataType: "text",
				data : {
					"m_id" : sid
				},
				
				success : function(data){
					var ck = data;
					if(ck == 1){
						// 이미 회원가입 한 사람이 있는 경우
						$('#idCheckInfo').attr('class', '');
						$('#idCheckInfo').toggleClass('font-red');
						$('#idCheckInfo').html("이미 가입된 아이디입니다.")
					} else {
						// 아직 해당 아이디로 회원가입한 사람이 없는 경우
						// 따라서 사용할 수 있는 아이디
						$('#idCheckInfo').attr('class', '');
						$('#idCheckInfo').toggleClass('font-blue');
						ckFunc(true);
						$('#idCheckInfo').html("사용할 수 있는 아이디 입니다. " + ck);
					}
				},
				error : function(){
					alert('### 통신 에러 ###');
				}
			});
		});
	})
	function inputCheck(){
		
		// 아이디 공백 확인
		if($("#m_id").val() == "") {
			alert("아이디를 입력해주세요.");
			$("#m_id").focus();
			return false;
		}
		
		// 아이디 유효성 검사
		if(!getCheckId.test($("#m_id").val())){
			alert("아이디 형식에 맞게 입력해주세요.");
			$("#m_id").focus();
			return false;
		}
		
		// 아이디 중복확인 검사
		if(ck != true){
			alert("아이디 중복확인을 해주세요.");
			return false;
		}
		
		// 비밀번호 공백 확인
		if($("#m_pw").val() == "") {
			alert("비밀번호를 입력해주세요.");
			$("#m_pw").focus();
			return false;
		}
		
		// 비밀번호 유효성 검사
		if(!getCheckPw.test($("#m_pw").val())){
			alert("비밀번호 형식에 맞게 입력해주세요.");
			$("#m_pw").focus();
			return false;
		}
		
		// 아이디와 비밀번호가 같은지 확인
		if ($("#m_id").val()==($("#m_pw").val())) {
			alert("아이디와 비밀번호는 같게 할 수 없습니다.");
			$("#m_pw").focus();
			return false;
		}
		
		// 비밀번호와 비밀번호 확인이 같은지 확인
		if ($("#m_pw").val()!=($("#m_pw_conf").val())) {
			alert("비밀번호란과 비밀번호 확인란의 입력 사항이 다릅니다.");
			$("#m_pw").focus();
			return false;
		}
		
		// 이름 입력 확인
		if($("#m_name").val() == "") {
			alert("이름을 입력해주세요.");
			$("#m_name").focus();
			return false;
		}
		
		// 이름 유효성 검사
		if(!getCheckName.test($("#m_name").val())){
			alert("이름 형식에 맞게 입력해주세요.");
			$("#m_name").focus();
			return false;
		}
		
		// 이메일 입력 확인
		if($("#m_mail").val() == "") {
			alert("이메일을 입력해주세요.");
			$("#m_mail").focus();
			return false;
		}
		
		// 이메일 유효성 검사
		if(!getCheckMail.test($("#m_mail").val())){
			alert("이메일 형식에 맞게 입력해주세요.");
			$("#m_mail").focus();
			return false;
		}
		
		// 전화번호 입력 확인
		if($("#m_tel").val() == "") {
			alert("전화번호를 입력해주세요.");
			$("#m_tel").focus();
			return false;
		}
		
		form.submit();
	}
</script>
<body>
	<div align="center">
		<form method="POST" action="/yj/member/joinProc.yj" onsubmit="return inputCheck()">
			<label for="m_id">아이디</label>
			<input name="m_id" type="text" id="m_id">
			<input type="button" id="idCheck" value="중복확인">
			<p id="idCheckInfo"></p>
			
			<label for="m_pw">비밀번호</label>
			<input name="m_pw" type="password" id="m_pw">
			<label for="m_pw_conf">비밀번호 확인</label>
			<input name="m_pw_conf" type="password" id="m_pw_conf">
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
			<input type="submit" id="joinSubmit" value="제출">
			<input type="button" id="main" value="메인으로">
		</form>
	</div>
</body>
</html>