<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>IT BURGER</title>
<meta charset="UTF-8">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/asset/css/notice_write.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<style type="text/css">
div#header{
	height:349.16px;
	}
	h1 {
    padding-bottom: 22px !important;
}
tr{
	aling-items: center;
}
</style>
</head>
<body class="nowrite">
      <%@ include file="../layout/header.jsp"%>
   <main id="write" style="width: 50%">


      <h3>관리자 :: 공지사항</h3>
      <p>관리자만 새로운 공지사항을 작성할 수 있습니다.</p>
      <hr style="color: white;">
      <form method="post" action="save" enctype="multipart/form-data">
         <table>
            <tr>
               <th class="label"><label>제목</label></th>
               <td><input type="text" name=notice_title size="50" required></td>
            </tr>
            <tr>
               <th class="label"><label>첨부이미지</label></th>
               <td><input type="file" name="notice_image"></td>
            </tr>
            <tr>
               <th class="label"><label>내용</label></th>
               <td><textarea rows="30" cols="80" name="notice_content"
                     style="resize: none;" required></textarea></td>
            </tr>
            <tr>
               <td style="text-align: center;" colspan="2"; >
                  <button type="submit">저장</button>
                  <button type="reset">다시쓰기</button>
                  <button type="button"
                     onclick="location.href='list?page=${(page eq null)?1:page}'">목록</button>
               </td>
            </tr>
         </table>
      </form>
   </main>
</body>
</html>
