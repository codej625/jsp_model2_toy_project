<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
</head>
<body>
	<%-- 회원정보 리스트--%>
	<h2>회원정보 리스트</h2>
	<input type="button" value="메인페이지" onclick="location.href='userInfo.jsp'">
	<table border="1">
		<tr>
			<th>사용자ID</th>
			<th>회원종류</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>이메일</th>
			<th>성별</th>
			<th>가입일</th>
			<th>비밀번호 변경일</th>
			<th>탈퇴여부</th>
		</tr>
		<c:if test="${totCnt > 0 }">
			<c:forEach var="member" items="${list }">
				<tr>
					<td>${member.user_id }</td>
					<td>${member.user_code }</td>
					<td>${member.user_pw }</td>
					<td>${member.user_name }</td>
					<td>${member.user_tel }</td>
					<td>${member.user_addr }</td>
					<td>${member.user_email }</td>
					<td>${member.user_gender }</td>
					<td>${member.user_reg }</td>
					<td>${member.user_pwd }</td>
					<td>${member.user_drop }</td>
				</tr>
				<c:set var="startNum" value="${startNum -1 }" />
			</c:forEach>
		</c:if>
	</table>

	<div style="text-align: center;">
		<c:if test="${startPage > blockSize }">
			<a href='userList.do?pageNum=${startPage-blockSize }'>[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<a href='userList.do?pageNum=${i }'>[${i }]</a>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
			<a href='userList.do?pageNum=${startPage+blockSize }'>[다음]</a>
		</c:if>
	</div>

</body>
</html>