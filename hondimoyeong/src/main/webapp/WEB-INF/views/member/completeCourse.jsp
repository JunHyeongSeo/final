<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>완주한 코스</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <style>
            div{
                /*border : 1px solid red;*/
                box-sizing : border-box;
                background-color: #ffffff;
                
            }          
        
            #wrap{
                width: 1200px;
                height: 1400px;
                margin: 0 auto;
                position: relative;  
            }


            /*마이페이지 전체 박스*/
            #content{ 
                width: 800px;
                height: 1260px;
                margin: 0 auto;
                margin-top: 150px;
                /* background-color: #FFF2D7; */
                border-radius: 20px;
                border : 4px solid #FF9843; 
                position: relative; 
            }

           
            /*귤 아이콘*/
            .icon-Img{
                width: 130px;
                height: 150px;
                background-color: transparent;
                position: absolute; 
                top: -130px; 
                left: 2%;
            }

            /*타이틀 박스*/
            #titleBox     
            {
                width: 700px;
                height: 50px;
                margin-top: 30px;
                margin-left: 50px;
                text-align: center;
                line-height: 50px;
                font-size: 20px;
                font-weight: bold;
                /* background-color: #FFF2D7; */
                /* border: 1px solid rgb(0, 255, 64); */
            }

            /*내용 박스*/
            #detailBox
            {
                width: 700px;
                height : 1000px;
                margin-left: 50px;
                padding-left: 2px;
                padding-top: 0px;
                /* background-color: #FFF2D7; */
                margin-bottom : 10px;
            }

            .background-Box{
                width: 450px;
                height: 80px;
                padding-top: 8px;
                background-color: #f7d3a0;
                border-radius: 10px;
                margin-top: 15px;
                margin-left: 20px;
            }

            .detail{
                width: 200px;
                height: 60px;
                float: left;
                background-color: #f7d3a0;
                margin-top: 3px;
                /* border: 1px solid rgb(0, 163, 204); */
            }

            h5{
                padding-top: 5px;
                font-size: 16px;
                font-weight: bold;
            }

            .map{
                width: 110px;
                height: 160px;
                float: left;
                margin-left: 25px;
                margin-top: 5px;
                margin-bottom : 20px;
            }

            .box2{
                width: 110px;
                height: 10px;
                display: inline-block;
                font-size: 16px;
                font-weight: bold;
                text-align: center;
            }
            
            .box3{
                width: 110px;
                height: 11px;
                display: inline-block;
                font-size: 12px;
                text-align: center;
            }
            
            /*코스 아이콘*/
            .map > img {
                opacity: 0.2; /* 투명도 조절 */
                width : 100%;
                height : 70%;
            }
            
            .box1{
		    	margin-left: 600px;
		    	margin-bottom: 10px;
		    }
		    
            .btn-b{
                width: 60px;
                height: 35px;
                border-radius: 15px;
                background-color: #9e9e9e; 
                color: #ffffff;
                font-weight: bold;
                font-size: 12px;
                line-height: 35px;
                border: 0;
            }		    

    </style>    
</head>
<body>
    <jsp:include page="../common/header.jsp"/>
    <div id="wrap">
        <div id="content">
            <img class="icon-Img" src="resources/image/mypageIcon.png">
            
            <div id="titleBox">완주한 코스</div>
            
            <div id="detailBox">
            <div class="box1"><button class="btn-b" onclick="location.href='myPage';">목록</button></div>
	            <c:forEach var="course" items="${list}">
					 <div class="map">
					 	<img id="${course.courseIndex}" src="${course.changeName}">
	                    <div class="box2">${course.courseNo}</div>
	                    <div class="box3">${course.courseName}</div>
	                </div>           
	            </c:forEach> 
            </div>
    
            <script>

            	/*사용자가 리뷰를 작성한 코스만 진하게*/
            	$.ajax({
            		url : 'userCourse',
            		data : {
            			userNo : ${sessionScope.loginUser.userNo}
            		},
            		success : (data) => {
           				for(let i in data){
           					const id = '#' + data[i].courseIndex;
           					$(id).css('opacity', '1');

           				}
            		}
            	});
            
            </script>
            
        </div>
    </div>
	<jsp:include page="../common/footer.jsp"/>


</body>
</html>