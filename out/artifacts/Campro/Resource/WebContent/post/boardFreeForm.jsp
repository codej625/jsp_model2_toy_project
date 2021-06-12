<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>게시판</title>
<link rel="stylesheet" href="style.css" type="text/css">
<style type="text/css">
table {
	width: 100%;
}
</style>
<script type="text/javascript" src="js/jquery.js"></script>

</head>
<body>
	<h2>자유 게시판</h2>
	<table>
		<tr>
			<td><a href="postWriteForm.do?board_num=${board_num}&post_num=${post_num}&pageNum=${currentPage }">자유 글쓰기</a>
			<input type="text" id="board_num" value="${board_num}"> 
			<input type="text" id="pageNum" value="${currentPage }">
			<input type="text" id="post_num" value="${post_num}"></td>
		</tr>
		
		<tr>
			<td><a href="boardNoticeList.do?board_num=0">공지게시판</a></td>
		</tr>
		<tr>
			<td><a href="boardFreeList.do?board_num=1">자유게시판</a></td>
		</tr>
		 <tr>
			<td><a href="boardMarketList.do?board_num=2">마켓게시판</a></td>
		</tr> 
	</table>
	<table border="1">
		<tr>
			<th>게시번호</th>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:if test="${totCnt > 0 }">
			<c:forEach var="post" items="${list}">
				<tr>
					<td>${board_num }</td>
					<td>${post.post_num}</td> <!--게시글 번호 대신하여 사용-->
					<td class="left" width=200>
						<a href='postContent.do?board_num=${board_num}&post_num=${post.post_num}&pageNum=${currentPage}'>
							${post.post_name}</a>
					</td>
					<td>${post.user_id}</td>
					<td>${post.post_date}</td>
					<td>${post.post_view}</td>
				</tr>
				<c:set var="startNum" value="${startNum - 1 }" />
			</c:forEach>
			 </c:if>
		<c:if test="${totCnt == 0 }">
			<tr>
				<td colspan=7>데이터가 없네</td>
			</tr>
		</c:if>
	</table>

	<div style="text-align: center;">
		<c:if test="${startPage > blockSize }">
			<a href='boardList.do?pageNum=${startPage-blockSize}'>[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href='boardList.do?pageNum=${i}'>[${i}]</a>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
			<a href='boardList.do?pageNum=${startPage+blockSize}'>[다음]</a>
		</c:if>
	</div>
</body>
</html>