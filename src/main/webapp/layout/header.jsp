<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>IT BURGER HEADER</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Angkor&family=Fauna+One&family=Gluten:wght@100..900&family=Hahmlet:wght@100..900&display=swap" rel="stylesheet">
<link rel="shortcut icon" href="${pageContext.request.contextPath }/asset/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="${pageContext.request.contextPath }/asset/images/favicon.ico" type="image/x-icon">
      
<style type="text/css">

html, body, div, ul, ol, li, h1, h2, h3, h4, h5, h6, p {
    margin: 0;
    padding: 0;
    -webkit-text-size-adjust: none;
    
}
.bg_nb_wrap {
   display: flex;
}

.head_menu {
   display: flex;
   flex-wrap: wrap;
   padding: 0;
   margin: 0;
   list-style: none;
}

.header_menu {
   padding: 0;
   margin: 0;
}

ul{
   list-style: none;
   
}
li{
   display: inline-flex;
}
div#header{
   display: inline;
   font-size: 30px;
   word-spacing: 1px;
     font-style : normal; 
     font-family: "Hahmlet", serif;
     line-height : 1.6;
     background-color: black;
     word-spacing: 8rem;
    color: #444;
    word-wrap: break-word;
    word-break: keep-all;
    -webkit-text-size-adjust: none;
    display: block;
    margin: 0;
    padding: 0;
    position: relative;
    margin-top: -22px;
    background: none;
    background-color: darkorange;
}

#header a:hover, #menu ul li a:hover {
    color: #fff;  
}
#user{
   font-size: small;
}
a:-webkit-any-link {
    color: initial;
    cursor: pointer;
    text-decoration: none;
    font-weight: 700;
}
#menu{
    display: flex;
    justify-content: center;
    position: relative;
    
  }
#menu > a{
   vertical-align: middle;
}

#menu ul a:visited,a:hover,a:focus,a:active {
      text-decoration: none; color: black;   


}


  #menu ul {
    margin: 0;
    padding: 0;
    display: flex;
    align-items: center; 
    text-decoration: underline;

  }

  #menu li {
     justify-content: center;
  }

  #menu ul li a {
    text-decoration: none;
  }
 nav{
     width: 100%;
    float:right;
 } 
 #user{
    text-align: right;
 }
.uid{
    color: initial;
    cursor: pointer;
    text-decoration: none;
    font-weight: 700;
    cursor: auto;
 }
 #ITlogo{
    width: 2000px;
 }
</style>
</head>
<body>

   <div id="header">
   <!-- Header -->
      <h1 style="background-color:#ff4511;text-align:center; width: 100%;">
      <a href="${pageContext.request.contextPath }" id="ITlogo"><img alt="" src="${pageContext.request.contextPath }/asset/images/ITlogo.png"
         width="300px" height="20%"style="object-fit: cover; margin-top:2rem;"></a>
      </h1>
      <nav>
      <ul id="user" style="word-spacing: 1.5rem; padding-right: 2rem;">
            <!-- sessionScope.user는 user 로만 써도 됩니다.
                        sessionScope는 명시적으로 user가 session 애트리뷰트라고 지정합니다.
                      -->
            <c:if test="${sessionScope.user == null }">
               <li><a href="${pageContext.request.contextPath }/user/join"><span>join</span></a></li>
               <li><a href="${pageContext.request.contextPath }/user/login">login</a></li>
            </c:if>
            <c:if test="${sessionScope.user != null }">
               <li><i class="uid"><span style="word-spacing: 15px;">${user.user_name }님&nbsp;</span></i>
                  
                  <ul id="bookcafe">
                     <li><a
                        href="${pageContext.request.contextPath }/user/modify">mypage</a></li>
                        <li><a href="${pageContext.request.contextPath }/buy/mylist">buylist</a></li>
                  </ul></li>
               <li><a href="${pageContext.request.contextPath }/user/logout">logout</a></li>
            </c:if>
         </ul>
         </nav>
         <br>
         
         <ul id="menu" style="margin: 0 auto;">
      <li><a href="${pageContext.request.contextPath }" id="logo" ><img alt="" src="${pageContext.request.contextPath }/asset/images/burger_logo.png" 
          style="object-fit: cover; padding-right: 1rem;  height: 82px !important;"></a></li>
            <li><a href="${pageContext.request.contextPath }/brand.jsp">brand&nbsp;</a></li>
            <li><a href="${pageContext.request.contextPath }/menu/list">menu&nbsp;</a></li>
            <li><a href="${pageContext.request.contextPath }/event/event">event&nbsp;</a></li>
            <li><a href="${pageContext.request.contextPath }/notice/list">notice&nbsp;</a></li>
            <li><a href="${pageContext.request.contextPath }/map.jsp">map</a></li>
            
         </ul>
      </div>
      
</body>
</html>
