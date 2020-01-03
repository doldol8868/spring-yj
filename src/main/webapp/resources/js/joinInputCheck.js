	$(function(){
		$('#idCheck').click(function(){
			var sid = $('#m_id').val();
			
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
						$('#idCheckInfo').html("사용할 수 있는 아이디 입니다.")
					}
				},
				error : function(){
					alert('### 통신 에러 ###');
				}
			});
		});
	})
	
	$('#m_id').change(function(){
		$('#idCheckInfo').val('');
		$('#m_id').attr("check_result", "fail");
	})
	
	if($('#m_id').val() == '') {
		alert
	}