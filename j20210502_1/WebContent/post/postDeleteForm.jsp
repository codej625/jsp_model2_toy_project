<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>정말 삭제하시겠습니까?</h2>
	<%-- <<<<<<< HEAD
	<form
		action="postDeletePro.do?board_num=${board_num }&post_num=${post_num}"
		method="post">
		<input type="text" id="board_num" value="${board_num }"> <input
			type="text" id="post_num" value="${post_num}"> 삭제 <input
			type="submit" value="확인"> 취소 <input type="button"
			value="돌아가기" onclick="location.href='boardList.do'">
	</form>
	======= --%>
	<form action="postDeletePro.do?board_num=${board_num }&post_num=${post_num}" method="post">
	<input type="hidden" id="board_num" value="${board_num }"> 
	<input type="hidden" id="post_num" value="${post_num}"> 삭제 
	<input type="submit" value="확인">
		<p>
			취소 <input type="button" value="돌아가기"
				onclick="location.href='boardList.do'">
		</p>
	</form>
</body>
</html>