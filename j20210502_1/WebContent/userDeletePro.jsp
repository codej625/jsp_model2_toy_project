<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/userInfo.css">
<!-- Style -->
<link rel="stylesheet" href="/css/style.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<style>
* {
  font-family: 'Roboto Condensed';
}

body {
  display: none; /*숨기기*/
  position: fixed;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.9);
}
</style>
</head>
<body>
		<%-- 회원정보 삭제 결과 --%>
		<c:if test="${result == 1 }">
				<script type="text/javascript">
          alert("회원탈퇴 완료");
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