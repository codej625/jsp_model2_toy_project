<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VIEW</title>
<link rel="stylesheet" href="css/style2.css" type="text/css">

</head>
<body>
	<div class="wrapper">
		<div class="box1">
			<div id="header">
				<img alt="error"
					src="https://www.gocamping.or.kr/upload/camp/1900/thumb/thumb_720_9097zScU1JGVw9ogs5WhU7nk.jpg">
			</div>
		</div>
		<div class="box2">
			<img alt="error" src="images/${Camp_InfoDto.camp_Images}.jpg">
		</div>
		<div class="box3">
			<table>
				<tr>
					<th id="th">주소</th>
					<td id="td">${Camp_InfoDto.camp_Loc}</td>
				</tr>
				<tr>
					<th>문의처</th>
					<td>${Camp_InfoDto.camp_Tel}</td>
				</tr>
				<tr>
					<th>지역</th>
					<td>${Camp_InfoDto.camp_Loc}</td>
				</tr>
				<tr>
					<th id="th2">???</th>
					<td id="td2"></td>
				</tr>
			</table>
		</div>
		<div class="box4">
			<div class="res">
				<a class="color" href="">예약하기</a>
			</div>
		</div>
		<div class="box5">
			<div class="button2">
				<ul>
					<li><a id="1" class="color" href="">캠핑장소개</a></li>
					<li><a class="color" href=".do">여행후기</a></li>
					<li><a class="color" href=".do">공지사항</a></li>
				</ul>
			</div>
		</div>
		<div class="box6">
			<div>
				<div>
					<h1>캠핑장 전경</h1>
				</div>
				<div>
					<table>
						<tr>
							<th>주요시설</th>
							<td>시설</td>
						</tr>
						<tr>
							<th>주요시설</th>
							<td>시설</td>
						</tr>
						<tr>
							<th>주요시설</th>
							<td>시설</td>
						</tr>
						<tr>
							<th>주요시설</th>
							<td>시설</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>