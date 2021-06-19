<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
<!-- 카카오맵  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 네비게이션, 세부디자인 -->
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/userInfo.css">
<link rel="stylesheet" href="/css/style.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<title>캠핑장</title>
<style>
* {
  font-family: 'Roboto Condensed';
  text-align: left;
}

body {
  padding-top: 150px;
  background: #f9f9fb;
}

#camp_Images{
  padding-top:20px;
}

#board_num, #pageNum, #post_num {
  display: none;
}
</style>
<script type="text/javascript">
  function formChange(obj) {
    //alert("함수호출확인");

    //※obj 변수에는 form 객체가 저장되어 있다.
    //필요에 따라 전송하기 전에 검증 절차를 추가하는 것이 가능하다.

    obj.submit(); //obj자체가 form이다.
    //『폼객체.submit();』 함수의 호출을 통해
    //form 객체의 데이터를 서버로 전송하는 것이 가능하다.
  }
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
										<li class="nav-item px-2"><a class="nav-link fw-bold" href="explorer.do?user_id=${sessionID }">EXPLORER(캠핑장)</a></li>
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
										<div id="cF">
												<form action="explorerCf.do" method="post">
														<select name="c_F" id="c_F" onchange="formChange(this.form)">
																<option>유/무료 선택</option>
																<option value='0'>유료</option>
																<option value='1'>무료</option>
														</select>
												</form>
												<!-- <ul class="nav">
																<li><a href="explorerCf.do?board_num=0"><span class="fa"></span>무료캠핑장</a></li>
																<li class="active"><a href="boardFreeList.do?board_num=1"><span class="fa"></span>유료캠핑장</a></li>
														</ul> -->
										</div>
										<form class="form-horizontal">
												<h3 class="fieldset-title" id="camp_Id">총 ${totCnt}개 캠핑장이 검색되었습니다.</h3>
												<div class="form-group avatar">
														<figure class="figure col-md-2 col-sm-3 col-xs-12">
														</figure>
												</div>
												<table>
														<c:if test="${totCnt > 0}">
																<c:forEach var="camp_InfoDto" items="${listCf}">
																		<div id="article">
																				<div id="camp_Images">
																						<a href='campView.do?camp_Id=${camp_InfoDto.camp_Id}'><img alt="error" src="images/${camp_InfoDto.camp_Images}.jpg"></a>
																				</div>
																				<h2 id="camp_Name">
																						&nbsp;&nbsp;<a href='campView.do?camp_Id=${camp_InfoDto.camp_Id}'>${camp_InfoDto.camp_Name}</a>
																				</h2>
																				<hr>
																				<div id="camp_Addr">
																						<p>
																								<strong>캠핑장 주소</strong> : ${camp_InfoDto.camp_Addr}
																						</p>
																						<p>
																								<strong>캠핑장 전화</strong> : ${camp_InfoDto.camp_Tel}
																						</p>
																						<p>
																								<strong>캠핑장 설명</strong> : ${camp_InfoDto.camp_Desc}
																						</p>
																				</div>
																				<p>
																						<strong>&nbsp;&nbsp;&nbsp;&nbsp;캠핑장 예약</strong> :
																						<button onclick="alert('예약 전 캠핑장 현황 확인 부탁드립니다. Campro는 예약 링크만 제공하며 서비스는 제공하지않습니다.')">
																								<a href="${camp_InfoDto.res_Id}" target="_blank">예약하기</a>
																						</button>
																				</p>
																				<p>
																						<img class="images2" alt="error" src="images/${camp_InfoDto.camp_Item}.jpg"></img>
																				</p>
																		</div>
																		<c:set var="startNum" value="${startNum - 1}" />
																</c:forEach>
														</c:if>
														<c:if test="${totCnt == 0}">
																<tr>
																		<td colspan=7>데이터가 없네</td>
																</tr>
														</c:if>
												</table>
												<hr>
												<footer>
														<div style="text-align: center;">
																<c:if test="${startPage > blockSize}">
																		<a href='explorerCf.do?pageNum=${startPage-blockSize}&c_F=${c_F}'>[이전]</a>
																</c:if>
																<c:forEach var="i" begin="${startPage}" end="${endPage}">
																		<a href='explorerCf.do?pageNum=${i}&c_F=${c_F}'>[${i}]</a>
																</c:forEach>
																<c:if test="${endPage < pageCnt}">
																		<a href='explorerCf.do?pageNum=${startPage+blockSize}&c_F=${c_F}'>[다음]</a>
																</c:if>
														</div>
												</footer>
										</form>
								</div>
						</section>
				</div>
		</div>
		<div style="text-align: center; max-width: 100%; height: auto;">
				<img class="notice" alt="error" src="images/notice.jpg">
		</div>
		<%-- <div id="wrapper">
				<div id="header">
						<div id="cF">
								<form action="explorerCf.do" method="post">
										<select name="c_F" id="c_F" onchange="formChange(this.form)">
												<option>유/무료 선택</option>
												<option value='0'>유료</option>
												<option value='1'>무료</option>
										</select>
								</form>
						</div>
						<h2 id="camp_Id">총 ${totCnt}개 캠핑장이 검색되었습니다.</h2>
				</div>
				<c:if test="${totCnt > 0}">
						<c:forEach var="camp_InfoDto" items="${listCf}">
								<div id="article">
										<div id="camp_Images">
												<a href='campView.do?camp_Id=${camp_InfoDto.camp_Id}'><img alt="error" src="images/${camp_InfoDto.camp_Images}.jpg"></a>
										</div>
										<h2 id="camp_Name">
												&nbsp;&nbsp;<a href='campView.do?camp_Id=${camp_InfoDto.camp_Id}'>${camp_InfoDto.camp_Name}</a>
										</h2>
										<hr>
										<div id="camp_Addr">
												<p>
														<strong>캠핑장 주소</strong> : ${camp_InfoDto.camp_Addr}
												</p>
												<p>
														<strong>캠핑장 전화</strong> : ${camp_InfoDto.camp_Tel}
												</p>
												<p>
														<strong>캠핑장 설명</strong> : ${camp_InfoDto.camp_Desc}
												</p>
										</div>
										<p>
												<strong>&nbsp;&nbsp;&nbsp;&nbsp;캠핑장 예약</strong> :
												<button onclick="alert('예약 전 캠핑장 현황 확인 부탁드립니다. Campro는 예약 링크만 제공하며 서비스는 제공하지않습니다.')">
														<a href="${camp_InfoDto.res_Id}" target="_blank">예약하기</a>
												</button>
										</p>
										<p>
												<img class="images2" alt="error" src="images/${camp_InfoDto.camp_Item}.jpg"></img>
										</p>
								</div>
								<c:set var="startNum" value="${startNum - 1}" />
						</c:forEach>
				</c:if>
				<c:if test="${totCnt == 0}">
						<tr>
								<td colspan=7>데이터가 없네</td>
						</tr>
				</c:if>
				<footer>
						<div style="text-align: center;">
								<c:if test="${startPage > blockSize}">
										<a href='explorerCf.do?pageNum=${startPage-blockSize}&c_F=${c_F}'>[이전]</a>
								</c:if>
								<c:forEach var="i" begin="${startPage}" end="${endPage}">
										<a href='explorerCf.do?pageNum=${i}&c_F=${c_F}'>[${i}]</a>
								</c:forEach>
								<c:if test="${endPage < pageCnt}">
										<a href='explorerCf.do?pageNum=${startPage+blockSize}&c_F=${c_F}'>[다음]</a>
								</c:if>
						</div>
						<div style="text-align: center; width: auto; height: auto;">
								<img class="notice" alt="error" src="images/notice.jpg">
						</div>
				</footer>
		</div> --%>
		<script src="/js/jquery-3.3.1.min.js"></script>
		<script src="/js/popper.min.js"></script>
		<script src="/js/bootstrap.min.js"></script>
		<script src="/js/main.js"></script>
</body>
</html>
