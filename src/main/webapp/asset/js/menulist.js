



document.querySelectorAll('.picture .image').forEach(img => {
    img.addEventListener('click', function(event) {
        // 클릭한 이미지 요소 확인
        console.log(event.target);

        // 클릭한 이미지의 정보 가져오기
        const menuCode = img.getAttribute('data-menu');
        const menuName = img.getAttribute('alt');
        const imgUrl = img.getAttribute('src');
         const menuDesc = img.closest('.picture').querySelector('input[type="hidden"]').value.trim();
        // 모달 내용 업데이트
        const modalImg = document.getElementById('image');
        modalImg.setAttribute('src', imgUrl);

        const modalMenuName = document.getElementById('menuName');
        modalMenuName.innerHTML = ` ${menuName}`;

        const modalMenuDesc = document.getElementById('menuDesc');
        modalMenuDesc.innerHTML = ` ${menuDesc}`;

        // 모달 띄우기
   //     const modal = new bootstrap.Modal(document.querySelector('.modal'));
        modal.show();
    });
});


document.querySelectorAll('#new-menu .image').forEach(img => {
    img.addEventListener('click', function(event) {
        // 클릭한 이미지 요소 확인
        console.log(event.target);

        // 클릭한 이미지의 정보 가져오기
        const menuCode = img.getAttribute('data-menu');
        const menuName = img.getAttribute('alt');
        const imgUrl = img.getAttribute('src');
         const menuDesc = img.closest('#new-menu').querySelector('input[type="hidden"]').value.trim();
        // 모달 내용 업데이트
        const modalImg = document.getElementById('image');
        modalImg.setAttribute('src', imgUrl);

        const modalMenuName = document.getElementById('menuName');
        modalMenuName.innerHTML = ` ${menuName}`;

        const modalMenuDesc = document.getElementById('menuDesc');
        modalMenuDesc.innerHTML = ` ${menuDesc}`;

        // 모달 띄우기
   //     const modal = new bootstrap.Modal(document.querySelector('.modal'));
        modal.show();
    });
});

document.querySelectorAll('#burger-menu .image').forEach(img => {
    img.addEventListener('click', function(event) {
        // 클릭한 이미지 요소 확인
        console.log(event.target);

        // 클릭한 이미지의 정보 가져오기
        const menuCode = img.getAttribute('data-menu');
        const menuName = img.getAttribute('alt');
        const imgUrl = img.getAttribute('src');
         const menuDesc = img.closest('#burger-menu').querySelector('input[type="hidden"]').value.trim();
        // 모달 내용 업데이트
        const modalImg = document.getElementById('image');
        modalImg.setAttribute('src', imgUrl);

        const modalMenuName = document.getElementById('menuName');
        modalMenuName.innerHTML = ` ${menuName}`;

        const modalMenuDesc = document.getElementById('menuDesc');
        modalMenuDesc.innerHTML = ` ${menuDesc}`;

        // 모달 띄우기
   //     const modal = new bootstrap.Modal(document.querySelector('.modal'));
        modal.show();
    });
});

document.querySelectorAll('#drink-menu .image').forEach(img => {
    img.addEventListener('click', function(event) {
        // 클릭한 이미지 요소 확인
        console.log(event.target);

        // 클릭한 이미지의 정보 가져오기
        const menuCode = img.getAttribute('data-menu');
        const menuName = img.getAttribute('alt');
        const imgUrl = img.getAttribute('src');
         const menuDesc = img.closest('#drink-menu').querySelector('input[type="hidden"]').value.trim();
        // 모달 내용 업데이트
        const modalImg = document.getElementById('image');
        modalImg.setAttribute('src', imgUrl);

        const modalMenuName = document.getElementById('menuName');
        modalMenuName.innerHTML = ` ${menuName}`;

        const modalMenuDesc = document.getElementById('menuDesc');
        modalMenuDesc.innerHTML = ` ${menuDesc}`;

        // 모달 띄우기
   //     const modal = new bootstrap.Modal(document.querySelector('.modal'));
        modal.show();
    });
});

document.querySelectorAll('#side-menu .image').forEach(img => {
    img.addEventListener('click', function(event) {
        // 클릭한 이미지 요소 확인
        console.log(event.target);

        // 클릭한 이미지의 정보 가져오기
        const menuCode = img.getAttribute('data-menu');
        const menuName = img.getAttribute('alt');
        const imgUrl = img.getAttribute('src');
         const menuDesc = img.closest('#side-menu').querySelector('input[type="hidden"]').value.trim();
        // 모달 내용 업데이트
        const modalImg = document.getElementById('image');
        modalImg.setAttribute('src', imgUrl);

        const modalMenuName = document.getElementById('menuName');
        modalMenuName.innerHTML = ` ${menuName}`;

        const modalMenuDesc = document.getElementById('menuDesc');
        modalMenuDesc.innerHTML = ` ${menuDesc}`;

        // 모달 띄우기
   //     const modal = new bootstrap.Modal(document.querySelector('.modal'));
        modal.show();
    });
});
/*
const wrap = document.querySelector(".modal-content");
const header = document.querySelector(".modal-header");
let lastX = 0;
let lastY = 0; 
let startX = 0; 
let startY = 0; 

// 1.
header.addEventListener('mousedown', function(e){
  e.preventDefault(); 
  startX = e.clientX; 
  startY = e.clientY; 
	
  // 2.  
  header.classList.add('active');
  
  // 3.
  document.addEventListener('mouseup', onRemoveEvent); 
  
  // 4.
  document.addEventListener('mousemove', onMove); 
});

function onRemoveEvent() { 
  header.classList.remove('active');
  document.removeEventListener('mouseup', onRemoveEvent); 
  document.removeEventListener('mousemove', onMove); 
} 

function onMove(e) { 
  e.preventDefault(); 
  lastX = startX - e.clientX; 
  lastY = startY - e.clientY; 

  startX = e.clientX; 
  startY = e.clientY; 

  wrap.style.top = `${wrap.offsetTop - lastY}px`;
  wrap.style.left = `${wrap.offsetLeft - lastX}px`;
}
*/