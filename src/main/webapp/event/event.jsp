<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IT BURGER</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="" />
<link rel="stylesheet" href="../asset/css/bookmodal.css" />
<link rel="stylesheet" href="../asset/css/layout.css" />
<link rel="stylesheet" href="../asset/css/style.css" />
<!-- 회원가입 (temp.css 는 미사용)-->
<link rel="stylesheet" href="../asset/css/main.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">

<style>
#mainarea {
   display: flex;
   flex-wrap: wrap;
   font-family: "Hahmlet", serif;
   justify-content: space-between;
}

.gallery {
   width: calc(25% - 30px);
   margin-bottom: 20px;
   font-family: "Hahmlet", serif;
}

.gallery img {
   width: 250px;
   height: 250px;
   display: block;
   overflow: hidden;
   object-fit: cover;
   font-family: "Hahmlet", serif;
}
.modal img {
   width: 250px;
   height: 250px;
   display: block;
   overflow: hidden;
   object-fit: cover;
   font-family: "Hahmlet", serif;
}
.modal {
   --bs-modal-zindex: 0;
   --bs-modal-width: 900px;
    font-family: "Hahmlet", serif;
    font-family: "Hahmlet", serif;
}
.modal-backdrop{
   background-color: unset;
   width: 0;
   height: 0;
   font-family: "Hahmlet", serif;
   }
.modal-footer{
   justify-content:flex-start;
}
.modal-content{
   padding: 0;
}
.btn-close {
   min-width: 3rem;
   font-family: "Hahmlet", serif;
}
#mainarea {
   box-sizing: border-box;
   border: 2px solid;
   border-color: ##9d9999;
   border-radius: 40px;
   padding: 70px;
   margin: 0;
   margin-left: 70px;
   margin-right: 70px;
   margin-bottom: 50px;
   font-family: "Hahmlet", serif;
    
}


.heartimg >.heart:hover {
   transform:scale(1.8);
   
}
h1{
   padding-bottom: 22px !important;
   }
   div#header{
   height:349.16px;
   font-family: "Hahmlet", serif;
   }

h2, p, a.button {
   font-family: "Hahmlet", serif;
}


</style>
</head>
<body class="is-preload">
   <div id="page-wrapper">
      <!-- Header -->
      <%@ include file="../layout/header.jsp"%>
      <section id="booklist">
   
         <h2 style="margin-left: 20px; margin-top: 20px; color: #ff8c00;">이 달의 이벤트</h2>
         <hr>
            <div style="">
            <a href="new" class="button" style="float: right; margin-right: 120px; padding-right: 30px;margin-top: 10px; background-color: #FF8200;
            color: white;">쓰기</a>
         <p style="margin-left: 20px; font-weight:bold; ">IT 버거와 함께하는 당신의 이야기를 올려주세요. </p>
         <p style="margin-left: 20px; font-weight:bold; ">사진을 찍어 리뷰를 써주시는 분들께는 매 달 추첨을 통해 IT버거 5만원 상품권을 5분께 드립니다!</p>
         </div>
         <hr style="color: white;">
         <div id="mainarea" style="">
            <c:forEach var="bo" items="${event }">
               <div class="gallery">
                  <div>
                     <i class="icon solid fa-regular fa-bookmark"></i> <span></span>
                     <!-- <i class="fa-duotone fa-bookmark"></i> -->
                     <img id="some" style="cursor: pointer;" src="../asset/images/${bo.event_image}"
                        alt="${bo.event_title }" data-num="${bo.event_seq }">
                  </div>
                  <p style="padding-top: 10px; font-size: larger;">${bo.event_title }</p>
                  <p style="font-size: 0.8em;">${bo.user_id }</p>
                  <div class="heartimg" style="display: flex; font-weight: bold;">
                   <span id="likeCount_${bo.event_seq}">${bo.like_count}</span>
                   <img class="heart" id="likeButton_${bo.event_seq}" src="../asset/images/heart.png" data-event-id="${bo.event_seq}"
                   style=" width: 17px;
                        margin: 5px 0 0 10px;
                        height: 17px;
                        cursor: pointer;
                        ">
                  </div>
               </div>
            </c:forEach>

         </div>
         
      </section>
      <div data-num="2" id="datanum"></div>
   </div>

   <!-- The Modal -->
   <div class="modal" tabindex="-1">
      <div class="modal-dialog">
         <div class="modal-content">
            
            <div class="modal-body">
            <div class="modal-header">
               <h2 class="modal-title" id="event_title"></h2>
               <button type="button" class="btn-close"
                  data-bs-dismiss="modal"></button>
            </div>
               <input type="hidden" id="event_seq" name="event_seq" value="">
               <input type="hidden" id="user_id">
               <input type="hidden" id="event_title">
               <p id="event_content"></p>
               <p id="event_regdate" style="text-align: right;"></p>
            </div>
            <div class="modal-footer">
            <button type="button" class="btn btn-primary" id="likeButtonModal">좋아요</button>
               
                  <button type="button" class="btn btn-secondary btn-edit"
                     onclick="execute(1)" data-bs-dismiss="modal">수정</button>
                  <button type="button" class="btn btn-secondary btn-delete"
                         onclick="execute(2)"  data-bs-dismiss="modal">삭제</button>

            </div>
         </div>
      </div>
   </div>
       <%@ include file="../layout/footer.jsp" %>


   <!--  -->
   <script src="../asset/js/jquery.min.js"></script>
   <script src="../asset/js/jquery.dropotron.min.js"></script>
   <script src="../asset/js/browser.min.js"></script>
   <script src="../asset/js/breakpoints.min.js"></script>
   <script src="../asset/js/util.js"></script>
   <script src="../asset/js/main.js"></script>
   <script src="../asset/js/nav.js"></script>
   <!-- 부트스트랩 - 모달 사용 -->
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
   <!-- 비동기 http 통신 axios api-->
   <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
   <script>
  /*   const modal = new bootstrap.Modal(document.querySelector(".modal")); */
    let isProcessing = false;

    async function requestEventOne(idx) {
        const result = await axios.get('../api/event?idx=' + idx);
        return result.data;
    }

    const modal = new bootstrap.Modal(document.querySelector(".modal"));

    document.querySelectorAll('.gallery #some').forEach(image => {
        image.addEventListener('click', function () {
            const eventId = this.getAttribute('data-num');
            document.querySelector('.modal').setAttribute('data-num', eventId);

              requestEventOne(eventId)
                  .then(result => {
                      console.log('result', result);
                      document.querySelector(".modal-body #event_seq").value = result.event_seq;
                      document.querySelector(".modal-body #user_id").innerHTML = result.user_id;
                      document.querySelector(".modal-body #event_regdate").innerHTML = result.event_regdate;
                      document.querySelector(".modal-body #event_title").innerHTML = result.event_title;
                      document.querySelector(".modal-body #event_content").innerHTML = result.event_content;
                     
                      // 작성자와 로그인한 사용자 비교하여 수정 및 삭제 버튼 활성화 또는 비활성화
                      const user_id = result.user_id; // 작성자의 user_id
                      const loggedInUser = "${user.user_id}"; // 로그인한 사용자의 user_id
                      const isAdmin = "${user.user_id}" === 'admin'; // 관리자 여부
                      
                      const editButtons = document.querySelectorAll('.modal-footer .btn-edit');
                      const deleteButtons = document.querySelectorAll('.modal-footer .btn-delete');
                      
                      // 작성자 또는 관리자인 경우에만 수정 및 삭제 버튼 활성화
                    if (user_id === loggedInUser || isAdmin) {
                    editButtons.forEach(button => {
                        button.style.display = 'inline-block'; // 수정 버튼 표시
                    });
                    deleteButtons.forEach(button => {
                        button.style.display = 'inline-block'; // 삭제 버튼 표시
                    });
                } else {
                    editButtons.forEach(button => {
                        button.style.display = 'none'; // 수정 버튼 숨김
                    });
                    deleteButtons.forEach(button => {
                        button.style.display = 'none'; // 삭제 버튼 숨김
                    });
                }
                  })
                  .catch(e => {
                      console.error(e.response);
                  });
       
                    modal.show();
          });
      });
      
   
    function execute(f) { // eventSeq 파라미터 추가
        let url;
        let message = (f === 1) ? '글 수정하시겠습니까?' : (f === 2) ? '이벤트를 삭제하시겠습니까?' : ''; // 메시지 수정
        let yn = false;

        if (f === 1 || f === 2) {
            yn = confirm(message);
            if (yn) {
                // 삭제인 경우에만 서버로 이벤트 번호를 전달하여 삭제 요청
                if(f === 1){
                    let event_seq = document.querySelector('.modal-body #event_seq').value;
                    url = '../event/update?event_seq='+ event_seq; // 수정 요청 URL 설정
                }
                else if (f === 2) {
                    let event_seq = document.querySelector('.modal-body #event_seq').value;
                    url = '../event/delete?event_seq=' + event_seq; // 삭제 요청 URL 설정
                }
                console.log(url);
                location.href = url;
            }
        } else
            return;

        console.log(yn);
        if (!yn) {
            alert('취소합니다.');
        }
    }
         
    document.getElementById('likeButtonModal').addEventListener('click', async function () {
        if (!isProcessing) {
            isProcessing = true;
            this.disabled = true;
            const eventId = document.querySelector('.modal').getAttribute('data-num');
            try {
                const response = await axios.post('../api/like', {
                    eventId: eventId
                });
                console.log("response.data :", response.data);
              if(response.data.result === -1)
                 alert(response.data.message); 
                 
              if (response.data.result === 1) {
                    const likeCountElement = document.querySelector('#likeCount_' + eventId);
                    likeCountElement.textContent = parseInt(likeCountElement.textContent) + 1;
                }

            } catch (error) {
                console.error('Error:', error);
                alert("로그인 후 이용해 주세요");
                window.location.href = "../user/login";
            }

            setTimeout(() => {
                this.disabled = false;
                isProcessing = false;
            }, 500);
        }
    });

     async function likeEvent(eventId) {
         try {
             const response = await axios.post('../api/like', {
                 eventId: eventId
             });
             console.log("response.data :", response.data);
          if(response.data.result === -1)
              alert(response.data.message);

             if (response.data.result === 1) {
                 const likeCountElement = document.querySelector('#likeCount_' + eventId);
                 likeCountElement.textContent = parseInt(likeCountElement.textContent) + 1;
             }

         } catch (error) {
             console.error('Error:', error);
             alert("로그인 후 이용해 주세요");
             window.location.href = "../user/login";
         }
     }

     document.querySelectorAll('.gallery #some').forEach(image => {
         image.addEventListener('click', function () {
             const eventId = this.getAttribute('data-num');
             document.querySelector('.modal').setAttribute('data-num', eventId);

               requestEventOne(eventId)
                   .then(result => {
                       console.log('result', result);
                       document.querySelector(".modal-body #event_seq").value = result.event_seq;
                       document.querySelector(".modal-body #user_id").innerHTML = result.user_id;
                       document.querySelector(".modal-body #event_regdate").innerHTML = result.event_regdate;
                       document.querySelector(".modal-body #event_title").innerHTML = result.event_title;
                       document.querySelector(".modal-body #event_content").innerHTML = result.event_content;
                   })
                   .catch(e => {
                       console.error(e.response);
                   });

               modal.show();
           });
       });

       
       document.querySelectorAll('.gallery .heart').forEach(heart => {
           heart.addEventListener('click', function() {
               const eventId = this.getAttribute('data-event-id');
               likeEvent(eventId);
           });
       });

   
</script>


</body>
</html>