<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE HTML>

<html>
	<head>
		<title>IT BURGER</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../asset/css/main.css" />
	</head>
	<body class="is-preload">
		<div id="page-wrapper">

			<%@ include file="../layout/header.jsp" %>

			<!-- Main -->
				<section class="wrapper style1">
					<div class="container">
						<div class="row gtr-200">
							<div class="col-3 col-12-narrower">
								<div id="sidebar1">
								</div>
							</div>
							<div class="col-6 col-12-narrower imp-narrower">
								<div id="content">

									<!-- Content -->

										<article>
											<header>
												<h2>결제 완료</h2>
												<h3 id="result">결제 내역입니다.</h3>
											</header>
											
											<div style="margin-bottom: 1em;">
												<img src="../asset/images/${item['IMG_NAME']}" width="90px">
											</div>
											<div  class="info">
												<p>
												<span>메뉴:</span>
												<span class="title" id="orderName"></span>(<span id="orderId"></span>)
												</p>
												<p>
												<%-- <span>옵션:</span>
												<span class="title"><fmt:formatNumber value="${item.price }" pattern="###,###"/> 원</span> --%>
												</P>
												<span>총 결제금액:</span>
												<span class="title" id="amount"></span>
												<br>
												결제카드 : <span id="cardtype"></span> <span id="method"></span> (<span id="cardno"></span>)<br> 
												승인날짜 : <span class="title" id="paydate"></span>
											</div>
											<div class="paybtn">
												<a class="btn btn-primary ok" href="/ITburger">홈</a>&nbsp;&nbsp;&nbsp;
											</div>
										</article>

								</div>
							</div>
							<div class="col-3 col-12-narrower">
								<div id="sidebar2">

								</div>
							</div>
						</div>
					</div>
				</section>

				<%@ include file="../layout/footer.jsp" %>
		</div>

		<!-- Scripts -->
			<script src="../asset/js/jquery.min.js"></script>
			<script src="../asset/js/jquery.dropotron.min.js"></script>
			<script src="../asset/js/browser.min.js"></script>
			<script src="../asset/js/breakpoints.min.js"></script>

			<!-- 비동기 http 통신 axios api-->
			<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
			
			
			<script type="text/javascript">
				const responseData='${payment}'
				const payment = JSON.parse(responseData)
				const buyuser ='${user.user_id}'
				console.dir(payment)
		
				async function requestPaymentSave(payReq){
					const result = await axios.post('../api/pay',payReq)
					console.log(result)
					return result.data
				}
				
				const payReq = {menu_code : payment.orderId.split("_")[0],
								order_id : payment.orderId.split("_")[0] + '_' + payment.orderId.split("_")[2], 
								detail_option_seq : payment.orderName.split("_")[1], 
								detail_option_desc : payment.orderName.split("_")[2], 
								amount : payment.totalAmount, 
								user_id : buyuser,
								pay_type : payment.card.cardType + ' ' + payment.method, 
								payment_key : payment.paymentKey,
								create_dttm : payment.approvedAt,
								buy_title : payment.orderName.split("_")[0]}
				
				requestPaymentSave(payReq)
				.then(result => {
					document.querySelector('#result').innerHTML = result
					document.querySelector('#orderId').innerHTML = payment.orderId.split("_")[0] + '_' + payment.orderId.split("_")[2]
					document.querySelector('#orderName').innerHTML = payment.orderName.split("_")[0]
					document.querySelector('#cardtype').innerHTML = payment.card.cardType
					document.querySelector('#method').innerHTML = payment.method
					document.querySelector('#cardno').innerHTML = payment.card.number
					document.querySelector('#paydate').innerHTML = payment.approvedAt
					document.querySelector('#amount').innerHTML = payment.totalAmount.toLocaleString() + '원'
				})
				.catch(e=> {
					console.error(e.response)
					location.href='../invalid.html'
				})
				
				
			</script>
	</body>
</html>