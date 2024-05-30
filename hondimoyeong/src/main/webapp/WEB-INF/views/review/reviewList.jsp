<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>혼디모영 - 리뷰</title>

<style>
    /* content */
    #container{
        width: 1200px;
        height: auto;
        margin: 0 auto;
    }
	
    .review_title{
        width: 1200px;
        text-align: center;
        margin-bottom: 40px;
    }

    .review_title_a{
        font-size: 35px;
        font-weight: bold;
        color: #272727;
    }

    .review_title_a:hover{
        color: #FF9843;
        text-decoration: none;
    }
    
    .review_search{
        width: 1200px;
        margin-bottom: 30px;
    }

    .review_searchForm{
        width: 620px;
        margin: 0 auto;
    }

    .review_search_select{
        width: 100px;
        height: 45px;
        text-align: center;
        border: 1px solid #afafaf;
        margin: 0 auto;
        font-size: 15px;
        border-radius: 20px;
    }

    .review_search_input{
        width: 400px;
        height: 45px;
        border: 1px solid #afafaf;
        margin-left: 10px;
        padding-left: 10px;
        border-radius: 20px;
        font-size: 15px;
    }

    .review_search_btn{
        width: 80px;
        height: 45px;
        border: none;
        background-color: #FF9843;
        border-radius: 20px;
        margin-left: 10px;
        color: white;
        font-size: 15px;
        font-weight: bold;
    }

    /* 글쓰기 버튼 */
    .cs_board_top{
        width: 1140px;
        height: 52px;
        margin: 0 auto;
        margin-bottom: 10px;
    }

    .cs_board_top_btn{
        width: 100px;
        float: right;
    }

    .cs_btn{
        width: 80px;
        height: 45px;
        border: none;
        background-color: #FF9843;
        border-radius: 20px;
        margin-left: 10px;
        color: white;
        font-size: 15px;
        font-weight: bold;
        margin-bottom: 15px;
    }

	.list-area {
	    display: flex;
	    flex-wrap: wrap;
	    justify-content: center;
	}
	
	.review_box {
	    border: 1px solid lightgray;
	    border-radius: 20px;
	    width: 340px;
	    height: 500px;
	    margin: 25px;
	    display: flex;
	    flex-direction: column;
	    align-items: center;
	    justify-content: space-between;
	}
	
	.thumbNail {
	    width: 280px;
	    height: 180px;
	    border-radius: 20px;
	    border: 1px solid #e1e1e1;
	}
	
	.thumbNail:hover{
		cursor: pointer;
	    opacity: 0.8;
	}
	
	.img_box, .box_title, .box_info {
	    width: 340px;
	}
	
	.box_title{
	    font-size: 18px;
	    font-weight: bold;
	    border-bottom: 1px solid #e1e1e1;
	    padding: 15px 15px;
	}
	
	.box_title:hover{
		color: #FF9843;
	}
	
	.box_info {
		padding-top: 10px;
	    padding-left: 20px;
	    padding-bottom: 15px;
	}
	
	.review_box:hover {
	    cursor: pointer;
	    opacity: 0.9;
	}
	
	.eventTitle {
	    width: 340px;
	    margin: 0 auto;
	    font-size: 17px;
	    font-weight: bold;
	    color: #272727;
	    text-align: center;
	    padding-top: 15px;
	    padding-bottom: 15px;
	    border-bottom: 1px solid lightgray;
	}
	
	.eventTitle:hover {
	    text-decoration: none;
	    color: #FF9843;
	}
	
	.box_course {
	    width: 300px;
	    font-size: 20px;
	    font-weight: bold;
	    padding-top: 15px;
	    padding-bottom: 15px;
	    border-bottom: 1px solid lightgray;
	}
	
	.box_star {
	    font-size: 25px;
	    padding: 10px 0px;
	    color: #FF9843;
	}
	
	.box_write, .box_count, .box_comment, .box_date {
	    width: 150px;
	    display: block;
	    text-align: center;
	    padding: 10px;
	    float: left;
	}

	    /* 페이징바 */
    .hdmy-board_page{
    	width: 1200px;
    }
    
     .pagination {
     	width:fit-content;
     	margin: 0 auto;
     	margin-top: 40px;
     	margin-bottom: 40px;
     }
     
     .page-item.active .page-link {
     	background-color: #FF9843 !important;
     	border: 1px solid #FF9843 !important;
     	color: #FFFFFF !important;
     	font-weight: bold;
     	border-radius: 10px;
     }
     
     .page-link {
     	color: #292929 !important;
     	font-weight: bold;
     	border-radius: 10px;
     	margin-right: 10px;
     }
     
     .page-item:last-child .page-link, .page-item:first-child .page-link {
     	border-radius: 10px !important;
     }
     
	
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
    <div id="container">
        <div class="review_title"><a class="review_title_a" href="review">리뷰 게시판</a></div>
        <div class="review_search">
            <form action="search.rvw" class="review_searchForm">
                <select name="condition" class="review_search_select">
                    <option value="title">제목</option>
                    <option value="course">코스</option>
                </select>
                <input type="text" name="keyword" value="${requestScope.keyword}" class="review_search_input" placeholder="검색어를 입력해 주세요.">
                <button type="submit" class="review_search_btn">검색</button>
            </form>
        </div>
        <c:if test="${ not empty condition }">
        	<script>
        		$(function(){
        			$('.review_search option[value=${condition}]').attr('selected', true);
        		})
        	</script>
        </c:if>

        <c:if test="${!empty loginUser}">
	        <div class="cs_board_top">
	            <div class="cs_board_top_btn"><button class="cs_btn" onclick="insertReview();">리뷰 등록</button></div>
	        </div>
        </c:if>
        
        <div class="list-area">
	        <c:choose>
		      	<c:when test="${empty review }">
		      		<thead>
		      			<tr>
		      				<th style="text-align:center; "><b>검색 결과가 없습니다.</b></th>
		      			</tr>
		      		</thead>
		      	</c:when>
		      	<c:otherwise>
		        	<c:forEach var="r" items="${review}">
			            <div class="review_box" align="center">
			                <input type="hidden" value="${r.reviewNo}" />
			                <div class="box_course">${r.courseName}</div>
			                <div class="box_star" data-rating="${r.reviewStar}">${r.reviewStar}</div>
			                <c:choose>
			                	<c:when test="${empty r.changeName}">
					                <div class="img_box"><img src="${path}/resources/reviewFile/defaultImg.png" class="thumbNail"/></div>
			                	</c:when>
			                	<c:otherwise>
					                <div class="img_box"><img src="${r.changeName}" class="thumbNail"/></div>
			                	</c:otherwise>
			                </c:choose>
			                <div class="box_title">${r.reviewTitle}</div>
			                <div class="box_info">
			                    <div class="box_write"><a>작성자 : ${r.userName}</a></div>
			                    <div class="box_count"><a>조회수 : ${r.count}</a></div>
			                    <div class="box_comment"><a>댓글 : ${r.commentCount}개</a></div>
			                    <div class="box_date"><a>24.05.23</a></div>
			                </div>
			            </div>
		        	</c:forEach>
		        </c:otherwise>
	        </c:choose>
			<div class="hdmy-board_page" id="pagination">
				<ul class="pagination">
					<c:choose>
						<c:when test="${ not empty condition }">
							<c:forEach begin="${searchPage.startPage}" end="${searchPage.endPage}" var="p">
			                    <c:choose>
			                        <c:when test="${p eq searchPage.currentPage}">
			                            <li class="page-item active"><a class="page-link" href="search.rvw?page=${p}&condition=${condition}&keyword=${keyword}">${p}</a></li>
			                        </c:when>
			                        <c:otherwise>
			                            <li class="page-item"><a class="page-link" href="search.rvw?page=${p}&condition=${condition}&keyword=${keyword}">${p}</a></li>
			                        </c:otherwise>
			                    </c:choose>
			            	</c:forEach>
					    </c:when>
					    <c:otherwise>
					        <c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" var="p">
					            <c:choose>
					                <c:when test="${p eq pageInfo.currentPage}">
					                    <li class="page-item active"><a class="page-link" href="review?page=${p}">${p}</a></li>
					                </c:when>
					                <c:otherwise>
					                    <li class="page-item"><a class="page-link" href="review?page=${p}">${p}</a></li>
					                </c:otherwise>
					            </c:choose>
					        </c:forEach>
					    </c:otherwise>
					</c:choose>
				</ul>
	        </div>
        </div>
    </div> <!-- container-->
	
	<jsp:include page="../common/footer.jsp"/>

	<script>
		function insertReview(){
			location.href = '${ path }/insertForm.rvw';
		}
		// 별점
		document.addEventListener("DOMContentLoaded", function () {
		    var starContainers = document.querySelectorAll('.box_star');
		    starContainers.forEach(function (container) {
		        var rating = container.getAttribute('data-rating');
		        var starsHTML = '';
		        for (var i = 0; i < rating; i++) {
		            starsHTML += '★';
		        }
		        container.innerHTML = starsHTML;
		    });
		});
	    
		// 상세보기
		$(() => {
			    $('.review_box').click(function() {
			        const reviewNo = $(this).find('input[type="hidden"]').val();
			        location.href = '${path}/detail.rvw?reviewNo=' + reviewNo;
			    })
			})
				

	</script>


</body>
</html>