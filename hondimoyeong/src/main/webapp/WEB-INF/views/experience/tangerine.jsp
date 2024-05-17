<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>

#form{
	border:1px solid red;
	text-align: left;
	width:1000px;
	height:100%;
	margin:auto;
	
}
#gul{
	width : 100%;
	height : 1000px;
	background-image : url('resources/image/gul.png');
	background-repeat : no-repeat;
	margin : auto;
	margins-top : 20px;
	boardere-radius : 20px;
	background-size : contain;
	border:1px solid blue;
}


#mainimg{
 	text-align: center;
	margin-left : 40px; ;
	margin-top:310px;
	width:20%;
	height:7%;
}

</style>
</head>
<body>

	<jsp:include page ="../common/header.jsp" />
	
	<div id="form">
		<div id="gul">
			<div  id="mainimg">
				<a class="btn btn-outline-warning" style="margin-top:15px">예매하기 하러 가기</a>
			</div> 
		</div>
		
		<div>
		<h5>플레이스</h5>
		<div id="map" style="width:100%;height:350px;"></div>
	
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8ddac81d17cea530c11b70881c406c61"></script>
			<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { 
			        center: new kakao.maps.LatLng(33.243402, 126.533579), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };
			
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			  
			// 마커를 표시할 위치입니다 
			var position =  new kakao.maps.LatLng(33.243402, 126.533579);
			
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
			var iwContent = '<div style="padding:5px;">감귤체험농장</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
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