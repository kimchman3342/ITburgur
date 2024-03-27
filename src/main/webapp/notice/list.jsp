<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<!--
    Arcana by Pixelarity
    pixelarity.com | hello@pixelarity.com
    License: pixelarity.com/license
-->
<html>
<head>
<title>IT BURGER</title>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
   href="${pageContext.request.contextPath }/asset/css/notice_list.css" />
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
   rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">

<script src="https://kit.fontawesome.com/352c53403e.js"
   crossorigin="anonymous"></script>
<style type="text/css">
body {
   overflow-x: hidden;
      font-family: "Hahmlet", serif;
}

div#header {
   height: 349.16px;
}

h1 {
   padding-bottom: 22px !important;
    font-family: "Hahmlet", serif;
}
</style>
</head>
<body class="is-preload">
   <div id="page-wrapper">

      <!-- Header -->
      <%@ include file="../layout/header.jsp"%>
      <!-- Main -->
      <section class="wrapper style1" id="bg_notice">
         <div id="notice_content">

            <!-- Content -->
            <article style="text-align: center; margin: 20px">
               <header class="guide">
                  <h1>공지사항</h1>
               </header>
            </article>
            <hr style="color: white;">


            <script type="text/javascript">
const form = document.forms[0];
document.querySelectorAll('option').forEach(ele => {
    if (ele.value == '${empty paging.column ? '' : paging.column}') ele.selected = true;
    else ele.selected = false;
});
document.querySelector('#search-btn').addEventListener('click', () => {
    const find = document.forms[0].findText;
    const column = document.forms[0].column;
    if (find.value === '' || column.value === 'none') {
        alert('검색어 입력과 검색 항목 선택을 하세요.');
        find.focus();
    } else {
        document.forms[0].submit();
    }
});
document.querySelector('#column').addEventListener('change', () => {
    const sel = form.column.value;
    form.findText.type = (sel == 'notice_date') ? 'date' : 'text'; // 선택한 항목이 작성날짜일 때 input 타입 변경
});
</script>
            <div>
               <ul id="main">
                  <li class="row"><span>번호</span> <span>제목</span> <span>조회수</span>
                     <span>작성일</span></li>
                  <c:forEach var="vo" items="${list}" varStatus="status">
                     <c:set var="noticeNumber"
                        value="${paging.pageSize * (paging.currentPage - 1) + status.index + 1}" />
                     <li class="row"><span><c:out value="${noticeNumber}" /></span>
                        <!-- 수정된 부분: 공지글 번호 --> <span> <a
                           href="read?notice_seq=${vo.notice_seq}" class="notice_title">
                              <c:out value="${vo.notice_title}" />
                        </a>
                     </span> <!-- 제목 --> <span><c:out value="${vo.notice_readcount}" /></span>
                        <!-- 조회수 --> <span><fmt:formatDate
                              value="${vo.notice_date}" pattern="yyyy-MM-dd" /></span> <!-- 작성일 -->
                     </li>
                  </c:forEach>
               </ul>
            </div>
            <script type="text/javascript">
function writtte() {
    let yn;
    if ('${user.user_id}' == '') {
        yn = confirm('글쓰기는 로그인이 필요합니다. 로그인 하시겠습니까?');
        if (yn) {
            location.href = '../user/login';
        }
    } else {
        location.href = 'write?page=${empty paging.currentPage ? '' : paging.currentPage }';
    }
}
</script>
            <div class="list"
               style="width: 700px; margin: auto; padding: 10px; text-align: center;">
               전체 글 개수 :
               <c:out value="${paging.totalCount }" />
            </div>
            <div id="search" style="display: block;">
               <div class="brg_paging"
                  style="width: 700px; margin: auto; padding: 10px; text-align: center;">
                  <a href="#" onclick="goToPreviousPage(); return false;"
                     class="prev"></a> <a class="pagenum"
                     href="javascript:page('${empty paging.startPage ? '' : paging.startPage-1 }')"
                     style='<c:if test="${paging.startPage==1 }">display:none;</c:if>'>&lt;</a>
                  <c:forEach var="i"
                     begin="${empty paging.startPage ? '' : paging.startPage }"
                     end="${empty paging.endPage ? '' : paging.endPage }">
                     <a class="pagenum ieach" href="#" onclick="page(${i})"><c:out
                           value="${i}" /></a>

                  </c:forEach>
                  <a class="pagenum"
                     href="javascript:page('${empty paging.endPage ? '' : paging.endPage+1 }')"
                     style='<c:if test="${paging.endPage==paging.totalPage }">display:none;</c:if>'>&gt;</a>
                  <a href="#" onclick="goToNextPage(); return false;" class="next"></a>
               
                  <form action="list" method="get" style="margin-top: 14px">
                     <!-- Get 방식 처리 -->
                     <select name="column" id="column">
                        <option value="none">선택</option>
                        <option value="notice_title">제목</option>
                        <option value="notice_content">내용</option>
                        <option value="notice_date">작성날짜</option>
                     </select> <input type="text" name="findText"
                        value="${empty paging.findText ? '' : paging.findText }"
                        placeholder="검색할 단어를 입력하세요.">
                     <button type="submit">검색</button>
                     <button type="button" onclick="location.href='list'">전체보기</button>
                  </form>
                  <br>
               </div>

         </div>
         <div style="float: right; margin: 30px;">
            <c:if test="${user.user_id=='admin' }">
               <button onclick="location.href='write'" class="write-btn">관리자
                  글쓰기</button>
            </c:if>
         </div>
      </section>
      <br> <br> <br> <br> <br> <br> <br>
      <br>

      <script type="text/javascript">
const pnums = document.querySelectorAll('.ieach');
pnums.forEach(function(item){
    /* item 번호가 현재 페이지 이면 글꼴 스타일을 다르게함. */
    if(item.innerHTML=='${empty paging.currentPage ? '' : paging.currentPage}') {    
        item.style.color = 'black';
        item.style.fontWeight = 'bold';
    } else {
        item.style.color = 'black';
    }
});
function page(pno) {
    let url = '?page=' + pno;
    if ('${empty paging.findText ? '' : paging.findText }' != '') {
        url += '&findText=${empty paging.findText ? '' : paging.findText}&column=${empty paging.column ? '' : paging.column}';
    }
    
    // 이전 페이지 번호의 스타일 초기화
    const pnums = document.querySelectorAll('.ieach');
    pnums.forEach(item => {
        item.classList.remove('current-page');
    });
    
    // 현재 페이지 번호의 스타일 변경
    const currentPageLink = document.querySelector('.ieach:nth-child(' + pno + ')');
    if (currentPageLink) {
        currentPageLink.classList.add('current-page');
    }
    
    location.href = url;
}

function readOne(notice_seq){
    let url = 'read?notice_seq='+notice_seq+'&page=' + ${empty paging.currentPage ? '' : paging.currentPage}
    if('${empty paging.findText ? '' : paging.findText }'!='')
        url += '&findText=${empty paging.findText ? '' : paging.findText}&column=${empty paging.column ? '' : paging.column}'
    location.href=url    
}

//이전페이지
function goToPreviousPage() {
    const currentPage = ${empty paging.currentPage ? 1 : paging.currentPage}; // 현재 페이지
    if (currentPage > 1) {
        page(currentPage - 1); // 페이지 변경 함수 호출
    }
}

// 다음페이징
function goToNextPage() {
    const currentPage = ${empty paging.currentPage ? 1 : paging.currentPage}; // 현재 페이지
    const totalPages = ${empty paging.totalPage ? 1 : paging.totalPage}; // 전체 페이지 수
    if (currentPage < totalPages) {
        page(currentPage + 1); // 페이지 변경 함수 호출
    }
}


// 페이지 번호 스타일 설정 함수
function setPageNumberStyle() {
    const currentPageNumber = '${empty paging.currentPage ? '' : paging.currentPage}';
    const pnums = document.querySelectorAll('.ieach');
    pnums.forEach(function(item) {
        if (item.innerHTML === currentPageNumber) {
            item.classList.add('current-page'); // 현재 페이지에 스타일 추가
        } else {
            item.classList.remove('current-page'); // 현재 페이지가 아니면 스타일 제거
        }
    });
}


// DOM 로딩 완료 후 페이지 번호 스타일 설정
document.addEventListener("DOMContentLoaded", function() {
    setPageNumberStyle();
});


</script>

      <div data-num="1" id="datanum"></div>
   </div>

   <!-- Scripts -->
   <script src="../assets/js/jquery.min.js"></script>
   <script src="../assets/js/jquery.dropotron.min.js"></script>
   <script src="../assets/js/browser.min.js"></script>
   <script src="../assets/js/breakpoints.min.js"></script>
   <script src="../assets/js/util.js"></script>
   <script src="../assets/js/main.js"></script>
   <script src="../js/nav.js"></script>
   <%@ include file="../layout/footer.jsp"%>
   <div style="margin-bottom: 100px;"></div>
</body>
</html>

