<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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