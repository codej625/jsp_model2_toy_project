<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EXPLORER</title>
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<nav>
				<ul id="nav_Menu">
					<li>평점순$</li>
					<li>리뷰순$</li>
					<li>지역순$</li>
				</ul>
			</nav>
			<h2 id="camp_Id">총 $개 캠핑장이 검색되었습니다.</h2>
		</div>
		<c:if test="${totCnt > 0}">
			<c:forEach var="Camp_InfoDto" items="${list}">
				<div id="article">
					<ul id="camp_Rating">
						<li>평점$</li>
						<li>리뷰$</li>
					</ul>
					<div id="camp_Images">
						<img alt="error"
							src="https://www.gocamping.or.kr/upload/camp/502/thumb/thumb_720_4672rYUEi7qaGH01dbpHqxXQ.jpg">
					</div>
					<h2 id="camp_Name">
						&nbsp;&nbsp;[<a
							href='campView.do?camp_Id=${Camp_InfoDto.camp_Id}'>${Camp_InfoDto.camp_Name}</a>]
					</h2>
					<hr>
					<div id="camp_Addr">
						<p>캠핑장 주소 : ${Camp_InfoDto.camp_Loc}</p>
						<p>캠핑장 전화 : ${Camp_InfoDto.camp_Tel}</p>
						<p>캠핑장 설명 : ${Camp_InfoDto.camp_Info}</p>
					</div>
						<a id="button" href=".do">예약하기</a>
				</div>
				<c:set var="startNum" value="${startNum - 1}" />
			</c:forEach>
		</c:if>
		<c:if test="${totCnt == 0}">
			<tr>
				<td colspan=7>데이터가 없네</td>
			</tr>
		</c:if>
		<footer>
			<div style="text-align: center;">
				<c:if test="${startPage > blockSize}">
					<a href='explorer.do?pageNum=${startPage-blockSize}'>[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a href='explorer.do?pageNum=${i}'>[${i}]</a>
				</c:forEach>
				<c:if test="${endPage < pageCnt}">
					<a href='explorer.do?pageNum=${startPage+blockSize}'>[다음]</a>
				</c:if>
			</div>
			<p>&nbsp;&nbsp;Model–View–Controller Pattern</p>
		</footer>
	</div>
</body>
</html>
