<<<<<<< .merge_file_a47964
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CAMPVIEW</title>
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
			<img alt="error"
				src="https://www.gocamping.or.kr/upload/camp/1900/thumb/thumb_720_9097zScU1JGVw9ogs5WhU7nk.jpg">
		</div>
		<div class="box3">
			<table>
				<tr>
					<th id="th">주소</th>
					<td id="td">${Camp_InfoDto.camp_Loc}</td>
				</tr>
				<tr>
					<th>문의처</th>
					<td></td>
				</tr>
				<tr>
					<th>지역</th>
					<td></td>
				</tr>
				<tr>
					<th id="th2">???</th>
					<td id="td2"></td>
				</tr>
			</table>
			<div class="button1">
				<ul>
					<li><a class="color" href=".do">예약하기</a></li>
				</ul>
			</div>
		</div>
		<div class="box4">
			<div class="button2">
				<ul>
					<li><a id="1" class="color" href="campView.jsp#1">캠핑장소개</a></li>
					<li><a class="color" href=".do">여행후기</a></li>
					<li><a class="color" href=".do">공지사항</a></li>
				</ul>
			</div>
		</div>
		<div class="box5">
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
=======
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
					<td id="td">${Camp_InfoDto.camp_Addr}</td>
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
					<th id="th2">운영일</th>
					<td id="td2">평일 + 주말</td>
				</tr>
			</table>
		</div>
		<div class="box4">
			<div class="res">
				<a id="button"
					onclick="alert('예약 전 캠핑장에 현황 확인 부탁드립니다. Campro는 예약 링크만 제공하며 서비스는 제공하지 않습니다.')"
					href="${Camp_InfoDto.res_Id}">예약하기</a>
			</div>
		</div>
		<div class="box5">
			<div class="one"></div>
		</div>
		<div class="box6">
			<div>
				<div>
					<hr>
					<h1>캠핑장 전경</h1>
					<div>1</div>
				</div>
				<div>1</div>
				<div>2</div>
				<div>3</div>
			</div>
		</div>
		<div class="box7">
			<div id="map" style="width: 500px; height: 400px;"></div>
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=feeb7a09264f16b16711469db46a2446"></script>
			<script>
				var container = document.getElementById('map');
				var options = {
					center : new kakao.maps.LatLng(33.450701, 126.570667),
					level : 3
				};
				var map = new kakao.maps.Map(container, options);
			</script>
			<script type="text/javascript
"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=feeb7a09264f16b16711469db46a2446&libraries=services"></script>



			<div id="staticMap" style="width: 600px; height: 350px;"></div>

			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=feeb7a09264f16b16711469db46a2446"></script>
			<script>
				// 이미지 지도에 표시할 마커입니다
				// 이미지 지도에 표시할 마커를 아래와 같이 배열로 넣어주면 여러개의 마커를 표시할 수 있습니다 
				var markers = [ {
					position : new kakao.maps.LatLng(33.450701, 126.570667)
				}, {
					position : new kakao.maps.LatLng(33.450001, 126.570467),
					text : '텍스트를 표시할 수 있어요!' // text 옵션을 설정하면 마커 위에 텍스트를 함께 표시할 수 있습니다     
				} ];

				var staticMapContainer = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
				staticMapOption = {
					center : new kakao.maps.LatLng(33.450701, 126.570667), // 이미지 지도의 중심좌표
					level : 3, // 이미지 지도의 확대 레벨
					marker : markers
				// 이미지 지도에 표시할 마커 
				};

				// 이미지 지도를 생성합니다
				var staticMap = new kakao.maps.StaticMap(staticMapContainer,
						staticMapOption);
			</script>
		</div>
	</div>
</body>
>>>>>>> .merge_file_a08160
</html>