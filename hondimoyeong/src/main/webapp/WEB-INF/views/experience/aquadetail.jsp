<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#businesstime{
		text-align: center;
		width:1200px;
		height:100%;
		margin:auto;
	}
	#business1{
		width:100%;
		height:30%;
		margin:auto;
	}
	#business2{
		padding-top:10px;
		width:100%;
		height:30%;
		margin:auto;
	}
	
	#business3{
		width:100%;
		height:20%;
		margin:auto;
	}
	table{
		width:100%;
		height:100%;
		margin:auto;
	}
	table, th, td{
		border-collapse : collapse;
	}
	th{
		background-color: #d4d4d4;
	}
	#playtime{
		background-image:url('https://www.aquaplanet.co.kr/images/common/use_price_blue_sea.jpg');
		color:white;
		padding-top:20px;
		padding-bottom:30px;
	}
	
</style>
</head>
<body>

	<jsp:include page ="../common/header.jsp" />

	<div id="businesstime">
		<div id="business1">
			<h1>이용시간·요금안내</h1>
			<div id="playtime">
				<h2>운영시간</h2>
				연중 무휴
				<h2>09:30 - 18:00</h2>
				※ 매표 마감시간은 17:00이며, 입장 마감시간은17:30이오니 이용에 참고 부탁드립니다.
			</div>
		</div>
		<div id="business2">
			<div class="container">
			  <table  class="table table-bordered">
			    <thead>
			      <tr>
			        <th style="width:50%">구분</th>
			        <th>운영시간</th>
			      </tr>
			    </thead>
			    <tbody>
			      <tr>
			        <td>매표소</td>
			        <td>09:30 - 17:00</td>
			      <tr>
			        <td>고래상어 빵(메인수조)</td>
			        <td>10:00 - 17:00</td>
			      </tr>
			       <tr>
			        <td>푸드 코트</td>
			        <td>11:00 - 17:30</td>
			      <tr>
			      <tr>
			        <td>카페1호점(메인수조 옆)</td>
			        <td>09:30 - 17:30</td>
			      </tr>
			      <tr>
			        <td>오션아레나 매대 <br>※ 오션아레나 공연 시간에만 이용 가능</td>
			        <td>10:20 - 17:00</td>
			      </tr>
			      <tr>
			        <td>나타오비카 타르트</td>
			        <td>10:00 - 17:30</td>
			      </tr>
			      <tr>
			        <td>카페 2호점(푸드코트 옆)</td>
			        <td>09:30 - 17:40</td>
			      </tr>
			      <tr>
			        <td>캐리커쳐</td>
			        <td>11:00 - 17:40</td>
			      </tr>
			      <tr>
			        <td>쿨샤벳 아이스크림</td>
			        <td>10:30 - 17:40</td>
			      </tr>
			      <tr>
			        <td>세포인사이드제주 전시관 아트샵(2F)	</td>
			        <td>09:30 - 17:40</td>
			      </tr>
			      <tr>
			        <td>아쿠아리움 기프트샵(B1)	</td>
			        <td>09:00 - 17:40</td>
			      </tr>
			      <tr>
			        <td>던킨 도너츠	</td>
			        <td>10:00 - 17:40</td>
			      </tr>
			    </tbody>
			  </table>
			  <br>
			</div>
		</div>
		<div id="business3">
			<h2>이용요금</h2>
			<b>개인요금</b>
			 <table  class="table table-bordered">
			    <thead>
			      <tr>
			        <th>권종</th>
			        <th style="width:50%">구분</th>
			        <th>이용요금</th>
			      </tr>
			    </thead>
			    <tbody>
			      <tr>
			        <td rowspan="5">매표소</td>
			        <td>대인(2005년 ~ 1960년생)</td>
			        <td>45000원</td>
			      <tr>
			        <td>청소년(2006년 ~ 2011년생)</td>
			        <td>43000원</td>
			      </tr>
			      <tr>
			        <td>소인(36개월 ~ 2012년생)</td>
			        <td>40000원</td>
			      </tr>
			      <tr>
			        <td>경로(1959년생 이하)</td>
			        <td>43000원</td>
			      </tr>
			    </tbody>
			</table>
			<br>
			<b>연간이용권</b>
			<table>
				<thead>
			      <tr>
			        <th style="width:50%">연간이용권 상품</th>
			        <th>요금</th>
			      </tr>
			    </thead>
			    <tbody>
			      <tr>
			        <td>연간이용권 AQ권<br>아쿠아리움(수족관)</td>
			        <td>120,000원</td>
			    </tbody>
			</table>
		</div>
		<div>
		
		<h5 style="text-align: left;">플레이스</h5>
		<div id="map" style="width:100%;height:350px;"></div>

		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${ sessionScope.appkey }"></script>
		<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(33.432777, 126.927821), // 지도의 중심좌표
		        level: 5 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		  
		// 마커를 표시할 위치입니다 
		var position =  new kakao.maps.LatLng(33.432777, 126.927821);
		
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		  position: position,
		  clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
		});
		
		// 아래 코드는 위의 마커를 생성하는 코드에서 clickable: true 와 같이
		// 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
		// marker.setClickable(true);
		
		// 마커를 지도에 표시합니다.
		marker.setMap(map);
		
		// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
		var iwContent = '<div style="padding:5px;">제주 아쿠아플라넷</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
		
		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		    content : iwContent,
		    removable : iwRemoveable
		});
		
		// 마커에 클릭이벤트를 등록합니다
		kakao.maps.event.addListener(marker, 'click', function() {
		      // 마커 위에 인포윈도우를 표시합니다
		      infowindow.open(map, marker);  
		});
		</script>
		
		
		
		
		</div>
	</div>
	
	
	<jsp:include page ="../common/footer.jsp" />

</body>
</html>