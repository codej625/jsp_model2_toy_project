<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<%--스타일 시트--%>


</head>
<body onload="bodyOnload()">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script src="vendors/@popperjs/popper.min.js"></script>
<script src="vendors/bootstrap/bootstrap.min.js"></script>
<script src="vendors/is/is.min.js"></script>
<script
	src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
<script src="vendors/feather-icons/feather.min.js"></script>
<script src="js/theme.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@300;700&amp;display=swap"
	rel="stylesheet">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.0.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/53a8c415f1.js"
	crossorigin="anonymous"></script>
	<link href="css/login.css" rel="stylesheet" />
</head>

<div class="wrap">
	<div class="login" style="color:#495057;">
		<h2>Sign-in</h2>
		<div class="login_sns">
			<li><a href="#googleLogin"><i class="fab fa-google"></i></a></li>
		</div>
		<div class="login_id">
			<h4>아이디</h4>
			<label for="user_id"></label><input type="email" name="user_id"
				id="user_id" placeholder="아이디">
		</div>
		<div class="login_pw">
			<h4>비밀번호</h4>
			<label for="user_pw"></label><input type="password" name="user_pw"
				id="user_pw" placeholder="비밀번호">
		</div>
		<div class="login_etc">
			<div class="checkbox">
				<label for="chk_id"></label><input type="checkbox" name="idcheck"
					id="chk_id" onclick="confirmSave(this)"> 아이디저장
			</div>
			<br>
			<div class="forgot_id">
				<a href="findUserIdForm.do">아이디 찾기</a>
			</div>
			<div class="forgot_pw">
				<a href="findUserPwForm.do">비밀번호 찾기</a>
			</div>
		</div>
		<div class="submit">
			<input type="button" value="submit" id="testBtn">
		</div>
	</div>
</div>

<form id="form" action="userLoginPro.do" method="post" name="frm">
	<input type="hidden" id="id" name="user_id" value=""> 
	<input type="hidden" id="pw" name="user_pw" value="">
</form>

<!-- <form id="form" action="userLoginPro.do" method="post" name="frm">
	<table border="1">
		<tr>
			<td>아이디</td>
			<td><input type="text" name="user_id" required="required">
				<input id="chk_id" type="checkbox" name="idcheck"
				onclick="confirmSave(this)">아이디저장</td>
		</tr>
		<tr>
			<td>암호</td>
			<td><input type="password" name="user_pw" required="required"></td>
		</tr>
		<tr>
			<td><input type="submit" value="확인" onclick="chk()"></td>
			<td><input type="reset" value="취소"></td>
		</tr>
	</table>
</form>


<p>
	<input type="button" value="아이디찾기"
		onclick="location.href='findUserIdForm.do'"> <input
		type="button" value="비밀번호찾기"
		onclick="location.href='findUserPwForm.do'">
</p>
<p>
	<input type="button" value="회원가입"
		onclick="location.href='userAgree.do'">
</p>
 -->

<script type="text/javascript">
	$(document).ready(function() {
		// 		$("#testBtn").click(function(){
		// 			$("#id").val($("#user_id").val());
		// 			$("#pw").val($("#user_pw").val());
		// 			$( "#form" ).submit();
		// 		});

		$("#testBtn").bind("click", testBtnClickEvent);

	});

	function testBtnClickEvent() {
		$("#id").val($("#user_id").val());
		$("#pw").val($("#user_pw").val());
		$("#form").submit();
	}

	function confirmSave(checkbox) {
		var isRemember;

		if (checkbox.checked) {
			isRemember = confirm("이 PC에 로그인 정보를 저장하시겠습니까? PC방등의 공공장소에서는 개인정보가 유출될 수 있으니 주의해주십시오.");

			if (!isRemember)
				checkbox.checked = false;
		}
	}

	function chk() {
		if (frm.idcheck.checked)
			saveLogin(frm.user_id.value);
		else
			saveLogin("");
	}

	function saveLogin(user_id) {
		if (user_id !== "") {
			// userid 쿠키에 id 값을 1일간 저장
			setsave("user_id", user_id, 1);
		} else {
			// userid 쿠키 삭제
			setsave("user_id", user_id, -1);
		}
	}

	function setsave(user_id, value, exdays) {
		var exdate = new Date();
		exdate.setDate(exdate.getDate() + exdays);
		var cookieValue = escape(value)
				+ ((exdays == null) ? "" : "; expires=" + exdate.toUTCString());
		document.cookie = user_id + "=" + cookieValue;
	}

	function getCookie(user_id) {
		user_id = user_id + '=';
		var cookieData = document.cookie;
		var start = cookieData.indexOf(user_id);
		var cookieValue = '';
		if (start !== -1) {
			start += user_id.length;
			var end = cookieData.indexOf(';', start);
			if (end === -1)
				end = cookieData.length;
			cookieValue = cookieData.substring(start, end);
		}
		return unescape(cookieValue);
	}

	function deleteCookie(user_id) {
		var expireDate = new Date();
		expireDate.setDate(expireDate.getDate() - 1);
		document.cookie = user_id + "= " + "; expires="
				+ expireDate.toUTCString();
	}

	function bodyOnload() {
		var chk_id = document.getElementById('chk_id');
		form.user_id.value = getCookie("user_id");
		if (form.user_id.value !== "")
			form.chk_id.checked = true;
	}
</script>
</body>
</html>