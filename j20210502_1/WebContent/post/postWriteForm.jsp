<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글작성</title>
<style>
/* body {
	text-align: center;
	position: fixed;
}
 */
header {
  padding-bottom: 100px;
}

#board_num, #pagenNum, #post_num {
  display: none;
}

nav2 {
  backgorund-color: #ffdab9;
  width: 50%;
  list-style-type: none;
  margin: 0;
  padding: 0;
  border-bottom: solid 1px black;
  float: left;
}

td a {
  display: block;
  color: #000000;
  padding: 8px;
  text-decoration: none;
  font-weight: bold;
  float: left;
}

td a:current {
  background-color: #ff6347;
  color: white;
}

td a:hover:not(.current) {
  background-color: #cd853f;
  color: white;
}

#area {
  height: 100%;
  overflow: hidden;
  text-align: center;
  display: relative;
}
</style>
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/userInfo.css">
<!-- Style -->
<link rel="stylesheet" href="/css/style.css">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<script>
	$(document).ready(function() {
						//여기 아래 부분
			$('#summernote').summernote(
										{
											height : 500,// 에디터 높이
											width : 700,
											focus : true, // 에디터 로딩후 포커스를 맞출지 여부
											lang : "ko-KR", // 한글 설정
											placeholder : '내용',
											disableResizeEditor : true, // 크기 조절 기능 삭제
											toolbar : [
													[ 'fontname',
															[ 'fontname' ] ],
													[ 'fontsize',
															[ 'fontsize' ] ],
													[
															'style',
															[
																	'bold',
																	'italic',
																	'underline',
																	'strikethrough',
																	'clear' ] ],
													[
															'color',
															[ 'forecolor',
																	'color' ] ],
													[ 'table', [ 'table' ] ],
													[
															'para',
															[ 'ul', 'ol',
																	'paragraph' ] ],
													[ 'height', [ 'height' ] ],
													[
															'insert',
															[ 'picture',
																	'link',
																	'video' ] ],
													[
															'view',
															[ 'fullscreen',
																	'help' ] ] ],
											fontNames : [ 'Arial',
													'Arial Black',
													'Comic Sans MS',
													'Courier New', '맑은 고딕',
													'궁서', '굴림체', '굴림', '돋움체',
													'바탕체' ],
											fontSizes : [ '8', '9', '10', '11',
													'12', '14', '16', '18',
													'20', '22', '24', '28',
													'30', '36', '50', '72' ]
										})
					});	

	
</script>
</head>
<body>
		<!-- ===============================================-->
		<!--    Main Content-->
		<!-- ===============================================-->
		<nav class="navbar navbar-expand-lg navbar-light fixed-top py-3 d-block" data-navbar-on-scroll="data-navbar-on-scroll">
				<div class="container">
						<a class="navbar-brand d-inline-flex" href="index.jsp"><span class="text-light fs-2 fw-bold ms-2"><img src="${pageContext.request.contextPath}/img/gallery/logo.png" style="width: 100px; height: 100px;" alt=""></span></a>
						<button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
								<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse border-top border-lg-0 mt-4 mt-lg-0" id="navbarSupportedContent">
								<ul class="navbar-nav me-auto mb-2 mb-lg-0">
										<c:if test="${sessionID == null }">
												<li class="nav-item px-2"><a class="nav-link fw-bold" href="userLoginForm.do">JUMP IN(마이페이지)</a></li>
										</c:if>
										<c:if test="${sessionID != null }">
												<li class="nav-item px-2"><a class="nav-link fw-bold" href="userInfo.do?user_code=${sessionCODE }">JUMP IN(마이페이지)</a></li>
										</c:if>
										<li class="nav-item px-2"><a class="nav-link fw-bold" href="explorerCF.do">EXPLORER(캠핑장)</a></li>
										<li class="nav-item px-2"><a class="nav-link fw-bold" href="boardList.do?user_id=${sessionID }">TIKI-TAKA(게시판)</a></li>
										<c:if test="${sessionID == null }">
												<li class="nav-item px-2"><a class="nav-link fw-bold" href="userLoginForm.do">로그인</a></li>
												<li class="nav-item px-2"><a class="nav-link fw-bold" href="userAgree.do">회원가입</a></li>
										</c:if>
										<c:if test="${sessionID != null }">
												<li class="nav-item px-2"><a class="nav-link fw-bold" href="userLogoutPro.do">로그아웃</a></li>
										</c:if>
								</ul>
						</div>
				</div>
		</nav>
		<!-- 상단 네비게이션 끝 -->
		<div class="container">
				<div class="view-account">
						<section class="module">
								<div class="module-inner">
										<div class="side-bar">
												<nav class="side-menu">
														<ul class="nav">
																<li><a href="boardNoticeList.do?board_num=0"><span class="fa"></span>공지게시판</a></li>
																<li><a href="boardFreeList.do?board_num=1"><span class="fa"></span>자유게시판</a></li>
																<li><a href="boardMarketList.do?board_num=2"><span class="fa"></span>마켓게시판</a></li>
																<li><a href="userAskForm.do?user_id=${sessionID}&user_code=${sessionCODE}&board_num=3"><span class="fa fa-envelope"></span>나의 문의내역</a></li>
														</ul>
												</nav>
										</div>
										<div class="content-panel">
												<form class="form-horizontal" action="postWritePro.do?board_num=${board_num}&pageNum=${pageNum}" method="post" enctype="multipart/form-data">
														<input type="hidden" name="board_num" id="board_num" value="${board_num}"> <input type="hidden" name="pageNum" id="pagenNum" value="${pageNum }"> <input type="hidden" name="post_num" value="${post_num }"> <input type="hidden" name="post_re" value="${post_re}"> <input type="hidden" name="post_restep" value="${post_restep}"> <input type="hidden" name="post_lv" value="${post_lv}">
														<h2>게시판 글쓰기</h2>
														<hr>
														<h4>작성자<input type="text" name="user_id" required="required" value="${sessionID}"></h4>
														
														<h4> 제목  <input type="text" name="post_name" required="required"></h4>
														<hr>
                           <textarea id="summernote" name="post_cont" required="required"></textarea>
                              
														<fieldset>
																<input class="btn btn-primary" type="button" onclick="history.back();" value="취소">
																<input class="btn btn-primary" type="submit" value="확인">
														</fieldset>
														</form>
										</div>
								</div>
						</section>
				</div>
		</div>
		<%-- <form action="postWritePro.do?board_num=${board_num}&pageNum=${pageNum}" method="post" enctype="multipart/form-data">
		<input type="hidden" name="board_num" id="board_num" value="${board_num}">
		<input type="hidden" name="pageNum" id="pagenNum" value="${pageNum }"> 
		<input type="hidden" name="post_num" value="${post_num }">
		<input type="hidden" name="post_re" value="${post_re}">
     	<input type="hidden" name="post_restep" value="${post_restep}">
     	<input type="hidden" name="post_lv" value="${post_lv}">
			<h2>게시판 글쓰기</h2>
				작성자
				<input type="text" name="user_id" required="required"> 
				제목
				<input type="text" name="post_name" required="required">
			 <textarea id="summernote" name="post_cont" required="required"></textarea> 
<fieldset>
		<input type="button" onclick="history.back();" value="취소">
		<input type="submit" value="확인">
</fieldset>
	</form> --%>
	<script>
  $(document).ready(function() {
    $('#summernote').summernote();
  });</script>
</body>
</html>