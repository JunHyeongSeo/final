<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>혼디모영 - 리뷰 작성</title>

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
	
	.title_inp, .date_inp, .course_inp, .people_inp, .content_inp{
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
	    padding-left: 10px;
	}
	
	.people_info:hover{
		text-decoration: none;
		color: #292929;
	}
	
	.content_inp{
	    width: 650px;
	    height: 400px;
	    resize: none;
	}
	
	.file_label{
		font-size: 15px;
		color: #777;
		float: right;
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
	
	/* 별점 */
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
	    font-size: 3em;
	    color: transparent;
	    text-shadow: 0 0 0 #cfcfcf;
	}
	#myform label:hover{
	    text-shadow: 0 0 0 #FF9843;
	}
	#myform label:hover ~ label{
	    text-shadow: 0 0 0 #FF9843;
	}
	#myform input[type=radio]:checked ~ label{
	    text-shadow: 0 0 0 #FF9843;
	}
	#reviewContents {
	    width: 100%;
	    height: 150px;
	    padding: 10px;
	    box-sizing: border-box;
	    border: solid 1.5px #D3D3D3;
	    border-radius: 5px;
	    font-size: 16px;
	    resize: none;
	}

   </style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
	<c:choose>
		<c:when test="${empty loginUser}">
			<script>
				alert('회원만 작성 가능합니다.');
				location.href = '${ path }/review';
			</script>
		</c:when>
		<c:otherwise>
		    <div id="container">
		        <div class="notice_insert_title"><span>리뷰 작성</span></div>
		
		        <div class="insert_box">
		            <form action="insert.rvw" method="post" id="myform" enctype="multipart/form-data">
		            	<input type="hidden" name="userNo" value="${ sessionScope.loginUser.userNo }"/>
		            	
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
		                            </td>
								</tr>
								
		                        <tr>
		                            <th>* 별점</th>
		                            <td>
		                                <fieldset>
		                                    <input type="radio" name="reviewStar" value="5" id="rate1"><label
		                                        for="rate1">★</label>
		                                    <input type="radio" name="reviewStar" value="4" id="rate2"><label
		                                        for="rate2">★</label>
		                                    <input type="radio" name="reviewStar" value="3" id="rate3"><label
		                                        for="rate3">★</label>
		                                    <input type="radio" name="reviewStar" value="2" id="rate4"><label
		                                        for="rate4">★</label>
		                                    <input type="radio" name="reviewStar" value="1" id="rate5"><label
		                                        for="rate5">★</label>
		                                </fieldset>
		                            </td>
		                        </tr>
		                        
		                        <tr>
									<th>* 제목</th>
									<td><input type="text" name="reviewTitle" class="title_inp" required/></td>
								</tr>
								<tr>
									<th>* 내용</th>
									<td><textarea class="content_inp" name="reviewContent" required></textarea>
		                            </td>
								</tr>
		                        <tr>
									<th>* 첨부  파일</th>
									<td>
										<input type="file" name="upfiles1" id="upfiles1" style="padding-right: 35px;"> <span class="file_label">* 썸네일로 등록 되는 이미지 입니다.</span>
		                            </td>
								</tr>
		                        <tr>
									<th>* 첨부파일</th>
									<td>
										<input type="file" name="upfiles2" id="upfiles2">
		                            </td>
								</tr>
							</tbody>
						</table>
		                <div class="detail_btn_box" align="center">
		                    <button class="hdmy_detail_btn" type="submit">등록</button>
		                    <button class="hdmy_detail_btn" type="button" onclick="backPage();">취소</button>
		                </div>
		            </form>
		        </div> <!-- inset_box -->
		    </div>
		</c:otherwise>
	</c:choose>
	<jsp:include page="../common/footer.jsp"/>
	
    <script>
    	 function backPage(){
    		 location.href = '${path}/review';
    	 }
    	 
   	    document.getElementById('myform').addEventListener('submit', function(event) {
   	        var radios = document.getElementsByName('reviewStar');
   	        var checked = false;
   	        for (var i = 0; i < radios.length; i++) {
   	            if (radios[i].checked) {
   	                checked = true;
   	                break;
   	            }
   	        }
   	        if (!checked) {
   	            event.preventDefault();
   	            alert('별점을 선택해주세요.');
   	        }
   	    });
    </script>

</body>
</html>