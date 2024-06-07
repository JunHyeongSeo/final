<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>디테일</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8fb9d532bba6f497bc125efc82a1127e"></script>
    <style>

        *{
            box-sizing: border-box;
            margin: 0;
        }

        #innerOuter{
            width: 1000px;
            height: 1000px;
            margin: auto;
        }

        h2{
            font-size : 30px;
            margin: 20px 0px 20px 0px;
        }

        #line{
            width: 1000px;
            height: 20px;
            background-color: #ff9843;
        }

        table{
            margin: auto;
            margin-top : 20px;
        }
        
        textarea{
        	resize : none;
        }

        .part {
            width: 150px;
            height: 50px;
            text-align: center;
            font-size: larger;
            background-color: rgba(255, 238, 216, 0.478);

        }

        .infomation{
            text-align: left;
            height: auto;
            padding: 10px;
        }

        .infomation > img {
            width: 800px;
            margin: auto;
        }

        #stamp{
            width: 120px;
        }

        .btn-area{
            text-align: center;
            margin : 30px
        }
        button{
            background-color: #ff9843;
            border : none;
            color : white;
            font-size : 20px;
            padding : 5px 15px 5px 15px;
            border-radius: 30px;
            text-align: center;
        }
    </style>
</head>
<body>
    
    	<jsp:include page="../../common/adminHeader.jsp" />
    	
    <div id="innerOuter">

        <h2>관리자페이지/ 올레길</h2>
        <div id="line"></div>

		<form action="updateCourse" method="post" enctype="multipart/form-data">
		
		<table>
	            <tr>
	                <td class="part">코스번호</td>
	                <td class="infomation">${course.courseNo}</td>
	                <td class="part">소요시간</td>
	                <td class="infomation">${course.takeTime}</td>
	                <td class="part" rowspan="2">스탬프</td>
	                <td rowspan="2" class="infomation">
	                <c:forEach var="file" items="${course.files}">
                		<c:if test="${file.fileLevel eq 1 }">
                			${file.originName }
                		</c:if>
                	</c:forEach>
	                    <input type="file" name="stamp"> 
	                </td>
	            </tr>
	            <tr>
	                <td class="part">코스이름</td>
	                <td colspan="3" class="infomation">${course.courseName }</td>
	            </tr>
	            <tr>
	                <td class="part">코스설명</td>
	                <td class="infomation" colspan="5">
	                	<textarea name="content" rows="20" cols="120">${course.content}</textarea>
	                
	                </td>
	            </tr>
	            <tr>
	                <td class="part">상세지도</td>
	                <td class="infomation" colspan="5">
	                <c:forEach var="file" items="${course.files}">
                		<c:if test="${file.fileLevel eq 2 }">
                			${file.originName }
                		</c:if>
                	</c:forEach>
	                    <input type="file" name="detailMap">
	                </td>
	            </tr>
	            <tr>
	                <td class="part" rowspan="4">코스사진</td>
		            <c:forEach var="file" items="${course.files}">
			               <c:if test="${file.fileLevel eq 3 }"> 
			               	<tr>    
				                <td class="infomation" colspan="4">${ file.originName }  <input type="file" name="photo"></td>
							</tr>
			               </c:if>
				    </c:forEach>
	        </table>

	        <div class="btn-area">
	        	<input type="hidden" name="courseIndex" value="${course.courseIndex }">
	            <button type="submit">수정하기</button>
	        </div>
	        
        </form>

        <div class="btn-area">
        	<button id="back">목록으로</button>
        </div>
        
        <script>
        	
        $(() => {
        	$('#back').click(() => {
        		location.href="/hondimoyeong/admin/course";
        	})
        })
        
        </script>
        
    </div>
    
    		<jsp:include page="../../common/footer.jsp" />


</body>
</html>