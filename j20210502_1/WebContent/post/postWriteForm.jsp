<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<title>글작성</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<form action="postWritePro.do?board_num=${board_num}&pageNum=${pageNum}&post_num=${post_num + 1}"method="post">
		<input type="text" name="board_num" value="${board_num}">
		<input type="text" name="pageNum" value="${pageNum }">
		<input type="text" name="post_num" value="${post_num +1}">
		<table>
			<caption>
				<h2>게시판 글쓰기</h2>
			</caption>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="user_id" required="required"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="post_name" required="required">
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="10" cols="30" name="post_cont"
						required="required"></textarea></td>
			</tr>
			<tr>
				<td><input type="submit" value="확인"></td>
				<td><input type="reset" value="다시작성"></td>
			</tr>
		</table>
	</form>
</body>
</html>