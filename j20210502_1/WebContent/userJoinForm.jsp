<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<%
	String context = request.getContextPath();
%>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@300;700&amp;display=swap"
	rel="stylesheet">
<link href="css/userJoin.css" rel="stylesheet" />
<link href="css/label.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
   	function openZipSearch() {
      	new daum.Postcode({
         	oncomplete : function(data) {
           // $('[id=zip]').val(data.zonecode); // 우편번호 (5자리)
            $('[id=addr1]').val(data.address);
            //$('[id=addr2]').val(data.buildingName);
        	}
      	}).open();
   	}
   	function pwChk(){
		if(frm.user_pw.value != frm.user_pw2.value) {
// 			alert("암호가 일치하지 않습니다.");
			data = "암호가 일치하지 않습니다."
			$('#pwCheck').val(data);
			frm.user_pw2.focus();
			return false;
		}
		if(frm.user_pw.value == frm.user_pw2.value){
// 			alert("정상적입니다.");
			data = "암호가 일치합니다."
			$('#pwCheck').val(data);
			frm.user_name.focus();
		}
	}
	function idChk() {
		var p_user_id = frm.user_id.value;
		$.ajax({
			url:"<%=context%>/ajaxIdCheck.do",
			data:{user_id : p_user_id},
			dataType:'text',
			success:function(data){
				$('#idCheckName').val(data);
			}
		});

// 		location.href='userIdCheckPro.do?user_id='+frm.user_id.value;
	};
	function emailChk() {
		var p_user_email = frm.user_email.value;
		$.ajax({
			url:"<%=context%>/ajaxEmailCheck.do",
			data:{user_email : p_user_email},
			dataType:'text',
			success:function(data){
				$('#emailCheckName').val(data);
			}
		});
	}
</script>

</head>
<body>
	<%-- 회원가입 폼 --%>
	<form action="userJoinPro.do" name="frm" method="post" onsubmit="return chk()">
		<div class="wrap wd668">
			<div class="container">
			<div class="form+txtInput">
			<h2 class="sub_tit_txt">회원가입</h2>
			<p class="exTxt">회원가입시 중복체크를 반드시 진행하셔야 합니다.</p>
			<div class="join_form">
		<table>
			<colgoroup>
			<col width="25%"/>
			<col width="auto"/>
			</colgoroup>
			<tr>
				<td><span>아이디</span></td>
				<td>
					<input type="text" name="user_id" id="user_id" required="required" placeholder="아이디를 입력하세요">
					<button type="button" onclick="idChk()" style="width:100px; height:40px; border: none;">아이디 체크</button>
					<input type="text"   id="idCheckName"  readonly="readonly" style="width:100%; border: none; color: #ee7272;">
				</td>
			</tr>
			<tr>
				<td><span>비밀번호</span></td>
				<td><input type="password" name="user_pw" required="required" placeholder="비밀번호를 입력하세요"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="password" name="user_pw2" required="required"  placeholder="비밀번호를 확인하세요">
				<button type="button" style="width:100px; height:40px; border: none;" onclick="pwChk()">비밀번호 체크</button>
				<input type="text"   id="pwCheck"   readonly="readonly" style="width:100%; border: none; color: #ee7272;">
				</td>
			</tr>
			<tr>
				<td><span>이름</span></td>
				<td><input type="text" name="user_name" required="required"></td>
			</tr>
			<tr>
				<td><span>전화번호</span></td>
				<td><input type="tel" name="user_tel" required="required"
					pattern="\d{2,3}-\d{3,4}-\d{4}" placeholder="xxx-xxxx-xxxx"
					title="2,3자리-3,4자리-4자리"></td>
			</tr>
         	<tr>
           	 	<td><span>주소</span></td>
            	<td><input type="text" id="addr1" name="user_addr" style="width: 300px; height: 30px;" readonly></td>
         	</tr>
         	<tr>
            	<td></td>
               	<td><button type="button" style="width: 60px; height: 32px;"onclick="openZipSearch()">검색</button></td>
         	</tr>
			<tr>
				<td><span>이메일</span></td>
				<td>
					<input type="text" name="user_email" id="user_email" required="required" placeholder="이메일을 입력하세요">
					<input type="button"style="width:100px; height:40px; border: none;" value="이메일 체크" onclick="emailChk()">
					<input type="text"   id="emailCheckName"   readonly="readonly" style="width:100%; border: none; color: #ee7272;">
				</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<select required="required" style="width: 100px; height:30px;">
					<option value="0">남자</option>
					<option value="1">여자</option>
					</select>
				</td>
			</tr>
		</table>

			<div class="btn_wrap">
			<button type="submit"><a>회원가입</a></button>
			<button type="reset"onclick="javascript:history.back();"><a>취소</a></button>
			</div>

			</div>
			</div>
			</div>
			</div>
	</form>

</body>
</html>