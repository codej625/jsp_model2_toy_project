<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>게시판</title>
<link rel="stylesheet" href="/css/style.css" type="text/css">
<style type="text/css">
table {
	width: 100%;
}
</style>
<!-- Required meta tags -->

<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="/icomoon/style.css">

<link rel="stylesheet" href="/css/owl.carousel.min.css">

<link rel="stylesheet" href="/css/board.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="/css/bootstrap.min.css">

<!-- Style -->
<link rel="stylesheet" href="/css/style.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.0.min.js"></script>

<!-- ===============================================-->
<!--    Favicons-->
<!-- ===============================================-->
<link rel="apple-touch-icon" sizes="180x180"
	href="img/favicons/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="img/favicons/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="img/favicons/favicon-16x16.png">
<link rel="shortcut icon" type="image/x-icon"
	href="img/favicons/favicon.ico">
<link rel="manifest" href="img/favicons/manifest.json">
<meta name="msapplication-TileImage"
	content="img/favicons/mstile-150x150.png">
<meta name="theme-color" content="#ffffff">
<!-- ===============================================-->
<!--    JavaScripts-->
<!-- ===============================================-->
<link
	href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@300;700&amp;display=swap"
	rel="stylesheet">
<script src="vendors/@popperjs/popper.min.js"></script>
<script src="vendors/bootstrap/bootstrap.min.js"></script>
<script src="vendors/is/is.min.js"></script>
<script
	src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
<script src="vendors/feather-icons/feather.min.js"></script>
<script src="js/theme.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.0.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@300;700&amp;display=swap"
	rel="stylesheet">




</head>
<body>
	<!-- ===============================================-->
	<!--    Main Content-->
	<!-- ===============================================-->
	<nav
		class="navbar navbar-expand-lg navbar-light fixed-top py-3 d-block"
		data-navbar-on-scroll="data-navbar-on-scroll">
		<div class="container">
			<a class="navbar-brand d-inline-flex" href="index.jsp"><span
				class="text-light fs-2 fw-bold ms-2"><img
					src="${pageContext.request.contextPath}/img/gallery/logo.png"
					style="width: 100px; height: 100px;" alt=""></span></a>
			<button class="navbar-toggler collapsed" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div
				class="collapse navbar-collapse border-top border-lg-0 mt-4 mt-lg-0"
				id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<c:if test="${sessionID == null }">
						<li class="nav-item px-2"><a class="nav-link fw-bold"
							href="userLoginForm.do">JUMP IN(마이페이지)</a></li>
					</c:if>
					<c:if test="${sessionID != null }">
						<li class="nav-item px-2"><a class="nav-link fw-bold"
							href="userInfo.do?user_code=${sessionCODE }">JUMP IN(마이페이지)</a></li>
					</c:if>
					<li class="nav-item px-2"><a class="nav-link fw-bold"
						href="explorer.do?user_id=${sessionID }">EXPLORER(캠핑장)</a></li>
					<li class="nav-item px-2"><a class="nav-link fw-bold"
						href="boardList.do?user_id=${sessionID }">TIKI-TAKA(게시판)</a></li>
					<c:if test="${sessionID == null }">
						<li class="nav-item px-2"><a class="nav-link fw-bold"
							href="userLoginForm.do">로그인</a></li>
						<li class="nav-item px-2"><a class="nav-link fw-bold"
							href="userAgree.do">회원가입</a></li>
					</c:if>
					<c:if test="${sessionID != null }">
						<li class="nav-item px-2"><a class="nav-link fw-bold"
							href="userLogoutPro.do">로그아웃</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>



	<!--/.bg-holder-->
	<div class="content">
		<div class="container">
			<h2 class="mb-5" style="color: black;">장터 게시판</h2>
			<table>
				<tr>
					<td><a
						href="postWriteForm.do?board_num=${board_num}&post_num=${post_num}&pageNum=${currentPage }">장터
							글쓰기</a> <input type="text" id="board_num" value="${board_num}">
						<input type="text" id="pageNum" value="${currentPage }"> <input
						type="text" id="post_num" value="${post_num}"></td>
				</tr>

				<tr>
					<td><a href="boardNoticeList.do?board_num=0">공지게시판</a></td>
				</tr>
				<tr>
					<td><a href="boardFreeList.do?board_num=1">자유게시판</a></td>
				</tr>
				<tr>
					<td><a href="boardMarketList.do?board_num=2">마켓게시판</a></td>
				</tr>
			</table>
			<table>
				<tr>
					<th scope="col">게시번호</th>
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">작성일</th>
					<th scope="col">조회수</th>
				</tr>
				<c:if test="${totCnt > 0 }">
					<c:forEach var="post" items="${list}">
						<tr>
							<td>${board_num }</td>
							<td>${post.post_num}</td>
							<!--게시글 번호 대신하여 사용-->
							<td class="left" width=200><a
								href='postContent.do?board_num=${board_num}&post_num=${post.post_num}&pageNum=${currentPage}'>
									${post.post_name}</a></td>
							<td>${post.user_id}</td>
							<td>${post.post_date}</td>
							<td>${post.post_view}</td>
						</tr>
						<c:set var="startNum" value="${startNum - 1 }" />
					</c:forEach>
				</c:if>
				<c:if test="${totCnt == 0 }">
					<tr>
						<td colspan=7>데이터가 없네</td>
					</tr>
				</c:if>
			</table>

			<div style="text-align: center;">
				<c:if test="${startPage > blockSize }">
					<a href='boardList.do?pageNum=${startPage-blockSize}'>[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a href='boardList.do?pageNum=${i}'>[${i}]</a>
				</c:forEach>
				<c:if test="${endPage < pageCnt }">
					<a href='boardList.do?pageNum=${startPage+blockSize}'>[다음]</a>
				</c:if>
			</div>
		</div>
	</div>
	<script src="/js/jquery-3.3.1.min.js"></script>
	<script src="/js/popper.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/main.js"></script>
</body>
</html>