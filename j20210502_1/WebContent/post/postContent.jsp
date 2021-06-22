<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
>>>>>>> 02_team
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<<<<<<< HEAD
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/userInfo.css">
<!-- Style -->
<link rel="stylesheet" href="/css/style.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
=======
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
>>>>>>> 02_team
<style type="text/css">
* {
  font-family: 'Roboto Condensed';
}

body {
  padding-top: 100px;
  background: #f9f9fb;
}

table {
  width: 110%;
  text-justify: auto;
}

#Content_Board_num, #board_num, #post_num {
  display: none;
}
</style>
</head>
<body>
<<<<<<< HEAD
		<!-- ===============================================-->
		<!--    Main Content-->
		<!-- ===============================================-->
		<nav class="navbar navbar-expand-lg navbar-light fixed-top py-3 d-block" data-navbar-on-scroll="data-navbar-on-scroll">
		<div class="container">
				<a class="navbar-brand d-inline-flex" href="index.jsp"><span class="text-light fs-2 fw-bold ms-2"><img src="${pageContext.request.contextPath}/img/gallery/logo.png" style="width: 100px; height: 100px;" alt=""></span></a>
				<button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse border-top border-lg-0 mt-4 mt-lg-0" id="navbarSupportedContent">
						<ul class="navbar-nav me-auto mb-2 mb-lg-0">
								<c:if test="${sessionID == null }">
										<li class="nav-item px-2"><a class="nav-link fw-bold" href="userLoginForm.do">JUMP IN(마이페이지)</a></li>
								</c:if>
								<c:if test="${sessionID != null }">
										<li class="nav-item px-2"><a class="nav-link fw-bold" href="userInfo.do?user_code=${sessionCODE }">JUMP IN(마이페이지)</a></li>
								</c:if>
								<li class="nav-item px-2"><a class="nav-link fw-bold" href="explorerCf.do">EXPLORER(캠핑장)</a></li>
								<li class="nav-item px-2"><a class="nav-link fw-bold" href="boardList.do?user_id=${sessionID }">TIKI-TAKA(게시판)</a></li>
								<c:if test="${sessionID == null }">
										<li class="nav-item px-2"><a class="nav-link fw-bold" href="userLoginForm.do">로그인</a></li>
										<li class="nav-item px-2"><a class="nav-link fw-bold" href="userAgree.do">회원가입</a></li>
								</c:if>
								<c:if test="${sessionID != null }">
										<li class="nav-item px-2"><a class="nav-link fw-bold" href="userLogoutPro.do">로그아웃</a></li>
								</c:if>
						</ul>
				</div>
		</div>
		</nav>
		<!-- 상단 네비게이션 끝 -->
		<div class="container">
				<div class="view-account">
						<section class="module">
						<div class="module-inner">
								<div class="side-bar">
										<div class="user-info">
												<ul class="meta list list-unstyled">
														<li class="name" value=""><label class="label label-info"></label></li>
														<li class="email"><a href="#"></a></li>
														<li class="activity"></li>
												</ul>
										</div>
										<nav class="side-menu">
										<ul class="nav">
												<li><a href="boardNoticeList.do?board_num=0"><span class="fa"></span>공지게시판</a></li>
												<li><a href="boardFreeList.do?board_num=1"><span class="fa"></span>자유게시판</a></li>
												<li><a href="boardMarketList.do?board_num=2"><span class="fa"></span>마켓게시판</a></li>
												<li><a href="userAskForm.do?user_id=${sessionID}&user_code=${sessionCODE}&board_num=3"><span class="fa fa-envelope"></span>나의 문의내역</a></li>
										</ul>
										</nav>
								</div>
								<div class="content-panel">
										<form class="form-horizontal">
												<fieldset class="fieldset">
														<input type="text" id="Content_Board_num" value="${board_num}">
														<h5 class="fieldset-title"><h4>제목 </h4> ${post.post_name}</h5>
														
														<h5 class="fieldset-title"><h4>글쓴이 </h4> ${post.user_id}</h5>
														
														<h5 class="fieldset-title"><h4>날짜 </h4> ${post.post_date}</h5>
														
														<h5 class="fieldset-title"><h4>조회수 </h4> ${post.post_view}</h5>
														<hr>
														<h5 class="fieldset-title">${post.post_cont}</h5>
                            
														<div class="form-group avatar">
																<figure class="figure col-md-2 col-sm-3 col-xs-12"> </figure>
														</div>
														<div class="form-group">
                                <div class="col-md-10 col-sm-9 col-xs-12 col-md-push-2 col-sm-push-3 col-xs-push-0">
                                
																		<input class="btn btn-primary" type="button" value="수정" onclick="location.href='postUpdateForm.do?board_num=${post.board_num}&post_num=${post.post_num}&pageNum=${pageNum}'"> 
																		<input class="btn btn-primary" type="button" value="답변작성" onclick="location.href='postWriteForm.do?post_num=${post.post_num}&pageNum=${pageNum}'"> 
																		<input class="btn btn-primary" type="button" value="삭제" onclick="location.href='postDeleteForm.do?board_num=${board_num}&post_num=${post_num}'"> 
																		<input class="btn btn-primary" type="button" value="목록" onclick="location.href='boardList.do?pageNum=${pageNum}'">
																		</div>
																		</div>
																		
																		<input type="text" id="board_num" value="${board_num}"> 
																		<input type="text" id="post_num" value="${post_num}">
												</fieldset>
												<hr>
										</form>
								</div>
						</div>
						</section>
				</div>
=======
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
>>>>>>> 02_team
		</div>
		<%-- <div class="content">
				<div class="container">
						<table border="1">
								<caption>
										<h2>게시판 상세내역</h2>${board_num }</caption>
								<tr>
										<td width="50">번호</td>
										<td>${post.post_num}</td>
										<input type="text" id="Content_Board_num" value="${board_num}">
								</tr>
								<tr>
										<td>제목</td>
										<td>${post.post_name}</td>
								</tr>
								<tr>
										<td>작성자</td>
										<td>${post.user_id}</td>
								</tr>
								<tr>
										<td>작성일</td>
										<td>${post.post_date}</td>
								</tr>
								<tr>
										<td>조회수</td>
										<td>${post.post_view}</td>
								</tr>
								<tr>
										<td>내용</td>
										<td><pre>${post.post_cont}</pre></td>
								</tr>
								<tr>
										<td colspan="2"><input type="button" value="수정" onclick="location.href='postUpdateForm.do?board_num=${post.board_num}&post_num=${post.post_num}&pageNum=${pageNum}'"> <input type="button" value="답변작성" onclick="location.href='postWriteForm.do?post_num=${post.post_num}&pageNum=${pageNum}'"> <input type="button" value="삭제" onclick="location.href='postDeleteForm.do?board_num=${board_num}&post_num=${post_num}'"> <input type="button" value="목록" onclick="location.href='boardList.do?pageNum=${pageNum}'"></td>
								</tr>
								<tr>
										<td><input type="text" id="board_num" value="${board_num}"> <input type="text" id="post_num" value="${post_num}"></td>
								</tr>
						</table>
				</div>
		</div> --%>
		<script src="/js/jquery-3.3.1.min.js"></script>
		<script src="/js/popper.min.js"></script>
		<script src="/js/bootstrap.min.js"></script>
		<script src="/js/main.js"></script>
</body>
</html>