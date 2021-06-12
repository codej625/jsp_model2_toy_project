<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑장 등록</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<form action="campWritePro.do?pageNum=${pageNum}" method="post">
		<table>
			<caption>캠핑장 등록</caption>
			<tr>
				<td>캠핑장이름</td>
				<td><input type="text" name="camp_Name" required="required"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="camp_Tel" required="required"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="camp_Addr" required="required"></td>
			</tr>
			<tr>
				<td>지역</td>
				<td><input type="text" name="camp_Loc" required="required"></td>
				<td style="color: red">Ex) 서울</td>
			</tr>
			<tr>
				<td>유료/무료</td>
				<td><input type="text" name="c_F" required="required"></td>
				<td style="color: red">Ex) 무료일시 = 1입력, 유료 = 0입력</td>
			</tr>
			<tr>
				<td>예약링크</td>
				<td><input type="text" name="res_Id" required="required"></td>
				<td style="color: red">Ex) https://www.google.com</td>
			</tr>
			<tr>
				<td>캠핑장설명</td>
				<td><textarea rows="10" cols="20" name="camp_Desc"
						required="required"></textarea></td>
			</tr>
			<tr>
				<td>캠핑장이미지</td>
				<td><input type="text" name="camp_Images" required="required"></td>
				<td style="color: red">Ex) 캠핑장 번호와 동일하게 맞춘다. 캠핑장 번호가 1이라면 1입력</td>
			</tr>
			<tr>
				<td>캠핑장전경1</td>
				<td><input type="text" name="camp_View1" required="required"></td>
				<td style="color: red">Ex) 캠핑장 번호가 1이라면 1-1 입력</td>
			</tr>
			<tr>
				<td>캠핑장전경2</td>
				<td><input type="text" name="camp_View2" required="required"></td>
				<td style="color: red">Ex) 캠핑장 번호가 1이라면 1-2 입력</td>
			</tr>
			<tr>
				<td>캠핑장전경3</td>
				<td><input type="text" name="camp_View3" required="required"></td>
				<td style="color: red">Ex) 캠핑장 번호가 1이라면 1-3 입력</td>
			</tr>
			<tr>
				<td>편의시설</td>
				<td><input type="text" name="camp_Item" required="required"></td>
				<td style="color: red">Ex) 캠핑장 번호가 1이라면 1_1 입력</td>
			</tr>
			<tr>
				<td><input type="submit" value="확인"></td>
				<td><input type="reset" value="다시작성"></td>
			</tr>
		</table>
	</form>
</body>
</html>