<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>혼디모영</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

	<style>
        *{
            box-sizing: border-box;
            font-family: "Noto Sans KR", sans-serif;
        }
        /* header */
        .header{
            width: 1200px;
            height: 260px;
            margin: 0 auto;
        }
    
        .header_top{
            width: 1200px;
            padding-top: 20px;
            padding-bottom: 20px;
        }
    
        .header_top_menu{
            width: 1200px;
            height: 30px;
            
        }
        
        .header_menubar{
        	width: 500px;
        	height:auto;
        	float: right;
        	text-align: right;
        }
    
        .header_top_menu a{
            width: 100px;
            text-decoration: none;
            font-size: 15px;
            font-weight: bold;
            color: black;
            margin-left: 10px;
        }
    
        .header_top_menu a:hover{
            color: #FF9843;
        }
    
        .header_mid{
            width: 1200px;
            float: left;
            position: relative;
            border-top: 1px solid lightgray;
            border-bottom: 1px solid lightgray;
        }
    
        .header_logo{
            width: 300px;
            height: 130px;
            /* border: 1px solid saddlebrown; */
            float: left;
        }
    
        .logo{
            width: 300px;
            padding-top: 20px;
        }
    
        .header_menu{
            width: 890px;
            height: 130px;
            float: left;
            /* border: 1px solid pink; */
            padding-top:45px
        }
    
        .navi{
            list-style: none;
            margin: 0;
            padding: 0;
            margin-left: 20px;
        }
    
        .navi > li{
            float: left;
            width: 170px;
            text-align: center;
            /* border: 1px solid red; */
        }
    
        .navi a{
            text-decoration: none;
            color: black;
            font-weight: bold;
            font-size: 17px;
        }
    
        .navi a:hover{
            color: #FF9843;
        }
    
        .navi > li > ul{
            list-style: none;
            margin: 0;
            padding: 0;
            display: none;
            text-align: center;
        }
    
        .navi > li > a:hover + ul {
            display : block;
        }
    
        .navi > li > ul:hover {
            display: block;
        }
    
        .submenu{
            position: absolute;
        }
    
        .submenu > li {
            width: 170px;
            padding: 15px;
            height: auto;
            background-color: rgba(255, 255, 255, 0.815);
        }
        
        #alram-area {
        	display : inline-block;
        	width : 100px;
        	height : 20px;
        	background-color : red;
        	color : white;
        	font-size : 12px;
        	font-weight : bold;
        	text-align : center;
        	border : 1px solid red;
        	border-radius : 100px;
        }
        
        #alram-area:hover{
        	cursor : pointer;
        }
    
    </style>
</head>
<body>
	<c:set var="path" value="${ pageContext.request.contextPath }" scope="session"/>
	
	<c:if test="${ not empty alertMsg }">
        <script>
            alert('${ alertMsg }');
        </script>
        <c:remove var="alertMsg" scope="session" />
    </c:if>

    <div class="header">
        <div class="header_top">
            <div class="header_top_menu">
                <c:choose>
	           		<c:when test="${ empty sessionScope.loginUser }">
		                <!-- 로그인 전 -->
		                <div class="header_menubar">
			                <a href="${path}/login">로그인</a>
			                <a href="${path}/insertForm">회원가입</a>
			                <a href="${path}/list.notice">고객센터</a>
		                </div>
	                </c:when>
				    <c:otherwise>
				        <!-- 로그인 후 -->
				        <div class="header_menubar">
				        	
				        	<span id="alram-area" onclick="location.href='${path}/companionInvite?page='"> </span>
				        	
					        <label><b style="color:#FF9843">${ sessionScope.loginUser.userName }</b>님 환영합니다!</label> 

					        <c:choose>
					            <c:when test="${ sessionScope.loginUser.status == 'A' }">
					                <a href="${path}/adminPage">관리자페이지</a>
					            </c:when>
					            
					            <c:when test="${ sessionScope.loginUser.status == 'C' }">
					                <a href="${path}/myPage">마이페이지</a>
					            </c:when>
					        </c:choose>
					        <a href="${path}/list.notice">고객센터</a>
					        <a href="${path}/logout.member">로그아웃</a>
				        	
						</div>
           		 	</c:otherwise>
                </c:choose>              
            </div>
        </div>
        <div class="header_mid">
            <div class="header_logo">
            	<a href="${ path }">
                	<img src="${ path }/resources/image/logo.png" class="logo">
                </a>
            </div>
            
            <div class="header_menu">
                <ul class="navi">
                    <li><a href="${path}/courses">올레길</a></li>
                    <li><a href="${path}/companion">혼디모영</a></li>
                    <li><a href="#">프로그램</a>
                        <ul class="submenu"  style="padding-top: 20px;">
                            <li><a href="${path}/tangerine">감귤 체험</a></li>
                            <li><a href="${path}/hanlasan">한라산 예약</a></li>
                            <li><a href="${path}/aqua">아쿠아플라넷 예약</a></li>
                        </ul>
                    </li>
                    <li><a href="${path}/event">축제/이벤트</a></li>
                    <li><a href="${path}/review">리뷰</a></li>
                </ul>
            </div>
        </div>
    </div> <!-- header 끝 -->
    
    <script>

    	$.ajax({
    		url : '${path}/alram',
    		data : {userNo : ${sessionScope.loginUser.userNo} },
    		success : (data) => {
    			
    			if(data != '0' ){
	    			$('#alram-area').html('<span> 새로운 신청확인 </span>');				
    			} else {
    				$('#alram-area').css('background-color', 'white');
    				$('#alram-area').css('border', 'white');
    			}
    		}
    		
    	})

    </script>
    
</body>
</html>