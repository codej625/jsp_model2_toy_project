<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	width: 50%;
}
</style>
<script type="text/javascript" src="js/jquery.js"></script>
</head>
<body>
	<form action="" method="post">
		<table border="1">
			<tr>
			<th>캠핑장 코드</th><th>캠핑장 이름</th>
			</tr>
			<c:forEach var="like" items="${list }">
				<tr>
<!-- 					<td></td> -->
					<td>${like.camp_id }</td>
					<td>${like.camp_name }</td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>