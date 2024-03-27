<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>IT BURGER</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Cache-Control"
	content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gamja+Flower&family=Madimi+One&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gamja+Flower&family=Madimi+One&family=Stylish&display=swap" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<!--   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script> -->

<link rel="stylesheet" href="../asset/css/join.css" />
<style type="text/css">
div#header{
	height:349.16px;
	}
	h1 {
    padding-bottom: 22px !important;
}

</style>
</head>
<body class="is-preload">
	<%@include file="../layout/header.jsp"%>

	<div class="join">
		<div class="con center">
			<div class="tab-container">
				<div class="cont" id="stage2">
			<ul class="join-title">
				<li class="li-tag">
					<h6>회원가입</h6>
				</li>
            	
			</ul>
					<form id="join_form">
						<ul class="join-wrap">
							<li>ID</li>
							<li><input class="id-input" id="user_id" name="user_id"
								type="text" onchange="resetCheckId();"
								placeholder="Enter your ID." />
								<button type="button" class="button-chk" onclick="checkId();">중복확인</button>
								<hr></li>
							<li>PW <label>(영문 대/소문자, 특수문자를 포함 10-20자로 입력해주세요.)</label></li>
							<li><input name="user_password" id="user_password"
								type="password" placeholder="Enter your password." /></li>
							<li>Check PW</li>
							<li><input name="user_password2" id="user_password2"
								type="password" placeholder="Enter your password again." /></li>
							<li>Name</li>
							<li><input id="user_name" name="user_name" type="text"
								placeholder="Enter your name." required /></li>
						</ul>
						<button type="button" class="join-btn" id="join-btn"
							onclick="join()">Sign up</button>
					</form>
				</div>
				<hr>
			</div>
			<div class="login-tab">
				    <i class="fa-solid fa-burger"></i>
				    <a href="login" class="rainbow-text">계정이 있으시면 로그인 하세요.</a>
				    <i class="fa-solid fa-burger"></i>
			</div>

		</div>
		<hr>
	</div>
	<%@include file="../layout/footer.jsp"%>

	<!-- Scripts -->
	<script src="../asset/js/jquery.min.js"></script>
	<script src="../asset/js/jquery.dropotron.min.js"></script>
	<script src="../asset/js/browser.min.js"></script>
	<script src="../asset/js/breakpoints.min.js"></script>
	<script src="../asset/js/util.js"></script>
	<script src="../asset/js/main.js"></script>
	<script src="../asset/js/swipper.min.js"></script>
	<script src="../asset/js/script.js"></script>

	<script>
		function join() {

			const data = $('#join_form').serializeObject();

			console.log(data);

			if (data.user_id == "") {
				alert("아이디를 입력하세요.");
				return;
			}
			
			if (!isChecked) {
				alert("아이디 중복확인을 해주세요.");
				return;
			}
			var pwRule = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{10,20}$/;
		    if (!pwRule.test(data.user_password)) {
		        alert("비밀번호는 영문 대/소문자, 숫자, 특수문자를 포함한 10-20자로 입력해주세요.");
		        $('#user_password').focus();
		        return;
		    }

			if (data.user_password == "") {
				alert("비밀번호를 입력하세요.");
				return;
			}

			if (data.user_password2 == "") {
				alert("비밀번호 확인을 입력하세요.");
				return;
			}

			if (data.user_password != data.user_password2) {
				alert("비밀번호 확인이 일치하지 않습니다.");
				$('#user_password').focus();
				return;
			}
			
			if (data.user_name == "") {
				alert("이름을 입력하세요.");
				return;
			}
			console.log('join', data);
			$.ajax({
				url : '../api/user/join',
				data : JSON.stringify(data),
				dataType : 'text',
				type : 'post',
				contentType : 'application/json',
				success : function(res) {
					console.log('/api/user/join', res);
					alert(res);
					location.href = "./login";
				},
				error : function(xhr) {
					console.log(xhr);
				}
			}); // end ajax
		} // end join

		//ID중복체크
		function checkId() {
			if ($("#user_id").val() == "") {
				alert("아이디를 입력하세요.");
				$("#user_id").focus();
				return;
			}
			//form 태그안의 모든 요소값을 직렬화. json 문자열로 변환합니다.
			const data = $('#join_form').serializeObject();
			var idRule = /^[a-z]+[a-z0-9]{5,11}$/g;
			if (!idRule.test(data.username)) {
				alert("아이디는 영문자로 시작하는 영문자 또는 숫자 6~12자로 입력해주세요.");
				$("#user_id").focus();
				return;
			}
			console.log('request data', data);
			//비동키 통신을 위한 jquery (순수자바스크립트의 XMLHttpRequest 를 쉽게 사용하도록 합니다.)
			$.ajax({
				url : '../api/auth/checkId',
				data : data,
				dataType : 'json',
				type : 'post',
				/* json 으로 직렬화 하지 않고 보내기 */
				/*   contentType: 'application/json', */
				success : function(res) {
					console.log('/api/auth/checkId', res);
					if (res.isExist === 0) {
						alert("사용 가능한 아이디입니다.");
						isChecked = true;
					} else {
						alert("이미 사용중인 아이디입니다.");
					}
				},
				error : function(xhr, status, error) {
					alert(xhr.response);
				}
			});
		}

		function resetCheckId() {
			isChecked = false;
		}

	
	
	</script>
</body>
</html>