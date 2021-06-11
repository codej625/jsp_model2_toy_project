<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">

  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <!-- ===============================================-->
    <!--    Document Title-->
    <!-- ===============================================-->


    <!-- ===============================================-->
    <!--    Favicons-->
    <!-- ===============================================-->
    <link rel="apple-touch-icon" sizes="180x180" href="img/favicons/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="img/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="img/favicons/favicon-16x16.png">
    <link rel="shortcut icon" type="image/x-icon" href="img/favicons/favicon.ico">
    <link rel="manifest" href="img/favicons/manifest.json">
    <meta name="msapplication-TileImage" content="img/favicons/mstile-150x150.png">
    <meta name="theme-color" content="#ffffff">


    <!-- ===============================================-->
    <!--    Stylesheets-->
    <!-- ===============================================-->
    <link href="css/theme.css" rel="stylesheet" />

  </head>


  <body>
<!-- 연습입니다 -->
    <!-- ===============================================-->
    <!--    Main Content-->
    <!-- ===============================================-->
    <main class="main" id="top">
      <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3 d-block" data-navbar-on-scroll="data-navbar-on-scroll">
        <div class="container"><a class="navbar-brand d-inline-flex" href="index.jsp"><span class="text-light fs-2 fw-bold ms-2"><img src="/img/gallery/logo.png" style="width:100px; height:100px;"></span></a>
          <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
          <div class="collapse navbar-collapse border-top border-lg-0 mt-4 mt-lg-0" id="navbarSupportedContent">
          
           
          </div>
        </div>
      </nav>
      <section class="py-0" id="header">
        <div class="bg-holder" style="background-image:url(img/gallery/header-bg.jpg);background-position:center; background-size:contain;">
        </div>
        <!--/bg-holder-->

        <div class="container">
          <div class="row align-items-center min-vh-75 min-vh-xl-100">
            <div class="col-md-8 col-lg-6 text-md-start text-center">
              <h1 class="display-1 lh-sm text-uppercase text-light"><br class="d-none d-xxl-block" /></h1>
              <div class="input-group"  style="position:relative; top: 50%; left:50%; border: none; background-color: transparent;">
              <div class="col-4 col-lg-3" style="text-align:center; border: none; background-color: transparent;">
             <%-- 로그인 폼 --%>
	<h2>로그인</h2>
	<form action="userLoginPro.do" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="user_id" required="required">
					<input id="chk_id" type="checkbox" name="idcheck" onclick="confirmSave(this)">아이디저장</td>
			</tr>
			<tr>
				<td>암호</td>
				<td><input type="password" name="user_pw" required="required"></td>
			</tr>
			<tr>
				<td><input type="submit" value="확인"></td>
				<td><input type="reset" value="취소"></td>
			</tr>
		</table>
	</form>
	<p>
		<input type="button" value="아이디찾기" onclick="location.href='findUserIdForm.do'">
		<input type="button" value="비밀번호찾기" onclick="location.href='findUserPwForm.do'">
	</p>
	<p>
		<input type="button" value="회원가입" onclick="location.href='userAgree.do'">
	</p>
	<script type="text/javascript">
		function confirmSave(checkbox) {
			var isRemember;

			if (checkbox.checked) {
				isRemember = confirm("이 PC에 로그인 정보를 저장하시겠습니까? PC방등의 공공장소에서는 개인정보가 유출될 수 있으니 주의해주십시오.");

				if (!isRemember)
					checkbox.checked = false;
			}
		}

		function chk() {
			if (frm.idcheck.checked)
				saveLogin(frm.user_id.value);
			else
				saveLogin("");
		}

		function saveLogin(user_id) {
			if (user_id != "") {
				// userid 쿠키에 id 값을 1일간 저장
				setsave("user_id", user_id, 1);
			} else {
				// userid 쿠키 삭제
				setsave("user_id", user_id, -1);
			}
		}

		function setsave(user_id, value, exdays) {
			var exdate = new Date();
			exdate.setDate(exdate.getDate() + exdays);
			var cookieValue = escape(value)
					+ ((exdays == null) ? "" : "; expires="
							+ exdate.toGMTString());
			document.cookie = user_id + "=" + cookieValue;
		}

		function getCookie(user_id) {
			user_id = user_id + '=';
			var cookieData = document.cookie;
			var start = cookieData.indexOf(user_id);
			var cookieValue = '';
			if (start != -1) {
				start += user_id.length;
				var end = cookieData.indexOf(';', start);
				if (end == -1)
					end = cookieData.length;
				cookieValue = cookieData.substring(start, end);
			}
			return unescape(cookieValue);
		}

		function deleteCookie(user_id) {
			var expireDate = new Date();
			expireDate.setDate(expireDate.getDate() - 1);
			document.cookie = user_id + "= " + "; expires="
					+ expireDate.toGMTString();
		}

		function bodyOnload() {
			var chk_id = document.getElementById('chk_id');
			form.user_id.value = getCookie("user_id");
			if (form.user_id.value != "")
				form.chk_id.checked = true;
		}
	</script>
              </div>
            </div>
            </div>
          </div>
        </div>
      </section>  
      <!-- <section> close ============================-->
      <!-- ============================================-->
      
      <!-- ============================================-->
      <!-- <section> begin ============================-->
        <div class="container">
          <div class="row">
            <div class="col-6 col-sm-4 col-xl-3 mb-3">
              <h4 class="lh-lg fw-bold text-light"></h4>
            </div>
            <div class="col-6 col-sm-4 col-xl-3 mb-3" style="position: relative; top: 50%;">
              <h5 class="lh-lg fw-bold text-light">메뉴</h5>
              <ul class="list-unstyled mb-md-4 mb-lg-0">
                <li class="lh-lg"><a class="text-800 text-decoration-none text-uppercase fw-bold" href="#!">고객센터</a></li>
                <li class="lh-lg"><a class="text-800 text-decoration-none text-uppercase fw-bold" href="#!">개인정보취급방침</a></li>
                <li class="lh-lg"><a class="text-800 text-decoration-none text-uppercase fw-bold" href="#!">홈페이지 이용약관</a></li>
              </ul>
            </div>
            <div class="col-6 col-sm-4 col-xl-3 mb-3">
              <h5 class="mb-5"></h5>
              <ul class="list-unstyled mb-md-4 mb-lg-0">
                <li class="lh-lg"><a class="text-800 text-decoration-none text-uppercase fw-bold" href="#!">회원가입</a></li>
                <li class="lh-lg"><a class="text-800 text-decoration-none text-uppercase fw-bold" href="#!">로그인</a></li>
              </ul>
            </div>
          <div class="border-bottom border-700"></div>
        </div>
        </div>
        <!-- end of .container-->

     
      <!-- <section> close ============================-->
      <!-- ============================================-->


    </main>
    <!-- ===============================================-->
    <!--    End of Main Content-->
    <!-- ===============================================-->




    <!-- ===============================================-->
    <!--    JavaScripts-->
    <!-- ===============================================-->
    <script src="vendors/@popperjs/popper.min.js"></script>
    <script src="vendors/bootstrap/bootstrap.min.js"></script>
    <script src="vendors/is/is.min.js"></script>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
    <script src="vendors/feather-icons/feather.min.js"></script>
    <script>
      feather.replace();
    </script>
    <script src="js/theme.js"></script>

    <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@300;700&amp;display=swap" rel="stylesheet">
  </body>
</html>