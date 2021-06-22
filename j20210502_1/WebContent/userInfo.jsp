<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/userInfo.css">
<!-- Style -->
<link rel="stylesheet" href="/css/style.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<style>
* {
  font-family: 'Roboto Condensed';
}

body {
  padding-top: 100px;
  background: #f9f9fb;
}
</style>
<script>
        function popup(){
            var url = "userDeleteForm.jsp";
            var name = "회원탈퇴";
            var option = "width = 500, height = 180, top = 100, left = 200, location = no, scrollbars = no, toolbars = no, status = no, resizable = no, fullscreen = no"
            window.open(url, name, option);
        }
    </script>
</head>
<body>
		<!-- ===============================================-->
		<!--    Main Content-->
		<!-- ===============================================-->
		<header>
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
		</header>
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
																<li class="active"><a href="userInfo.do?user_id=${sessionID }"><span class="fa fa-user"></span> 사용자 정보</a></li>
																<!-- 								<li><a href="userUpdateForm.jsp"><span -->
																<!-- 										class="fa fa-cog"></span> 사용자 정보수정</a></li> -->
																<li><a href="userAskForm.do?user_id=${sessionID}&user_code=${sessionCODE}&board_num=3"><span class="fa fa-envelope"></span> 나의 문의내역</a></li>
																<li><a href="userWriteList.do?user_id=${sessionID}"><span class="fa fa-envelope"></span> 내가 쓴글 </a></li>
																<c:if test="${sessionCODE != 2}">
																		<li><a href="userList.do?user_id=${sessionID}"><span class="fa fa-cog"></span> 모든사용자 정보</a></li>
																</c:if>
														</ul>
														<%-- 							<c:if test="${sessionCODE != 2}"> --%>
														<!-- 		<button type="button" -->
														<%-- 			onclick="location.href='userList.do?user_id=${sessionID}'">모든회원정보</button> --%>
														<%-- 	</c:if> --%>
												</nav>
										</div>
								</div>
						</section>
						<div class="content-panel">
								<form class="form-horizontal">
										<fieldset class="fieldset">
												<h3 class="fieldset-title">사용자 정보</h3>
												<div class="form-group avatar">
														<figure class="figure col-md-2 col-sm-3 col-xs-12">
														</figure>
												</div>
												<div class="form-group">
														<label class="col-md-2 col-sm-3 col-xs-12 control-label">사용자 이름</label>
														<div class="col-md-10 col-sm-9 col-xs-12">
																<input type="text" class="form-control" value="${member.user_name }" readonly="readonly">
														</div>
												</div>
										</fieldset>
								</form>
								<fieldset class="fieldset">
										<div class="form-group">
												<label class="col-md-2  col-sm-3 col-xs-12 control-label">이메일</label>
												<div class="col-md-10 col-sm-9 col-xs-12">
														<input type="email" class="form-control" value="${member.user_email }" readonly="readonly">
												</div>
										</div>
										<div class="form-group">
												<label class="col-md-2  col-sm-3 col-xs-12 control-label">전화번호</label>
												<div class="col-md-10 col-sm-9 col-xs-12">
														<input type="text" class="form-control" value="${member.user_tel }" readonly="readonly">
												</div>
										</div>
										<div class="form-group">
												<label class="col-md-2  col-sm-3 col-xs-12 control-label">사용자 주소</label>
												<div class="col-md-10 col-sm-9 col-xs-12">
														<input type="url" class="form-control" value="${member.user_addr }" readonly="readonly">
												</div>
										</div>
								</fieldset>
								<hr>
								<div class="form-group">
										<div class="col-md-10 col-sm-9 col-xs-12 col-md-push-2 col-sm-push-3 col-xs-push-0">
												<input class="btn btn-primary" type="button" value="회원정보 수정" onclick="location.href='userUpdateForm.do?user_id=${sessionID}'"> <input class="btn btn-primary" type="button" value="회원탈퇴" onclick="javascript:popup()">
										</div>
								</div>
						</div>
				</div>
		</div>
		<script src="/js/jquery-3.3.1.min.js"></script>
		<script src="/js/popper.min.js"></script>
		<script src="/js/bootstrap.min.js"></script>
		<script src="/js/main.js"></script>
</body>
</html>