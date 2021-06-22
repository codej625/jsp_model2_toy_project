<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/userInfo.css">
<!-- Style -->
<link rel="stylesheet" href="/css/style.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<script type="text/javascript" src="./campReview.js"></script>
<title>VIEW</title>
<style>
body {
  padding-top: 150px;
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
										<div class="content-panel">
												<form class="form-horizontal">
														<fieldset class="fieldset">
																<h3 class="h1">${camp_InfoDto.camp_Name}</h3>
																<hr class="hr">
																<div class="form-group avatar">
																		<figure class="figure col-md-2 col-sm-3 col-xs-12">
																		</figure>
																</div>
																<div class="box2">
																		<img alt="error" src="images/${camp_InfoDto.camp_Images}.jpg">
																</div>
																<div class="box3">
																		<br>
																		<table>
																				<tr>
																						<th id="thTop">주소</th>
																						<td id="tdTop">${camp_InfoDto.camp_Addr}</td>
																				</tr>
																				<tr>
																						<th>문의처</th>
																						<td>${camp_InfoDto.camp_Tel}</td>
																				</tr>
																				<tr>
																						<th>지역</th>
																						<td>${camp_InfoDto.camp_Loc}</td>
																				</tr>
																				<tr>
																						<th id="thBottom">운영일</th>
																						<td id="tdBottom">평일 + 주말</td>
																				</tr>
																		</table>
																</div>
																<div class="box4">
																		<div id="resButtonBox">
																				<button id="resButton" style="font-size: 20px; width: 150pt; height: 30pt;" onclick="alert('예약 전 캠핑장 현황 확인 부탁드립니다. Campro는 예약 링크만 제공하며 서비스는 제공하지않습니다.')">
																						<a href="${camp_InfoDto.res_Id}" target="_blank">예약하기</a>
																				</button>
																		</div>
																</div>
																<div class="box5">
																		<div>
																				<br>
																		</div>
																</div>
																<hr>
																<div class="box6">
																		<div class="view">
																				<h3 class="h3">캠핑장 전경</h3>
																				<img class="images1" alt="error" src="images/${camp_InfoDto.camp_View1}.jpg"> <img class="images1" alt="error" src="images/${camp_InfoDto.camp_View2}.jpg"> <img class="images1" alt="error" src="images/${camp_InfoDto.camp_View3}.jpg">
																		</div>
																</div>
																
																<div class="box7">
																		<div class="item">
																				<h3 class="h3">캠핑장 편의시설
																				<br>
																				<img style="width:60%; height:70%;" class="images2" alt="error" src="images/${camp_InfoDto.camp_Item}.jpg"></img></h3>
																				<br>
																				<br>
																				<br>
																		</div>
																</div>
																<hr>
																<br>
																<div class="box8">
																		<div class="desc">
																				<h3 class="h3">캠핑장 상세 소개</h3>
																				<br>
																				<div class="campDesc">
																						<p>${camp_InfoDto.camp_Desc}</p>
																				</div>
																		</div>
																</div>
														</fieldset>
														<hr>
												</form>
												<div class="box9">
														<div class="review">
																<h3 class="h3">리뷰</h3>
																<c:import url="campReview.jsp"></c:import>
														</div>
												</div>
										</div>
								</div>
						</section>
				</div>
		</div>
		<%-- <div id="wrapper">
				<div class="box1">
						<div class="header">
								<br> <br>
								<h1 class="h1">${camp_InfoDto.camp_Name}</h1>
								<br>
								<hr class="hr">
						</div>
				</div>
				<div class="box2">
						<img alt="error" src="images/${camp_InfoDto.camp_Images}.jpg">
				</div>
				<div class="box3">
						<br>
						<table>
								<tr>
										<th id="thTop">주소</th>
										<td id="tdTop">${camp_InfoDto.camp_Addr}</td>
								</tr>
								<tr>
										<th>문의처</th>
										<td>${camp_InfoDto.camp_Tel}</td>
								</tr>
								<tr>
										<th>지역</th>
										<td>${camp_InfoDto.camp_Loc}</td>
								</tr>
								<tr>
										<th id="thBottom">운영일</th>
										<td id="tdBottom">평일 + 주말</td>
								</tr>
						</table>
				</div>
				<div class="box4">
						<div id="resButtonBox">
								<button id="resButton" style="font-size: 20px; width: 150pt; height: 30pt;" onclick="alert('예약 전 캠핑장 현황 확인 부탁드립니다. Campro는 예약 링크만 제공하며 서비스는 제공하지않습니다.')">
										<a href="${camp_InfoDto.res_Id}" target="_blank">예약하기</a>
								</button>
						</div>
				</div>
				<div class="box5">
						<div>
								<br>
						</div>
				</div>
				<div class="box6">
						<div class="view">
								<h3 class="h3">캠핑장 전경</h3>
								<img class="images1" alt="error" src="images/${camp_InfoDto.camp_View1}.jpg"> <img class="images1" alt="error" src="images/${camp_InfoDto.camp_View2}.jpg"> <img class="images1" alt="error" src="images/${camp_InfoDto.camp_View3}.jpg">
						</div>
				</div>
				<div class="box7">
						<div class="item">
								<h3 class="h3">캠핑장 편의시설</h3>
								<br> <img class="images2" alt="error" src="images/${camp_InfoDto.camp_Item}.jpg"></img>
						</div>
				</div>
				<div class="box8">
						<div class="desc">
								<h3 class="h3">캠핑장 상세 소개</h3>
								<br>
								<div class="campDesc">
										<p>${camp_InfoDto.camp_Desc}</p>
								</div>
						</div>
				</div>
				<div class="box9">
						<div class="review">
								<h3 class="h3">리뷰</h3>
								<c:import url="campReview.jsp"></c:import>
						</div>
				</div>
		</div> --%>
		<script src="/js/jquery-3.3.1.min.js"></script>
		<script src="/js/popper.min.js"></script>
		<script src="/js/bootstrap.min.js"></script>
		<script src="/js/main.js"></script>
</body>
</html>