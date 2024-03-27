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
<link rel="stylesheet" href="../asset/css/notice_read.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<style type="text/css">
div#header{
	height:349.16px;
	}
	h1 {
    padding-bottom: 22px !important;
}

</style>
</head>
<body class="is-preload">
	<div id="page-wrapper">

		<!-- Header -->
		<%@ include file="../layout/header.jsp"%>
		<!-- Main -->
		<section class="wrapper style1" id="notice">
			<div class="container">
					<div id="content" style="border: 2px solid;
    border-radius: 40px;
    width: 65%;
    padding-bottom: 50px;
    padding-top: 50px;">

					<!-- Content -->

					<div class="notice">
						<table style="margin-bottom: ">
							<tr>
								<th width="20%" style="border-right: 1px solid #ddd;"><label>제목</label></th>
								<td width="45%"><input type="text" name="title" size="90"
									value="${vo.notice_title }" disabled></td>
								<td></td>
							</tr>
							<tr>
								<th style="border-right: 1px solid #ddd;"><label>작성날짜</label></th>
								<td colspan="3"><fmt:formatDate value="${vo.notice_date }"
										type="both" /></td>
							</tr>
							<tr>
								<th style="border-right: 1px solid #ddd;"><label>내용</label></th>
								<td colspan="3"><c:if test="${not empty vo.notice_image}">
										<img src="../asset/images/${vo.notice_image}" alt="이미지"
											width="250">
										<br>
									</c:if> <c:if test="${empty vo.notice_image}">
										<span>이미지 없음</span>
									</c:if> <textarea rows="8" cols="80" name="content"
										style="resize: none;" disabled><c:out
											value="${vo.notice_content }" /></textarea></td>
							</tr>

							<tr>
								<td colspan="4" style="text-align: center; padding: 1em 4em;">
									<a class="button user" href="javascript:execute(3)">목록</a> <c:if
										test="${user.user_id=='admin'}">
										<!-- session 에 저장된 user애트리뷰트의 id와 작성자의 id 가 같은면 보이기 -->
										<a class="button adm" href="javascript:execute(1)">관리자:수정</a>
										<!-- 자바스크립트 함수:인자값 1은 수정 -->
										<!--  예시 : 글 비밀번호 입력하여 삭제. -->
										<a class="button adm" href="javascript:execute(2)">관리자:삭제</a>
										<!-- 자바스크립트 함수:인자값 2는 삭제  -->
									</c:if>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</section>

		<div data-num="1" id="datanum"></div>
		<%@ include file="../layout/footer.jsp"%>
	</div>

	<!-- Scripts -->
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/jquery.dropotron.min.js"></script>
	<script src="../assets/js/browser.min.js"></script>
	<script src="../assets/js/breakpoints.min.js"></script>
	<script src="../assets/js/util.js"></script>
	<script src="../assets/js/main.js"></script>
	<script src="../js/nav.js"></script>
	<script type="text/javascript">
		function execute(f) {
			let url;
			let message = (f === 1) ? '글 수정하시겠습니까?' : (f === 2) ? '글 삭제하시겠습니까?'
					: '';
			let yn = false;

			if (f === 1 || f === 2) {
				yn = confirm(message);
				if (yn)
					url = (f === 1) ? 'update?notice_seq=${vo.notice_seq}'
							: (f === 2) ? 'delete?notice_seq=${vo.notice_seq}'
									: '#';
			} else if (f === 3) {
				yn = true;
				url = 'list?';
				url += 'page=${paging.currentPage}';
				if ('${paging.findText}' !== '')
					url += '&findText=${paging.findText}&column=${paging.column}';
			} else
				return;

			console.log(yn);
			if (yn) {
				location.href = url;
			} else {
				alert('취소합니다.');
			}
		}

		function downloadfile(event) {
			event.preventDefault()
			alert('ok')
			document.forms[0].submit()
		}
		document.querySelector("#download").addEventListener('click',
				downloadfile)
	</script>
</body>
</html>
