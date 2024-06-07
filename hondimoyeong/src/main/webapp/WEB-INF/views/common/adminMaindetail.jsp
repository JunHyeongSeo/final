<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#all{
	padding-top:50px;
	width:1200px;
	height:800px;
	margin:auto
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="adminHeader.jsp"/>

	<div id="all">
	
	
		<h2>결제 상세 내역</h2><br>
		<a class="btn btn-secondary" style="float:right; height:40px;" href="saleMain">목록으로</a>
	<table id="boardList" class="table table-hover" align="center">
		        <thead>
		            <tr>
		            	<th>번호</th>
		                <th>회원이름</th>
		                <th>종류</th>
		                <th>가격</th>
		                <th>날짜</th>
		                <th>이용인원</th>
		                <th>구분</th>
		            </tr>
		        </thead>
		        <tbody>
		        
		        	
		        		<tr>
		        			<td>${ experienceDetail.experienceNo }</td>
		        			<td>${ experienceDetail.userName }</td>
		        			<td>${ experienceDetail.category }</td>
		        			<td>${ experienceDetail.price }</td>
		        			<td>${ experienceDetail.experienceDate }</td>
		        			<td>${ experienceDetail.experiencePeople }</td>
		        			<td>${ experienceDetail.experienceDivide }</td>
		        		</tr>
		        	
		          
		        </tbody>
	    </table>
	    
    </div>
    	<jsp:include page ="../common/footer.jsp" />
    

</body>
</html>