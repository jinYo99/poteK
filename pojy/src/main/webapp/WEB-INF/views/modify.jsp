<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 수정</title>
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

				<h1>게시물 수정</h1>
				
				<form id="modifyForm" action="/modify" method="post">
				
				<div class="input wrap">
					<label>번호</label> 
					<input name="bno" id="bno" readonly="readonly" value='<c:out value="${pageInfo.bno }"/>' >
				</div>

				<div class="input wrap">
					<label>제목</label>
					<input name="title" id="title" value='<c:out value="${pageInfo.title }"/>' >
				</div>

				<div class="input wrap">
					<label>내용</label>
					<input name="content" id="content" value='<c:out value="${pageInfo.content }"/>' >
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
				<a class="btn" id="modify_btn">완료</a>
				<a class="btn" id="cancel_btn">취소</a> 
				
			</div>
			</form>
				
				
			<form id="infoForm" action="/modify" method="get">
				<input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.bno}"/>'>
				<input type="hidden" name="pageNum" value="${cri.pageNum }">
				<input type="hidden" name="amount" value="${cri.amount }">
			</form>
	</div>
	
	<script>
		let form = $("#infoForm");		// 페이지 이동 form(리스트 페이지 이동, 조회 페이지 이동)
		let mForm = $("#modifyForm");	// 페이지 데이터 수정
		
		// 목록 페이지 이동 버튼
		$("#list_btn").on("click", function(e){
			form.find("#bno").remove();
			form.attr("action", "/main");
			form.submit();
		});
		
		// 수정하기 버튼
		$("#modify_btn").on("click", function(e){
       		 mForm.submit();
   		});
		
		// 취소 버튼
		$("#cancel_btn").on("click", function(e){
			form.attr("action", "/get");
			form.submit();
		});
		
		
		
	</script>

</body>
</html>