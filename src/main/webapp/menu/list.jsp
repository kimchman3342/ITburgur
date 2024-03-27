<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
	<head>
		<title>IT BURGER</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="../asset/css/modal.css" />
		<link rel="stylesheet" href="../asset/css/menu.css" />
		<script src="https://kit.fontawesome.com/352c53403e.js" crossorigin="anonymous"></script>
	<style>
	.selected{
	color: red;
	text-decoration: underline;
	}
	h1{
	padding-bottom: 22px !important;
	}
	div#header{
	height:349.16px;
	}
	#logo{
	width: 132px !important;
	}
	</style>
	</head>
	<body class="is-preload">

			<!-- Header -->
			<%@ include file="../layout/header.jsp" %>
			
		<section id="booklist">
    <div class="new" style="display: flex;">
        <h3 style="font-size: xxx-large;">메뉴</h3>
        <p style="text-align: left; padding-left: 2rem; display: flex; flex-direction: column-reverse;">상기 메뉴는 매장상황에 따라 일부 상이할 수 있습니다.</p>
    </div>
    <hr>
<div class="cate">
    <a class="category-button" data-category="menuall" href="${pageContext.request.contextPath}/menu/list">전체</a>
    <a class="category-button" data-category="new" href="?cate=NEW">New</a>
    <a class="category-button" data-category="burger" href="?cate=BURGER">Burger</a>
    <a class="category-button" data-category="drink" href="?cate=DRINK">Beverage</a>
    <a class="category-button" data-category="side" href="?cate=SIDE">Side</a>
</div>  

<div class="menu-list" id="mainarea">
    
<c:forEach var="bo" items="${menuList}">
    <c:choose>
        <c:when test="${param.cate == null || param.cate == bo.category_code}">
            <div class="picture" data-category="${bo.category_code}">
                <div style="height:80%;">
                    <img class="image" src="../asset/images/${bo.img_name}" alt="${bo.menu_name}">
                </div>
                <div class="product">  
                    <a data-menu="${bo.menu_code}" style="cursor: pointer;"><i class="fa-regular fa-circle-play"></i>구매하기</a>
                    <br>
                    <div>
                        <c:out value="${bo.menu_name}"/> (<fmt:formatNumber value="${bo.price}" pattern="###,###"/> 원)
                        <input type="hidden" value="${bo.menu_desc}"/>
                    </div>
                </div>
            </div>
        </c:when>
    </c:choose>
</c:forEach>
</div>
</section>

			<div data-num="3" id="datanum"></div>

<div class="modal" tabindex="-1">
    <div class="modal-content">
        <div class="modal-header" style=" display:flex;">
            <div id="menuName" style="font-size: x-large; font-weight: 700; padding-left: 4rem;"></div>
            <a href="${pageContext.request.contextPath}/menu/list" class="btn-close"></a>
        </div>
        <div class="modal-body" id="modal-body-content" style="display: flex;">
            <!-- 클릭한 이미지에 대한 정보가 여기에 표시됩니다. -->
   			<img id="image" src="" alt="">
            <div id="modal-info">
                <div id="menuDesc" style="padding: 3rem 0 0 3rem; width: 270px; font-weight: 700;">
                </div>
            </div> 
        </div>
    </div>
</div>


			<!-- Scripts -->
			<script src="../assets/js/jquery.min.js"></script>
			<script src="../assets/js/jquery.dropotron.min.js"></script>
			<script src="../assets/js/util.js"></script>
			<script src="../assets/js/main.js"></script>
			<script src="../js/nav.js"></script>
			<!-- 부트스트랩 - 모달 사용 -->
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js">
			</script>
			<!-- 비동기 http 통신 axios api-->  <!-- 비동기 통신을 위한 자바스크립트 api -->
			<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
			<!-- 결제위젯 SDK 추가 -->
  			<script src="https://js.tosspayments.com/v1/payment-widget"></script>


<script>
    document.addEventListener("DOMContentLoaded", function() {
        var categoryButtons = document.querySelectorAll(".category-button");
        var menuItems = document.querySelectorAll(".menu-list .picture");

        categoryButtons.forEach(function(button) {
            button.addEventListener("click", function() {
                var selectedCategory = this.getAttribute("data-category");

                menuItems.forEach(function(item) {
                    var itemCategory = item.getAttribute("data-category");

                    if (selectedCategory === "menuall" || selectedCategory === itemCategory) {
                        item.style.display = "block";
                    } else {
                        item.style.display = "none";
                    }
                });
            });
        });

        // 페이지 로드 시 전체 메뉴 표시
        showAllMenu();
    });

    // 전체 메뉴 표시 함수
    function showAllMenu() {
        var menuItems = document.querySelectorAll(".menu-list .picture");
        menuItems.forEach(function(item) {
            item.style.display = "block";
        });
    }
</script>

	<script>
			const modal = new bootstrap.Modal(document.querySelector(".modal"))
				document.querySelector("#mainarea").addEventListener('click',function(evt){
					evt.preventDefault()				//a 태그 등 pagination 안에 있는 기본 클릭 동작을 중지
					//evt.stopPropagation()			//클릭 이벤트는 자식 또는 부모요소에 전달되는데 그것을 중지
					const target = evt.target
					if(target.tagName !== 'A') {return}			
		
					let yn
					console.log("user.user_id",'${user}' )
					
					if('${user.user_id}'==''){
						yn=confirm('구매는 로그인이 필요합니다. 로그인 하시겠습니까?')
						// 로그인 후 메뉴로 돌아가기
						if(yn) {
							sessionStorage.setItem('back', 'menu/list');
							location.href='../user/login' 
						}
					}else {
						const menu_code = target.getAttribute("data-menu")		
						
						// 메뉴옵션 선택 페이지로 이동하기
						location.href='../option/list?menu_code=' + menu_code
					}
				})
				
		</script>
		<script>
				document.querySelector("#new-menu").addEventListener('click',function(evt){
					evt.preventDefault()				//a 태그 등 pagination 안에 있는 기본 클릭 동작을 중지
					//evt.stopPropagation()			//클릭 이벤트는 자식 또는 부모요소에 전달되는데 그것을 중지
					const target = evt.target
					if(target.tagName !== 'A') {return}			
		
					let yn
					console.log("user.user_id",'${user}' )
					
					if('${user.user_id}'==''){
						yn=confirm('구매는 로그인이 필요합니다. 로그인 하시겠습니까?')
						// 로그인 후 메뉴로 돌아가기
						if(yn) {
							sessionStorage.setItem('back', 'menu/list');
							location.href='../user/login' 
						}
					}else {
						const menu_code = target.getAttribute("data-menu")		
						
						// 메뉴옵션 선택 페이지로 이동하기
						location.href='../option/list?menu_code=' + menu_code
					}
				})
				
		</script>			
		<script>
				document.querySelector("#burger-menu").addEventListener('click',function(evt){
					evt.preventDefault()				//a 태그 등 pagination 안에 있는 기본 클릭 동작을 중지
					//evt.stopPropagation()			//클릭 이벤트는 자식 또는 부모요소에 전달되는데 그것을 중지
					const target = evt.target
					if(target.tagName !== 'A') {return}			
		
					let yn
					console.log("user.user_id",'${user}' )
					
					if('${user.user_id}'==''){
						yn=confirm('구매는 로그인이 필요합니다. 로그인 하시겠습니까?')
						// 로그인 후 메뉴로 돌아가기
						if(yn) {
							sessionStorage.setItem('back', 'menu/list');
							location.href='../user/login' 
						}
					}else {
						const menu_code = target.getAttribute("data-menu")		
						
						// 메뉴옵션 선택 페이지로 이동하기
						location.href='../option/list?menu_code=' + menu_code
					}
				})
				
		</script>
		<script>
				document.querySelector("#side-menu").addEventListener('click',function(evt){
					evt.preventDefault()				//a 태그 등 pagination 안에 있는 기본 클릭 동작을 중지
					//evt.stopPropagation()			//클릭 이벤트는 자식 또는 부모요소에 전달되는데 그것을 중지
					const target = evt.target
					if(target.tagName !== 'A') {return}			
		
					let yn
					console.log("user.user_id",'${user}' )
					
					if('${user.user_id}'==''){
						yn=confirm('구매는 로그인이 필요합니다. 로그인 하시겠습니까?')
						// 로그인 후 메뉴로 돌아가기
						if(yn) {
							sessionStorage.setItem('back', 'menu/list');
							location.href='../user/login' 
						}
					}else {
						const menu_code = target.getAttribute("data-menu")		
						
						// 메뉴옵션 선택 페이지로 이동하기
						location.href='../option/list?menu_code=' + menu_code
					}
				})
				
		</script>
		<script>
				document.querySelector("#drink-menu").addEventListener('click',function(evt){
					evt.preventDefault()				//a 태그 등 pagination 안에 있는 기본 클릭 동작을 중지
					//evt.stopPropagation()			//클릭 이벤트는 자식 또는 부모요소에 전달되는데 그것을 중지
					const target = evt.target
					if(target.tagName !== 'A') {return}			
		
					let yn
					console.log("user.user_id",'${user}' )
					
					if('${user.user_id}'==''){
						yn=confirm('구매는 로그인이 필요합니다. 로그인 하시겠습니까?')
						// 로그인 후 메뉴로 돌아가기
						if(yn) {
							sessionStorage.setItem('back', 'menu/list');
							location.href='../user/login' 
						}
					}else {
						const menu_code = target.getAttribute("data-menu")		
						
						// 메뉴옵션 선택 페이지로 이동하기
						location.href='../option/list?menu_code=' + menu_code
					}
				})
		</script>
		
	<script>
    const categoryButtons = document.querySelectorAll('.category-button');
    const menuLists = document.querySelectorAll('.menu-list');
    
    categoryButtons.forEach((button, index) => {
        button.addEventListener('click', () => {
            menuLists.forEach((menuList) => {
                menuList.style.display = 'none';
            });

            menuLists[index].style.display = 'block';
        });
    });
</script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        var categoryButtons = document.querySelectorAll(".category-button");

        // 각 버튼에 대한 이벤트 리스너를 추가
        categoryButtons.forEach(function(button) {
            button.addEventListener("click", function() {
                // 이전에 선택된 버튼의 스타일을 제거
                var selectedButton = document.querySelector(".category-button.selected");
                if (selectedButton) {
                    selectedButton.classList.remove("selected");
                }

                // 현재 클릭된 버튼에 선택된 클래스를 추가
                this.classList.add("selected");
            });
        });
    });
</script>
			<script src="../asset/js/menulist.js"></script>
	</body>
</html>