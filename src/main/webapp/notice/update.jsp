<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <title>IT BURGER</title>
    <meta content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/notice_update.css" />
    <!-- 절대경로 -->
    <script src="https://kit.fontawesome.com/352c53403e.js"
        crossorigin="anonymous"></script>
</head>
<body>
    <main id="write">
        <h3>공지사항</h3>
        <p>공지사항 수정</p>
        <hr style="color: white;">
        <form name="frm1" method="post" action="update" onreset="onReset()"
            enctype="multipart/form-data">
            <input type="hidden" name="notice_seq" value="${vo.notice_seq }">
            <!-- 현재페이지 번호 전달 - 세션에 있으므로 생략 -->
            <table>
                <tr>
                    <th>제목</th>
                    <td><c:choose>
                            <c:when test="${fn:contains(vo.notice_title,'[수정]') }">
                                <input type="text" name="notice_title" size="50"
                                    value="${vo.notice_title }" readonly>
                            </c:when>
                            <c:otherwise>
                                <input type="text" name="notice_title" size="50"
                                    value="${vo.notice_title }" readonly>
                            </c:otherwise>
                        </c:choose> <!-- readonly : 입력불가 --></td>
                </tr>
                <tr>
                    <th>작성 날짜</th>
                    <td><c:out value="${vo.notice_date }" /></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <!-- textarea 의 크기 : rows="20" cols="80" -->
                    <td><textarea rows="30" cols="80" name="notice_content" id="notice_content"
                            required><c:out value="${vo.notice_content }" /></textarea></td>
                </tr>
                <tr>
                    <th>이미지</th>
                    <td>
                        <!-- 이미지를 수정할 수 있는 input 필드 -->
                        <input type="file" name="notice_image" accept="image/*">
                        <!-- 기존 이미지 미리보기 -->
                        <c:if test="${not empty vo.notice_image }">
                            <img src="${pageContext.request.contextPath}/asset/images/${vo.notice_image }" width="100">
                        </c:if>
                    </td>
                    
                </tr>
                
                <tr>
                
                    <td colspan="2" style="text-align: center;">
                    <div  style="display: flex; justify-content: space-around; width: 100%; margin-left: 30px;">
                       <button type="submit" style="width: 70%; margin-right: 50px;">저장</button>
                        <button type="reset" style="width: 70%; margin-right: 50px;">다시쓰기</button>
                         <button type="button" onclick="golist()" style="width: 70%; margin-right: 50px;">목록</button> <!-- 현재페이지 번호 전달 - 순서5) -->
                         </div>
                    </td>
                </tr>
            </table>
        </form>
    </main>
    <script type="text/javascript">
        function onReset(event) {
            document.frm1.reset();
        }

        function golist() {
            let url = 'list?'
            url += 'page=' + ${paging.currentPage }; //파라미터에 페이지번호 추가
            if ('${paging.findText }' != '') //검색값이 있을 때 파라미터에 검색값 2개 추가
                url += '&findText=${paging.findText }&column=${paging.column }'
            location.href = url
        }/* location.href='list?page=${paging.currentPage}&findText=${paging.findText }&column=${paging.column }' */
    </script>
</body>
</html>
