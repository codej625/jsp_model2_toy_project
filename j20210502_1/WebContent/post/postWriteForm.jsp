<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">

<title>글작성</title>
<style>
#board_num, #pagenNum, #post_num {
	display: none;
}

input [type=submit] {
	width: 100%;
	height: 50px;
	border: 0;
	outline: none;
	border-radius: 40px;
	background: #495057;
	color: white;
	font-size: 1.2em;
	letter-spacing: 2px;
}

input [type=submit]:hover {
	background: white;
	color: black;
}

input [type=button] {
	width: 100%;
	height: 50px;
	border: 0;
	outline: none;
	border-radius: 40px;
	background: #495057;
	color: white;
	font-size: 1.2em;
	letter-spacing: 2px;
}

input [type=button]:hover {
	background: white;
	color: black;
}

nav2 {
	backgorund-color: #ffdab9;
	width: 50%;
	list-style-type: none;
	margin: 0;
	padding: 0;
	border-bottom: solid 1px black;
	float: left;
}

td a {
	display: block;
	color: #000000;
	padding: 8px;
	text-decoration: none;
	font-weight: bold;
	float: left;
}

td a:current {
	background-color: #ff6347;
	color: white;
}

td a:hover:not(.current) {
	background-color: #cd853f;
	color: white;
}
</style>
<!-- <link rel="stylesheet" type="text/css" href="/css/style.css"> -->
<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js-->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<script>
	$(document)
			.ready(
					function() {
						$('#summernote')
								.summernote(
										{
											placeholder : '내용을 입력해주세요.',
											height : 500,
											minHeight : 500,
											maxHeight : 500,
											lang : 'ko-KR',

											toolbar : [
													[ 'style', [ 'style' ] ],
													[
															'font',
															[
																	'bold',
																	'underline',
																	'clear' ] ],
													[ 'color', [ 'color' ] ],
													[
															'para',
															[ 'ul', 'ol',
																	'paragraph' ] ],
													[ 'table', [ 'table' ] ],
													[
															'insert',
															[ 'link',
																	'picture',
																	'video' ] ],
													[
															'view',
															[ 'fullscreen',
																	'help' ] ] ]
										});
						$('p').css('margin-bottom', '0')
						$('.note-resizebar').css('display', 'none');
					});
</script>


<script type="text/javascript">
	var checkUnload = true;
	$(window).on('beforeunload', function() {
		if (checkUnload)
			return "이 페이지를 벗어나면 작성된 내용은 저장되지 않습니다.";
	});
	$("#확인").on("click", function() {
		checkUnload = false;
		$("submit").submit();
	});
</script>




</head>
<body>
	<table>


		<tr>
			<td><a class="nav2" id="nav2"
				href="boardNoticeList.do?board_num=0">공지게시판</a></td>
		</tr>
		<tr>
			<td><a class="nav2" id="nav2"
				href="boardFreeList.do?board_num=1">자유게시판</a></td>
		</tr>
		<tr>
			<td><a class="nav2" id="nav2"
				href="boardMarketList.do?board_num=2">마켓게시판</a></td>
		</tr>
	</table>

	<form
		action="postWritePro.do?board_num=${board_num}&pageNum=${pageNum}&post_num=${post_num + 1}"
		method="post">
		<input type="text" name="board_num" id="board_num"
			value="${board_num}"> <input type="text" name="pageNum"
			id="pagenNum" value="${pageNum }"> <input type="text"
			name="post_num" id="post_num" value="${post_num +1}">
		<caption>
			<h2>게시판 글쓰기</h2>
		</caption>
		<td>작성자</td>
		<td><input type="text" name="user_id" required="required"></td>

		제목 <input type="text" name="post_name" required="required">
		<textarea id="summernote" name="post_cont" required="required">
		</textarea>

		<div>
			<input type="button" onclick="history.back();" value="취소"> <input
				type="submit" value="확인">
		</div>


	</form>
<script src="/js/jquery-3.3.1.min.js"></script>
	<script src="/js/popper.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/main.js"></script>
</body>
</html>