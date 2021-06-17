<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function chk() {
		if(frm.new_pw.value != frm.new_pw2.value) {
			alert("암호가 일치하지 않습니다.");
			frm.new_pw2.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<%-- 회원정보 수정 폼 --%>
	<form action="userUpdatePro.do" method="post" onsubmit="return chk()">
		<table border="1">
			<caption>
				<h2>회원정보 수정</h2>
			</caption>
			<tr>
				<td>아이디</td>
				<td>${member.user_id }<input type="hidden" name="user_id" value="${member.user_id }"></td>
			</tr>
			<tr>
				<td>현재 비밀번호</td>
				<td><input type="password" name="cur_pw" required="required"></td>
			</tr>
			<tr>
				<td>새로운 비밀번호</td>
				<td><input type="password" name="new_pw" required="required"></td>
			</tr>
			<tr>
				<td>새로운 비밀번호 재입력</td>
				<td><input type="password" name="new_pw2" required="required"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${member.user_name }<input type="hidden" name="user_name" required="required" value="${member.user_name }"></td>
			</tr>

			<tr>
				<td>전화번호</td>
				<td><input type="tel" name="user_tel" required="required"
					pattern="\d{2,3}-\d{3,4}-\d{4}" placeholder="xxx-xxxx-xxxx"
					title="2,3자리-3,4자리-4자리" value="${member.user_tel }"></td>
			</tr>

			<tr>
				<td>주소</td>
				<td><input type="text" name="user_addr" required="required" value="${member.user_addr }"></td>
			</tr>

			<tr>
				<td>이메일</td>
				<td>${member.user_email }<input type="hidden" name="user_email" required="required" value="${member.user_email }"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>${member.user_gender }<input type="hidden" name="user_gender" required="required" value="${member.user_gender }"></td>
			</tr>

			<tr>
				<td><input type="submit" value="확인">
				<input type="reset" value="취소"></td>
			</tr>
		</table>
	</form>
</body>
</html>