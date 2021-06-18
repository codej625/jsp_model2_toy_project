<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EXPLORER</title>
<script type="text/javascript">
	function formChange(obj) {
		//alert("함수호출확인");

		//※obj 변수에는 form 객체가 저장되어 있다.
		//필요에 따라 전송하기 전에 검증 절차를 추가하는 것이 가능하다.

		obj.submit(); //obj자체가 form이다.
		//『폼객체.submit();』 함수의 호출을 통해
		//form 객체의 데이터를 서버로 전송하는 것이 가능하다.
	}
</script>
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<div id="cF">
				<ul id="nav_Menu">
					<li>평점순$</li>
					<li>리뷰순$</li>
					<li>지역순$</li>
				</ul>
				<form action="explorerCf.do" method="post">
					<select name="c_F" id="c_F" onchange="formChange(this.form)">
						<option>유/무료</option>
						<option value='0'>유료</option>
						<option value='1'>무료</option>
					</select>
				</form>
			</div>
			<h2 id="camp_Id">총 ${totCnt}개 캠핑장이 검색되었습니다.</h2>
		</div>

		<c:if test="${totCnt > 0}">
			<c:forEach var="Camp_InfoDto" items="${listCf}">
				<div id="article">
					<div id="camp_Images">
						<a href='campView.do?camp_Id=${Camp_InfoDto.camp_Id}'><img
							alt="error" src="images/${Camp_InfoDto.camp_Images}.jpg"></a>
					</div>
					<h2 id="camp_Name">
						&nbsp;&nbsp;[<a href='campView.do?camp_Id=${Camp_InfoDto.camp_Id}'>${Camp_InfoDto.camp_Name}</a>]
					</h2>
					<hr>
					<div id="camp_Addr">
						<p>캠핑장 주소 : ${Camp_InfoDto.camp_Loc}</p>
						<p>캠핑장 전화 : ${Camp_InfoDto.camp_Tel}</p>
						<p>캠핑장 설명 : ${Camp_InfoDto.camp_Desc}</p>
					</div>
					<a id="button"
						onclick="alert('예약 전 캠핑장에 현황 확인 부탁드립니다. Campro는 예약 링크만 제공하며 서비스는 제공하지 않습니다.')"
						href="${Camp_InfoDto.res_Id}">예약하기</a>
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
					<a href='explorerCf.do?pageNum=${startPage-blockSize}&c_F=${c_F}'>[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a href='explorerCf.do?pageNum=${i}&c_F=${c_F}'>[${i}]</a>
				</c:forEach>
				<c:if test="${endPage < pageCnt}">
					<a href='explorerCf.do?pageNum=${startPage+blockSize}&c_F=${c_F}'>[다음]</a>
				</c:if>
			</div>
			<p>&nbsp;&nbsp;Model–View–Controller Pattern</p>
		</footer>
	</div>
</body>
</html>
