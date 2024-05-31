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

#hanlasanimg{
	width : 1200px;
	height : 800px;
	background-image : url('resources/image/한라산.webp');
	background-repeat : no-repeat;
	margin : auto;
	margin-top : 20px;
	boardere-radius : 20px;
	background-size : contain;
}

#mainimg{
 	text-align: center;
	margin : auto;
	padding-top:200px;
	width:40%;
	height:75%;
	
}
#main1{
	padding-top:20px;
	height:65%;
	background-color: #FFE880;
	
}
#main2{
	padding-top:20px;
	height:35%;
	color:white;
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
		<div id="hanlasanimg">
			<div  id="mainimg">
				<div id="main1">
					<h3>한라산</h3><br>
					<b>
					제주도에 위치한 남한에서 가장 높은산(해발 1947m)이자 대한민국의 가장 높은 국립공원이다. <br>
					국립공원 전역이 유네스코 세계유산으로 지정되었다. 금강산, 지리산과 함께 대한민국 삼신산 중 하나로 꼽힌다. <br>
					</b>
					
					<a class="btn btn-outline-primary" style="margin-top:15px" href="handetail">자세히보기</a>
					
				</div>
				<div id="main2">
					<h3>한라산 등산 예매하기</h3>
					
					<form action="hanreserve" method="get">
						<button class="btn btn-outline-success" style="margin-top:15px">탐방하기</button>
					</form>
					<br>
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
					<c:forEach items="${ reviewh }" var="review" end="4">
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
			
		  	<form action="exreviewh" method="post">
		  	
		  	  <div class="select">
		  	  	<label>카테고리</label>                                        
				<select name="courseSeq" id="courseSeq" onchange="divide();" class="form-control">
				 	<option value="한라산">한라산</option>
				</select>
					<input id="course" type="hidden" name="experienceCategory" value="한라산"><!-- 1 -->
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