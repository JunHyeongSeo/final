<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 - ${review.reviewTitle}</title>

<style>
    /* content */
    #container{
        width: 1200px;
        height: auto;
        margin: 0 auto;
    }

    /* 상단 */
    .detail_top{
        width: 1200px;
        height: 100px;
        text-align: center;
        font-size: 35px;
        font-weight: bold;
        color: #292929;
    }

    .detail_top:hover{
        color: #FF9843;
        text-decoration: none;
    }

    .detail_course{
        width: 1200px;
        height: 100px;
        text-align: center;
        line-height: 95px;
        font-size: 25px;
        font-weight: bold;
        background-color: #ececec;
        margin-bottom: 30px;
        border-radius: 30px;
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
        display: block;
    }

    /* 제목 + 별점 상단 부분 */
    .detail_box{
        width: 1200px;
        height: 120px;
        margin: 0 auto;
        margin-top: 30px;
        border-bottom: 1px solid lightgray;
        /* border: 1px solid red; */
    }

    .detail_box_left{
        width: 950px;
        height: 100px;
        float: left;
        /* border: 1px solid green; */
    }

    .detail_box_right{
        width: 250px;
        height: 100px;
        float: left;
        padding-top: 10px;
        font-size: 30px;
        text-align: center;
        line-height: 65px;
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
        border-radius: 10px;
        margin-left: 10px;
        color: white;
        font-size: 20px;
        font-weight: bold;
    }
    
    .detail_right_star{
    	color: #FF9843;
    	text-align: right;
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
	    white-space:pre-line;
	}

    .content_img{
        width: 1200px;
        height: auto;
        margin-bottom: 20px;
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
    
    /* 별점*/
	#myform fieldset{
	    display: inline-block;
	    direction: rtl;
	    border:0;
	}
	#myform fieldset legend{
	    text-align: right;
	}
	#myform input[type=radio]{
	    display: none;
	}
	#myform label{
	    font-size: 26px;
	    color: transparent;
	    text-shadow: 0 0 0 #f0f0f0;
	}
	#myform label:hover{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	#myform label:hover ~ label{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	#myform input[type=radio]:checked ~ label{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}


</style>
</head>
<body>

<jsp:include page="../common/header.jsp"/>

    <div id="container">
        <div class="detail_top"><a class="detail_top" href="review">리뷰 게시판</a></div>

        <div class="detail_course">${review.courseName}</div>

        <div class="detail_courseImg">
            <img src="${review.routeImg}" alt="" class="courseImg">
        </div>
        
        <div class="detail_box"> <!-- 제목, 작성자 신청버튼 전부 감싸는 div -->
            <div class="detail_box_left"> <!-- 제목, 작성자 감싸는 div -->
                <div class="detail_title"><span>${review.reviewTitle}</span></div>
                <div class="detail_info">
                    <div class="detail_info1"><a>작성자 : ${review.userName} &nbsp;&nbsp;| &nbsp;&nbsp;조회수 : ${review.count}</a></div>
                </div>
            </div>

            <div class="detail_box_right"> <!-- 버튼 감싸는 div -->
                <div class="detail_right_star">
                ${review.reviewStar}
                </div>
            </div>
        </div>

        <div class="detail_content">
            <div class="detail_content_p">${review.reviewContent}</div>
            <c:if test="${!empty review.reviewImgs}">
		        <c:forEach var="img" items="${review.reviewImgs}">
		            <img src="${img.changeName}" class="content_img"/>
				</c:forEach>
			</c:if>
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
            <div class="hdmy_detail_btn detailBtn">목록</div>
            <c:if test="${sessionScope.loginUser.userNo == review.userNo}">
	            <a class="hdmy_detail_btn" onclick="postSubmit(0);">수정</a>
	            <a class="hdmy_detail_btn" onclick="postSubmit(1);">삭제</a>
            </c:if>
        </div>
        
        <form action="" id="postForm" method="post">
		    <input type="hidden" name="reviewNo" value="${review.reviewNo}"/>
		</form>
        
    </div>

	<jsp:include page="../common/footer.jsp"/>
	
	<script>
		var userRating = '${review.reviewStar}';
		var starContainer = document.querySelector('.detail_right_star');
		var starsHTML = '';
		for (var i = 0; i < userRating; i++) {
		    starsHTML += '★ ';
		}
		starContainer.innerHTML = starsHTML;
	
		function addComment(){
				$.ajax({
					url: 'comment',
					type: 'post',
					data: {
						reviewNo : ${review.reviewNo},
						commentContent : $('.commentContent').val(),
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
				url: 'comment',
				type: 'get',
				data : {reviewNo : ${review.reviewNo}},
				success: function(result){
					let resultStr = '';
					for(let i in result){
						resultStr += '<div class="detail_reply_content">'
								   + '<div class="detail_reply_left">'
	                    		   + '<div class="detail_reply_write"><a>🍊 ' + result[i].userName + '</a></div>'
	                    		   + '<div class="detail_reply_p"><p>' + result[i].commentContent + '</p></div>'
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
		
		
		
		$(function(){
			$('.detailBtn').click(function(){
				location.href='${ path }/review?page=1';
			});
		});
		
		
		function postSubmit(num){
			if(num == 0){
				$('#postForm').attr('action', 'updateForm.rvw').submit();
			}
			else{
		        let dele = confirm('삭제 하시겠습니까?');
		        if(dele){
		            $('#postForm').attr('action', 'delete.rvw').submit();
		        }
			}
		}
		
	</script>
	
	
	
	
	
	
	
	

</body>
</html>