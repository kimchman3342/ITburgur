<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>   
   <head>
      <meta charset="UTF-8">
      <title>IT BURGER</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
      <meta http-equiv="Pragma" content="no-cache">
      <meta http-equiv="Expires" content="0">
           <meta name="description" content="" />
           <meta name="author" content="" />
           
   <!--    <link rel="stylesheet" href="asset/css/layout.css" /> -->
   <!--    <script src="https://kit.fontawesome.com/352c53403e.js" crossorigin="anonymous"></script> -->
      
<style type="text/css">
.is-preload{
 overflow-x: hidden;
}
.burgerimg{
   display: flex;
   justify-content: center;
   
}
.mainburger{
   width: 28%;
   height: 28%;
   z-index: 1;
}
.burgerText{
   background-color: rgb(253, 140, 0);
   width: 18%;
   height: 5%;
   border-radius: 50% 50% 50% 50% / 50% 50% 50% 50%;
   background-size: cover;
   z-index: 2;
   transform: translateX(-50%);
   left: 75%;
   margin-left: 8%;
}
@media (max-width: 800px) {
    .burgerText{
       left: 75%;
    }
}

</style>
   </head>
   <body class="is-preload">
      <div id="page-wrapper">
         <script>
            /* 로그인 후 글쓰기로 돌아가기 */
            var back = sessionStorage.getItem('back');
            if(back) {
               location.href=back;
               sessionStorage.removeItem('back');
            }
         </script>

         </div>
            <!-- Header -->
            <%@ include file="./layout/header.jsp" %>
   <div class="ie" style="text-align: center;display:block; background-image: url(asset/images/mainbackground.jpg);" >
   <br><br><br>
   <div class="burgerimg">
      <img class="burgerText" alt="" src="asset/images/burgerText.png">
      <img class="mainburger" alt="" src="asset/images/mainburgur.png" width="60%" height="30%" style="object-fit: cover;">
      </div>
      <br>
      <img alt="" src="asset/images/bf.png" width="60%" style="object-fit: cover;">
      <br>
      <a href="${pageContext.request.contextPath }/map.jsp"><img alt="" src="asset/images/매장찾기.png" width="60%" style="object-fit: cover;"></a>
   </div>
         <!-- Scripts -->
            <%@ include file="./layout/footer.jsp" %>
   </body>
</html>