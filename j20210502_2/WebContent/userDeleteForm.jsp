<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 회원정보 삭제 폼 --%>
	<h2>탈퇴하려면 암호를 입력하세요.</h2>
	<form action="userDeletePro.do" method="post">
		<fieldset>
			<label for="user_pw">암호</label>
			<input type="password" name="user_pw" required="required" value="${member.user_pw }"><p>
			<input type="submit" value="확인">
		</fieldset>
	</form>
</body>
</html>