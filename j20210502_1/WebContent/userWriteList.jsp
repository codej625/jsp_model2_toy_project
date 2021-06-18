<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css"> 
table {
	width: 100%;
}
</style>
<script type="text/javascript" src="js/jquery.js"></script>
</head>
<body>
<h2>내가 쓴 글</h2>
<table border="1">
		<tr>
			<th>번호</th>
			<th>분류번호</th>
			<th>작성일</th>
			<th>제목</th>
			<th>내용</th>
			<th>조회수</th>
		</tr>
		<c:if test="${totCnt > 0 }">
			<c:forEach var="write" items="${list1 }">
				<tr>
					<td>${startNum }</td>
					<td>
						<c:choose>
							<c:when test="${write.board_num == 0}">공지사항</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${write.board_num == 1}">마켓</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${write.board_num == 2}">자율게시판</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${write.board_num == 3}">문의사항</c:when>
						</c:choose>
					</td>
					<td>${write.post_date}</td>
					<td class="left" width=200>
						 <a href='postContent.do?board_num=${write.board_num}&post_num=${write.post_num}&pageNum=${currentPage}'>
							${write.post_name}</a>
					</td>
					<td>${write.post_cont}</td>
					<td>${write.post_view}</td>
				</tr>
				<c:set var="startNum" value="${startNum + 1 }" />
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
			<a href='list.do?pageNum=${startPage-blockSize}'>[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href='userWriteList.do?pageNum=${i}&user_id=${user_id}'>[${i}]</a>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
			<a href='list.do?pageNum=${startPage+blockSize}'>[다음]</a>
		</c:if>
	</div>
</body>
</html>