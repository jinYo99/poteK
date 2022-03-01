<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
<link rel="stylesheet" href="/resources/css/member/join.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
	
<script>
	
</script>
</head>
<body>

	<div class="wrapper">
		<form id="join_form" method="post">
		
			<div class="wrap">
				<div class="subjecet">
					<span>회원가입</span>
				</div>

				<div>
					<p>이름</p>
					<input type="text" name="username" id="username" class="idinput">
				</div>

				<div>
					<p>아이디</p><small class="small">(영문자 또는 영문자/숫자 5~15)</small>
					<input type="text" name="userid" id="userid">
					<span class="check-o" id="idy">사용 가능한 아이디입니다.</span>
					<span class="check-n" id="idd">중복된 아이디입니다.</span>
					<span class="check-n" id="idcn">사용 불가능한 아이디입니다.</span>
				</div>
				
				<div>
					<p>비밀번호</p><small class="small">(영문자/숫자/특수문자(!@#$%^&*~ 중 8~20자)</small>
					<input type="password" name="userpw" id="userpw">
					<span class="check-n" id="pwcn">비밀번호 양식에 맞게 작성해주세요.</span>
				</div>

				<div>
					<p>비밀번호 확인</p>
					<input type="password" name="usercpw" id="usercpw">
					<span class="check-o" id="pwy">비밀번호가 일치합니다.</span>
					<span class="check-n" id="pwn">비밀번호가 일치하지 않습니다.</span>
				</div>

				<div>
					<p>이메일</p>
					<input type="text" name="useremail" id="useremail">
					<span class="check-n" id="emn">이메일 양식에 맞게 작성해주세요.</span>
				</div>
				
				<div>
					<button id="btnjoin" name="btnjoin" value="가입하기">가입하기</button>
				</div>
				
				
			</div>
		</form>
	</div>

	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<script>
	
	var idCheck = false; // 아이디 양식/중복에 사용
	
	$(document).ready(function() {
		// 회원가입 버튼
		$("#btnjoin").click(function() {
			
			function check() {
				var f = document.Reg_form;
				
				if(f.userid.value == "") {
					alert("아이디를 입력해주세요.");
					f.userid.focus();
					return false;
				}
			}
			
			$("#join_form").attr("action", "/member/join");
			$("#join_form").submit();
		});
	});
		
		// 아이디 양식 검사
		var idReg = /^(?=.*[a-z])[a-z0-9]{5,15}$/i;
		$("#userid").change(function() {
			var userid = $(this).val();
			
			if (userid != '') {
				if (!idReg.test(userid)) {
					alert("아이디는 영문자 혹은 영문자와 숫자로 이루어진 5~15자여야 합니다.");
					$("#idy").css("display", "none");
					$("#idd").css("display", "none");
					$("#idcn").css("display", "block");
					$(this).focus();
					idCheck = false;
					return false;
				} else {
					idCheck = true;
				}
			}
		});
		
		// 비밀번호 양식 검사
		var pwReg = /^(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*~])[a-z0-9!@#$%^&*~]{5,15}$/i;
		$("#userpw").change(function() {
			var userpw = $(this).val();
			if (!pwReg.test(userpw)) {
				alert("비밀번호는 영문자와 숫자, 특수문자를(!@#$%%^&*~)로 이루어진 8~20자여야 합니다.");
				$("#pwcn").css("display", "block");
				$(this).focus();
				return false;
			} else {
				$("#pwcn").css("display", "none")
			}
		});
		
		// 비밀번호 확인 일치 유효성 검사
		$('#usercpw').on("change keyup paste input", function(){
			
			var pw = $('#userpw').val();
			var pwck = $('#usercpw').val();
			$('.final_pwck').css('display', 'none');
			
			if(pw == pwck) {
				$('#pwy').css('display', 'block');
				$('#pwn').css('display', 'none');
			} else {
				$('#pwy').css('display', 'none');
				$('#pwn').css('display', 'block');
			}
			
		});
		
		// 이메일 양식 검사
		var emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		$("#useremail").on('blur', function() {
			var useremail = $(this).val();
			if (useremail != '') {
				if (!emailReg.test(useremail)) {
					$('#emn').css("display", "block");
					return false;
				} else {
					$('#emn').css("display", "none");
				}
			}
		});
		
		// id 중복확인
		$("#userid").change(function() {
			var userid = $(this).val();
		// console.log("userid: " + userid);
			
			var data = {userid : userid}
			
			$.ajax({
				type : "post",
				url : "/member/memberIdChk",
				data : data,
				success : function(result){
					// console.log("성공 여부" + result);
					if (idCheck == true) { // 아이디 양식에 맞으면,
						if (result != 'fail') {
							$('#idy').css("display","block");
							$('#idd').css("display","none");
							$('#idcn').css("display","none");
						} else {
							$('#idd').css("display","block");
							$('#idy').css("display","none");
							$('#idcn').css("display","none");
						} 
					}
				}
			}); 
			
		}); 
		
		
		
		
	</script>

</body>
</html>