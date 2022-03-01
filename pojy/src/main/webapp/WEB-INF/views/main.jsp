<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl 태그라이브러리 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- jstl 숫자 표시 형식 변경 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Free Board</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
</head>
<body>

	

	<div class="wrapper">
		<div class="wrap">

			<div class="top">
				<div class="logo">
					<h1>자유게시판</h1>
				</div>

				<div class="serach">
					<h1></h1>
				</div>

				<div class="login">

					<!-- 로그인을 안했을 때 -->
					<c:if test="${member == null }">
						<div class="login_button">
							<!-- <a href="/member/login">로그인</a> <a>| </a><span><a
								href="/member/join">회원가입</a></span> -->
						</div>

					</c:if>

					<c:if test="${member != null }">
						<div class="login_success">
							<span>회원 : ${member.username }</span> <a href="/member/logout.do">로그아웃</a>
						</div>
					</c:if>

				</div>

				<div class="crearfix"></div>
			</div>

			<div class="mid">
				<div class="mid1">
				</div>

				<div class="mid2">
					<button type="button" class="mid3" id="boardreg"
						onclick="location.href='/register'">글쓰기</button>
				</div>

			</div>


			<div class="content">

				<table border="1" class="tableboard" id="dataTable" width="100%"
					cellspacing="5">
					<thead>
						<tr>
							<th class="bno">#번호</th>
							<th class="title">제목</th>
							<th class="writer">작성자</th>
							<th class="width">작성일</th>
							<th class="updatedate">수정일</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${list }" var="list">
							<tr>
								<td><c:out value="${list.bno}" /></td>
								
								<td>
                    			<a class="move" href='<c:out value="${list.bno}"/>'>
       								 <c:out value="${list.title}"/>
   								</a>
								</td>
								
								<td><c:out value="${list.writer}" /></td>
								<td><fmt:formatDate pattern="yyyy/MM/dd"
										value="${list.regdate}" /></td>
								<td><fmt:formatDate pattern="yyyy/MM/dd"
										value="${list.updateDate}" /></td>
							</tr>
						</c:forEach>
					</tbody>

				</table>
				
				<div class="pageInfo_wrap">
					<div class="pageInfo_area">
						<ul id="pageInfo" class="pageInfo">
						
							<!-- 이전 페이지 버튼 -->
							<c:if test="${pageMaker.prev }">
								<li class="pageInfo_btn previous"><a href="${pageMaker.startPage-1 }">이전</a></li>
							</c:if>
						
							<!-- 각 번호 페이지 버튼 -->
							<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
								<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="${num }">${num }</a></li>
							</c:forEach>
							
							<!-- 다음 페이지 버튼 -->
							<c:if test="${pageMaker.next }">
								<li class="pageInfo_btn next"><a href="${pageMaker.endPage+1 }">다음</a></li>
							</c:if>
							
						</ul>
						
					</div>
				</div>
				
				
				<form id="moveForm" method="get">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
				</form>
			</div>
		</div>
	</div>

<script>
		// 페이지 로딩시 실행
		$(document).ready(function() {

			let result = '<c:out value="${result}"/>';

			checkAlert(result);

			function checkAlert(result) {

				if (result === '') {
					return;
				}

				if (result === "register success") {
					alert("등록이 완료되었습니다.");
				}
				
				if (result === "modify success") {
					alert("수정이 완료되었습니다.");
				}

				if (result === "delete success") {
					alert("삭제가 완료되었습니다.");
				}
				
			}

		});
		
		let moveForm = $("#moveForm");
		
		$(".move").on("click", function(e){
	        e.preventDefault();
	        
	        moveForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+ "'>");
	        moveForm.attr("action", "/get");
	        moveForm.submit();
	    });
		
		$(".pageInfo a").on("click", function(e){
			
			e.preventDefault();
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.attr("action", "/main");
			moveForm.submit();
		});
		
		
	</script>

</body>
</html>