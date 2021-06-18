<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	td {
		text-align: center;
	}
	#a input {
		height: 100px;
		width: 300px;
	}
</style>
</head>
<body>
	<form action="userAskWritePro.do" method="post">

		<table border="1">
			<caption>
				<h2>문의사항</h2>
				<input type="text" name="board_num" value="${board_num }">
			</caption>
			<input type="text" name="user_id" value="${user_id }">
			<input type="text" name="post_num" value="${post_num }">
			<input type="text" name="pageNum" value="${pageNum }">
			re<input type="text" name="post_re" value="${post_re }">
			st<input type="text" name="post_restep" value="${post_restep }">
			lv<input type="text" name="post_lv" value="${post_lv }">
			<tr>
				<td>게시글번호</td>
				<td>${post_num +1 }</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="post_name" required="required"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td id="a"><input type="text" name="post_cont"
					required="required" width="300" height="300"></td>
			</tr>
			<tr>
				<td><input type="submit" value="확인">
				<input type="reset" value="취소"></td>
			</tr>
		</table>
	</form>

</body>
</html>