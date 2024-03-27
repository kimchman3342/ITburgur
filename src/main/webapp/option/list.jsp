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
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
      <link rel="stylesheet" href="../asset/css/paymodal.css" />   
      <link rel="stylesheet" href="../asset/css/modal.css" />   
      <link rel="stylesheet" href="../asset/css/menu.css" />   
      <script src="https://kit.fontawesome.com/352c53403e.js" crossorigin="anonymous"></script>
      
   <style>
   .modal-backdrop {
   	--bs-backdrop-zindex: 0;
   }
   #btn_pay{
   padding: 8px 3rem; 
    border-radius: 10px; 
    background-color: orangered; 
    text-decoration: none; 
    color: #333; 
    font-weight: bold; 
    transition: background-color 0.3s ease;
    align-items: right;
   }
   .intro > ul > li {
   padding: 5px 0.8rem;
   padding-bottom: 10px;
   }
   .title{
   display: inline-flex; 
   padding: 4rem 1rem 0 0;
   font: 18px / 20px;
   }
   .intro > ul {
   text-align: justify;
   padding-left: 5rem;
   width: 500px;
   }
   .gallery.bookcase{
   margin: 5rem 0 15rem 8rem;
   
   }
   
   .price{
   	padding-left: 20rem;
   }
   
    input[type="number"] {
       width: 40px; /* 인풋 박스의 너비를 60px로 설정합니다. */
       padding: 0.5px; /* 내부 여백을 조정하여 텍스트가 잘 보이게 합니다. */
       margin-right: 10px; /* 오른쪽 여백을 추가하여 요소들 사이에 공간을 만듭니다. */
    }
    h1{
	padding-bottom: 22px !important;
	}
	div#header{
	height:349.16px;
	}
   </style>
   </head>
   <body class="is-preload">

      <div id="page-wrapper">

         <!-- Header -->
         <%@ include file="../layout/header.jsp" %>
         
         <!-- Main -->
         <section id="booklist">
            <h3 class="title" style="font-size: xx-large;">메뉴</h3>
            <p class="title" style="padding-right: 70rem;">판매 중인 메뉴입니다.</p>
            <hr>
            <div class="gallery bookcase" style="display: flex;">
               <div style="height:80%; padding-top: 2rem;">
                   <input type="hidden" value="${menuVO.menu_code}" name="menu_code" id="menu_code">
                   <input type="hidden" value="${menuVO.price}" name="menu_price" id="menu_price">
                  <br>
                  <img src="../asset/images/${menuVO.img_name}" alt="${menuVO.menu_name}" width="400px"><br><br><br>
                  <span id="title_menu" style="padding-bottom:3rem; font-size: xx-large;">${menuVO.menu_name}</span>
               </div>
               <div class="intro">   
                  <ul style="display: block;">
                     <c:forEach var="bo" items="${optionList }">
                        <li>
                           <input type="checkbox" name="option" id="option_${bo.option_seq}" 
                           value="${bo.option_seq}" data-option-all="${bo.option_seq},${bo.option_name},${bo.option_price}">
                           <label for="option_${bo.option_seq}">${bo.option_name}&nbsp;&nbsp;</label>
                           <fmt:formatNumber value="${bo.option_price }" pattern="###,###"/>원
                           <label for="count_${bo.option_seq}">수량 : </label>
                           <input type="number" name="count" id="count_${bo.option_seq}" placeholder="구매수량" value="1" min="1">
                        </li>
                     </c:forEach>
                  </ul>
                  <div>
                     <button type="button" name="btn_pay" id="btn_pay" style="margin-top: 1rem; cursor:pointer;">주문하기</button>
                  </div>
               </div>
            </div>
         </section>
            
         <%@ include file="../layout/footer.jsp" %>
      </div>

      <!-- 결제 Modal  -->
      <div class="modal" tabindex="-1">
         <div class="modal-dialog">
            <div class="modal-content">
               <div class="modal-header">
                  <h3 class="modal-title">메뉴를 구매하시겠습니까?</h3>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
               </div>
               <div class="modal-body">
                    
                  <div class="pay">
                        <!-- 결제 , 이용약관 UI 영역 -->
                        <div id="payment-method" style="display: flex;"></div>
                        <div class="price">
                     	<h3 id="menu_name" class="inline" style="padding-bottom: 2rem;"></h3>
                     	<div style="display: flex; font-size: 20px;"><strong style="padding-top:8px;">총 금액 : </strong>
                     	<h3 id="total_price" class="inline" style="padding-left: 3rem; font-weight: bold;"></h3>
                        </div></div>
                        <div id="agreement">
                  </div> 
                  </div>
               </div>
               <div class="modal-footer">
                    <!-- 결제하기 버튼 -->
                    <button id="payment-button" type="button" class="btn btn-primary">결제하기</button>
               </div>
            </div>
         </div>
      </div>

      <!-- Scripts -->
      <script src="../asset/js/jquery.min.js"></script>
      <script src="../asset/js/jquery.dropotron.min.js"></script>
      <script src="../asset/js/browser.min.js"></script>
      <script src="../asset/js/breakpoints.min.js"></script>
      
      <!-- 부트스트랩 - 모달 사용 -->
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
      
      <!-- 비동기 http 통신 axios api-->  <!-- 비동기 통신을 위한 자바스크립트 api -->
      <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
      
      <!-- 결제위젯 SDK 추가 -->
      <script src="https://js.tosspayments.com/v1/payment-widget"></script>
            
      <script>
         let fn_init_toss_payment = function(obj) {
            const clientKey = 'test_ck_DnyRpQWGrNDzNjejy5n23Kwv1M9E'
   
               const customerKey = crypto.randomUUID()  
               const payment_button = document.getElementById("payment-button")
   
               // ------  결제위젯 초기화 ------ 
               const paymentWidget = PaymentWidget(clientKey, customerKey)
   
               // ------  결제 UI 렌더링 ------ 
               const paymentMethodWidget = paymentWidget.renderPaymentMethods(
                   "#payment-method", 
                   { value: Number(obj.price) },
                   { variantKey: "DEFAULT" } 
               )
   
               // ------  이용약관 UI 렌더링 ------
               paymentWidget.renderAgreement(
                   '#agreement',
                   { variantKey: "AGREEMENT" }
               )
   
   
               paymentMethodWidget.updateAmount(Number(obj.price))
               const selectedPaymentMethod = paymentMethodWidget.getSelectedPaymentMethod()
   
               // ------ '결제모달 > 결제하기' 버튼 누르면 결제창 띄우기 ------
               const pay_obj = {
                   orderId: obj.menu_code + '_' + obj.detail_option_seq + '_' + obj.time,                   
                   orderName: obj.buy_title + '_' + obj.detail_option_seq + '_' + obj.detail_option_desc.substr(0,60),                       
                   successUrl: window.location.origin + "/ITburger/pay/success",  
                   failUrl: window.location.origin + "/ITburger/pay/fail",        
                   customerName: '${user.user_name}'
               }
   
               console.log(pay_obj)
   
               payment_button.addEventListener("click", function () {
                   paymentWidget.requestPayment(pay_obj)
               })
         }
         const modal = new bootstrap.Modal(document.querySelector(".modal"))  // 부트스트랩의 모달 기능을 제공하는 객체
            
            //console.log(modal)
   
            // 현재 위치에서 btn_pay 요소를 가져오는 경우는 body 요소들이 모두 만들어진 후 실행하므로 오류없이 실행 가능합니다
            document.getElementById('btn_pay').addEventListener('click',
               () => {
                   let yn
               
               if('${user.user_id}'==''){
                     yn=confirm('결제는 로그인이 필요합니다. 로그인 하시겠습니까?')
                     if(yn) {
                         sessionStorage.setItem('back', 'menu/list');
                         location.href='../user/login'
                     }
                 }else {
                    
                    const option_arr = []   // 옵션데이터
                    const pay_data = {}      // 결제데이터
                     
                    const chk_arr = document.querySelectorAll('input[name="option"]:checked')
                  //console.log(chk_arr, typeof(chk_arr))
   
                    chk_arr.forEach(function (item, index, array) {
                       
                        //console.log("item = ", item)
   
                        const option_data =  item.getAttribute('data-option-all')
                        const ele =  option_data.split(",");
                        
                        // 수량 저장
                        const option_seq = ele[0]
                        let temp = 'count_'+option_seq
                        let option_count = document.getElementById(temp).value
                        //console.log('시퀀스: ', option_seq, ' 수량 : ',option_count)
   
                        ele.push(option_count)
                        
                        // console.log(ele)
                        
                          option_arr.push(ele)
                    }) // end chk_arr
                  
                  console.log('옵션 데이터 : ', option_arr)
                  
                  
               
                  
                    // 옵션 시퀀스 저장 변수
                    let option_seq_arr = []
                    let option_seq_str = ''
                    // 옵션 이름 저장 변수
                    let option_name_arr = []
                    let option_name_str = ''
                    // 결제 가격 저장 변수
                    let total_option_price = 0
                    let menu_price = Number(document.getElementById('menu_price').value)
                    
                    // 옵션 가격 계산 + 옵션 시퀀스 저장, 옵션 이름 저장
                    option_arr.forEach((ele,index) => {
                       /* 
                     console.log('옵션시퀀스: ', ele[0])
                     console.log('옵션이름: ', ele[1])
                     console.log('가격: ', ele[2])
                     console.log('수량: ', ele[3])
                      */
                     // 가격 0 이면 pass   
                     if(ele[2] > 0) {
                        let temp = Number(ele[2]) * Number(ele[3])
                        total_option_price += temp
                     }
                     
                       let temp =  ele[1]+' ' +ele[3] +'개'
                     option_seq_arr.push(ele[0])
                     option_name_arr.push(temp)
                     
                       
                  }) // end option_arr
                  
                  option_seq_str = option_seq_arr.join('-')
                  option_name_str = option_name_arr.join(',')
                  
                  const total_price = menu_price + total_option_price
                    const option_price = document.getElementById('menu_price').value
                    const menu_code = document.getElementById('menu_code').value
                    let buy_title = document.getElementById('title_menu').innerText
                    let current_time = new Date().toISOString().replace(/\D/g, '').slice(2, 14);
                    
                    
                  if(option_arr.length > 0) {
                     buy_title += ', '+ option_name_str.substr(0,14) +'...'
                  }
                  
                    // 결제 데이터 바인딩
                    pay_data.buy_title =  buy_title   
                    pay_data.menu_code =  menu_code   
                    pay_data.detail_option_seq =  option_seq_str
                    pay_data.detail_option_desc =  option_name_str.substr(0,60)
                    pay_data.price =  total_price
                    pay_data.time =  current_time
                    
                    console.log('결제 데이터 바인딩 : ', pay_data)
   
                    document.querySelector(".modal-body #menu_name").innerHTML = buy_title
                    document.querySelector(".modal-body #total_price").innerHTML = total_price.toLocaleString("ko-KR")
   
                    
                     modal.show()
                    fn_init_toss_payment(pay_data)
                 } // end if
                   
                   
               } 
            )   // end  event listener
   
      </script>

<script>
    // 페이지가 로드될 때 실행되는 함수
    document.addEventListener("DOMContentLoaded", function() {
        // 옵션 목록이 렌더링되었는지 확인
        var optionsExist = document.querySelector(".intro ul li");
        
        // 옵션 목록이 없는 경우 CSS를 조정
        if (!optionsExist) {
            // CSS 조정을 원하는 내용으로 수정
            var button = document.getElementById("btn_pay");
            button.style.margin = "17rem 30rem 0 0";
            button.style.backgroundColor = "bisque";
        }
    });
</script>
   </body>
</html>
