<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<div id="cF">
				<form action="explorerCf.do" method="post">
					<select name="c_F" id="c_F" onchange="formChange(this.form)">
						<option>유/무료 선택</option>
						<option value='0'>유료</option>
						<option value='1'>무료</option>
					</select>
				</form>
			</div>
			<h2 id="camp_Id">총 ${totCnt}개 캠핑장이 검색되었습니다.</h2>
		</div>

		<c:if test="${totCnt > 0}">
			<c:forEach var="camp_InfoDto" items="${list}">
				<div id="article">
					<div id="camp_Images">
						<a href='campView.do?camp_Id=${camp_InfoDto.camp_Id}'><img
							alt="error" src="images/${camp_InfoDto.camp_Images}.jpg"></a>
					</div>
					<h2 id="camp_Name">
						&nbsp;&nbsp;<a href='campView.do?camp_Id=${camp_InfoDto.camp_Id}'>${camp_InfoDto.camp_Name}</a>
					</h2>
					<hr>
					<div id="camp_Addr">
						<p>
							<strong>캠핑장 주소</strong> : ${camp_InfoDto.camp_Addr}
						</p>
						<p>
							<strong>캠핑장 전화</strong> : ${camp_InfoDto.camp_Tel}
						</p>
						<p>
							<strong>캠핑장 설명</strong> : ${camp_InfoDto.camp_Desc}
						</p>
					</div>
					<p>
						<strong>&nbsp;&nbsp;&nbsp;&nbsp;캠핑장 편의시설</strong> :
					</p>
					<p>
						<img class="images2" alt="error"
							src="images/${camp_InfoDto.camp_Item}.jpg"></img>
					</p>
					<p>
						<a id="button"
							onclick="alert('예약 전 캠핑장 현황 확인 부탁드립니다. Campro는 예약 링크만 제공하며 서비스는 제공하지 않습니다.')"
							href="${camp_InfoDto.res_Id}" target="_blank">예약하기</a>
					</p>
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
			<img class="notice" alt="error" src="images/notice.jpg">
		</footer>
	</div>
</body>
</html>
