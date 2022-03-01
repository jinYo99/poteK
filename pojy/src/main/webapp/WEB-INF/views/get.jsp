<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 조회</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/css/get.css">
</head>
<body>

	<div class="wrapper">

			<div class="wrap">

				<h1>게시물 조회</h1>

				<div class="input wrap">
					<label>번호</label> 
					<input name="bno" id="bno" readonly="readonly" value='<c:out value="${pageInfo.bno }"/>' >
				</div>

				<div class="input wrap">
					<label>제목</label>
					<input name="title" id="title" readonly="readonly" value='<c:out value="${pageInfo.title }"/>' >
				</div>

				<div class="input wrap">
					<label>내용</label>
					<input name="content" id="content" readonly="readonly" value='<c:out value="${pageInfo.content }"/>' >
				</div>

				<div class="input wrap">
					<label>작성자</label> 
					<input name="writer" id="writer" readonly="readonly" value='<c:out value="${pageInfo.writer }"/>' >
				</div>
				
				<div class="input wrap">
					<label>작성일</label> 
					<input name="regdate" id="regdate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd"
										value="${pageInfo.regdate}"/>' >
				</div>
				
				<div class="input wrap">
					<label>수정일</label> 
					<input name="updateDate" id="updateDate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd"
										value="${pageInfo.updateDate}"/>' >
				</div>
				
				<a class="btn" id="list_btn">목록</a> 
				<a class="btn" id="modify_btn">수정</a>
				<a class="btn" id="delete_btn">삭제</a> 
				
			</div>
			<form id="infoForm" action="/modify" method="get">
				<input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.bno}"/>'>
				<input type="hidden" name="pageNum" value="${cri.pageNum }">
				<input type="hidden" name="amount" value="${cri.amount }">
			</form>
	</div>
	
	<script>
		let form = $("#infoForm");
		
		$("#list_btn").on("click", function(e){
			form.find("#bno").remove();
			form.attr("action", "/main");
			form.submit();
		});
		
		$("#modify_btn").on("click", function(e){
			form.attr("action", "/modify");
			form.submit();
		});
		
		// 삭제 버튼
		$("#delete_btn").on("click", function(e){
			form.attr("action", "/delete");
			form.attr("method", "post");
			form.submit();
		});
		
	</script>

</body>
</html>