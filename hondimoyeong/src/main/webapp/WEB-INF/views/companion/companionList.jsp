<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>혼디모영!</title>
<style>
    /* content */
    #container{
        width: 1200px;
        height: auto;
        margin: 0 auto;
    }

    .hdmy_title{
        width: 1200px;
        text-align: center;
        margin-bottom: 40px;
    }

    .hdmy_title_a{
        font-size: 35px;
        font-weight: bold;
        color: #272727;
        cursor: pointer;
    }

    .hdmy_title_a:hover{
        color: #FF9843;
        text-decoration: none;
    }

    .hdmy_search{
        width: 1200px;
        margin-bottom: 30px;
    }

    .hdmy_searchForm{
        width: 620px;
        margin: 0 auto;
    }

    .hdmy_search_select{
        width: 100px;
        height: 45px;
        text-align: center;
        border: 1px solid #afafaf;
        margin: 0 auto;
        font-size: 15px;
        border-radius: 20px;
    }

    .hdmy_search_input{
        width: 400px;
        height: 45px;
        border: 1px solid #afafaf;
        margin-left: 10px;
        padding-left: 10px;
        border-radius: 20px;
        font-size: 15px;
    }

    .hdmy_search_btn{
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
    
    .hdmy-board_top{
        width: 1200px;
        height: 42px;
        margin: 0 auto;
        margin-bottom: 10px;
    }

    .hdmy-board_top-align{
        width: 800px;
        height: 42px;
        float: left;
        line-height: 37px;
        padding-left: 10px;
    }

    .hdmy-board_top-align a{
        font-size: 15px;
        text-decoration: none;
    }
    
    .sortCompanionList, .sortCompanion{
        font-weight: bold;
    }
    
    .sortCompanionList:hover, .sortCompanion:hover{
        color: #FF9843;
    }

    .hdmy-board_top-align a:hover{
        text-decoration: none;
    }
    
    .sortCompanionInfo{
    	color: #777777;
    	margin-left : 10px;
    }
    
    .sortCompanionInfo:hover{
    	color: #777777;
    }
    
    .sortCompanionList{
    	color: #272727;
    }
    
    .sortCompanion{
    	color: #272727;
    }

    .hdmy-board_top-btn{
        width: 100px;
        float: right;
    }

    .hdmy-btn{
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

    .hdmy-board_content{
        width: 1200px;
        margin: 0 auto;
    }

    .hdmy-board_page{
        width: 1200px;
        margin: 0 auto;
    }

    .btn-outline-secondary{
        width: 40px;
        height: 40px;
        border: none;
        background-color: #ffebdb;
        color: #272727;
        border-radius: 10px;
    }

    .btn-outline-secondary:hover{
        background-color: #FF9843;
    }

    .table-hover tbody {
        border-bottom: 1px solid lightgray;
    }

    .table-hover tbody tr:hover {
        background-color: #f5f5f5;
    }

    .table-hover thead th{
        padding-top: 20px;
        padding-bottom: 20px;
    }

    .table-hover tbody tr{
        line-height: 30px;
    }

    .hdmy-table_small{
        width: 90px;
        text-align: center;
    }

    .hdmy-table_status{
        width: 90px;
        text-align: center;
        font-weight: bold;
    }

    .hdmy-table_mid{
        width: 120px;
        text-align: center;
    }
    
    .commentCount{
    	color: #FF9843;
    	font-weight: bold;
    }
    
    .commentCount:hover{
    	text-decoration: none;
    	color: #FF9843;
    	font-weight: bold;
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

    <div id="container">  <!-- 전체 박스 -->
        <div class="hdmy_title"><a class="hdmy_title_a" href="companion">혼디모영 🍊 </a></div>

        <div class="hdmy_search">
            <form action="search.cmp" method="get" class="hdmy_searchForm">
                <select name="condition" class="hdmy_search_select">
                    <option value="title">제목</option>
                    <option value="course">코스</option>
                </select>
                <input type="text" name="keyword" value="${requestScope.keyword}" class="hdmy_search_input" placeholder="검색어를 입력해 주세요.">
                <button type="submit" class="hdmy_search_btn">검색</button>
            </form>
        </div>
        
        <c:if test="${ not empty condition }">
        	<script>
        		$(function(){
        			$('.hdmy_search option[value=${condition}]').attr('selected', true);
        		})
        	</script>
        </c:if>

        <div class="hdmy-board">
            <div class="hdmy-board_top">
                <div class="hdmy-board_top-align">
                	<a class="sortCompanionList" href="companion">전체</a> | 
					<a class="sortCompanion" href="sort.cmp">모집중</a> 
					<a class="sortCompanionInfo"> (* 기본 날짜순 정렬) </a>
                </div>
                
                <c:if test="${ !empty loginUser }">
                	<div class="hdmy-board_top-btn"><button class="hdmy-btn" onclick="insertCompanion();">글쓰기</button></div>
                </c:if>
            </div>

            <div class="hdmy-board_content">
            
            	<!-- 모집중 -->
           	    <table class="companions"> 
			        <thead></thead>
			        <tbody></tbody>
			    </table>
			    
			    <!-- 날짜순 -->
           	    <table class="companions"> 
			        <thead></thead>
			        <tbody></tbody>
			    </table>
            
            
				<!-- 전체 목록 -->
                <table class="table table-hover">
                    
                    <c:choose>
                    	<c:when test="${empty companion }">
                    		<thead>
                    			<tr>
                    				<th style="text-align:center;">검색 결과가 없습니다.</th>
                    			</tr>
                    		
                    		</thead>
                    	</c:when>
                    	<c:otherwise>
		                    <thead>
		                        <tr>
		                            <th class="hdmy-table_mid">동행 날짜</th>
		                            <th class="hdmy-table_small">코스</th>
		                            <th>제목</th>
		                            <th class="hdmy-table_small">작성자</th>
		                            <th class="hdmy-table_small">인원</th>
		                            <th class="hdmy-table_small">상태</th>
		                            <th class="hdmy-table_small">조회수</th>
		                        </tr>
		                    </thead>
		                    <tbody>
	                    	<c:forEach var="companion" items="${ companion }">
		                        <tr class="list">
			    					<td style="display:none">${ companion.companionNo }</td>
		                            <td class="hdmy-table_mid" id="companionDate">${ companion.companionDate }</td>
		                            <td class="hdmy-table_small">${ companion.courseName }</td>
		                            <c:choose>
		                            	<c:when test="${ companion.replyCount == 0 }">
		                            		<td>${companion.companionTitle}</td>
		                            	</c:when>
		                            	<c:otherwise>
				                            <td>${ companion.companionTitle} <a class="commentCount">[${companion.replyCount}]</a><a id="test"></a></td>
		                            	</c:otherwise>
		                            </c:choose>
		                            <td class="hdmy-table_small">${companion.userName}</td>
		                            <td class="hdmy-table_small">${companion.companionNum} / ${companion.companionPeople}</td>
		                            <c:choose>
		                            	<c:when test="${companion.companionNum ge companion.companionPeople or companion.nowStatus == '마감'}">
		                            		<td class="hdmy-table_status" style="color: #292929;">마감</td>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<td class="hdmy-table_status" style="color: #FF9843;">모집 중</td>
		                            	</c:otherwise>
		                            </c:choose>
		                            <td class="hdmy-table_small">${ companion.count}</td>
		                        </tr>
	                        </c:forEach>
                    	</c:otherwise>
                    </c:choose>
                    </tbody>
                </table>
            </div>
        </div> <!-- hdmy-board -->
        
        <div class="hdmy-board_page" id="pagination"> <!-- 페이징바-->
			<ul class="pagination">
				<c:choose>
				    <c:when test="${not empty pageInfo.endPage}">
				        <c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" var="p">
				            <c:choose>
				                <c:when test="${p eq pageInfo.currentPage}">
				                    <li class="page-item active"><a class="page-link" href="companion?page=${p}">${p}</a></li>
				                </c:when>
				                <c:otherwise>
				                    <li class="page-item"><a class="page-link" href="companion?page=${p}">${p}</a></li>
				                </c:otherwise>
				            </c:choose>
				        </c:forEach>
				    </c:when>
				    
		            <c:when test="${not empty condition}">
		                <c:forEach begin="${searchPage.startPage}" end="${searchPage.endPage}" var="p">
		                    <c:choose>
		                        <c:when test="${p eq searchPage.currentPage}">
		                            <li class="page-item active"><a class="page-link" href="search.cmp?page=${p}&condition=${condition}&keyword=${keyword}">${p}</a></li>
		                        </c:when>
		                        <c:otherwise>
		                            <li class="page-item"><a class="page-link" href="search.cmp?page=${p}&condition=${condition}&keyword=${keyword}">${p}</a></li>
		                        </c:otherwise>
		                    </c:choose>
		                </c:forEach>
		            </c:when>
				            
				    <c:otherwise>
				        <c:forEach begin="${sortPage.startPage}" end="${sortPage.endPage}" var="p">
				            <c:choose>
				                <c:when test="${p eq sortPage.currentPage}">
				                    <li class="page-item active"><a class="page-link" href="sort.cmp?page=${p}">${p}</a></li>
				                </c:when>
				                <c:otherwise>
				                    <li class="page-item"><a class="page-link" href="sort.cmp?page=${p}">${p}</a></li>
				                </c:otherwise>
				            </c:choose>
				        </c:forEach>
				    </c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
	

	<jsp:include page="../common/footer.jsp"/>
	

	
	
	<script>
    	$(function(){
    		$('.table-hover > tbody > tr').click(function(){
    			location.href = 'detail.cmp?companionNo='+$(this).children().eq(0).text();
    		});
    	});
    	
		function insertCompanion(){
			location.href = '${ path }/enrollForm.cmp';
		}
		
		$(function(){
		    $(document).on('click', '.sortCompanion', function(){
		        $.ajax({
		            url: 'companions',
		            type: 'get',
		            success: function(result){
		                $('.table-hover tbody').empty();
		                
		                let value = '';
		                
		                for(let i in result){
		                    value += '<tr>'
		                           + '<td class="hdmy-table_mid">' + result[i].companionDate +'</td>'
		                           + '<td class="hdmy-table_small">' + result[i].courseName +'</td>'
		                           + '<td>' + result[i].companionTitle +'</td>'
		                           + '<td class="hdmy-table_small">' + result[i].userName +'</td>'
		                           + '<td class="hdmy-table_small">' + result[i].companionNum + '/' + result[i].companionPeople + '</td>'
		                           + '<td class="hdmy-table_status" style="color: #FF9843"> 모집중 </td>'
		                           + '</tr>';
		                }
		                $('.table-hover tbody').append(value);
		                $('.companions').show();
		            }
		        });
		    });
		});
	
		$(document).ready(function() {
		    var currentUrl = window.location.href;

		    if (currentUrl.indexOf("/companion") !== -1) {
		        $(".sortCompanionList").css("color", "#FF9843");
		    }

		    if (currentUrl.indexOf("/sort.cmp") !== -1) {
		        $(".sortCompanion").css("color", "#FF9843");
		    }
		    
		    if (currentUrl.indexOf("/search.cmp") !== -1) {
		        $(".sortCompanionList").css("color", "#FF9843");
		    }
		});

	</script>


</body>
</html>