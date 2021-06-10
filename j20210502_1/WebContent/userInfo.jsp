<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 로그인 후 페이지 --%>
	<div>
		<header>
			<h1>마이페이지</h1>
		</header>
		<div>
			<input type="button" value="회원정보 수정" onclick="location.href='userUpdateForm.do?user_id=${sessionID}'">
		</div>
		<div>
			<input type="button" value="문의사항" onclick="location.href='userAskForm.do?user_id=${sessionID}&board_num=3'">
		</div>
		<div>
			<input type="button" value="로그아웃" onclick="location.href='userLogoutPro.do?user_id=${sessionID}'">
		</div>
		<div>
			<input type="button" value="회원탈퇴" onclick="location.href='userDeleteForm.do?user_id=${sessionID}'">
		</div>
		<div>
			<input type="text" name="user_code_chk" value="${sessionCODE}">
		</div>
		<div>
			<input type="button" value="내가 찜한 캠핑장" onclick="location.href='userLike.do?user_id=${sessionID}'">
		</div>
		<div>
			<input type="button" value="내가 쓴글" onclick="location.href='userWriteList.do?user_id=${sessionID}'">
		</div>
		
	</div>
	<c:if test="${sessionCODE != 2}">
		<button type="button" onclick="location.href='userList.do?user_id=${sessionID}'">모든회원정보</button>	
	</c:if>
</body>
</html>