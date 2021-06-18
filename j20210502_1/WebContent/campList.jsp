<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>CampList</title>
<style type="text/css">
table {
	width: 100%;
}
</style>
</head>
<body>
	<h3>총 ${totCnt}개 캠핑장이 검색되었습니다.</h3>
	<table class="table table-striped">
		<tr>
			<th>캠핑장번호</th>
			<th>캠핑장이름</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>지역</th>
			<th>유료/무료</th>
		</tr>
		<c:if test="${totCnt > 0 }">
			<c:forEach var="camp_InfoDto" items="${list}">
				<tr>
					<td>${camp_InfoDto.camp_Id}</td>
					<td><a
						href='campContent.do?camp_Id=${camp_InfoDto.camp_Id}&pageNum=${currentPage}'>${camp_InfoDto.camp_Name}</a></td>
					<td>${camp_InfoDto.camp_Tel}</td>
					<td>${camp_InfoDto.camp_Addr}</td>
					<td>${camp_InfoDto.camp_Loc}</td>
					<td>${camp_InfoDto.c_F}</td>
				</tr>
				<c:set var="startNum" value="${startNum - 1 }" />
			</c:forEach>
		</c:if>
		<c:if test="${totCnt == 0 }">
			<tr>
				<td colspan=7>데이터가 없네</td>
			</tr>
		</c:if>
	</table>

	<div style="text-align: center;">
		<c:if test="${startPage > blockSize }">
			<a href='campList.do?pageNum=${startPage-blockSize}'>[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href='campList.do?pageNum=${i}'>[${i}]</a>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
			<a href='campList.do?pageNum=${startPage+blockSize}'>[다음]</a>
		</c:if>
	</div>
	<div align="right">
		<input type="button" value="캠핑장등록"
			onclick="location.href='campWriteForm.do'">
	</div>
</body>
</html>