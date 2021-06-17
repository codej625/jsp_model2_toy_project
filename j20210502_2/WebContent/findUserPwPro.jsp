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
	<%-- 비밀번호 찾기 결과 --%>
	<c:if test="${result == 1 }">
		<script type="text/javascript">
			alert("비밀번호가 1234로 초기화됐습니다. 비밀번호를 변경해주시길 바랍니다.");
			location.href = "userLoginForm.do";
		</script>
	</c:if>
	<c:if test="${result != 1 }">
		<script type="text/javascript">
			alert("입력하신 정보와 일치하는 계정이 없습니다.");
			history.back();
		</script>
	</c:if>
</body>
</html>