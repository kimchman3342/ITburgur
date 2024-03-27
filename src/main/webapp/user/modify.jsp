<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <title>IT BURGER</title>
   <meta charset="UTF-8">
   <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
   <meta http-equiv="Pragma" content="no-cache">
   <meta http-equiv="Expires" content="0">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!--   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script> -->
    <!-- <link rel="stylesheet" href="../asset/css/layout.css" /> -->
     <!-- <link rel="stylesheet" href="../asset/css/style.css" /> -->  <!-- 회원가입 (temp.css 는 미사용)-->
     <link rel="stylesheet" href="../asset/css/main.css" />
     <link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Angkor&family=Fauna+One&family=Gluten:wght@100..900&family=Hahmlet:wght@100..900&display=swap" rel="stylesheet">
     
  <style type="text/css">




.is-preload {
   font-family: "Hahmlet", serif;
    background-color: #f8f8f8;
    color: black;
    display: flex;
    align-items: center;
    justify-content: center; /* 수직 가운데 정렬 */
    margin-bottom: 80px;
}

#page-wrapper {
    margin: 70px;
    background-color: #fff;
    padding: 80px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    width: 700px;
    display: flex;
    flex-direction: column; /* flex 방향을 column으로 변경 */
    align-items: center; /* 수평 가운데 정렬 */
    justify-content: center; /* 수직 가운데 정렬 */
    border: 80px;
}



.page-wrapper img{
    height: 9.143rem;
    margin: 0 auto;
    max-width: 100%;
    border: 0;
    padding: 0;
    margin: 0;
    font-size: 0;
    display: flex;
    margin-top: 50px;
}
.cont {
    margin-top: 10px;
}

.join-wrap {
    display: flex;
    flex-direction: column;
    align-items: center;
    background-color: #fff;
    padding: 20px 60px; /* 상단 및 좌우 패딩을 줄임 */
    border-radius: 8px;
    width: 700px; /* 너비를 줄임 */
    margin-bottom: auto; /* 오타 수정 */
    margin-top: 50px;
}

.join-wrap li {
   font-size: 1.4rem;
   font-weight: 20px;
   color: #071d3d;
   margin:15px;  
    list-style: none;    
    vertical-align: baseline;
    font-weight: bold;
    display: block; /* 각 li 태그를 새로운 줄에 표시 */
    margin: 15px 0; /* 위아래 여백 설정 */
}


#user_id , #user_name , #user_password {
   color: black;
    width: 400px;
   height: 60px; /* 입력 필드의 높이를 조정합니다. */
  padding: 20px; /* 여기를 조정하여 패딩 값을 늘렸습니다. */
  margin-top: 20px; /* 상단 마진 조정 */
  border: 2px solid red !important;
  border-radius: 4px;
  box-sizing: border-box;
  transition: border-color .3s, background-color .3s;
}

.join-btn {
    width: 100%;
    background-color: #dc2f02;
    color: white;
    font-size: 20px;
    padding: 6px;
    margin-top: 20px;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    transition: background-color .3s;
    font-family: "Hahmlet", serif;
}

.join-btn:hover {
    background-color: #9d0208;
}

h3{
  display : flex;
  text-align : center;
  padding: 50 20px;
  margin-bottom: 80px;
  font-size: 30px;
}

#header h1 {
    padding-bottom: 8.5px !important;
}
div#header{
	height:349.16px;
	}


  </style>
</head>

<body>
    <%@ include file="../layout/header.jsp" %>
<div class="is-preload">
<div id="page-wrapper">
    <h3>회원 정보 수정</h3>
    <div class="cont">
        <form id="form" style="margin: 0;">
            <ul class="join-wrap">
                <li>
                    <label for="user_id" style="color:black;">아이디</label>
                    <input class="id-input" type="text" id="user_id" value="${sessionScope.user.user_id}" disabled/>
                    <input name="user_id" type="hidden" value="${sessionScope.user.user_id}"/>
                </li>
                <li>
                    <label for="user_name" style="color:black;">이름</label>
                    <input id="user_name" name="user_name" type="text" value="${sessionScope.user.user_name}" required/>
                </li>
                <li>
                    <label for="user_password" style="color:black;">비밀번호 변경</label>
                    <input id="user_password" name="user_password" type="password" required value="" />
                </li>
                <li>
                    <button type="button" class="join-btn" onclick="modify()">저장</button>
                </li>
            </ul>
        </form>
    </div>
</div>
</div>
    <%@include file="../layout/footer.jsp" %>
 <script type="text/javascript">
       
 function modify() {
      const data = $('#form').serializeObject();

      if(data.user_name == "") {
        alert("이름을 입력하세요.")
        return;
      }
      if(data.user_password == "") {
          alert("비밀번호를 입력하세요.")
          return;
        }
      var pwRule = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{10,20}$/;
      if (!pwRule.test(data.user_password)) {
          alert("비밀번호는 영문 대/소문자, 숫자, 특수문자를 포함한 10-20자로 입력해주세요.");
          $('#user_password').focus();
             return;
         }

      console.log('modify',data);
      $.ajax({
        url        : '../user/modify',
        data       : JSON.stringify(data),
        dataType       : 'text',
        type       : 'post',
       contentType: 'application/json', 
        success : function(res){
          alert(res);
          location.href = "../";
        },
        error : function(xhr){
          console.log(xhr);
        }
      });
    }
   
   
   
     
 </script>
 
<!-- Scripts -->
          <script src="../asset/js/jquery.min.js"></script>
         <script src="../asset/js/jquery.dropotron.min.js"></script>
         <script src="../asset/js/browser.min.js"></script>
         <script src="../asset/js/breakpoints.min.js"></script>
         <script src="../asset/js/swipper.min.js"></script>
         <script src="../asset/js/util.js"></script>
         <script src="../asset/js/main.js"></script> 
         <script src="../asset/js/map.daum.js"></script>
         <script src="../asset/js/script.js"></script> 
</body>
</html>