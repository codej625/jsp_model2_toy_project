<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
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
  margin: 0;
  padding: 0;
}

body {
  background: rgba(255, 255, 255, 0.9);
  margin: auto;
  position: fixed;
  width: 100%;
  height: 100%;
}

.exit {
    position: absolute;
    left: 50%;
    bottom: 10px;
    transform: translate(-50%,0);
    width: 60px;
    height: 30px;
    text-align: center;
    line-height: 30px;
    cursor: pointer;
}
</style>
</head>
<body>


		<%-- 회원정보 삭제 폼 --%>
		<h3>탈퇴하려면 암호를 입력하세요.</h3>
		<form action="userDeletePro.do" method="post">
				<fieldset>
						<label for="user_pw">암호</label> <input type="password" name="user_pw" required="required" value="${member.user_pw }">
						<p>
								<input class="exit" type="submit" value="확인">
				</fieldset>
		</form>
</body>
</html>