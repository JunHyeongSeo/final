<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#businesstime{
	border:1px solid red;
	text-align: left;
	width:1200px;
	height:100%;
	margin:auto;
	
}
	#business1{
		border:1px solid red;
		width:100%;
		height:30%;
		margin:auto;
	}
	#business2{
		border:1px solid red;
		width:100%;
		height:30%;
		margin:auto;
	}
	
	#business3{
		border:1px solid red;
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
		border:1px solid #222;
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
		<h2>1. 탐방 예약</h2>
		1. 한라산 탐방예약은 매월 첫 업무개시일 09시부터 다음달 이용에 대한 예약을 신청할 수 있으며, 다음달 말일까지 예약 가능합니다. <br>
		 &nbsp;&nbsp;&nbsp;&nbsp;- 예) 탐방예정일이 02월 01일 ~ 28일(매월 1일이 토요일 및 공휴일인 경우) 사이인 경우 01월 01일 ~ 02월 28일까지 예약 가능<br>
		2. 탐방예약 완료 후에는 입력하신 전화번호로 입·하산 QR코드를 전송하고 있습니다.<br>
			&nbsp;&nbsp;&nbsp;&nbsp;예약 시에는 반드시 정확한 전화번호를 기재하여 주시기 바랍니다. <br>
		3. 전화 문의는 평일 09:00부터 17:30까지 가능하며, 주말 및 공휴일에는 홈페이지를 이용해 주시기 바랍니다. <br>
		4. 예약 대기 1일 후에는 자동취소가 됩니다. <br>
		5. 예약 취소는 한라산탐방예약시스템 예약한 인증 방법으로 접속 후 마이페이지 예약 조회에서 취소하여 주시기 됩니다. <br>
		  &nbsp;&nbsp;&nbsp;&nbsp;예약 취소는 예약된 탐방 종료시간 전에 취소하여 주시기 바랍니다. <br>
		&nbsp;&nbsp;&nbsp;&nbsp;※ 일행 중 부분 예약 취소할 경우, 예약된 탐방 종료시간 전에 반드시 예약취소를 하시기 바랍니다. <br>
		6. 탐방제한 페널티 제도를 적용하고 있습니다. 예약 후 취소 없이 탐방하지 않았을 경우는 1회는 3개월, 2회는 1년간 예약이 불가능 합니다. <br>
		7. 한라산 기상상황에 따라 입산이 전면(부분)통제될 수 있사오니 탐방전 한라산국립공원 홈페이지에서 통제여부를 확인하여 주시기 바랍니다. <br>
		
		</div>
		<div id="business2">
			<h2>2. 한라산국립공원 등산허용 안내</h2>
			<table  class="table table-bordered">
			    <thead>
			      <tr>
			        <th>구분</th>
			        <th>탐방로별</th>
			        <th>통제장소</th>
			        <th>동절기(1,2,11,12월)</th>
			        <th>춘추절기(3,4,9,10월)</th>
			        <th>하절기(5,6,7,8월)</th>
			      </tr>
			    </thead>
			    <tbody>
			      <tr>
			        <td rowspan="4">입산</td>
			        <td rowspan="2">성판악코스</td>
			        <td>탐방로 입구</td>
			        <td>06:00 ~ 12:00</td>
			        <td>05:30 ~ 12:30</td>
			        <td>05:00 ~ 13:00</td>
			      <tr>
			        <td>진달래밭통제소</td>
			        <td>12:00</td>
			        <td>12:30</td>
			        <td>13:00</td>
			      </tr>
			      <tr>
			        <td rowspan="2">관음사코스</td>
			        <td>탐방로 입구</td>
			        <td>06:00 ~ 12:00</td>
			        <td>05:30 ~ 12:30</td>
			        <td>05:00 ~ 13:00</td>
			      </tr>
			      <tr>
			        <td>삼각봉통제소</td>
			        <td>12:00</td>
			        <td>12:30</td>
			        <td>13:00</td>
			      </tr>
			      <tr>
			        <td>하산</td>
			        <td colspan="2">45000원</td>
			        <td>13:30</td>
			        <td>14:00</td>
			        <td>14:30</td>
			      </tr>
			    </tbody>
			</table>
		</div>
		<div id="business3">
		<h2>3. 탐방 주의사항</h2>
			
		1. 한라산국립공원 탐방은 반드시 지정된 탐방로를 이용해야 하며 계절별 탐방로 통제시간이 정해져 있으므로 탐방 전 확인하시기 바랍니다.<br>
		2. 기상청 기상특보 ( 호우, 태풍, 대설 주의보 및 경보 ) 시 탐방이 부분통제 혹은 전면통제 됩니다. 탐방 당일 한라산국립공원 홈페이지에서 통제여부를 확인하여 주시기 바랍니다.<br>
		3. 국립공원 구역 내에서 식물, 곤충, 토석채취 등 일체의 자연훼손을 금지하며 위반 시 관련법에 의거 처벌됩니다.<br>
		4. 탐방 도중 안전사고나 위급한 상황이 발생하면 한라산국립공원사무소나 119구조대로 즉시 신고하시고 탐방로 주변에 설치된 탐방로 위치표시판의 번호를 확인하여 알려주십시오<br>
		5. 한라산은 날씨의 변화가 심한 지역이므로 비상식량( 사탕, 초코렛, 소금 등)과 여벌옷을 준비해야 하며 겨울철 탐방 시에는 방한복, 아이젠, 장갑, 따뜻한 물 등을 준비하시기 바랍니다.<br>
		6. 한라산국립공원에서 야영과 취사가 가능한 곳은 관음사지구 야영장이며 그 외의 지역은 야영과 취사가 엄격히 금지되고 있습니다.<br>
		7. 한라산국립공원 탐방 시 대중교통수단을 적극적으로 이용해 주시고 공원 내 주차 시에는 귀중품 도난 및 차량훼손에 각별히 주의하시기 바랍니다.<br>
		8. 한라산국립공원은 세계자연유산지구이므로 탐방예절 지키기, 자기쓰레기 되가져오기, 배낭무게 줄이기 등을 실천하여 탐방문화 정착에 적극적으로 앞장서 주시기 바랍니다.<br>
		9. 1회용 도시락 및 화기물질 반입, 음주행위, 흡연 등이 금지되어 있습니다.<br>
		10. 청정 한라산 보전을 위하여 1회용 도시락 반입을 금지하고 있으며 김밥, 햄버거는 허용됩니다.<br>
		</div>
		
		
		
		<div>
		
		<h5>플레이스</h5>
		<div id="map" style="width:100%;height:350px;"></div>

		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${ sessionScope.appkey }"></script>
		<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(33.361673, 126.529173), // 지도의 중심좌표
		        level: 5 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		  
		// 마커를 표시할 위치입니다 
		var position =  new kakao.maps.LatLng(33.361673, 126.529173);
		
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
		var iwContent = '<div style="padding:5px;">한라산</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
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