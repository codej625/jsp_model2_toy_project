<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">


<!-- ===============================================-->
<!--    Document Title-->
<!-- ===============================================-->


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
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="vendors/is/is.min.js"></script>
<script
	src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
<script src="vendors/feather-icons/feather.min.js"></script>
<script src="js/theme.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@300;700&amp;display=swap"
	rel="stylesheet">



<!-- ===============================================-->
<!--    Stylesheets-->
<!-- ===============================================-->
<link href="css/theme.css" rel="stylesheet" />
<title>CAMPRO</title>

</head>


<body>
	<!-- ===============================================-->
	<!--    Main Content-->
	<!-- ===============================================-->
	<main class="main" id="top">
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
								href="userLoginForm.do?">JUMP IN(마이페이지)</a></li>
						</c:if>
						<c:if test="${sessionID != null }">
							<li class="nav-item px-2"><a class="nav-link fw-bold"
								href="userInfo.do?user_code=${sessionCODE }&user_id=${sessionID }">JUMP IN(마이페이지)</a></li>
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
		<section class="py-0" id="header">
			<div class="bg-holder"
				style="background-image: url(img/gallery/store-bg.jpg); background-position: center; background-size: contain;">
			</div>
			<!--/.bg-holder-->

			<div class="container">
				<div class="row align-items-center min-vh-75 min-vh-xl-100">
					<div class="col-md-8 col-lg-6 text-md-start text-center">
						<h1 class="display-1 lh-sm text-uppercase text-light">
							<br class="d-none d-xxl-block" />
						</h1>
						<div class="input-group"
							style="position: relative; top: 50%; left: 50%; border: none; background-color: transparent;">
							<label for="colFormLabel"></label><input
								class="rounded-end-0 form-control" id="colFormLabel" type="text"
								placeholder="캠핑장 검색" />
							<div class="col-4 col-lg-3"
								style="text-align: center; border: none; background-color: transparent;">
								<button class="btn btn-primary rounded-start-0" type="submit"
									style="background-color: lightsalmon;">검색</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- <section> close ============================-->
		<!-- ============================================-->

		<!-- ============================================-->
		<!-- <section> begin ============================-->
		<div class="container">
			<div class="row">
				<div class="col-6 col-sm-4 col-xl-3 mb-3">
					<h4 class="lh-lg fw-bold text-light"></h4>
				</div>
				<div class="col-6 col-sm-4 col-xl-3 mb-3"
					style="position: relative; top: 50%;">
					<h5 class="lh-lg fw-bold text-light">메뉴</h5>
					<ul class="list-unstyled mb-md-4 mb-lg-0">
						<li class="lh-lg"><a
							class="text-800 text-decoration-none text-uppercase fw-bold"
							href="#!">고객센터</a></li>
						<li class="lh-lg"><a
							class="text-800 text-decoration-none text-uppercase fw-bold"
							href="#!">개인정보취급방침</a></li>
						<li class="lh-lg"><a
							class="text-800 text-decoration-none text-uppercase fw-bold"
							href="#!">홈페이지 이용약관</a></li>
					</ul>
				</div>
				<div class="col-6 col-sm-4 col-xl-3 mb-3">
					<h5 class="mb-5"></h5>
					<ul class="list-unstyled mb-md-4 mb-lg-0">
						<li class="lh-lg"><a
							class="text-800 text-decoration-none text-uppercase fw-bold"
							href="userAgree.do">회원가입</a></li>
						<li class="lh-lg"><a
							class="text-800 text-decoration-none text-uppercase fw-bold"
							href="userLoginForm.do">로그인</a></li>
					</ul>
				</div>
				<div class="border-bottom border-700"></div>
			</div>
			<!-- end of .container-->

		</div>
		<!-- <section> close ============================-->
		<!-- ============================================-->


	</main>
	<!-- ===============================================-->
	<!--    End of Main Content-->
	<!-- ===============================================-->




</body>
<!-- <head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">


===============================================
   Document Title
===============================================


===============================================
   Favicons
===========
    ====================================
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


===============================================
   Stylesheets
===============================================
<link href="css/theme.css" rel="stylesheet" />

</head> -->


<!-- <body>
	연습입니다
	===============================================
	   Main Content
	===============================================
	<main class="main" id="top">
		<nav
			class="navbar navbar-expand-lg navbar-light fixed-top py-3 d-block"
			data-navbar-on-scroll="data-navbar-on-scroll">
			<div class="container">
				<a class="navbar-brand d-inline-flex" href="index.jsp"><span
					class="text-light fs-2 fw-bold ms-2"><img
						src="/img/gallery/logo.png" style="width: 100px; height: 100px;"></span></a>
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
						<li class="nav-item px-2"><a class="nav-link fw-bold active"
							aria-current="page" href="#collections">메인 페이지</a></li>
						<li class="nav-item px-2"><a class="nav-link fw-bold"
							href="mainPage.jsp">JUMP IN</a></li>
						<li class="nav-item px-2"><a class="nav-link fw-bold"
							href="mainPageExplorer.jsp">EXPLORER</a></li>
						<li class="nav-item px-2"><a class="nav-link fw-bold"
							href="#header">TIKI-TAKA</a></li>
						<li class="nav-item px-2"><a class="nav-link fw-bold"
							href="mainPage.jsp">로그인</a></li>
						<li class="nav-item px-2"><a class="nav-link fw-bold"
							href="#contact">회원가입</a></li>
						<li class="nav-item px-2"><a class="nav-link fw-bold"
							href="#header">마이페이지</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<section class="py-0" id="header">
			<div class="bg-holder"
				style="background-image: url(img/gallery/header-bg.jpg); background-position: center; background-size: contain;">
			</div>
			/bg-holder

			<div class="container">
				<div class="row align-items-center min-vh-75 min-vh-xl-100">
					<div class="col-md-8 col-lg-6 text-md-start text-center">
						<h1 class="display-1 lh-sm text-uppercase text-light">
							<br class="d-none d-xxl-block" />
						</h1>
						<div class="input-group"
							style="position: relative; top: 50%; left: 50%; border: none; background-color: transparent;">
							<input class="rounded-end-0 form-control" id="colFormLabel"
								type="text" placeholder="캠핑장 검색" />
							<div class="col-4 col-lg-3"
								style="text-align: center; border: none; background-color: transparent;">
								<button class="btn btn-primary rounded-start-0" type="submit">검색</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section> close ============================
		============================================

		============================================
		<section> begin ============================
		<div class="container">
			<div class="row">
				<div class="col-6 col-sm-4 col-xl-3 mb-3">
					<h4 class="lh-lg fw-bold text-light"></h4>
				</div>
				<div class="col-6 col-sm-4 col-xl-3 mb-3"
					style="position: relative; top: 50%;">
					<h5 class="lh-lg fw-bold text-light">메뉴</h5>
					<ul class="list-unstyled mb-md-4 mb-lg-0">
						<li class="lh-lg"><a
							class="text-800 text-decoration-none text-uppercase fw-bold"
							href="#!">고객센터</a></li>
						<li class="lh-lg"><a
							class="text-800 text-decoration-none text-uppercase fw-bold"
							href="#!">개인정보취급방침</a></li>
						<li class="lh-lg"><a
							class="text-800 text-decoration-none text-uppercase fw-bold"
							href="#!">홈페이지 이용약관</a></li>
					</ul>
				</div>
				<div class="col-6 col-sm-4 col-xl-3 mb-3">
					<h5 class="mb-5"></h5>
					<ul class="list-unstyled mb-md-4 mb-lg-0">
						<li class="lh-lg"><a
							class="text-800 text-decoration-none text-uppercase fw-bold"
							href="#!">회원가입</a></li>
						<li class="lh-lg"><a
							class="text-800 text-decoration-none text-uppercase fw-bold"
							href="#!">로그인</a></li>
					</ul>
				</div>
				<div class="border-bottom border-700"></div>
			</div>
		</div>
		end of .container


		<section> close ============================
		============================================


	</main>
	===============================================
	   End of Main Content
	===============================================




	===============================================
	   JavaScripts
	===============================================
	<script src="vendors/@popperjs/popper.min.js"></script>
	<script src="vendors/bootstrap/bootstrap.min.js"></script>
	<script src="vendors/is/is.min.js"></script>
	<script
		src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
	<script src="vendors/feather-icons/feather.min.js"></script>
	<script>
		feather.replace();
	</script>
	<script src="js/theme.js"></script>
 -->

</body>
</html>