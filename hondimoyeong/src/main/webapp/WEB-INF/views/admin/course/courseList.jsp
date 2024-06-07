<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리스트</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8fb9d532bba6f497bc125efc82a1127e"></script>

<style>
	#innerOuter{
		width: 1000px;
		margin: auto;
		margin-top: 40px;
	}

	table{
		width: 800px;
		margin: auto;
		text-align: center;
		font-size: 15px;
		font-weight: 100;
	}
	
	thead{
		background-color: rgb(255, 191, 108);
		color : white;
		border-bottom : 1px solid rgb(255, 191, 108);
	}

	th, td{
		height: 30px;
		border-bottom : 1px solid rgb(255, 191, 108);
	}

	.btn-area{
		margin : auto;
		width: 800px;
		text-align: right;
		margin-bottom : 20px;
		height : 50px;
    }
    
    p{
    	font-size : 12px;
    	margin-bottom : 8px;
    	padding-right : 10px;
    }

	a{
		background-color: #ff9843;
		border : none;
		color : white;
		font-size : 15px;
		padding : 5px 15px 5px 15px;
		border-radius: 30px;
		text-align: center;
	}

</style>

</head>
<body>

	
	
	<jsp:include page="../../common/adminHeader.jsp" />
	

	<div id="innerOuter">

		
		<div class="btn-area">
			<p>최근 업데이트 시간 : ${cookie.currentTime.value }</p>
			<a href="api/load">데이터 가져오기</a>
		</div>
		<table>
			<thead>
				<tr>
					<th>코스번호</th>
					<th>코스이름</th>
					<th>스탬프</th>
					<th>상세지도</th>
				</tr>
			</thead>
			<tbody>
				
				<c:if test="${ empty list}">
					<tr>
						<td colspan="4">리스트가 없습니다</td>
					</tr>
				</c:if>

				<c:forEach var="course" items="${list}">
					<tr>
						<td>${course.courseNo}</td>
						<td onclick="location.href='course/${course.courseIndex}'">${course.courseName}</td>
						<c:if test="${ course.files[0].originName ne '' }">
							<td> 💾 </td>
						</c:if>
						<c:if test="${ course.files[1].originName ne '' }">
							<td> 💾 </td>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
		<jsp:include page="../../common/footer.jsp" />
	

</body>
</html>