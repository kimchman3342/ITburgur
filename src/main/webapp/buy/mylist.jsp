<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>IT BURGER</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale">
		<meta http-equiv="Cache-Control"
		content="no-cache, no-store, must-revalidate">
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Expires" content="0">
		
		<link rel="stylesheet" href="../asset/css/burgerMain.css" />	
		<link rel="stylesheet" href="../asset/css/layout.css" />	
		<!--  <link rel="stylesheet" href="../asset/css/main.css" /> -->
		<link rel="stylesheet" href="../asset/css/notice.css" />	
		<!-- <link rel="stylesheet" href="../asset/css/style.css" />	

		<!-- <script src="https://kit.fontawesome.com/352c53403e.js" crossorigin="anonymous"></script> -->
		<style type="text/css">
/* 스타일 추가 */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f9f9f9;
overflow-x: hidden;
}
.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
}
.buylist {
    background-color: #f9f9f9;
    border: 2px solid #FFF0F0;
    margin-bottom: 20px;
    padding: 20px;
    border-radius: 5px;
}

.buylist li {
    list-style-type: none; /* 리스트 스타일 제거 */
}

.buylist .intro {
    margin-top: 10px;
    display: flex; /* Flexbox 사용하여 내부 아이템을 가로로 배치 */
    align-items: center; /* 아이템을 세로 중앙 정렬 */
}

.buylist .intro a {
    display: none;
}

.buylist .intro div {
    font-size: 16px;
    color: #333;
    margin-left: 10px; /* 아이템 사이의 간격 설정 */
}

.buylist .intro div span {
    font-weight: bold;
}

hr {
    border: 0;
    height: 1px;
    background: #333;
    margin: 20px 0;
}

h3 {
    padding: 10px;
    border-radius: 5px;
    position:relative;
    left:42.5%;
    color: black;
    font-size: 36px;
    font-weight: bold;
    display:inline-block;
    text-align:center;
   
}

@media (max-width: 768px) {
    h3 {
        font-size: 24px;
        font: 'Nanum Gothic', 'Dotum', 'applegothic', sans-serif;
    }
    .buylist {
        padding: 10px;
    }
}

p {
    font-size: 20px;
    display: block;
    margin: 10px;
    border: 1px inherit;
    
}
.asd {
border-radius: 5px;
padding: 20px;
	margin: 0 auto;
margin-top: 30px;
margin-bottom: 30px;
box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
max-width: 1200px;
background-color: #fff;
}



/* h1 {
    position: relative;
    padding: 0;
    margin: 0;
    font-family: "Raleway", sans-serif;
    font-weight: 300;
    font-size: 40px;
    color: #080808;
    -webkit-transition: all 0.4s ease 0s;
    -o-transition: all 0.4s ease 0s;
    transition: all 0.4s ease 0s;
    
} */
div#header{
	height:349.16px;
	}
h1{
	padding-bottom: 22px !important;
}
# logo {
	width: 131.98px !important;
}
</style>
		
	</head>
	<body class="is-preload">

			<!-- Header -->
				<%@ include file="../layout/header.jsp" %>
			<!-- Main -->
			<section>
			
			<div class="asd">
				<c:if test="${sessionScope.user == null }">
				</c:if>

				<h3 style="margin:10px; padding-bottom: 15px;">구매 내역</h3>
				<p style="font-weight: bold; ">${user.user_id }님의 구매 내역입니다.</p>
				<hr style="color:white;">
				<c:forEach var="bo" items="${mylist }" >
				<input type="hidden" name="user_id" value="${bo.user_id }">
				<ul class="buylist" style="width: 70%; margin: 0 auto; margin-bottom: 20px"> 
						<li style="height:80%;">
						</li>
						<li class="intro" style="width:800px; display:inline;">	
							<!-- 결제에 필요한 모든 정보를 data-all 사용자 속성으로 저장 -->
							<a data-all="${bo.img_name},${bo.menu_name},${bo.detail_option_desc},${bo.amount},${bo.pay_type},${bo.create_dttm}"></a>
							<div style="justify-content: space-between; display: flex;">
								<img src="../asset/images/${bo.img_name}" alt="이미지" width="150" style="margin-left: 30px;" >
								<div style="font-weight: bold; margin: 0 auto; display: flex; align-items: center; padding-bottom: 10px;text-align: center;">
								<c:out value="${bo.menu_name},"/>
								<c:out value="${bo.detail_option_desc}"/>
								<br>
								<br>
								<fmt:formatNumber value="${bo.amount }" pattern="###,###"/> 원,
								<c:out value="${bo.pay_type}"/>
								<br>
								<br>
								<c:out value="${bo.create_dttm}"/>
								</div>
							</div>
						</li>
					</ul>
				</c:forEach>
				</div>
			</section>
				
		
			<%@ include file="../layout/footer.jsp" %>

		<!-- Scripts -->
			<script src="../asset/js/jquery.min.js"></script>
			<script src="../asset/js/jquery.dropotron.min.js"></script>
			<script src="../asset/js/browser.min.js"></script>
			<script src="../asset/js/breakpoints.min.js"></script>
			<script src="../asset/js/util.js"></script>
		
<script>
       document.addEventListener("DOMContentLoaded", function() {
        var buylist = document.querySelector(".buylist");
        if (!buylist) {
        var footer = document.querySelector("footer");
        var additionalMargin = "30rem";
        footer.style.marginTop = additionalMargin;
        document.body.appendChild(footer);
        }
        if (buylist && document.querySelectorAll(".buylist").length === 1) {
           var footer = document.querySelector("footer");
            var additionalMargin = "20rem";
            footer.style.marginTop = additionalMargin;
        }
        if (buylist && document.querySelectorAll(".buylist").length === 2) {
           var footer = document.querySelector("footer");
            var additionalMargin = "12rem";
            footer.style.marginTop = additionalMargin;
        }
    });
</script>

		
	</body>
</html>