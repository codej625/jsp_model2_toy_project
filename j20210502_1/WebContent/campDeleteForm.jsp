<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete</title>
</head>
<body>
	<h2>정말 삭제하시겠습니까?</h2>
	<form action="campDeletePro.do?camp_Id=${camp_Id}&pageNum=${pageNum}"
		method="post">
		<p>
			<input type="submit" value="확인">
		</p>
		<p>
			<input type="button" value="돌아가기"
				onclick="location.href='campContent.do?camp_Id=${camp_Id}&pageNum=${pageNum}'">
		</p>
	</form>
</body>
</html>