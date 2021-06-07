<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>아이디찾기</h2>
	<form action="findUserPwPro.do" method="post" name="frm">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="user_id"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="email" name="user_email"></td>
			</tr>
		</table>
		<p><input type="submit" value="확인"><input type="reset" value="취소"></p>
	</form>
</body>
</html>