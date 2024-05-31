<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>혼디모영 - 글 수정</title>

<script type="text/javascript" src="/hondimoyeong/resources/static/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<!-- 필수 JS/CSS { -->
<link type="text/css" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />
<!-- } -->
</head>


<style>
	/* 컨텐트 */
	#container{
	    width: 1200px;
	    height: auto;
	    margin: 0 auto;
	}
	
	.notice_insert_title{
	    width: 1200px;
	    height: 100px;
	    font-size: 35px;
	    font-weight: bold;
	    text-align: center;
	}
	
	.insert_box{
	    width: 800px;
	    margin: 0 auto;
	}
	
	.tb_input {
	    width: 800px;
	    border-top: solid 2px #FF9843;
	    margin-top: 10px;
	}
	
	.tb_input th {
	    width: 150px;
	    background-color: #f3f3f3;
	}
	
	.tb_input th, .tb_input td {
	    border-bottom: solid 1px #ddd;
	    padding: 10px 20px;
	    text-align: left;
	    vertical-align: middle;
	    font-size: 14px;
	}
	
	.title_inp{
	    width: 650px;
	    font-size: 15px;
	}
	
	.title_inp, .date_inp, .course_inp, .people_inp, .companionContent{
		height: 40px;
		border: 1px solid #b1b1b1;
		outline:none;
		border-radius: 10px;
		font-size: 15px;
		color: #292929;
		padding: 10px;
		
	}
	
	.date_inp, .course_inp, .people_inp{
	    width: 150px;
	    font-size: 15px;
	}

	.people_info{
	    color: #292929;
	    text-decoration: none;
	    line-height: 0px;
	    padding-left: 10px;
	}
	
	.people_info:hover{
	    color: #292929;
	    text-decoration: none;
	    line-height: 0px;
	}
	
	.companionContent{
	    width: 648px;
	    height: 400px;
	    resize: none;
	}
	
	/* 등록 취소 버튼 */
	.detail_btn_box{
	    width: 800px;
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
	}
	
</style>
<body>

	<jsp:include page="../common/header.jsp"/>
	<c:choose>
		<c:when test="${sessionScope.loginUser.userNo == companion.userNo}">
	
    <div id="container">
        <div class="notice_insert_title"><span>혼디모영!</span></div>

        <div class="insert_box">
            <form action="update.cmp" method="post">
            	<input type="hidden" name="companionNo" value="${ companion.companionNo }"/>
				<table class="tb_input">
					<tbody>
                        <tr>
							<th>* 코스</th>
							<td>
							
                                <select name="courseNo" class="course_inp">
                                <c:forEach var="c" items="${ courseList }">
                                	<option value="${ c.courseIndex }">
                                		${ c.courseNo }
                                	</option>
                                </c:forEach>
                                </select>
                                
                                    <script>
	                                    $(function(){
	                                        $('select[name="courseNo"]').val("${companion.courseNo}");
	                                    });
								    </script>
                            </td>
						</tr>
						<tr>
							<th>* 동행 날짜</th>
							<td>
								<input type="text" name="companionDate" class="datepicker date_inp" value="${companion.companionDate }"/>
								<jsp:include page="datepicker.jsp"></jsp:include>
							</td>
						</tr>
                        <tr>
							<th>* 모집 인원</th>
							<td>
								<input type="number" min="1" max="10" name="companionPeople" class="people_inp" value="${companion.companionPeople}"required/>
		                        <a class="people_info">* 최소 1명, 최대 10명 선택해 주세요. (본인 포함 총 인원수 선택)</a>
                            </td>
						</tr>
                        <tr>
							<th>* 제목</th>
							<td>
								<input type="text" name="companionTitle" class="title_inp" value="${companion.companionTitle}" required/>
							</td>
						</tr>
						<tr>
							<th>* 내용</th>
							<td>
								<textarea class="companionContent" name="companionContent" id="companionContent">${companion.companionContent}</textarea>
							</td>
						</tr>
					</tbody>
				</table>
                <div class="detail_btn_box" align="center">
                    <button class="hdmy_detail_btn" type="submit" id="companionContent" onclick="submitPost();">등록</button>
                    <button class="hdmy_detail_btn" type="button" onclick="backPage();">취소</button>
                </div>
            </form>
        </div> <!-- inset_box -->
    </div>
    	</c:when>
    	<c:otherwise>
    	<script>
			alert('작성자만 수정 가능합니다.');
			location.href = '${ path }/companion?page=1';
    	</script>
    	</c:otherwise>
	</c:choose>
    <jsp:include page="../common/footer.jsp"/>
    
    <script>
    	function backPage(){
    		location.href = '${path}/companion'
    	}
    </script>
    
        
    <script type="text/javascript">
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
		 oAppRef: oEditors,
		 elPlaceHolder: "companionContent",
		 sSkinURI: "/hondimoyeong/resources/static/smarteditor/SmartEditor2Skin.html",
		 fCreator: "createSEditor2"
		});
		
   	 
	   	 submitPost = function(){
	   		 oEditors.getById["companionContent"].exec("UPDATE_CONTENTS_FIELD", [])
	   		 let content = document.getElementById("companionContent").value
	   		 
	   		 if(content == ''){
	   			 alert("내용 입력")
	   			 oEditors.getById["companionContent"].exec("FOCUS")
	   			 return
	   		 } else {
	   			 console.log(content)
	   		 }
	   	 }
	</script>

</body>
</html>