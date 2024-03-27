<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
   rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<meta charset="UTF-8">
<title>IT BURGER</title>
<style type="text/css">
body {
   overflow-x: hidden;
   font-family: "Hahmlet", serif;
}
@keyframes rainbowAnimation {
  0%{color: red;}
  28%{color: orange;}
  42%{color: green;}
  57%{color: blue;}
  71%{color: indigo;}
  85%{color: violet;}
  100%{color: red;}
}
.rainbow{
   animation: rainbowAnimation 2s infinite;
}
#map{
   border: 3px solid;
   animation: rainbow-animation 5s linear infinite;
}
@keyframes rainbow-animation {
  0%{color: red;}
  28%{color: orange;}
  42%{color: green;}
  57%{color: blue;}
  71%{color: indigo;}
  85%{color: violet;}
  100%{color: red;}
}
div#header{
	height:349.16px;
	}
	h1 {
    padding-bottom: 22px !important;
}

</style>
</head>
<body>
   <%@ include file="../layout/header.jsp"%>
   <h2 style="padding: 5rem 0 0 30rem;">매장 정보</h2>
   <hr>
   <div id="mapContain" style="display: inline; color: black;">
      <h4 style="padding: 4rem 0 2rem 30rem; color: initial;">
         <strong class="rainbow">매장 찾는 지도입니다.</strong> <br> 영업시간 10:00 ~ 22:00 <br>
         "TEL" 02-5555-8282
      </h4>
      <!-- 지도가 표시될 div 요소 -->
      <div id="map"
         style="width: 1000px; height: 500px; text-align: center; margin-bottom: 10rem; margin-left: 30rem;"></div>
   </div>
   <script type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cfb6731d980f643714fdb96758baba25"></script>

   <script>
      var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
      var options = { //지도를 생성할 때 필요한 기본 옵션
         center : new kakao.maps.LatLng(37.500034076862924,
               127.03557235597818), //지도의 중심좌표.
         level : 3
      //지도의 레벨(확대, 축소 정도)
      };

      var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
   </script>
   <script>
      var positions = [
    	    {
    	    	title: 'IT Burger 본점', 
    	        latlng: new kakao.maps.LatLng(37.500034076862924,
    	                127.03557235597818)
    	    },
    	    {
    	    	title: '컨벤션센터 점', 
    	        latlng: new kakao.maps.LatLng(37.500677,
    	                127.030650)
    	    },
    	    {
    	    	title: '강남역 점',
    	        latlng: new kakao.maps.LatLng(37.498656,
    	                127.028769)
    	    },
    	    {
    	    	title: '신논현 점',
    	        latlng: new kakao.maps.LatLng(37.504605,
    	                127.025604)
    	    },
    	    {
    	    	title: '선릉역 점',
    	        latlng: new kakao.maps.LatLng(37.504068,
    	                127.048428)
    	    },
    	    {
    	    	title: '센터필드 점',
    	        latlng: new kakao.maps.LatLng(37.502953,
    	                127.041561)
    	    },
    	    {
    	    	title: '언주역 점',
    	        latlng: new kakao.maps.LatLng(37.506942,
    	                127.034300)
    	    },
    	    {
    	        title: '위례 IT Burger',
    	        latlng: new kakao.maps.LatLng(37.470247, 127.142812)
    	    },
    	    {
    	        title: '수유 IT Burger',
    	        latlng: new kakao.maps.LatLng(37.638563, 127.026892)
    	    },
    	    {
    	        title: '사당 IT Burger',
    	        latlng: new kakao.maps.LatLng(37.482218, 126.981494)
    	    },
    	    {
    	        title: '논현역 IT Burger',
    	        latlng: new kakao.maps.LatLng(37.507591, 127.022678)
    	    },
    	    {
    	        title: '부산 IT Burger',
    	        latlng: new kakao.maps.LatLng(35.156049, 129.059362)
    	    },
    	    {
    	        title: '대구 IT Burger',
    	        latlng: new kakao.maps.LatLng(35.871453, 128.601457)
    	    },
    	    {
    	        title: '인천 IT Burger',
    	        latlng: new kakao.maps.LatLng(37.456066, 126.705104)
    	    },
    	    {
    	        title: '광주 IT Burger',
    	        latlng: new kakao.maps.LatLng(35.160320, 126.851300)
    	    },
    	    {
    	        title: '대전 IT Burger',
    	        latlng: new kakao.maps.LatLng(36.351556, 127.384063)
    	    },
    	    {
    	        title: '울산 IT Burger',
    	        latlng: new kakao.maps.LatLng(35.537250, 129.318325)
    	    },
    	    {
    	        title: '서초점',
    	        latlng: new kakao.maps.LatLng(37.491984, 127.014493)
    	    },
    	    {
    	        title: '여의도점',
    	        latlng: new kakao.maps.LatLng(37.527860, 126.924012)
    	    },
    	    {
    	        title: '홍대입구역 점',
    	        latlng: new kakao.maps.LatLng(37.557619, 126.923701)
    	    },
    	    {
    	        title: '잠실역점',
    	        latlng: new kakao.maps.LatLng(37.513128, 127.099714)
    	    },
    	    {
    	        title: '노량진점',
    	        latlng: new kakao.maps.LatLng(37.513309, 126.942357)
    	    },
    	    {
    	        title: '청담점',
    	        latlng: new kakao.maps.LatLng(37.523328, 127.041430)
    	    },
    	    {
    	        title: '삼성역점',
    	        latlng: new kakao.maps.LatLng(37.510440, 127.063951)
    	    },
    	    {
    	        title: '을지로입구역점',
    	        latlng: new kakao.maps.LatLng(37.566135, 126.982818)
    	    },
    	    {
    	        title: '종각점',
    	        latlng: new kakao.maps.LatLng(37.570204, 126.983050)
    	    },
    	    {
    	        title: '구로디지털단지역점',
    	        latlng: new kakao.maps.LatLng(37.485820, 126.895928)
    	    },
    	    {
    	        title: '영등포역점',
    	        latlng: new kakao.maps.LatLng(37.515318, 126.907660)
    	    },
    	    {
    	        title: '용산역점',
    	        latlng: new kakao.maps.LatLng(37.529724, 126.964332)
    	    },
    	    {
    	        title: '동대문역사문화공원역점',
    	        latlng: new kakao.maps.LatLng(37.566085, 127.007961)
    	    },
    	    {
    	        title: '신촌역점',
    	        latlng: new kakao.maps.LatLng(37.556390, 126.935964)
    	    },
    	    {
    	        title: '동대문점',
    	        latlng: new kakao.maps.LatLng(37.567231, 127.005956)
    	    },
    	    {
    	        title: '합정점',
    	        latlng: new kakao.maps.LatLng(37.549404, 126.913960)
    	    },
    	    {
    	        title: '수원 IT Burger',
    	        latlng: new kakao.maps.LatLng(37.261832, 127.028255)
    	    },
    	    {
    	        title: '천안 IT Burger',
    	        latlng: new kakao.maps.LatLng(36.812229, 127.151536)
    	    },
    	    {
    	        title: '전주 IT Burger',
    	        latlng: new kakao.maps.LatLng(35.82133, 127.148041)
    	    },
    	    {
    	        title: '청주 IT Burger',
    	        latlng: new kakao.maps.LatLng(36.6428, 127.489696)
    	    },
    	    {
    	        title: '제주 IT Burger',
    	        latlng: new kakao.maps.LatLng(33.489011, 126.491484)
    	    },
    	    {
    	        title: '춘천 IT Burger',
    	        latlng: new kakao.maps.LatLng(37.877501, 127.734618)
    	    },
    	    {
    	        title: '안동 IT Burger',
    	        latlng: new kakao.maps.LatLng(36.564436, 128.718933)
    	    },
    	    {
    	        title: '포항 IT Burger',
    	        latlng: new kakao.maps.LatLng(36.034229, 129.370155)
    	    },
    	    {
    	        title: '울산 IT Burger',
    	        latlng: new kakao.maps.LatLng(35.53725, 129.318325)
    	    },
    	    {
    	        title: '대전 IT Burger',
    	        latlng: new kakao.maps.LatLng(36.351556, 127.384063)
    	    },
    	    {
    	        title: '전주 IT Burger',
    	        latlng: new kakao.maps.LatLng(35.82133, 127.148041)
    	    },
    	    {
    	        title: '강릉 IT Burger',
    	        latlng: new kakao.maps.LatLng(37.754047, 128.878896)
    	    },
    	    {
    	        title: '속초 IT Burger',
    	        latlng: new kakao.maps.LatLng(38.204411, 128.589978)
    	    },
    	    {
    	        title: '동해 IT Burger',
    	        latlng: new kakao.maps.LatLng(37.520743, 129.117009)
    	    },
    	    {
    	        title: '제천 IT Burger',
    	        latlng: new kakao.maps.LatLng(37.148906, 128.212767)
    	    },
    	    {
    	        title: '당진 IT Burger',
    	        latlng: new kakao.maps.LatLng(36.889068, 126.638128)
    	    },
    	    {
    	        title: '거제 IT Burger',
    	        latlng: new kakao.maps.LatLng(34.884441, 128.624458)
    	    },
    	    {
    	        title: '서귀포 IT Burger',
    	        latlng: new kakao.maps.LatLng(33.246894, 126.565114)
    	    },
    	    {
    	        title: '충주 IT Burger',
    	        latlng: new kakao.maps.LatLng(36.991006, 127.924338)
    	    },
    	    {
    	        title: '김해 IT Burger',
    	        latlng: new kakao.maps.LatLng(35.234713, 128.876773)
    	    },
    	    {
    	        title: '시흥 IT Burger',
    	        latlng: new kakao.maps.LatLng(37.38012, 126.800983)
    	    },
    	    {
    	        title: '울릉도 IT Burger',
    	        latlng: new kakao.maps.LatLng(37.504605, 130.897731)
    	    },
    	    {
    	        title: '파주 IT Burger',
    	        latlng: new kakao.maps.LatLng(37.75982, 126.796359)
    	    },
    	    {
    	        title: '갸아샨 IT Burger',
    	        latlng: new kakao.maps.LatLng(37.791207, 127.882315)
    	    },
    	    {
    	        title: '함양 IT Burger',
    	        latlng: new kakao.maps.LatLng(35.52077, 127.723997)
    	    },
    	    {
    	        title: '과천 IT Burger 1호점',
    	        latlng: new kakao.maps.LatLng(37.433517, 126.988556)
    	    },
    	    {
    	        title: '과천 IT Burger 2호점',
    	        latlng: new kakao.maps.LatLng(37.431761, 126.990879)
    	    },
    	    {
    	        title: '안양 IT Burger 1호점',
    	        latlng: new kakao.maps.LatLng(37.392549, 126.936714)
    	    },
    	    {
    	        title: '안양 IT Burger 2호점',
    	        latlng: new kakao.maps.LatLng(37.391268, 126.922626)
    	    },
    	    {
    	        title: '군포 IT Burger 1호점',
    	        latlng: new kakao.maps.LatLng(37.354721, 126.931342)
    	    },
    	    {
    	        title: '군포 IT Burger 2호점',
    	        latlng: new kakao.maps.LatLng(37.350868, 126.937151)
    	    },
    	    {
    	        title: '안산 IT Burger 1호점',
    	        latlng: new kakao.maps.LatLng(37.323576, 126.830616)
    	    },
    	    {
    	        title: '안산 IT Burger 2호점',
    	        latlng: new kakao.maps.LatLng(37.312341, 126.831216)
    	    },{
    	        title: '성남 IT Burger 1호점',
    	        latlng: new kakao.maps.LatLng(37.418601, 127.129293)
    	    },
    	    {
    	        title: '성남 IT Burger 2호점',
    	        latlng: new kakao.maps.LatLng(37.414885, 127.128617)
    	    },
    	    {
    	        title: '성남 IT Burger 3호점',
    	        latlng: new kakao.maps.LatLng(37.415358, 127.125961)
    	    },
    	    {
    	        title: '경기도광주 IT Burger 1호점',
    	        latlng: new kakao.maps.LatLng(37.422854, 127.257498)
    	    },
    	    {
    	        title: '경기도광주 IT Burger 2호점',
    	        latlng: new kakao.maps.LatLng(37.415984, 127.256526)
    	    },
    	    {
    	        title: '경기도광주 IT Burger 3호점',
    	        latlng: new kakao.maps.LatLng(37.409818, 127.262348)
    	    },
    	    {
    	        title: '의왕 IT Burger 1호점',
    	        latlng: new kakao.maps.LatLng(37.394476, 126.970064)
    	    },
    	    {
    	        title: '의왕 IT Burger 2호점',
    	        latlng: new kakao.maps.LatLng(37.385784, 126.968916)
    	    },
    	    {
    	        title: '의왕 IT Burger 3호점',
    	        latlng: new kakao.maps.LatLng(37.385002, 126.973208)
    	    },
    	    {
    	        title: '여주 IT Burger',
    	        latlng: new kakao.maps.LatLng(37.298802, 127.637556)
    	    },
    	    {
    	        title: '이천 IT Burger',
    	        latlng: new kakao.maps.LatLng(37.275753, 127.442995)
    	    },
    	    {
    	        title: '원주 IT Burger',
    	        latlng: new kakao.maps.LatLng(37.338208, 127.945353)
    	    },
    	    {
    	        title: '세종 IT Burger',
    	        latlng: new kakao.maps.LatLng(36.480132, 127.289041)
    	    },
    	    {
    	        title: '충북 IT Burger',
    	        latlng: new kakao.maps.LatLng(36.635677, 127.491256)
    	    },
    	    {
    	        title: '충남 IT Burger',
    	        latlng: new kakao.maps.LatLng(36.658976, 126.673977)
    	    },
    	    {
    	        title: '고성 IT Burger',
    	        latlng: new kakao.maps.LatLng(38.382181, 128.467664)
    	    },
    	    {
    	        title: '양양 IT Burger',
    	        latlng: new kakao.maps.LatLng(38.070561, 128.628844)
    	    },
    	    {
    	        title: '인제 IT Burger',
    	        latlng: new kakao.maps.LatLng(38.067622, 128.168433)
    	    },
    	    {
    	        title: '양구 IT Burger',
    	        latlng: new kakao.maps.LatLng(38.105637, 127.991209)
    	    },
    	    {
    	        title: '동해 IT Burger',
    	        latlng: new kakao.maps.LatLng(37.520743, 129.117009)
    	    },
    	    {
    	        title: '삼척 IT Burger',
    	        latlng: new kakao.maps.LatLng(37.444678, 129.167799)
    	    },
    	    {
    	        title: '홍천 IT Burger',
    	        latlng: new kakao.maps.LatLng(37.692616, 127.898554)
    	    },
    	    {
    	        title: '평창 IT Burger',
    	        latlng: new kakao.maps.LatLng(37.370171, 128.388983)
    	    },
    	    {
    	        title: '정선 IT Burger',
    	        latlng: new kakao.maps.LatLng(37.381509, 128.666275)
    	    },
    	    {
    	        title: '태백 IT Burger',
    	        latlng: new kakao.maps.LatLng(37.164153, 128.984883)
    	    },
    	    {
    	        title: '속초 IT Burger',
    	        latlng: new kakao.maps.LatLng(38.204411, 128.589978)
    	    },
    	    {
    	        title: '강릉 IT Burger',
    	        latlng: new kakao.maps.LatLng(37.754047, 128.878896)
    	    },
    	    {
    	        title: '화천 IT Burger 1호점',
    	        latlng: new kakao.maps.LatLng(38.105798, 127.711972)
    	    },
    	    {
    	        title: '화천 IT Burger 2호점',
    	        latlng: new kakao.maps.LatLng(38.104668, 127.712648)
    	    },
    	    {
    	        title: '목포 IT Burger',
    	        latlng: new kakao.maps.LatLng(34.811843, 126.392213)
    	    },
    	    {
    	        title: '여수 IT Burger',
    	        latlng: new kakao.maps.LatLng(34.751567, 127.746933)
    	    },
    	    {
    	        title: '광양 IT Burger',
    	        latlng: new kakao.maps.LatLng(34.938051, 127.694598)
    	    },
    	    {
    	        title: '사천 IT Burger',
    	        latlng: new kakao.maps.LatLng(35.008328, 128.079279)
    	    },
    	    {
    	        title: '진주 IT Burger',
    	        latlng: new kakao.maps.LatLng(35.198362, 128.084891)
    	    },
    	    {
    	        title: '가덕도 IT Burger',
    	        latlng: new kakao.maps.LatLng(35.118054, 129.141282)
    	    },
    	    {
    	        title: '김해 IT Burger',
    	        latlng: new kakao.maps.LatLng(35.234713, 128.876773)
    	    },
    	    {
    	        title: '창원 IT Burger',
    	        latlng: new kakao.maps.LatLng(35.238319, 128.688129)
    	    },
    	    {
    	        title: '마산 IT Burger',
    	        latlng: new kakao.maps.LatLng(35.213282, 128.58219)
    	    },
    	    {
    	        title: '군산 IT Burger',
    	        latlng: new kakao.maps.LatLng(35.969928, 126.730286)
    	    },
    	    {
    	        title: '보령 IT Burger',
    	        latlng: new kakao.maps.LatLng(36.357467, 126.593955)
    	    },
    	    {
    	        title: '서산 IT Burger',
    	        latlng: new kakao.maps.LatLng(36.782122, 126.450122)
    	    },
    	    {
    	        title: '아산 IT Burger',
    	        latlng: new kakao.maps.LatLng(36.779205, 127.002401)
    	    },
    	    {
    	        title: '김제 IT Burger',
    	        latlng: new kakao.maps.LatLng(35.812009, 126.881606)
    	    },
    	    {
    	        title: '정읍 IT Burger',
    	        latlng: new kakao.maps.LatLng(35.569615, 126.859831)
    	    },
    	    {
    	        title: '안성 IT Burger',
    	        latlng: new kakao.maps.LatLng(37.007487, 127.262498)
    	    },
    	    {
    	        title: '평택 IT Burger',
    	        latlng: new kakao.maps.LatLng(36.994519, 127.087757)
    	    },
    	    {
    	        title: '오산 IT Burger',
    	        latlng: new kakao.maps.LatLng(37.144225, 127.075922)
    	    },
    	    {
    	        title: '용평리조트 IT Burger',
    	        latlng: new kakao.maps.LatLng(37.662541, 128.674406)
    	    },
    	    {
    	        title: '평창알펜시아 IT Burger',
    	        latlng: new kakao.maps.LatLng(37.659892, 128.683568)
    	    },
    	    {
    	        title: '강촌 레저랜드 IT Burger',
    	        latlng: new kakao.maps.LatLng(37.758737, 127.624349)
    	    },
    	    {
    	        title: '휘닉스파크 IT Burger',
    	        latlng: new kakao.maps.LatLng(35.858616, 128.598189)
    	    },
    	    {
    	        title: '덕유산 리조트 IT Burger',
    	        latlng: new kakao.maps.LatLng(36.804281, 128.586181)
    	    },
    	    {
    	        title: '무주 스키장 IT Burger',
    	        latlng: new kakao.maps.LatLng(36.954166, 127.660498)
    	    },
    	    {
    	        title: '곤지암 IT Burger',
    	        latlng: new kakao.maps.LatLng(37.231407, 127.296938)
    	    },
    	    {
    	        title: '지산포레스트 IT Burger',
    	        latlng: new kakao.maps.LatLng(36.936641, 127.756993)
    	    },
    	    {
    	        title: '홍천비발디 IT Burger',
    	        latlng: new kakao.maps.LatLng(37.652787, 127.171377)
    	    },
    	    {
    	        title: '오사카 IT Burger',
    	        latlng: new kakao.maps.LatLng(34.693738, 135.502165)
    	    },
    	    {
    	        title: '나고야 IT Burger',
    	        latlng: new kakao.maps.LatLng(35.181446, 136.906398)
    	    },
    	    {
    	        title: '후쿠오카 IT Burger',
    	        latlng: new kakao.maps.LatLng(33.590143, 130.420698)
    	    },
    	    {
    	        title: '히로시마 IT Burger',
    	        latlng: new kakao.maps.LatLng(34.385203, 132.455293)
    	    },
    	    {
    	        title: '사가 IT Burger',
    	        latlng: new kakao.maps.LatLng(33.263199, 130.300464)
    	    },
    	    {
    	        title: '나라 IT Burger',
    	        latlng: new kakao.maps.LatLng(34.685086, 135.805000)
    	    },
    	    {
    	        title: '오이타 IT Burger',
    	        latlng: new kakao.maps.LatLng(33.236995, 131.609427)
    	    },
    	    {
    	        title: '쿠마모토 IT Burger',
    	        latlng: new kakao.maps.LatLng(32.793846, 130.747265)
    	    },
    	    {
    	        title: '야마구치 IT Burger',
    	        latlng: new kakao.maps.LatLng(34.685086, 135.805000)
    	    },
    	    {
    	        title: '이와테 IT Burger',
    	        latlng: new kakao.maps.LatLng(39.700606, 141.148678)
    	    },
    	    {
    	        title: '아오모리 IT Burger',
    	        latlng: new kakao.maps.LatLng(40.825323, 140.750858)
    	    },
    	    {
    	        title: '아이치 IT Burger',
    	        latlng: new kakao.maps.LatLng(35.170915, 137.117788)
    	    },
    	    {
    	        title: '도야마 IT Burger',
    	        latlng: new kakao.maps.LatLng(35.431756, 133.331291)
    	    },
    	    {
    	        title: '나가노 IT Burger',
    	        latlng: new kakao.maps.LatLng(36.648582, 138.194351)
    	    },
    	    {
    	        title: '이시카와 IT Burger',
    	        latlng: new kakao.maps.LatLng(36.592273, 136.625573)
    	    }
    	    
    	];

    	// 마커 이미지의 이미지 주소입니다
    	var imageSrc = "asset/images/burgermarker.png"; 
    	    
    	for (var i = 0; i < positions.length; i ++) {
    	    
    	    // 마커 이미지의 이미지 크기 입니다
    	    var imageSize = new kakao.maps.Size(30, 25); 
    	    
    	    // 마커 이미지를 생성합니다    
    	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    	    
    	    // 마커를 생성합니다
    	    var marker = new kakao.maps.Marker({
    	        map: map, // 마커를 표시할 지도
    	        position: positions[i].latlng, // 마커를 표시할 위치
    	        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
    	        image : markerImage // 마커 이미지 
    	    });
    	}
    	// 마커가 지도 위에 표시되도록 설정합니다
        marker.setMap(map);
    	</script>
   <!-- Google Maps JavaScript API를 불러옵니다. -->
   <%@ include file="./layout/footer.jsp"%>
</body>
</html>
