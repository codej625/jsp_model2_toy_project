<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete</title>
</head>
<body>
	<c:if test="${result > 0 }">
		<script type="text/javascript">
			alert("삭제 완료");
			location.href = "campList.do?pageNum=${pageNum}";
		</script>
	</c:if>
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert("error");
			location.href = "campContent.do?camp_Id=${camp_Id}&pageNum=${pageNum}";
		</script>
	</c:if>
</body>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>Delete</title>
</head>
<body>
	<c:if test="${result > 0 }">
		<script type="text/javascript">
			alert("삭제 완료");
			location.href = "campList.do?pageNum=${pageNum}";
		</script>
	</c:if>
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert("error");
			location.href = "campContent.do?camp_Id=${camp_Id}&pageNum=${pageNum}";
		</script>
	</c:if>
</body>
>>>>>>> 03_team
</html>