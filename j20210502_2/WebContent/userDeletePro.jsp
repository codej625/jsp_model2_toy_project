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
	<%-- 회원정보 삭제 결과 --%>
	<c:if test="${result == 1 }">
		<script type="text/javascript">
			alert("회원탈퇴 완료");
			location.href = "index.jsp";
		</script>
	</c:if>
	<c:if test="${result != 1 }">
		<script type="text/javascript">
			alert("비밀번호를 잘못 입력하였습니다.");
			history.back();
		</script>
	</c:if>
</body>
</html>