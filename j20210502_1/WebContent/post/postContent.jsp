<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function commentChk() {
		var txt = frm.comment_cont.value;
//			alert(txt);
		var board_num = ${post.board_num};
//			alert(board_num);
		var post_num = ${post.post_num};
//			alert(post_num);
		var post_name = frm.post_name.value;
//			alert(post_name);
		var user_id = frm.user_id.value;
//			alert(user_id);
		var pageNum = frm.pageNum.value;
		
		location.href="postCommentWrite.do?txt="+txt+"&board_num="+board_num+"&post_num="+post_num+"&user_id="+user_id+"&post_name="+post_name+"&pageNum="+pageNum;
	}
	
	function reCommentChk() {
		var txt = frm.reCommentCont.value;
//				alert(txt);
		var board_num = ${post.board_num};
//				alert(board_num);
		var post_num = ${post.post_num};
//				alert(post_num);
		var post_name = frm.rePost_name.value;
//				alert(post_name);
		var user_id = frm.reUser_id.value;
//				alert(user_id);
		var post_re = frm.post_re.value;
//			    alert(post_re);
		var post_restep = frm.post_restep.value;
//		        alert(post_restep);
		var pageNum = frm.pageNum.value;
		
		location.href="postReCommentWrite.do?txt="+txt+"&board_num="+board_num+"&post_num="+post_num+"&user_id="+user_id+"&post_name="+post_name+"&post_re="+post_re+"&post_restep="+post_restep+"&pageNum="+pageNum;

		
	}
	
	function showRecommentBtn(recomment_cnt) {   
		   status = $(".hide"+recomment_cnt).css("display"); 
	//	   alert("seek status->"+status);

		   if (status == "none")
		      $(".hide"+recomment_cnt).css("display", ""); 
		   else
		      $(".hide"+recomment_cnt).css("display", "none"); 
		}
	
	
</script>
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

<link rel="stylesheet" href="/icomoon/style.css">

<link rel="stylesheet" href="/css/board.css">
<!-- Bootstrap CSS -->

<!-- Style -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js"></script>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box font-family: 'Roboto Condensed';
}

#Content_Board_num, #board_num, #post_num {
	display: none;
}

table {
	width: 80%;
}
</style>
</head>
<body>
	<div class="header">
		<div class="logo_section">
			<!--로고 이미지  -->
			<img src="">
		</div>
		<div class="main_menu">
			<ul>
				<li>JUMP IN(마이페이지)</li>
				<li>TIKI-TAKA(게시판)</li>
				<li>EXLPOER(캠핑장)</li>
			</ul>
		</div>
	</div>
	<div class="content">
		<div class="container">
			<form name = "frm">
				<table border="1">
					<caption>
						<h2>게시판 상세내역</h2>
					</caption>
					
					<tr>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					<tr style="width: 100%">
						<td>${post.post_name }</td>
						<td>${post.user_id }</td>
						<td>${post.post_date }</td>
						<td>${post.post_view }</td>
					</tr>
					<tr>
						<th colspan="4">내용</th>
					</tr>
					<tr>
						<td colspan="4">
							<pre>${post.post_cont }</pre>
						</td>
					</tr>
					<%-- <tr>
						<th colspan=4>첨부파일</th>
					</tr> 
					<tr>
						<td colspan=4>
							<c:if test="${upload.file_name != null }">
								<pre>${upload.file_name}</pre>
								<img src="upload/${upload.file_name}" alt="error">
							</c:if>
						</td>
					</tr> --%>
					<tr>
						<td colspan="4">
							<input type="button" value="게시글 수정" onclick="location.href='postUpdateForm.do?board_num=${post.board_num}&post_num=${post.post_num}&pageNum=${pageNum}'">
							<input type="button" value="게시글 삭제" onclick="location.href='postDeleteForm.do?board_num=${board_num}&post_num=${post_num}'">
							<input type="button" value="게시글 목록" onclick="location.href='boardList.do?pageNum=${pageNum}'">
						</td>
					</tr>
					<tr>
						<td colspan="4">
							<textarea name="comment_cont" rows="5" cols="100" placeholder="댓글을 입력하세요"></textarea>
							  	<input type="hidden" name="board_num" value="${post.board_num}">
								<input type="hidden" name="post_num" value="${post.post_num}">
								<input type="hidden" name="user_id" value="${post.user_id}">
								<input type="hidden" name="post_name" value="${post.post_name }">
								<input type="hidden" name="pageNum" value="${pageNum}">
								<input type="button" onclick="commentChk()" value="확인">
						</td>
					</tr>
					<tr style="width: 100%">
						<th colspan="5">댓글</th>
					</tr>
						<c:if test="${totCnt > 0}">
							<c:forEach var="comment" items="${comment_list }" varStatus="status">
								<tr>
									<td colspan="3">
										<c:if test="${comment.post_lv > 0 }">
											<img src ="./img/recomment.png" style="width: 30px; height: 20px;">
										</c:if>
									<b>${comment.user_id}</b>
									${comment.post_cont }</td>
									<td colspan="1">
										<a href="postDeleteForm.do?board_num=${board_num}&post_num=${comment.post_num}&pageNum=${pageNum}"><input type="button" value="댓글 삭제"></a>
								 		<a href="postUpdateForm.do?board_num=${board_num}&post_num=${comment.post_num}&pageNum=${pageNum}"><input type="button" value="댓글 수정"></a> 
								 	<c:if test="${comment.post_lv >= 0 }">
								 		<input type="button" value="답글" name="find_${status.count }"onclick="showRecommentBtn('${status.count }')">
									</c:if>
									</td>
								</tr>
								<tr class="hide${status.count}" style="display:none">
									<td colspan="3">
									<textarea name="reCommentCont"  rows="5" cols="100" placeholder="답글을 입력하세요"></textarea>
										<input type="hidden" name="board_num" value="${post.board_num}">
										<input type="hidden" name="post_num" value="${post.post_num}">
										<input type="hidden" name="reUser_id" value="${post.user_id}">
										<input type="hidden" name="rePost_name" value="${comment.post_name }">
										<input type="hidden" name="post_re" value="${comment.post_re }"> 
										<input type="hidden" name="post_restep" value="${comment.post_restep }"> 
										<input type="hidden" name="pageNum" value="${pageNum}">
										<input type="button"  value="답글 등록" onclick="reCommentChk()">
									</td>
								</tr>		
						</c:forEach>
					</c:if>
				</table>
			</form>
		</div>
	</div>
	<script src="/js/jquery-3.3.1.min.js"></script>
	<script src="/js/popper.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/main.js"></script>
</body>
</html>