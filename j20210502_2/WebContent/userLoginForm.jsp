<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 로그인 폼 --%>
	<h2>로그인</h2>
	<form action="userLoginPro.do" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="user_id" required="required">
					<input id="chk_id" type="checkbox" name="idcheck" onclick="confirmSave(this)">아이디저장</td>
			</tr>
			<tr>
				<td>암호</td>
				<td><input type="password" name="user_pw" required="required"></td>
			</tr>
			<tr>
				<td><input type="submit" value="확인"></td>
				<td><input type="reset" value="취소"></td>
			</tr>
		</table>
	</form>
	<p>
		<input type="button" value="아이디찾기" onclick="location.href='findUserIdForm.do'">
		<input type="button" value="비밀번호찾기" onclick="location.href='findUserPwForm.do'">
	</p>
	<p>
		<input type="button" value="회원가입" onclick="location.href='userAgree.do'">
	</p>
	<script type="text/javascript">
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
			if (user_id != "") {
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
					+ ((exdays == null) ? "" : "; expires="
							+ exdate.toGMTString());
			document.cookie = user_id + "=" + cookieValue;
		}

		function getCookie(user_id) {
			user_id = user_id + '=';
			var cookieData = document.cookie;
			var start = cookieData.indexOf(user_id);
			var cookieValue = '';
			if (start != -1) {
				start += user_id.length;
				var end = cookieData.indexOf(';', start);
				if (end == -1)
					end = cookieData.length;
				cookieValue = cookieData.substring(start, end);
			}
			return unescape(cookieValue);
		}

		function deleteCookie(user_id) {
			var expireDate = new Date();
			expireDate.setDate(expireDate.getDate() - 1);
			document.cookie = user_id + "= " + "; expires="
					+ expireDate.toGMTString();
		}

		function bodyOnload() {
			var chk_id = document.getElementById('chk_id');
			form.user_id.value = getCookie("user_id");
			if (form.user_id.value != "")
				form.chk_id.checked = true;
		}
	</script>
</body>
</html>