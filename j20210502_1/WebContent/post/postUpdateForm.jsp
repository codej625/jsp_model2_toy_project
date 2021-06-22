<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 수정</title>
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/userInfo.css">
<!-- Style -->
<link rel="stylesheet" href="/css/style.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<style type="text/css">
* {
  font-family: 'Roboto Condensed';
}

body {
  padding-top: 100px;
  background: #f9f9fb;
}

table {
  width: 100%;
  text-justify: auto;
}
</style>
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
                        <form action="postUpdatePro.do" method="post">
                        <input type="hidden" name="board_num" value="${post.board_num }"> <input type="hidden" name="post_num" value="${post.post_num }"> <input type="hidden" name="pageNum" value="${pageNum }"> <input type="hidden" name="user_id" value="${post.user_id}">
                        <table border="0">
                            <h2>게시판 수정</h2>
                            <hr>
                            <tr>
                                <h3>제목</h3>
                                <h5><c:if test="${post.post_re > 0 }">
                                        <input type="text" name="post_name" required="required" value="[댓글수정]">
                                    </c:if> <c:if test="${post.post_re == 0 }">
                                        <input type="text" name="post_name" required="required" value="${post.post_name}">
                                    </c:if></h5>
                            </tr>
                           <hr>
                           <tr>
                                <h3>작성자</h3>
                                <h5>${post.user_id}</h5>
                           </tr>
                            <hr>
                            <tr>
                                <h3>내용</h3>
                                <h5><textarea rows="10" cols="40" name="post_cont" required="required">${post.post_cont}</textarea></h5>
                            </tr>
                            <hr>
                            <tr>
                                <td colspan="2"><input class="btn btn-primary" type="submit" value="수정완료"></td>
                            </tr>
                        </table>
                    </form>
                    </div>
                </div>
            </section>
        </div>
    </div>
		<%-- <form action="postUpdatePro.do" method="post">
				<input type="hidden" name="board_num" value="${post.board_num }"> <input type="hidden" name="post_num" value="${post.post_num }"> <input type="hidden" name="pageNum" value="${pageNum }"> <input type="hidden" name="user_id" value="${post.user_id}">
				<table border="1">
								<h2>게시판 수정</h2>
						<tr>
								<td>제목</td>
								<td><c:if test="${post.post_re > 0 }">
												<input type="text" name="post_name" required="required" value="[댓글수정]">
										</c:if> <c:if test="${post.post_re == 0 }">
												<input type="text" name="post_name" required="required" value="${post.post_name}">
										</c:if></td>
						</tr>
						<tr>
								<td>작성자</td>
								<td>${post.user_id}</td>
						</tr>
						<tr>
								<td>내용</td>
								<td><textarea rows="10" cols="40" name="post_cont" required="required">${post.post_cont}</textarea></td>
						</tr>
						<tr>
								<td colspan="2"><input type="submit" value="수정완료"></td>
						</tr>
				</table>
		</form> --%>
</body>
</html>