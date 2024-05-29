<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>동행신청 내역</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

 	
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	
    <style>
            div{
                box-sizing : border-box;
                margin : 0;
                padding : 0
            }          
        
            #wrap{
                width: 1200px;
                height: 900px;
                margin: 0 auto;
                position: relative;  
            }


            /*마이페이지 전체 박스*/
            #content{ 
                width: 800px;
                height: 700px;
                margin: 0 auto;
                margin-top: 200px;
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

            }

            .detailBox
            {
                width: 700px;
                height: 550px;
                margin-left: 50px;
            }
           
			.background-Box{
                width: 650px;
                height: 80px;
                padding-top: 8px;
                background-color: #f7d3a0;
                border-radius: 10px;
                margin-top: 15px;
                margin-left : 20px;
                
            }

            .box1{
                width: 80px;
                height: 60px;
                margin-left: 30px;
                float: left;
                background-color: #f7d3a0;
            }

            .detail{
                width: 200px;
                height: 60px;
                float: left;
                background-color: #f7d3a0;
                margin-top: 3px;
            }

            h5{
                padding-top: 5px;
                font-size: 16px;
                font-weight: bold;
            }

            .box2 {
            	width : 400px;
                padding-top: 5px;
                font-size: 16px;
                font-weight: bold;
                background-color: #f7d3a0;
                margin-top: 1px;
                padding-left : 20px;
            }

            .box3 {
           	 	width : 400px;
                padding-top: 5px;
                font-size: 14px;
                margin: 0;
                background-color: #f7d3a0;
                padding-left : 20px;
            }

            
            .acompany-btn{
            	width : 100px;
            	height : 50px;
            	float : right;
            	margin-top : 5px;
            	margin-right : 30px;
            	border-radius : 10px;
            	text-align : center;
            	padding-top : 10px;
            	vertical-align : middle;
            	background-color : white;
            }
            
            .acompany-btn:hover{
            	cursor : pointer;
            }
            
           .box5 {
	            width: 400px;
	            height: 100px;
	            border-radius: 10px;
	            margin-left: 20px;
	            margin : auto;
	            border : 1px solid #f7d3a0;
	            margin-bottom: 10px;
	        }

	        
	        .status-area{
	            margin: 5px 0px 5px 20px;
	            width: 100px;
	            height: 25px;
	            border-radius: 10px;
	            background-color: #f7d3a0;
	            color : black;
	            font-weight: bold;
	            text-align: center;
	        }

	        .userInfo{
	            margin: 5px 0px 0px 20px;
	            font-size: 20px;
	        }
	
	        .btn-area{
	            margin-bottom: 5px;
	            text-align: right;
	        }
	
	        .status{
	            margin-right : 10px;
	            width: 50px;
	            height: 25px;
	            border-radius: 10px;
	            color : black;
	            font-weight: bold;
	            text-align: center;
	            border : none;
	        }
	        
	
	        .yes{
	            background-color: #f7d3a0;
	        }
	
	        .no {
	            background-color : lightgray;
	        }

	        .pagination {
                width:fit-content;
                margin: 0 auto;
            }

           .active {
                background-color: #FF9843 !important;
                border: 1px solid #FF9843 !important;
                color: #FFFFFF !important;
                border-radius: 10px;
            }

            .page-link {
            	width : 40px;
            	height : 40px;
            	float : left;
                color: #292929 !important;
                border-radius: 10px;
                margin-right: 10px;
                border: 1px solid #9e9e9e;
                text-align : center;
            }
            
            .page-item:last-child .page-link, .page-item:first-child .page-link {
                border-radius: 10px !important;
            }
            
            #pagingArea{
            	margin-top : 20px;
            }
            
            #pageChange{
            	width : 250px;
            	height : 30px;
            	text-align : center;
            	float : right;
            	background-color : #FF9843;
            	border-top-right-radius : 10px;
            }
            
            #pageChange > a {
            	text-decoration : none;
            	color : white;
            	font-size : 16px;
            }
            
            


    </style>    
</head>
<body>
    <jsp:include page="../common/header.jsp"/>
    <div id="wrap">
    			

        <div id="content">
        	<div id="pageChange"><a href="myRequest?page="> 나의 신청내역 보기 </a> </div>
            <img class="icon-Img" src="resources/image/mypageIcon.png">
			
            <div id="titleBox">내가 쓴 동행 게시글</div>
            <div class="detailBox">

	            <c:forEach var="board" items="${list}">
	            	<div class="background-Box">
	            	    <div class="acompany-btn" id="${board.companionNo }" data-toggle="modal" data-target="#myModal">신청확인</div>
	            		<div class="box2">제목 : ${board.companionTitle} </div>
	            		<div class="box3"> ${board.courseName} | 날짜 : ${board.companionDate} | 인원 : ${board.companionNum}/${board.companionPeople }</div>
	            	</div>
	            </c:forEach>

	            
	              <!-- The Modal -->
				  <div class="modal" id="myModal">
				    <div class="modal-dialog">
				      <div class="modal-content">
				      
				        <!-- Modal Header -->
     				    <div class="modal-header">
				          <h4 class="modal-title">신청자 목록 확인</h4>
				          <button type="button" class="close" data-dismiss="modal">×</button>
				        </div>
				        
				        <!-- Modal body -->
				        <div class="modal-body">
				          
				        </div>
				        
				        <!-- Modal footer -->
				        <div class="modal-footer">
				          <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
				        </div>
				        
				      </div>
				    </div>
				  </div>
				  
				  
				  
				<div id="pagingArea">
	                <ul class="pagination">
	                	<c:if test="${pageInfo.currentPage gt 1}">
		            	<li class="page-item"><a class="page-link" href="companionInvite?page=${pageInfo.currentPage - 1}"> < </a>
		            	</c:if>
		            	<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" var="i" step="1">
			            	<c:choose>
								<c:when test="${pageInfo.currentPage ne i }">
									<li class="page-item"><a class="page-link" href="companionInvite?page=${i}"> ${i} </a>
								</c:when>    
								<c:otherwise>
									<li class="page-item"><a class="page-link active" href="companionInvite?page=${i}">${i}</a>
								</c:otherwise>        	
			            	</c:choose>
		           		</c:forEach>
			            <c:if test="${not empty list && pageInfo.currentPage ne pageInfo.maxPage}">
			            	<li class="page-item"><a class="page-link" href="companionInvite?page=${pageInfo.currentPage +1 }"> > </a>
			            </c:if>	
	                </ul>               
	            </div>  
	            
            </div>
        </div>
        
        <!-- The Modal -->
	  <div class="modal" id="myModal">
	    <div class="modal-dialog">
	      <div class="modal-content">
	      
	        <!-- Modal Header -->
  		   <div class="modal-header">
	          <h4 class="modal-title">신청자 목록 확인</h4>
	          <button type="button" class="close" data-dismiss="modal">×</button>
	        </div>
	        
	        <!-- Modal body -->
	        <div class="modal-body">
	          
	        </div>
	        
	        <!-- Modal footer -->
	        <div class="modal-footer">
	          <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
	        </div>
	        
	      </div>
	    </div>
	  </div>  
	            
        
        <script>

	        $(document).on('click', '.acompany-btn', function() {
	        	
	        	$.ajax({
	        		url : 'companions/acompany',
	        		data : {companionNo : $(this).attr('id')},
	        		success : (data) => {
	        			let user = '';
	        			let status = '';
	        			
	        			for(let i in data){
	        				
	        				if(data[i].status == 'N') {
	        					status = '신청중';
	        					
	        					user += '<div class="box4">'
		  		        		          +	  '<div class="status-area">'
		  		        		          +		status
		  		        		          +	  '</div>'
		  		        		          +   '<div class="userInfo">'
		  		        		          + 	data[i].userName
		  		        		          +   '</div>'  
		  		        		          +   '<div class="btn-area">'
		  		        		          +     '<button class="status yes" onclick="permission();">수락</button>'
		  		        		          +     '<button class="status no" onclick="rejection();">거절</button>'
		  		        		          +		'<input type="hidden" class="userNo" id="' + data[i].userNo +'">'
		  		        		          +		'<input type="hidden" class="companionNo" id="' + data[i].companionNo +'">'
		  		        		          +   '</div>'
		  		        		    	  + '</div>'
	        				} else if (data[i].status == 'A' ) {
	        					status = '참여';
	        					
	        					user += '<div class="box4">'
		  		        		          +	  '<div class="status-area">'
		  		        		          +		status
		  		        		          +	  '</div>'
		  		        		          +   '<div class="userInfo">'
		  		        		          + 	data[i].userName
		  		        		          +   '</div>'  
		  		        		          + '</div>'
		  		        		          
	        				} else {
	        					status = '취소';
	        					
	        					user += '<div class="box4">'
	  		        		          +	  '<div class="status-area">'
	  		        		          +		status
	  		        		          +	  '</div>'
	  		        		          +   '<div class="userInfo">'
	  		        		          + 	data[i].userName
	  		        		          +   '</div>'  
	  		        		          + '</div>'  
	        				}

	        			$('.modal-body').html(user);
	        		}
	        		
	        	}
	        	})		
	        })
	        
        </script>
        
        <script>
        	function permission(){
        		
        		const user = $('.userNo').attr('id');
        		const companion = $('.companionNo').attr('id');
        		
        		$.ajax({
        			url : 'permission',
        			data : {
        				userNo : user,
        				companionNo : companion
        			},
        			success : () => {
        				location.href="companionInvite";
        			}
        		})
        	}
        	
        	function rejection(){
        		
        		const user = $('.userNo').attr('id');
        		const companion = $('.companionNo').attr('id');
        		
        		$.ajax({
        			url : 'rejection',
        			data : {
        				userNo : user,
        				companionNo : companion
        			},
        			success : () => {
        				location.href="companionInvite";
        			}
        		})
        	}
        
        </script>
        
    </div>
    
    
	<jsp:include page="../common/footer.jsp"/>


</body>
</html>