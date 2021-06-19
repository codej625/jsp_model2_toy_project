<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
<!-- 카카오맵  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 네비게이션, 세부디자인 -->
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/userInfo.css">
<link rel="stylesheet" href="/css/style.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<!-- Bootstrap CSS -->
<style type="text/css">
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box font-family: 'Roboto Condensed';
}

body {
  padding-top: 100px;
  background: #f9f9fb;
}

table {
  width: 110%;
  text-justify: auto;
}

#Content_Board_num, #board_num, #post_num {
  display: none;
}
</style>
</head>
<body>
		<div class="content">
				<div class="container">
						<table border="1">
								<caption>
										<h2>게시판 상세내역</h2>${board_num }</caption>
								<tr>
										<td width="50">번호</td>
										<td>${post.post_num}</td>
										<input type="text" id="Content_Board_num" value="${board_num}">
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
										<td colspan="2"><input type="button" value="수정" onclick="location.href='postUpdateForm.do?board_num=${post.board_num}&post_num=${post.post_num}&pageNum=${pageNum}'"> <input type="button" value="답변작성" onclick="location.href='postWriteForm.do?post_num=${post.post_num}&pageNum=${pageNum}'"> <input type="button" value="삭제" onclick="location.href='postDeleteForm.do?board_num=${board_num}&post_num=${post_num}'"> <input type="button" value="목록" onclick="location.href='boardList.do?pageNum=${pageNum}'"></td>
								</tr>
								<tr>
										<td><input type="text" id="board_num" value="${board_num}"> <input type="text" id="post_num" value="${post_num}"></td>
								</tr>
						</table>
				</div>
		</div>
		<script src="/js/jquery-3.3.1.min.js"></script>
		<script src="/js/popper.min.js"></script>
		<script src="/js/bootstrap.min.js"></script>
		<script src="/js/main.js"></script>
</body>
</html>