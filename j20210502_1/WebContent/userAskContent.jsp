<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" type="text/css" href="style.css"> -->
<style type="text/css">
	table { width: 80%; }
</style>
</head>
<body>
	<table border="1">
		<caption><h2>문의사항 내역</h2>${board_num }</caption>
		<tr>
			<td width="50">번호</td>
			<td>${post.post_num}</td>
			<input type="text" id="Content Board_num" value="${board_num}">
		</tr>
		<tr>
			<td>제목</td>
			<td>${post.post_name}</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${post.user_id}</td>
		</tr>
		<tr>
			<td>작성일</td>
			<td>${post.post_date}</td>
		</tr>
		<tr>
			<td>조회수</td>
			<td>${post.post_view}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td><pre>${post.post_cont}</pre></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="수정" onclick="location.href='postUpdateForm.do?board_num=${post.board_num}&post_num=${post.post_num}&pageNum=${pageNum}'">
				<c:if test="${sessionCODE != 2}">
					<input type="button" value="답변작성" onclick="location.href='userAskWriteForm.do?board_num=3&post_num=${post.post_num}&pageNum=${pageNum}&user_id=${post.user_id}'">
				</c:if>
				<input type="button" value="삭제" onclick="location.href='postDeleteForm.do?board_num=${board_num}&post_num=${post_num}&user_id=${post.user_id}'">
				<input type="button" value="목록" onclick="location.href='boardList.do?pageNum=${pageNum}'">
			</td>
		</tr>
		<tr>
			<td><input type="text" id="board_num" value="${board_num}"> 
			<input type="text" id="post_num" value="${post_num}">
			<input type="text" id="user_code" value="${sessionCODE}">
			<input type="text" id="user_id" value="${user_id }"></td>
		</tr>
	</table>
</body>
</html>