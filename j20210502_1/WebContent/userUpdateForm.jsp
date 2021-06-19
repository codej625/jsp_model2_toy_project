<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<script type="text/javascript">
  function chk() {
    if (frm.new_pw.value != frm.new_pw2.value) {
      alert("암호가 일치하지 않습니다.");
      frm.new_pw2.focus();
      return false;
    }
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
																<li><a href="userAskForm.do?user_id=${sessionID}&user_code=${sessionCODE}&board_num=3"><span class="fa fa-envelope"></span> 문의내역</a></li>
																<li><a href="userWriteList.do?user_id=${sessionID}"><span class="fa fa-envelope"></span> 내가 쓴글 </a></li>
																<c:if test="${sessionCODE != 2}">
																		<li><a href="userList.do?user_id=${sessionID}"><span class="fa fa-cog"></span> 모든사용자 정보</a></li>
																</c:if>
														</ul>
												</nav>
										</div>
										<div class="content-panel">
												<form class="form-horizontal" action="userUpdatePro.do" method="post" name="frm" onsubmit="return chk()">
														<fieldset class="fieldset">
																<h3 class="fieldset-title">회원정보 수정</h3>
																<div class="form-group">
																		<label class="col-md-2 col-sm-3 col-xs-12 control-label">아이디</label>
																		<div class="col-md-10 col-sm-9 col-xs-12">
																				<input type="text" name="user_id" class="form-control" value="${member.user_id }" readonly />
																		</div>
																</div>
														</fieldset>
														<fieldset class="fieldset">
																<div class="form-group">
																		<label class="col-md-2  col-sm-3 col-xs-12 control-label">현재비밀번호</label>
																		<div class="col-md-10 col-sm-9 col-xs-12">
																				<input type="password" class="form-control" name="cur_pw" required="required">
																		</div>
																</div>
																<div class="form-group">
																		<label class="col-md-2  col-sm-3 col-xs-12 control-label">새로운 비밀번호</label>
																		<div class="col-md-10 col-sm-9 col-xs-12">
																				<input type="password" class="form-control" name="new_pw" required="required">
																		</div>
																</div>
																<div class="form-group">
																		<label class="col-md-2  col-sm-3 col-xs-12 control-label">새로운 비밀번호 재입력</label>
																		<div class="col-md-10 col-sm-9 col-xs-12">
																				<input type="password" class="form-control" name="new_pw2" required="required">
																		</div>
																</div>
																<div class="form-group">
																		<label class="col-md-2  col-sm-3 col-xs-12 control-label">이름</label>
																		<div class="col-md-10 col-sm-9 col-xs-12">
																				<input type="text" class="form-control" name="user_name" value="${member.user_name }" required="required">
																		</div>
																</div>
																<div class="form-group">
																		<label class="col-md-2  col-sm-3 col-xs-12 control-label">이메일</label>
																		<div class="col-md-10 col-sm-9 col-xs-12">
																				<input type="email" class="form-control" name="user_email" value="${member.user_email }" required="required">
																		</div>
																</div>
																<div class="form-group">
																		<label class="col-md-2  col-sm-3 col-xs-12 control-label">전화번호</label>
																		<div class="col-md-10 col-sm-9 col-xs-12">
																				<input type="tel" class="form-control" name="user_tel" required="required" pattern="\d{2,3}-\d{3,4}-\d{4}" placeholder="xxx-xxxx-xxxx" title="2,3자리-3,4자리-4자리" value="${member.user_tel }">
																		</div>
																</div>
																<div class="form-group">
																		<label class="col-md-2  col-sm-3 col-xs-12 control-label">사용자 주소</label>
																		<div class="col-md-10 col-sm-9 col-xs-12">
																				<input type="text" class="form-control" name="user_addr" value="${member.user_addr }" required="required">
																		</div>
																</div>
																<%-- <table>
								
									<div class="form-group">
									<label class="col-md-2 col-sm-3 col-xs-12 control-label">사용자
										이름</label>
									<div class="col-md-10 col-sm-9 col-xs-12">
										<input type="text" class="form-control" value="#유저ID">
									</div>
									<tr>
										<td>아이디</td>
										<td>${member.user_id }<input type="hidden" name="user_id"
											value="${member.user_id }"></td>
									</tr>
									<tr>
										<td>현재 비밀번호</td>
										<td><input type="password" name="cur_pw"
											required="required"></td>
									</tr>
									<tr>
										<td>새로운 비밀번호</td>
										<td><input type="password" name="new_pw"
											required="required"></td>
									</tr>
									<tr>
										<td>새로운 비밀번호 재입력</td>
										<td><input type="password" name="new_pw2"
											required="required"></td>
									</tr>
									<tr>
										<td>이름</td>
										<td>${member.user_name }<input type="hidden"
											name="user_name" required="required"
											value="${member.user_name }"></td>
									</tr>

									<tr>
										<td>전화번호</td>
										<td><input type="tel" name="user_tel" required="required"
											pattern="\d{2,3}-\d{3,4}-\d{4}" placeholder="xxx-xxxx-xxxx"
											title="2,3자리-3,4자리-4자리" value="${member.user_tel }"></td>
									</tr>

									<tr>
										<td>주소</td>
										<td><input type="text" name="user_addr"
											required="required" value="${member.user_addr }"></td>
									</tr>

									<tr>
										<td>이메일</td>
										<td>${member.user_email }<input type="hidden"
											name="user_email" required="required"
											value="${member.user_email }"></td>
									</tr>
									<tr>
										<td>성별</td>
										<td>${member.user_gender }<input type="hidden"
											name="user_gender" required="required"
											value="${member.user_gender }"></td>
									</tr>
								
								</table> --%>
														</fieldset>
														<hr>
														<div class="form-group">
																<div class="col-md-10 col-sm-9 col-xs-12 col-md-push-2 col-sm-push-3 col-xs-push-0">
																		<input class="btn btn-primary" type="submit" value="회원정보 수정">
																		<%-- 									<input class="btn btn-primary" type="button" value="회원탈퇴" onclick="location.href='userDeleteForm.do?user_id=${sessionID}'"> --%>
																</div>
														</div>
												</form>
										</div>
								</div>
						</section>
				</div>
		</div>
		<script src="/js/jquery-3.3.1.min.js"></script>
		<script src="/js/popper.min.js"></script>
		<script src="/js/bootstrap.min.js"></script>
		<script src="/js/main.js"></script>
</body>
</html>