<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 아이디찾기 결과 --%>
	<c:if test="${user_id == null }">
		<script type="text/javascript">
			alert("입력하신 정보와 일치하는 아이디가 없습니다.");
			history.back();
		</script>
	</c:if>
	<c:if test="${user_id != null }">
		<script type="text/javascript">
			alert("회원님의 아이디는"+'${user_id}'+"입니다.");
			location.href="userLoginForm.do"
		</script>
	</c:if>
</body>
</html>