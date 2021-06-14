<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>campContentView</title>
<link rel="stylesheet" href="css/style3.css" type="text/css">
</head>
<body>
	<div id="wrapper">
		<div class="box1">
			<div class=campNumber>
				<h3>등록번호 : ${camp_InfoDto.camp_Id}</h3>
			</div>
		</div>
		<div class="box2">
			<div class="campName">
				<h2>캠핑장 상호명 : ${camp_InfoDto.camp_Name}</h2>
			</div>
		</div>
		<div class="box3">
			<div class=campImage>
				<img alt="error" src="images/${camp_InfoDto.camp_Images}.jpg">
			</div>
		</div>
		<div class="box4">
			<div class=campTable>
				<table>
					<tr>
						<th class="th">전화번호</th>
						<td>${camp_InfoDto.camp_Tel}</td>
					</tr>
					<tr>
						<th class="th">주소</th>
						<td>${camp_InfoDto.camp_Addr}</td>
					</tr>
					<tr>
						<th class="th">지역</th>
						<td>${camp_InfoDto.camp_Loc}</td>
					</tr>
					<tr>
						<th class="th">유료/무료</th>
						<td>${camp_InfoDto.c_F}</td>
						<td class="td2" style="color: red">1이면 무료, 0이면 유료</td>
					</tr>
					<tr>
						<th class="th">예약링크</th>
						<td>${camp_InfoDto.res_Id}</td>
					</tr>
					<tr>
						<th class="th">캠핑장설명</th>
						<td>${camp_InfoDto.camp_Desc}</td>
					</tr>
					<tr>
						<th class="th">편의시설</th>
						<td><img alt="error"
							src="images/${camp_InfoDto.camp_Item}.jpg"></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="box5">
			<div class="button">
				<input type="button" value="수정"
					onclick="location.href='campUpdateForm.do?camp_Id=${camp_InfoDto.camp_Id}&pageNum=${pageNum}'">
				<input type="button" value="삭제"
					onclick="location.href='postUpdateForm.do?camp_Id=${camp_InfoDto.camp_Id}&pageNum=${pageNum}'">
				<input type="button" value="목록"
					onclick="location.href='campList.do?pageNum=${pageNum}'">
			</div>
		</div>
	</div>
</body>
</html>