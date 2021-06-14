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
<link href="css/userJoin.css" rel="stylesheet" />
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
		<table border="1">
			<caption>
				<h2>회원가입</h2>
			</caption>
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" name="user_id" id="user_id" required="required">
					<input type="button" value="중복체크" onclick="idChk()">
					<input type="text"   id="idCheckName"  readonly="readonly" style="width:100%; border: none; color: red;">
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="user_pw" required="required"></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="user_pw2" required="required">
				<input type="button" value="비밀번호 확인" onclick="pwChk()">
				<input type="text"   id="pwCheck"   readonly="readonly" style="width:100%; border: none; color: red;">
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="user_name" required="required"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="tel" name="user_tel" required="required" 
					pattern="\d{2,3}-\d{3,4}-\d{4}" placeholder="xxx-xxxx-xxxx"
					title="2,3자리-3,4자리-4자리"></td>
			</tr>
			<tr>
            	<td></td>
               	<td><button type="button" style="width: 60px; height: 32px;"onclick="openZipSearch()">검색</button></td>
         	</tr>
         	<tr>
           	 	<td>주소</td>
            	<td><input type="text" id="addr1" name="user_addr" style="width: 300px; height: 30px;" readonly></td>
         	</tr>
			<tr>
				<td>이메일</td>
				<td>
					<input type="text" name="user_email" id="user_email" required="required">
					<input type="button" value="중복체크" onclick="emailChk()">
					<input type="text"   id="emailCheckName"   readonly="readonly" style="width:100%; border: none; color: red;">
				</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<p>
						남성 <input type="radio" name="user_gender" value="male" checked="checked">
						여성 <input type="radio" name="user_gender" value="female">
					</p>
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="확인"> <input type="reset" value="취소"></td>
			</tr>
		</table>
	</form>

</body>
</html>