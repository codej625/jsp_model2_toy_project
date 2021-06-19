<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저정보관리</title>
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
<style type="text/css">
* {
  font-family: 'Roboto Condensed';
}

body {
  padding-top: 100px;
  background: #f9f9fb;
}

table {
  width: 110%;
  text-justify: auto;
}

</style>
</head>
<body>
		<%-- 회원정보 리스트--%>
		<h2>회원정보 리스트</h2>
		<input type="button" value="메인페이지" onclick="location.href='userInfo.do'">
		<table border="1">
				<tr>
<<<<<<< HEAD
						<th>사용자ID</th>
						<th>회원종류</th>
						<th>비밀번호</th>
						<th>이름</th>
						<th>전화번호</th>
						<th>주소</th>
						<th>이메일</th>
						<th>성별</th>
						<th>가입일</th>
						<th>회원정보 수정일</th>
						<th>탈퇴여부</th>
=======
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
					<td><c:choose>
                    		<c:when test="${member.user_drop == 0 }">사용중</c:when>
                  		</c:choose>
                  		<c:choose>
                     		<c:when test="${member.user_drop == 1 }">사용정지</c:when>
                  		</c:choose>
               			<c:if test="${member.user_drop == 1 }">
               				<input type="button" value="복구" onclick="location.href='userDeleteUpdate.do?user_id=${member.user_id }'">
               			</c:if></td>
>>>>>>> 01_team
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
										<td>${member.user_drop }<input type="button" value="변경" onclick="location.href='userDeleteUpdate.do?user_id=${member.user_id }'"></td>
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