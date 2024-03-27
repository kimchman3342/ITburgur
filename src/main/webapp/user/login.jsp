<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>IT BURGER</title>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
      <meta http-equiv="Pragma" content="no-cache">
      <meta http-equiv="Expires" content="0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Angkor&family=Fauna+One&family=Gluten:wght@100..900&family=Hahmlet:wght@100..900&display=swap" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">


<style type="text/css">
 #incorrect{
   display: none;
   color: red;
   font-weight: 1.2rem;
   font-size: 20px;
}

body {
      font-family: "Hahmlet", serif;
      background-color: #f4f7f6;
      margin: 0;
      padding: 0;
    }

.container {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
 }

.login {
    display: flex;
    flex-direction: column;
    align-items: center;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    background-color: #fff;
    padding: 40px 80px; /* 상단 패딩을 40px로 늘림 */
    border-radius: 8px;
    height: auto; /* 높이를 자동으로 조정하도록 변경 */
    min-height: 500px; /* 최소 높이 설정 */
    width: 800px; /* 너비를 800px로 늘림 */
    position: relative;
    margin: auto;
  }
  
input[type="text"], input[type="password"] {
  color: black;
  width: calc(100% - 24px); /* 너비 조정, 필요에 따라 값을 조정하세요 */
   height: 60px; /* 입력 필드의 높이를 조정합니다. */
  padding: 20px; /* 여기를 조정하여 패딩 값을 늘렸습니다. */
  margin-top: 20px; /* 상단 마진 조정 */
  border: 2px solid red !important;
  border-radius: 4px;
  box-sizing: border-box;
  transition: border-color .3s, background-color .3s;
}


input[type="text"]:focus, input[type="password"]:focus {
  border-color: #d00000;
}

.mycol-2 {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 750px;
  text-align: center;
  position: relative;
}




h2 {
  top: 80px;
  left: 50%;
  padding: 50 20px;
  margin-bottom: 80px;
  font-size: 40px;
}

/* 로그인 버튼 스타일 추가 */
button.btn.btn-primary {
    width: 100%;
    background-color: #dc2f02;
    color: white;
    font-size: 30px;
    padding: 12px;
    margin-top: 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color .3s;
    font-family: "Hahmlet", serif;
}

/* 로그인 버튼 호버 스타일 추가 */
button.btn.btn-primary:hover {
  background-color: #9d0208; /* 마우스 오버 시 더 진한 주황색 */
  border-color: #9d0208; /* 마우스 오버 시 더 진한 주황색 테두리 */
}

label {
  display: block;
  margin-bottom: 8px; /* 레이블과 인풋 박스 사이의 거리를 조절합니다. 원래는 0.2rem 였으나 조금 더 늘렸습니다 */
  margin-left: 0.5rem;
  text-align: left; /* 텍스트를 왼쪽으로 정렬 */
}

#user_id, #user_password{
font-size: 30px;
font-family: "Hahmlet", serif;
}

#user_id::placeholder,
#user_password::placeholder{
 color: #ced4da;
}

#uid, #upd{
font-size: 30px;
font-family: "Hahmlet", serif;
}

.form-label {
  display: block;
  margin-bottom: 0.5px; /* 입력 필드와의 간격 줄임 */
  font-weight: bold;
}

/* 입력 필드 컨테이너 스타일 */
  .mb-3 {
    position: relative; /* 레이블 위치 조정을 위한 상대 위치 설정 */
    margin-top: 10px; /* 입력 필드 간 간격 */
    justify-content: flex-start; /* 왼쪽 정렬 */
    display: flex; /* 추가: Flexbox를 사용하여 내용을 왼쪽 정렬 */
    width: 100%; /* 너비를 100%로 조정 */
  }

/* 입력 필드 스타일 조정 */
input[type="text"], input[type="password"], .form-control {
  width: 300px;
  height: 55px;
  margin-top: 8px; /* 레이블과의 거리를 좁힘. 필요에 따라 조정 가능 */
  margin-bottom: 16px; /* 다음 요소와의 거리를 넓힘. 필요에 따라 조정 가능 */
  font-size: 16px; /* 폰트 사이즈 조정, 필요에 따라 조정 가능 */
  border: 2px solid red !important;
  border-radius: 0.5rem;
  box-sizing: border-box;
  transition: border-color .3s, background-color .3s;
}

 .form-control {
    display: block;
    width: 100%; /* 입력 필드 너비를 100%로 조정 */
    padding: 12px;
    margin-top: 5px; /* 상단 여백 조정, 레이블과의 거리를 좁힘 */
    border: 2px solid red !important;
    border-radius: 4px;
    box-sizing: border-box;
    transition: border-color .3s, background-color .3s;
  }

 .signup-link {
        display: flex;
        justify-content: center; /* 가운데 정렬 */
        align-items: center;
        margin-bottom: 70px; /* 로그인 박스와의 간격 */
	    font-size: 30px;
    }

.fa-burger {
    color: #ffb703;
}

@keyframes rainbowAnimation {
  0%{color: red;}
  28%{color: orange;}
  42%{color: green;}
  57%{color: blue;}
  71%{color: indigo;}
  85%{color: violet;}
  100%{color: red;}
}

.f-sm {
  animation: rainbowAnimation 2s infinite; /* 2초 동안 무한 반복 */
}

div#header{
	height:349.16px;
	}
	h1 {
    padding-bottom: 22px !important;
}
</style>

</head>

<body class="is-preload">
    <%@ include file="../layout/header.jsp" %>


<div id="page-wrapper">
    <div class="mycol-2" id="divcap">
        <div class="login">
            <h2 style="display:inline-block;">회원 로그인</h2>
            <br>
            <br>
            <br>
            <label id="incorrect">계정 정보가 일치하지 않습니다.</label>
            <form action="login" method="post">
                <%
                    Cookie[] cookies = request.getCookies();
                    String userIdValue = "";
                    if (cookies != null) {
                        for (Cookie cookie : cookies) {
                            if ("user_id".equals(cookie.getName())) {
                                userIdValue = cookie.getValue();
                                break;
                            }
                        }
                    }
                %>
                    <label id="uid" for="user_id">ID</label>
                <div class="mb-3">
                    <input class="form-control" id="user_id" placeholder="Enter your ID." type="text" name="user_id" required style="width: 500px;" value="<%= userIdValue %>">
                </div>
                    <label id="upd" for="user_password">PW</label>
                <div class="mb-3">
                    <input type="password" class="form-control" id="user_password" placeholder="Enter your Password." name="user_password" required style="width: 500px">
                </div>
                <button class="btn btn-primary" style="border: 0;">LOGIN</button>
                <%--   <button type="button" class="btn btn-primary" 
                      onclick="location.href='${pageContext.request.contextPath}'">HOME</button> --%>
            </form>
            <hr>
        </div>
    </div>
              <div class="signup-link">
              <i class="fa-solid fa-burger"></i>
        	  <a href="join" class="f-sm">아직 회원이 아니시면 회원 가입을 해주세요.</a>
              <i class="fa-solid fa-burger"></i>
    		</div>
    <!-- 여기서부터 푸터 부분 시작 -->
    <div id="footer-wrapper">
        <%@ include file="../layout/footer.jsp" %>
        <!-- 푸터 내용을 여기에 추가 -->
    </div>
    <!-- 푸터 부분 끝 -->
</div>


<script src="../asset/js/jquery.min.js"></script>

<script>
   console.log('${cookie.incorrect}')
   if('${cookie.incorrect.value}'==='y') {
      document.getElementById('incorrect').style.display='inline-block';
      document.cookie = 'incorrect' + "=; expires=Thu, 01 Jan 1970 00:00:10 GMT; path=/;";
   }
   console.log('incorrect','${cookie.incorrect.value}')
</script>



 
         <script src="../asset/js/jquery.min.js"></script>
         <script src="../asset/js/jquery.dropotron.min.js"></script>
         <script src="../asset/js/browser.min.js"></script>
         <script src="../asset/js/breakpoints.min.js"></script>
         <script src="../asset/js/util.js"></script>
         <script src="../asset/js/main.js"></script> 
</body>
</html>


