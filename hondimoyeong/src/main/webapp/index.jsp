<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>혼디모영</title>
<style>

	#innerOuter{
		width : 1000px;
		height : 1400px;
		margin : auto;
		margin-bottom: 50px;
	}
	
	#ex{
		width : 800px;
		height : 350px;
		margin : auto;
	}
	
	.reservation {
		width : 250px;
		height : 50px;
		float : left;
		margin-right : 15px;
	}
	
	.reservation:hover {
		cursor : pointer;
	}

	.reservation > img {
		width: 200px;
		height: 200px;
		display: table-cell;
		margin:auto;
		border-radius: 100px;
	}
	
	.reservation > label{
		font-size:25px;
		margin:auto;
	}
	
	#han{
		margin-top: 15px;
		margin-left:75px;
		padding: 5px 20px;
		color:#FFF;
		background-color: #976841;
		border-radius: 20px;
	}
	
	#aqua{
		margin-top: 15px;
		margin-left:40px;
		color:#FFF;
		padding: 5px 20px;
		background-color: #36f;
		border-radius: 20px;
	}
	
	#gul{
		margin-top: 15px;
		margin-left:65px;
		color:#FFF;
		background-color: #FF9843;
		padding: 5px 20px;
		border-radius: 20px;
	}

	#jeju-island{
		width:1000px;
		height:800px;
		margin : auto;
	
	}

     #ollemap{
        width: 920px;
        height: 650px;
        margin: auto;
        background-image: url(resources/course/island/기본.PNG);
        background-size: cover;
        background-repeat: no-repeat;
        position: relative;
    }

    #ollemap > img{
        width: 100%;
        height: 100%;

    }

    .course-detail{
        width: 380px;
        height: 180px;
        background-color: rgba(255, 255, 255, 0.606);
        border-radius: 30px;
        position: absolute;
        z-index: 10;
        right : 260px;
        top : 230px;
    }
    
    h4, h5 {
    	padding : 5px;
    	text-align : center;
    	font-size : smaller;
    }

    #whole-course{
       width: 1000px;
       margin: auto; 
       margin : 40px 0px 40px 0px;
       text-align: center;
       padding: 20px;
    }

    #btn-area{
    	width : 900px;
        margin: auto;
        margin-bottom : 40px;
        margin-top: 30px;
    }

    h3{
        font-size: 25px;
    }

    .course-btn {
        margin : 10px;
        width: 100px;
        height: 40px;
        font-size: 20px;
        color : white;
        border-radius: 30px;
        background-color: #ff9843;
        border : none;
    }
    
    

</style>
</head>
<body>



	<jsp:include page ="WEB-INF/views/common/header.jsp" />
	
	<div id="innerOuter">
		<div id="ex">
		    <div class="reservation">
		   		<img onclick="location.href='${path}/hanlasan'" src="resources/image/han.jpg">
		   		<label id="han">한라산</label>
		    </div>
		    <div class="reservation">
		    	<img onclick="location.href='aqua'"src="resources/image/아쿠아리움.png">
		    	<label id="aqua">아쿠아플라넷</label>
		    </div>
		    <div class="reservation">
		   		<img onclick="location.href='tangerine'"src="resources/image/tangerine.jpg"/>
		   		<label id="gul">감귤체험</label>
		    </div>
		 </div>
		 
		<div id ="jeju-island">
			<div id="ollemap"></div>
			<div id="content-area"></div>
		        
		    <div id="whole-course">
		        <h3>코스 한 눈에 보기</h3>
		        <div id="btn-area">
		        	
		        </div>
		    </div>
		</div>
		
	</div>


    <script>
   
    
    	$.ajax({
    		url : 'mainCourse',
    		success : (data) => {

    			let btn = '';
    			
    			for(let i in data){
    				//console.log(data[i].courseName);
    				if(data[i].courseName === '온평-표선(B)' || data[i].courseName === '한림-고내(B)'){
    					continue;
    				}
    				
    				if(data[i].courseNo === '3-A코스') data[i].courseNo = '3코스';
    				if(data[i].courseNo === '15-A코스') data[i].courseNo = '15코스';
    				
    				btn += '<button class="course-btn" id="' + data[i].courseIndex
			 		   + '" onclick="content(this);">'
			 		   + data[i].courseNo + '</button>';    				   
    			}
    			
    			$('#btn-area').html(btn);	  
    		}
    		
    	});
    	
    	function content(button){
    		
    		$.ajax({
    			url : 'selectCourse',
    			data : {courseIndex : (button.id)},
    			success : (data) => {
    				let content = '';
    				
    	    		const url = "resources/course/island/"+ (data.courseIndex) +".png"

    	    		if(data.courseNo === '3-A코스') data.courseNo = '3코스 (A/B)'
    	    		if(data.courseNo === '15-A코스') data.courseNo = '15코스 (A/B)'
    	    		
    	    		content += '<div class="course-detail" id="'+ data.courseIndex +'" onclick="detailPage(this);">'
    	    				 + '<h4>' + data.courseNo + '</h4>'
    						 + '<h5>' + data.startEnd + '</h5>'
    						 + '<h5>' + data.takeTime + '</h5>'
    						 + '<h5>' + data.distance + '</h5>'
    						 + '</div>'
    				
    	    		$('#ollemap').html(content + '<img src="'+ url + '">');		 
    			}

    		})
    	}
    	
    	
    	function detailPage(obj){
    		
    		//console.log($(obj).attr('id'));
    		location.href="course?courseIndex="+$(obj).attr('id');
    		
    	}
    	
    </script>

	
	<jsp:include page ="WEB-INF/views/common/footer.jsp" />

</body>
</html>