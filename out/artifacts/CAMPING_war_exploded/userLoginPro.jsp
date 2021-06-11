<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 로그인 결과 --%>
	<c:if test="${result >0 }">
		<script type="text/javascript">
// 			alert("로그인 완료");
			location.href = "userInfo.jsp";
		</script>
	</c:if>
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert("암호가 맞지않습니다!");
			location.href = "userLoginForm.do";
		</script>
	</c:if>
	<c:if test="${result == -1 }">
		<script type="text/javascript">
			alert("가입된 아이디가 없습니다");
			location.href = "userLoginForm.do";
		</script>
	</c:if>

</body>
</html>