<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
   <title>IT BURGER</title>
   <meta charset="UTF-8">
   <link rel="stylesheet" href="../css/layout.css" />
   <link rel="stylesheet" href="../asset/css/style.css" />  <!-- 회원가입 (temp.css 는 미사용)-->
   <link rel="stylesheet" href="../asset/css/main.css" />   
   <link rel="stylesheet" href="../asset/css/event.css" />
   <link href="//cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
   <script src="//cdn.quilljs.com/1.3.6/quill.js"></script>
<style type="text/css">
h1{
	padding-bottom: 8.5px !important;
	}
	div#header{
	height:349.16px;
	}
</style>
<!-- 상대경로는 ../css/community.css 입니다. 
request객체의 contextPath를 el로 접근할 때에는 현재 jsp 객체 pageContext 를 사용해야 합니다. -->
</head>
   <body class="is-preload">
      <div id="page-wrapper">
        <!-- Header -->
        <%@ include file="../layout/header.jsp" %>
        <section id="book">
            <h3>이 달의 이벤트 </h3>
            <p class="sub">포토 리뷰를 올려주세요. </p>
            <hr style="color:white;">
            <form name="frm1" method="post" action="update" enctype="multipart/form-data">
                <input type="hidden" name="event_seq" value="${vo.event_seq}">
                <table>
                    <tr>
                        <th width="100px;">제목</th>
                        <td>
                            <c:choose>
                                <c:when test="${fn:contains(vo.event_title, '[수정]')}">
                                    <input type="text" name="event_title" size="50" value="${vo.event_title}">
                                </c:when>
                                <c:otherwise>
                                    <input type="text" name="event_title" size="50" value="${vo.event_title}">
                                </c:otherwise>
                            </c:choose>
                            <!-- readonly : 입력불가 -->
                        </td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td>
                            <input type="text" name="user_id" size="50" value="${user.user_id}" disabled="disabled">
                            <!-- disabled : 입력 불가 + 파라미터 전송 못함. -->
                        </td>
                    </tr>
                  
                  
                   
                    <tr>
                        <th>내용</th>
                        <!-- textarea 의 크기 : rows="20" cols="80" -->
                        <td><textarea rows="30" cols="80" name="event_content" required><c:out value="${vo.event_content}" /></textarea></td>
                    </tr> 
                    <tr>
                        <th>이미지 업로드</th>
                        <td><input type="file" name="event_image"></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <button type="submit">저장</button>
                            <button type="reset">다시쓰기</button>
                            <button type="button" onclick="location.href='${pageContext.request.contextPath}/event/event'" class="book-btn">목록</button>
                            <!-- 현재 페이지 번호 전달 - 순서5) -->
                        </td>
                    </tr>
                </table>
            </form>
        </section>
        <div data-num="2" id="datanum"></div>
    </div>    
         <script src="../asset/js/jquery.min.js"></script>
         <script src="../asset/js/jquery.dropotron.min.js"></script>
            <script src="../asset/js/browser.min.js"></script>
         <script src="../asset/js/breakpoints.min.js"></script>
         <script src="../asset/js/util.js"></script>
         <script src="../asset/js/main.js"></script>
         <script src="../asset/js/nav.js"></script>
         <script src="../asset/js/editor.js"></script>
         
</body>
</html>
