<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/style2.css" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>VIEW</title>
</head>
<title>CAMPRO REVIEW & RATING</title>
    <link rel="stylesheet" href="./campReview.css"/>
    <script type="text/javascript" src="./campReview.js"></script>
</head>
<body>
	<div id="wrapper">
		<div class="box1">
			<div class="jumbotron">
				<!-- <div class="jumbotron" style="background-color: transparent !important;"> -->
				<h1>&nbsp;&nbsp;${camp_InfoDto.camp_Name}</h1>
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;즐거운 캠핑 생활</p>
				<hr>
			</div>
		</div>
		<div class="box2">
			<img alt="error" src="images/${camp_InfoDto.camp_Images}.jpg">
		</div>
		<div class="box3">
			<table>
				<tr>
					<th id="thTop">주소</th>
					<td id="tdTop">${camp_InfoDto.camp_Addr}</td>
				</tr>
				<tr>
					<th>문의처</th>
					<td>${camp_InfoDto.camp_Tel}</td>
				</tr>
				<tr>
					<th>지역</th>
					<td>${camp_InfoDto.camp_Loc}</td>
				</tr>
				<tr>
					<th id="thBottom">운영일</th>
					<td id="tdBottom">평일 + 주말</td>
				</tr>
			</table>
		</div>
		<div class="box4">
			<div id="resButtonBox">
				<a id="resButton"
					onclick="alert('예약 전 캠핑장 현황 확인 부탁드립니다. Campro는 예약 링크만 제공하며 서비스는 제공하지 않습니다.')"
					href="${camp_InfoDto.res_Id}" target="_blank">예약하기</a>
			</div>
		</div>
		<div class="box5">
			<div></div>
		</div>
		<div class="box6">
			<hr>
			<h3>&nbsp;&nbsp;&nbsp;&nbsp;캠핑장 전경</h3>
			<img class="images1" alt="error"
				src="images/${camp_InfoDto.camp_View1}.jpg"> <img
				class="images1" alt="error"
				src="images/${camp_InfoDto.camp_View2}.jpg"> <img
				class="images1" alt="error"
				src="images/${camp_InfoDto.camp_View3}.jpg">
		</div>
		
		<a href="${camp_InfoDto.map_Info}" target="_blank">
		<img width="504" height="310" src="${camp_InfoDto.map_Image}" style="border:1px solid #ccc"></a>
		<div class="hide" style="overflow:hidden;padding:7px 11px;border:1px solid #dfdfdf;border-color:rgba(0,0,0,.1);border-radius:0 0 2px 2px;background-color:#f9f9f9;width:482px;">
		<strong style="float: left;">
		<img src="//t1.daumcdn.net/localimg/localimages/07/2018/pc/common/logo_kakaomap.png" width="72" height="16" alt="카카오맵">
		</strong>
		<div style="float: right;position:relative">
		<a style="font-size:12px;text-decoration:none;float:left;height:15px;padding-top:1px;line-height:15px;color:#000" target="_blank" href="${camp_InfoDto.map_Info}">지도 크게 보기</a>
		</div>
		</div>
		
		<div class="box7">
			<h3>&nbsp;&nbsp;&nbsp;&nbsp;캠핑장 편의시설</h3>
			<img class="images2" alt="error"
				src="images/${camp_InfoDto.camp_Item}.jpg"></img>
		</div>

		<div class="box8">
			<h3>&nbsp;&nbsp;&nbsp;&nbsp;캠핑장 상세 소개</h3>
			<br>
			<p class="desc">${camp_InfoDto.camp_Desc}</p>
		</div>
	</div>
	
	<div class="wrap">
        <h1>후기</h1>
        <form name="reviewform" class="reviewform" method="post" action="/save">
            <input type="hidden" name="rate" id="rate" value="0"/>
            <p class="title_star">평점과 리뷰를 남겨주세요.</p>
     
            <div class="review_rating rating_point">
                <div class="warning_msg">평점을 선택해 주세요.</div>
                <div class="rating">
                    <div class="ratefill"></div>
                    <!-- [D] 해당 별점이 선택될 때 그 점수 이하의 input엘리먼트에 checked 클래스 추가 -->
                    <input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점">
                    <label for="rating1"></label>
                    <input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점">
                    <label for="rating2"></label>
                    <input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점" >
                    <label for="rating3"></label>
                    <input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점">
                    <label for="rating4"></label>
                    <input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점">
                    <label for="rating5"></label>
                </div>
            </div>
            <div class="review_contents">
                <div class="warning_msg">5자 이상의 리뷰 내용을 작성해 주세요.</div>
                <textarea rows="10" class="review_textarea"></textarea>
            </div>   
            <div class="cmd">
                <input type="button" name="save" id="save" value="등록">
            </div>
        </form>
    </div>
	
</body>
</html>