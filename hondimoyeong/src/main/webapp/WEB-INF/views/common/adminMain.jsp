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
	width:1200px;
	height:800px;
	margin:auto
}
#area{
	width:100%;
	height:10%;
}

th{
	width:20%;
}

</style>

<title>관리자페이지</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	
</head>
<body>

<jsp:include page="adminHeader.jsp"/>
		
	<div id="all">

	<h2>관리자페이지</h2><br>
	<h4>결제 내역</h4>
	
	<table id="boardList" class="table table-hover" align="center">
	        <thead>
	            <tr>
	            	<th>번호</th>
	                <th>회원이름</th>
	                <th>종류</th>
	                <th>가격</th>
	            </tr>
	        </thead>
	        <tbody>
	        
	        	<c:forEach items="${ list }" var="saleList">
	        		<tr>
	        			<td>${ saleList.experienceNo }</td>
	        			<td>${ saleList.userName }</td>
	        			<td>${ saleList.category }</td>
	        			<td>${ saleList.price }</td>
	        		</tr>
	        	</c:forEach>
	          
	        </tbody>
        
    </table>
	 
	<div id="area"></div>
		<div id="pagingArea">
		<ul class="pagination">
                	<c:choose>
                		<c:when test="${ pageInfo.currentPage eq 1 }">
                		    <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item">
                    			<a class="page-link" href="saleMain?page=${ pageInfo.currentPage -1}">
                    				Previous
                    			</a>
                    		</li>
                    	</c:otherwise>
                    </c:choose>
                     <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" var="p">
                   		<li class="page-item"><a class="page-link" href="saleMain?page=${p}">${p}</a></li>
					</c:forEach>
                    
                    
                    <c:choose>
                    	<c:when test="${ pageInfo.currentPage eq pageInfo.endPage }">
                    		<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<a class="page-link" href="saleMain?page=${ pageInfo.currentPage + 1}">
                    			Next
                    		</a>
                    	</c:otherwise>
                    </c:choose>
                </ul>
               
		</div>
	
	</div>

<div>

</div>


<script>
	$(function(){
		
		$('#boardList > tbody > tr').click(function(){
			
			location.href = 'detail.ex?experienceNo=' + $(this).children().eq(0).text();
			
		});
		
	});

</script>


	<jsp:include page ="../common/footer.jsp" />


</body>
</html>