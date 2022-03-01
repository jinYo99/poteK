<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 등록</title>
<link rel="stylesheet" type="text/css"
	href="/resources/css/register.css">
</head>
<body>

	<div class="wrapper">
		<form action="/register" method="post">

			<div class="wrap">

				<h1>게시물 등록</h1>

				<div class="input wrap">
					<label>제목</label>
					<textarea name="title" id="title"></textarea>
				</div>

				<div class="input wrap">
					<label>내용</label>
					<textarea name="content" id="content"></textarea>
				</div>

				<div class="input wrap">
					<label>작성자</label> 
					<input type="text" name="writer" id="writer">
				</div>

				<button class="btn">등록</button>
			</div>
		</form>
	</div>

</body>
</html>