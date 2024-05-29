<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코스 상세</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7bef214b2421bc152b20759bcb61f298&libraries=services"></script>
    
    <style>

        #innerOuter{
            width: 1200px;
            height: 2000px;
            margin: auto;
        }
        .carousel-inner img {
            width: 100%;
            height: 100%;
        }

        #main{
            width: 1200px;
            height: auto;
            text-align: center;
            font-weight: bold;
            margin-top: 40px;
        }

        #main > p {
            font-weight: 400;
            width: 1000px;
            margin: auto;
            margin-top: 40px;
            text-align: left;
        }
        
        .modal-body > img{
        	width: 100%;
        	heigth : 100%;
        }
        
        #map {
        	width : 1000px;
        	height : 600px;
        	margin : auto;
        }
        
       #choose-area{
            width: 1200px;
            text-align: right;
            margin-bottom : 20px;
        }
        
       #choose{
            width: 350px;
            height: 40px;
            font-size: 16px;
            text-align: center;
            background-color: #f9f9f98c;
            border : none;
            border-radius: 10px;
        }
        
        #enter{
        	background-color: #f9f9f98c;
        	border : none;
        	border-radius: 5px;
        	padding : 5px;
        }
        
        .container{
        	width : 1000px;
        	height : 70px;
        	margin : auto;
        }
        
        .btn-container{
        	width : 470px;
        	heigth : 500px;
        	display : inline-block;
        	margin-left :50px;
        }
        
        #map-info {
        	text-align : center;
        	border : none;
        }


  </style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
	 <div id="innerOuter">
	 	<div id="choose-area">
	        <form action="course" method="get">
	            <select id="choose" name="courseIndex">
	                <c:forEach var="course" items="${ list }">
	                	<option value="${course.courseIndex }">${course.courseNo}. ${course.courseName}</option>
	                </c:forEach>
	            </select>
	            <button id="enter" type="submit">GO</button>
	        </form>    
        </div>
	 	

        <div id="demo" class="carousel slide" data-ride="carousel">

            <!-- Indicators -->
            <ul class="carousel-indicators">
            <li data-target="#demo" data-slide-to="0" class="active"></li>
            <li data-target="#demo" data-slide-to="1"></li>
            <li data-target="#demo" data-slide-to="2"></li>
            </ul>
        
            <!-- The slideshow -->
            <div class="carousel-inner">
            	<c:set var="fileIndex" value="0"/>
                <c:forEach var="file" items="${course.files }">
                	<c:if test="${file.fileLevel eq 3 }">
                		<c:set var="isFirst" value="${fileIndex == 0 }" />
                		<c:set var="fileIndex" value="${fileIndex + 1 }" />
                		<div class="carousel-item ${isFirst ? 'active' : ''}">
				            <img src="${pageContext.request.contextPath}/${file.changeName}">
				        </div>
                	</c:if>
                </c:forEach>
                
            </div>
        
            <!-- Left and right controls -->
            <a class="carousel-control-prev" href="#demo" data-slide="prev">
            <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#demo" data-slide="next">
            <span class="carousel-control-next-icon"></span>
            </a>
        </div>

        <div id="main">
            <h2>${course.courseNo }. ${course.courseName }</h2>
            <h4>${course.startEnd }</h4>
            <h4>거리:${course.distance } / 소요시간 : ${course.takeTime }</h4>
            <p>${course.content }</p>
        </div>
        <br><br>
        <hr>
		<br><br>
		
		<div class="container">
			<div class="btn-container" >
			  <h2>코스 상세 지도</h2>
			  <!-- Button to Open the Modal -->
			  <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal">
			    	이미지로 보기
			  </button>
			</div>  
			
			<div class="btn-container">
			 	<h2>코스 상세 보기</h2>
				<button id="kakaoUrl" type="button" class="btn btn-warning">
			    	카카오 장소 보기
				</button>
			</div> 
		</div>
		  <!-- The Modal -->
			  <div class="modal fade" id="myModal">
			    <div class="modal-dialog modal-lg">
			      <div class="modal-content">
			      
			        <!-- Modal Header -->
			        <div class="modal-header">
			          <h4 class="modal-title">${course.courseNo }. ${course.courseName }</h4>
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			        </div>
			        
			        <!-- Modal body -->
			        <div class="modal-body">
			        	<c:forEach var="file" items="${course.files }">
			            	<c:if test="${file.fileLevel eq 2 }">
			            		<img src="${pageContext.request.contextPath }/${ file.changeName }">
			            	</c:if>
			            </c:forEach>
			        </div>
			        
			        <!-- Modal footer -->
			        <div class="modal-footer">
			          <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
			        </div>
			        
			      </div>
			  </div>
			</div>

		<br><br>

        <div id="map"> </div>
        
		<script>
				
		const $courseIndex = '${course.courseIndex}'
		let $keyword = '제주올레 ${course.courseNo}'

		if($courseIndex === '3') $keyword = '제주올레 3-A코스'; 
		else if ($courseIndex === '4') $keyword = '제주올레 3-B코스';
		else if ($courseIndex === '16')	$keyword = '제주올레 15-A코스';
		else if ($courseIndex === '17') $keyword = '제주올레 15-B코스';
		
		$.ajax({
			url : 'courseMap',
			data : {query : $keyword },
			success : (data) => {
				
				const id = data[0].id;
				const placeUrl = data[0].place_url;
				const xMark = data[0].x;
				const yMark = data[0].y;
				
				$('#kakaoUrl').click(() => {
					window.open(placeUrl);
				});
				
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { 
			        center: new kakao.maps.LatLng(yMark, xMark), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };

				var map = new kakao.maps.Map(mapContainer, mapOption);
	
				// 마커가 표시될 위치입니다 
				var markerPosition  = new kakao.maps.LatLng(yMark, xMark); 
	
				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
				    position: markerPosition
				});
	
				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);
	
				var iwContent = '<div id="map-info">'+ $keyword +'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
				    iwPosition = new kakao.maps.LatLng(yMark, xMark); //인포윈도우 표시 위치입니다
	
				// 인포윈도우를 생성합니다
				var infowindow = new kakao.maps.InfoWindow({
				    position : iwPosition, 
				    content : iwContent 
				});
				  
				// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
				infowindow.open(map, marker); 

			}

		})





		</script>
        
    </div>
	
	<jsp:include page="../common/footer.jsp"/>
	
</body>
</html>