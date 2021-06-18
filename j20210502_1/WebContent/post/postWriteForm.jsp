<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">

<title>글작성</title>
<style>
/* body {
	text-align: center;
	position: fixed;
}
 */
header {
	padding-bottom: 100px;
}

#board_num, #pagenNum, #post_num {
	display: none;
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

#area{
	height:100%;
	overflow:hidden;
	text-align:center;
	display:relative;
}
</style>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<script
	src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
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
						//여기 아래 부분
						$('#summernote')
								.summernote(
										{
											height : 500,// 에디터 높이
											width : 700,
											focus : true, // 에디터 로딩후 포커스를 맞출지 여부
											lang : "ko-KR", // 한글 설정
											placeholder : '내용',
											disableResizeEditor : true, // 크기 조절 기능 삭제
											toolbar : [
													[ 'fontname',
															[ 'fontname' ] ],
													[ 'fontsize',
															[ 'fontsize' ] ],
													[
															'style',
															[
																	'bold',
																	'italic',
																	'underline',
																	'strikethrough',
																	'clear' ] ],
													[
															'color',
															[ 'forecolor',
																	'color' ] ],
													[ 'table', [ 'table' ] ],
													[
															'para',
															[ 'ul', 'ol',
																	'paragraph' ] ],
													[ 'height', [ 'height' ] ],
													[
															'insert',
															[ 'picture',
																	'link',
																	'video' ] ],
													[
															'view',
															[ 'fullscreen',
																	'help' ] ] ],
											fontNames : [ 'Arial',
													'Arial Black',
													'Comic Sans MS',
													'Courier New', '맑은 고딕',
													'궁서', '굴림체', '굴림', '돋움체',
													'바탕체' ],
											fontSizes : [ '8', '9', '10', '11',
													'12', '14', '16', '18',
													'20', '22', '24', '28',
													'30', '36', '50', '72' ]
										})
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

	<header>
		<table>
			<tr>
				<th>
				<td><a class="nav2" id="nav2"
					href="boardNoticeList.do?board_num=0">공지게시판</a></td>

				<th>
				<td><a class="nav2" id="nav2"
					href="boardFreeList.do?board_num=1">자유게시판</a></td>

				<th>
				<td><a class="nav2" id="nav2"
					href="boardMarketList.do?board_num=2">마켓게시판</a></td>
			</tr>
		</table>
	</header>
	<form
		action="postWritePro.do?board_num=${board_num}&pageNum=${pageNum}&post_num=${post_num + 1}"
		method="post">
		<input type="text" name="board_num" id="board_num"
			value="${board_num}"> <input type="text" name="pageNum"
			id="pagenNum" value="${pageNum }"> <input type="text"
			name="post_num" id="post_num" value="${post_num +1}">


	
			<h2>게시판 글쓰기</h2>


			작성자<input type="text" name="user_id" required="required"> 
			제목<input type="text" name="post_name" required="required">
			<textarea id="summernote" name="content" required="required">
		</textarea>

<fieldset>
		<input type="button" onclick="history.back();" value="취소">
		<input type="submit" value="확인">
</fieldset>

	</form>
</body>
</html>