<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>게시판</title>
<style type="text/css">
* {
  font-family: 'Roboto Condensed';
}

body {
  padding-top: 100px;
  background: #f9f9fb;
}

table {
  width: 110%;
  text-justify: auto;
}

#board_num, #pageNum, #post_num {
  display: none;
}
</style>
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/userInfo.css">
<!-- Style -->
<link rel="stylesheet" href="/css/style.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
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
										<li class="nav-item px-2"><a class="nav-link fw-bold" href="explorerCf.do">EXPLORER(캠핑장)</a></li>
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
												<div class="user-info">
														<ul class="meta list list-unstyled">
																<li class="name" value=""><label class="label label-info"></label></li>
																<li class="email"><a href="#"></a></li>
																<li class="activity"></li>
														</ul>
												</div>
												<nav class="side-menu">
														<ul class="nav">
																<li class="active"><a href="boardNoticeList.do?board_num=0"><span class="fa"></span>공지게시판</a></li>
																<li><a href="boardFreeList.do?board_num=1"><span class="fa"></span>자유게시판</a></li>
																<li><a href="boardMarketList.do?board_num=2"><span class="fa"></span>마켓게시판</a></li>
																<li><a href="userAskForm.do?user_id=${sessionID}&user_code=${sessionCODE}&board_num=3"><span class="fa fa-envelope"></span>나의 문의내역</a></li>
														</ul>
												</nav>
										</div>
										<div class="content-panel">
												<form class="form-horizontal">
														<fieldset class="fieldset">
																<h3 class="fieldset-title">공지게시판</h3>
																<div class="form-group avatar">
																		<figure class="figure col-md-2 col-sm-3 col-xs-12">
																		</figure>
																</div>
																<table>
                                  <colgroup>
                                    <col width="10%">
                                    <col width="50%">
                                    <col width="10%">
                                    <col width="15%">
                                    <col width="*">
                                  </colgroup>
                                  <tbody>
                                    <tr>
                                        <th>번호</th> 
                                        <th>제목</th>
                                        <th>작성자</th>
                                        <th>작성일</th>
                                        <th>조회수</th>
                                    </tr>
                                    <c:if test="${totCnt > 0 }">
                                        <c:forEach var="post" items="${list}" varStatus="postNum">
                                            <tr>
                                                  <td>${postNum.count}</td> <!-- JSTL count 로 게시글 번호 정렬 -->
                                                <!--게시글 번호 대신하여 사용-->
																								<td class="left" width=200><a href='postContent.do?board_num=${board_num}&post_num=${post.post_num}&pageNum=${currentPage}'> ${post.post_name}</a></td>
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
																		</tbody>
																</table>
																<!-- <div class="form-group">
                                    <label class="col-md-2 col-sm-3 col-xs-12 control-label">사용자 이름</label>
                                    <div class="col-md-10 col-sm-9 col-xs-12">
                                        <input type="text" class="form-control" value="#유저ID">
                                    </div>
                                </div>
                            </fieldset>
                            <fieldset class="fieldset">
                                <div class="form-group">
                                    <label class="col-md-2  col-sm-3 col-xs-12 control-label">이메일</label>
                                    <div class="col-md-10 col-sm-9 col-xs-12">
                                        <input type="email" class="form-control" value="#사용자EMAIL">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2  col-sm-3 col-xs-12 control-label">전화번호</label>
                                    <div class="col-md-10 col-sm-9 col-xs-12">
                                        <input type="text" class="form-control" value="#사용자 전화번호">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2  col-sm-3 col-xs-12 control-label">사용자 주소</label>
                                    <div class="col-md-10 col-sm-9 col-xs-12">
                                        <input type="url" class="form-control" value="#사용자 주소">
                                    </div>
                                </div> -->
														</fieldset>
														<hr>
														<div class="form-group">
																<div class="col-md-10 col-sm-9 col-xs-12 col-md-push-2 col-sm-push-3 col-xs-push-0">
																		<a href="postWriteForm.do?board_num=${board_num}&post_num=${post_num}&pageNum=${currentPage }">공지 글쓰기</a> <input type="text" id="board_num" value="${board_num}"> <input type="text" id="pageNum" value="${currentPage }"> <input type="text" id="post_num" value="${post_num}">
																</div>
														</div>
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
												</form>
										</div>
								</div>
						</section>
				</div>
		</div>
		<%-- <div class="content">
				<div class="container">
						<h2 class="mb-5" style="color: black;">공지사항 게시판</h2>
						<table>
								<tr>
										<td><a id="nav2" href="boardNoticeList.do?board_num=0">공지게시판</a></td>
								</tr>
								<tr>
										<td><a id="nav2" href="boardFreeList.do?board_num=1">자유게시판</a></td>
								</tr>
								<tr>
										<td><a id="nav2" href="boardMarketList.do?board_num=2">마켓게시판</a></td>
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
														<td class="left" width=200><a href='postContent.do?board_num=${board_num}&post_num=${post.post_num}&pageNum=${currentPage}'> ${post.post_name}</a></td>
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
						<table>
								<tr>
										<td><a href="postWriteForm.do?board_num=${board_num}&post_num=${post_num}&pageNum=${currentPage }">자유 글쓰기</a> <input type="text" id="board_num" value="${board_num}"> <input type="text" id="pageNum" value="${currentPage }"> <input type="text" id="post_num" value="${post_num}"></td>
								</tr>
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
		</div> --%>
		<script src="/js/jquery-3.3.1.min.js"></script>
		<script src="/js/popper.min.js"></script>
		<script src="/js/bootstrap.min.js"></script>
		<script src="/js/main.js"></script>
</body>
</html>