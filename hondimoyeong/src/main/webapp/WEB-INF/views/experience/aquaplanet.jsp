<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
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
#allform{
	width:1200px;
	height : 1200px;
	margin : auto;
	
}

#aquaimg{
	width : 1200px;
	height : 631px;
	background-image : url('resources/image/aqua2.jpg');
	background-repeat : no-repeat;
	margin : auto;
	margins-top : 20px;
	boardere-radius : 20px;
	background-size : contain;
	
}
#mainimg{
 	text-align: center;
	margin : auto;
	padding-top:150px;
	width:40%;
	height:75%;
	
}
#main1{
	padding-top:20px;
	float:left;
	height:100%;
	width:50%;
	background-color: white;
	
}
#main2{
	padding-top:20px;
	color:white;
	height:100%;
	background-color: #36f;
}

#one{
	widht:100%;
	height:200px;
}

#one > div > h3{
	padding-left:10px;
	padding-top:10px;
	width:30%;
	float:left
}

#btn1 {
	float: right;
	margin-right:10px;
	margin-top:10px;
}	

#btn2 {
	float: right;
	margin-right:10px;
	margin-top:10px;
}	
		
</style>
</head>
<body>
	<jsp:include page ="../common/header.jsp" />

	<div id="allform">
		<div id="aquaimg">
			<div  id="mainimg">
				<div id="main1">
					<h3>운영시간 / 프로그램</h3><br>
					연중무휴 : 09:30~18:00 <br>
					매표마감 : 17:00 <br>
					- 매표 마감시간은 17:00이오며,<br> 입장마감 <br>
					시간은 17:30까지입니다. <br><br>
					<a class="btn btn-outline-warning" style="margin-top:5px" href="aquadetail">자세히보기</a>
				</div>
				<div id="main2">
					<h3>이용요금</h3><br>
					<h4>성인    &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;45000원</h4>
					<h4>청소년·경로 &nbsp;&nbsp;&nbsp;43000원</h4>
					<h4>어린이    &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;40000원</h4> <br>
					<form action="aquareserve" method="get">
						<button class="btn btn-outline-info"  style="margin-top:15px">예매하기</button>
						<input type="hidden" name="price" id="price" value="36000">
					</form>
				</div>
			</div> 
		</div>
		<br>
		
		<div id="one">
			<div>
				<h3>한줄리뷰</h3>
				<c:if test="${ not empty sessionScope.loginUser && not empty sessionScope.experience }">
					<button class="btn btn-outline-info" id="btn1" data-toggle="modal" data-target="#add">
						글쓰기
					</button>
				</c:if>
				<table id="boardList" class="table table-hover">
					<thead>
						<tr>
							<th>아이디</th>
							<th>내용</th>
							<th>카테고리</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${ reviewa }" var="review" end="4">
						<tr>
							<td>${ review.userId }</td>
							<td>${ review.experienceContent }</td>
							<td>${ review.experienceCategory }</td>
						</tr>					
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
	<!-- 한줄 리뷰 입력 -->
	<div class="modal" id="add">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">한줄리뷰 작성</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- body -->
	      <div class="modal-body">
			
		  	<form action="exreviewa" method="post">
		  	
		  	  <div class="select">
		  	  	<label>카테고리</label>                                        
				<select name="courseSeq" id="courseSeq" onchange="divide();" class="form-control">
				 	<option value="아쿠아리움">아쿠아리움</option>
				</select>
					<input id="course" type="hidden" name="experienceCategory" value="아쿠아리움"><!-- 1 -->
			  </div>
		  	  <br>
			  <div class="form-group">
			    <label for="memberPwd">한줄리뷰</label>
			    <input type="text" name="experienceContent" class="form-control" placeholder="리뷰를 입력해주세요" required>
			  </div>
			<button id="btn2">작성</button>			  
	    	 </form>
	    	</div>
		</div>
	  </div>
	</div>
	
	<jsp:include page ="../common/footer.jsp" />

</body>
</html>