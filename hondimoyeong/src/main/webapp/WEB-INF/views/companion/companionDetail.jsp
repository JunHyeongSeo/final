<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>혼디모영 - ${ companion.companionTitle }</title>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8fb9d532bba6f497bc125efc82a1127e"></script>
<style>
    /* content */
    #container{
        width: 1200px;
        height: auto;
        margin: 0 auto;
    }

    .detail_top{
        width: 1200px;
        height: 100px;
        margin: 0 auto;
        background-color: #FF9843;
        border-radius: 30px;
        line-height: 95px;
        text-align: center;
        font-size: 20px;
        font-weight: bold;
        color: #fff;
        margin-bottom: 30px;
    }

    .detail_top a{
        color: #ffffff;
        padding:20px;
    }

    .detail_courseImg {
        width: 1200px;
        margin: 0 auto;
        display: flex;
        justify-content: center;
        border: 4px solid #FF9843;
        border-radius: 30px;
    }

    .courseImg {
        width: 950px;
        display: block; /* inline 요소에서 block 요소로 변경 */
    }

    .detail_box{
        width: 1200px;
        height: 120px;
        margin: 0 auto;
        margin-top: 30px;
        border-bottom: 1px solid lightgray;
        /* border: 1px solid red; */
    }

    .detail_box_left{
        width: 1000px;
        height: 100px;
        float: left;
        /* border: 1px solid green; */
    }

    .detail_box_right{
        width: 195px;
        height: 100px;
        float: left;
        padding-top: 10px;
        /* border: 1px solid black; */
    }

    .detail_title{
        width: 1000px;
        font-size: 25px;
        font-weight: bold;
        padding-top: 10px;
        padding-bottom: 10px;
        /* border: 1px solid pink; */
    }

    .detail_info{
        width: 1000px;
        /* border: 1px solid red; */
    }

    .detail_info1{
        width: 230px;
        float: left;
    }

    .detail_btn{
        width: 180px;
        height: 72px;
        border: none;
        background-color: #FF9843;
        border-radius: 30px;
        margin-left: 10px;
        color: white;
        font-size: 20px;
        font-weight: bold;
    }

    /* 본문 */
    .detail_content{
        width: 1200px;
        margin: 0 auto;
        font-size: 15px;
        /* border-bottom: 1px solid lightgray; */
    }

	.detail_content_p{
		width: 1200px;
	    padding-top: 20px;
	    padding-bottom: 20px;
	}

    /* 댓글 */
    .detail_reply_title{
        width: 1200px;
        margin: 0 auto;
        font-size: 17px;
        font-weight: bold;
        padding-top: 20px;
        padding-bottom: 20px;
        border-bottom: 1px solid lightgray;
        background-color: #ececec;
        padding-left: 20px;
        margin-bottom: 20px;
    }
        
    .comment_write{
    	width:1200px;
    }
    
    .commentContent{
    	width: 1090px;
    	height: 90px;
    	resize: none;
    	border: 1px solid lightgray;
    	border-radius: 10px;
    	padding: 10px;
    	outline: none;
    	float: left;
    	margin-right: 20px;
    }

    .comment_btn{
    	width:90px;
    	height: 90px;
    	text-align: center;
    	line-height: 85px;
    	float:left;
    	background-color: #FF9843;
    	color: #fff;
    	border-radius: 10px;
    	font-weight: bold;
    	border: none;
    }

    .detail_reply{
        width: 1200px;
        height: auto;
        margin: 0 auto;
    }
    
    .detail_reply_box{
    	width: 1200px;
    	height: 110px;
    	border-bottom: 1px solid lightgray;
    }

    .detail_reply_content{
        width: 1200px;
        height: auto;
        margin: 0 auto;
        overflow: auto;
        border-bottom: 1px solid lightgray;
    }

    .detail_reply_left{
        width: 1100px;
        padding-bottom: 10px;
        float: left;
    }

    .detail_reply_write{
        font-size: 17px;
        font-weight: bold;
        margin-bottom: 10px;
        margin-top: 15px;
    }

    .detail_reply_p{
        font-size: 15px;

    }

    .detail_reply_right{
        width: 100px;
        float: left;
    }

    .detail_reply_data{
        width: 90px;
        padding-top: 15px;
        font-weight: bold;
    }

    .detail_btn_box{
        margin-top: 30px;
    }

    .hdmy_detail_btn {
        display: inline-block;
        width: 80px;
        height: 50px;
        padding: 8px;
        font-size: 20px;
        font-weight: bold;
        border: none;
        border-radius: 15px;
        background-color: #FF9843;
        color: #ffffff;
        margin-right: 10px;
        cursor: pointer;
        line-height: 35px;
        text-decoration: none;
    }
    
    .hdmy_detail_btn:hover{
    	text-decoration: none;
    	color: #FFFFFF;
    }
    
</style>

</head>
<body>

<jsp:include page="../common/header.jsp"/>

    <div id="container">
        <div class="detail_top">
            <a>${companion.courseName}</a>/
            <a>동행 날짜 : ${companion.companionDate}</a>/
            <a>인원 : ${companion.companionNum} / ${companion.companionPeople}
            [<c:choose>
            	<c:when test="${companion.companionNum ge companion.companionPeople or companion.nowStatus == '마감'}">마감</c:when>
            	<c:otherwise>모집중</c:otherwise>
            </c:choose>]</a>
        </div>

        <div class="detail_courseImg">
            <img src="${companion.routeImg}" alt="" class="courseImg">
        </div>

        <div class="detail_box"> <!-- 제목, 작성자 신청버튼 전부 감싸는 div -->
            <div class="detail_box_left"> <!-- 제목, 작성자 감싸는 div -->
                <div class="detail_title"><span>${companion.companionTitle}</span></div>
                <div class="detail_info">
                    <div class="detail_info1">
                    	<a>작성자 : ${companion.userName} &nbsp;&nbsp;| &nbsp;&nbsp;조회수 : ${companion.count}</a>
                    </div>
                </div>
            </div>

            <div class="detail_box_right"> <!-- 버튼 감싸는 div -->
	            <c:choose>
	            	<c:when test="${companion.companionNum ge companion.companionPeople or companion.nowStatus == '마감'}">
	                	<div class="detail_right_btn">
	                		<button class="detail_btn" disabled style="background-color: grey;">마감</button>
	                	</div>
	            	</c:when>
	            	<c:otherwise>
		                <div class="detail_right_btn">
		                <c:choose>
		                	<c:when test="${empty loginUser}">
			                	<button class="detail_btn" onclick="noConnect();">신청하기</button>
		                	</c:when>
		                	
		                	<c:when test="${sessionScope.loginUser.userNo eq companion.userNo }">
			                	<button class="detail_btn" onclick="userNoAlert();">신청하기</button>
		                	</c:when>
		                	
		                	
		                	<c:otherwise>
			                	<button class="detail_btn" onclick="connect();">신청하기</button>
		                	</c:otherwise>
		                </c:choose>
		                </div>
	            	</c:otherwise>
	            </c:choose>
            </div>
        </div>

        <div class="detail_content">
            <div class="detail_content_p">${companion.companionContent}</div>
        </div>

        <div class="detail_reply_title">
            <div class="detail_reply_top"><a>댓글 [<span id="rcount"></span>]</a></div>
        </div>
        
        <div class="detail_reply_box">
			<div class="comment_write">
			<c:choose>
				<c:when test="${ empty loginUser }">
					<textarea class="commentContent" name="commentContent" style="color: #777;" readonly>로그인 후 작성 가능합니다.</textarea>
					<button class="comment_btn" onclick="addComment();" disabled>등록</button> 	
				</c:when>
				<c:otherwise>
					<textarea class="commentContent" name="commentContent"></textarea>
					<button class="comment_btn" onclick="addComment();">등록</button> 	
				</c:otherwise>
			</c:choose>
			</div>    
        </div>
        
         <!-- 댓글 박스 -->
        <div class="detail_reply">
        </div>

        <div class="detail_btn_box" align="center">
            <a class="hdmy_detail_btn detailBtn">목록</a>
            <c:if test="${sessionScope.loginUser.userNo == companion.userNo}">
            	<c:choose>
	            	<c:when test="${companion.companionNum ge companion.companionPeople or companion.nowStatus == '마감'}">
		            	<button class="hdmy_detail_btn" onclick="endAlert();">수정</button>
	            	</c:when>
	            	<c:otherwise>
		            	<a class="hdmy_detail_btn" onclick="postSubmit(0);">수정</a>
		            </c:otherwise>
	            </c:choose>
	            <a class="hdmy_detail_btn" onclick="postSubmit(1);">삭제</a>
            </c:if>
        </div>
        
        <form action="" id="postForm" method="post">
		    <input type="hidden" name="companionNo" value="${companion.companionNo}"/>
		</form>

    </div> <!-- 내용 박스 끝 -->

	<jsp:include page="../common/footer.jsp"/>

	<script>
	
	function noConnect(){
		alert('로그인이 필요한 서비스 입니다.');
		location.href='${path}/login';
	}
	
	// 목록, 수정, 삭제
	$(function(){
		$('.detailBtn').click(function(){
			location.href='${ path }/companion?page=1';
		});
	});
	
	function endAlert(){
		alert('마감 된 모집글은 수정이 불가능 합니다.')
	}
	
	function postSubmit(num){
		if(num == 0){
			$('#postForm').attr('action', 'updateForm.cmp').submit();
		}
		else{
	        let dele = confirm('삭제 하시겠습니까?');
	        if(dele){
	        	$('#postForm').attr('action', 'delete.cmp').submit();
	        }
			
		}
	}
	
	// 댓글
	function addComment(){
		$.ajax({
			url: 'reply',
			type: 'post',
			data: {
				companionNo : ${companion.companionNo},
				replyContent : $('.commentContent').val(),
				userNo: '${sessionScope.loginUser.userNo}',
				userName : '${sessionScope.loginUser.userName}'
			},
			success: function(result){
				console.log(result);
				
				if(result == 'success'){
					$('.commentContent').val('');
					selectComment();
				};
			}
		});
	}
	
	function selectComment(){
		$.ajax({
			url: 'reply',
			type: 'get',
			data : {companionNo : ${companion.companionNo}},
			success: function(result){
				let resultStr = '';
				for(let i in result){
					resultStr += '<div class="detail_reply_content">'
							   + '<div class="detail_reply_left">'
                    		   + '<div class="detail_reply_write"><a>🍊 ' + result[i].userName + '</a></div>'
                    		   + '<div class="detail_reply_p"><p>' + result[i].replyContent + '</p></div>'
                			   + '</div>'
                			   + '<div class="detail_reply_right">'
                			   + '<div class="detail_reply_data"><a>' + result[i].createDate + '</a></div>'
                			   + '</div></div>';
				}
				$('.detail_reply').html(resultStr);
				$('#rcount').text(result.length);

			}
		});
	};
	
	$(function(){
		selectComment();
	});
	
	</script>
	
	<script>
	// 신청 버튼
	function connect(){
		
		$.ajax({
			url : 'accompanyRequest',
			data : {
				userNo : ${sessionScope.loginUser.userNo},
				companionNo : ${companion.companionNo}
				},
			success : (data) => {
				alert(data);
			}
		})
	};
	
	function userNoAlert(){
		alert('본인의 신청글엔 신청이 불가능 합니다.');
	}
	
	</script>


</body>
</html>