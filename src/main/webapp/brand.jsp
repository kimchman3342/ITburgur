<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IT BURGER</title>
<style>
body {
overflow-x: hidden;}
div#header{
	height:349.16px;
	}
.brand{
	margin: 0;
    padding: 0;
    -webkit-text-size-adjust: none;
	margin-bottom: 15px;
	margin-left: 25rem;
    padding-left: 480px;
    margin-top: 5rem;
    min-height: 380px;
    width: 30%;
    background: url(asset/images/브랜드소개.png) no-repeat 0 0;
    background-size: 470px;
    display: block;
    
    }
.brand:hover{
	background: url(asset/images/나무버거2.jfif) no-repeat 0 0;
	margin: 0;
    padding: 0;
    -webkit-text-size-adjust: none;
	margin-bottom: 15px;
	margin-left: 25rem;
    padding-left: 480px;
    margin-top: 5rem;
    min-height: 380px;
    width: 30%;
    background-size: 470px;
    display: block;
}
.bur{
	color: #333; 
	line-height: 30px; 
	font-size: 15px; 
	display: block;
	padding-top: 3rem;
	padding-left: 3rem;
	font-weight: bold;
	font-family: "Hahmlet", serif;
}

.brand2{
	margin: 0;
    padding: 0;
    -webkit-text-size-adjust: none;
	margin-bottom: 4rem;
    padding-right: 30rem;
    margin-left: 25rem;
    margin-top: 10px;
    min-height: 380px;
    width: 30%;
    background: url(asset/images/매장.png) no-repeat right bottom;
    background-size: 470px;
    display: block;
    font-weight: bold;
    
    }
.brand2:hover{
	background: url(asset/images/브랜드소개2.jfif) no-repeat right bottom;
	margin: 0;
    padding: 0;
    -webkit-text-size-adjust: none;
	margin-bottom: 3rem;
    padding-right: 30rem;
    margin-left: 25rem;
    margin-top: 10px;
    min-height: 380px;
    width: 30%;
    background-size: 470px;
    display: block;
    font-weight: bold;
}
.bur2{
	color: #333; 
	line-height: 30px; 
	font-size: 15px; 
	display: block;
	padding-top: 3rem;
	font-weight: bold;
	font-family: "Hahmlet", serif;
}
.bur2:first-child{
	padding-top: 7rem;
	font-weight: bold;
}

</style>
</head>
<body>
	<%@ include file="../layout/header.jsp" %>
	<h2 style="padding: 5rem 0 1rem 27rem; font-family: Hahmlet, serif; font-size: xx-large;"><strong>브랜드 소개</strong></h2>
	<hr>
	<div class="brand">
	<p>
	<span class="bur">
	IT 버거는 최적의 식자재와 요리방법을 찾아 버거마니아들을 위한 최적의 서비스를 제공하는 수제 버거 하우스 입니다.
	</span></p>
	<span class="bur">
	두툼하고 스모키한 직화구이 패티와 이에 어울리는 다양하고 매력적인 소스들, 그리고 부드러운 번으로 부담없는 가격에 즐기는 최고의 가성비 버거를 제공합니다.
	</span>
	</div>
	<div class="brand2">
	<p>
	<span class="bur2">
	기존의 버거들과는 달리한 새로운 맛의 버거들을 제공함으로서 <br>고객들에게 새로운 맛을 경험을 할 수 있도록 합니다
	</span></p>
	<span class="bur2">
	저희는 단순히 버거를 먹는 레스토랑을 넘어 다양한 시간, <br>다양한 고객님들의 상황에 최적화된 외식 경험을 제공하기 위한 <br>신개념 버거 하우스를 추구하고 있습니다.
	</span>
	</div>
<%@ include file="./layout/footer.jsp" %>
</body>
</html>