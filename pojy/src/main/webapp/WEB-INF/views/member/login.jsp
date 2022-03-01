<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="stylesheet" type="text/css" href="/resources/css/member/login.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
crossorigin="anonymous"></script>
</head>
<body>

	<div class="wrapper">

		<div class="wrap">
			<form id="login_form" method="post">
			
				<div class="logo">
					<span>로그인</span>
				</div>

				<div class="login">

					<div>
						<input type="text" name="userid" id="uesrid" placeholder="id"
							requierd>
					</div>

					<div>
						<input type="password" name="userpw" id="userpw" placeholder="pw"
							requierd>
					</div>
				</div>

				<c:if test = "${result == 0 }">
					<div class="login_warn">사용자 ID 또는 비밀번호를 잘못 입력했습니다.</div>
				</c:if>
				
				<div>
					<button type="button" id="btnlogin" value="로그인">로그인</button>
				</div>
				

			</form>
		</div>
	</div>
	
	<script>
	
	/* 로그인 버튼 클릭 */
	$("#btnlogin").click(function() {
		
		// alert("로그인 버튼 실행");
		
		// 로그인 메소드 서버 요청
		$("#login_form").attr("action", "/member/login");
		$("#login_form").submit();
	});
	
	</script>


</body>
</html>