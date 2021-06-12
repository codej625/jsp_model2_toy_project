<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<title>글작성</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<form action="postWritePro.do?board_num=0&pageNum=1&post_num=2"
		method="post">
		<table>
			<caption>게시판 글쓰기</caption>
			<tr>
				<td>이름</td>
				<td><input type="text" name="camp_Name" required="required"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="camp_Tel" required="required">
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="camp_Addr" required="required">
				</td>
			</tr>
			<tr>
				<td>지역</td>
				<td><input type="text" name="camp_Loc" required="required">
				</td>
			</tr>
			<tr>
				<td>유/무료</td>
				<td><input type="text" name="c_F" required="required">
				</td>
			</tr>
			<tr>
				<td>예약링크</td>
				<td><input type="text" name="res_Id" required="required">
				</td>
			</tr>
			<tr>
				<td>캠핑장소개</td>
				<td><textarea rows="10" cols="30" name="camp_Desc" required="required"></textarea></td>
			</tr>
			<tr>
				<td><input type="submit" value="확인"></td>
				<td><input type="reset" value="다시작성"></td>
			</tr>
		</table>
	</form>
</body>
</html>