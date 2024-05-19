<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
</head>
<body>

	<jsp:include page="../common/header.jsp"/>

    <div id="container">
        <div class="notice_insert_title"><span>혼디모영!</span></div>

        <div class="insert_box">
            <form action="insert.cmp" method="post">
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
							<th>* 동행 날짜</th>
							<td>
								<input type="text" name="companionDate" class="datepicker date_inp" placeholder="날짜 선택" required/>
								<jsp:include page="datepicker.jsp"></jsp:include>
							</td>
						</tr>
                        <tr>
							<th>* 모집 인원</th>
							<td><input type="number" min="1" max="10" name="companionPeople" class="people_inp" required/>
                                <a class="people_info">* 최소 1명, 최대 10명 선택해 주세요.</a></td>
						</tr>
                        <tr>
							<th>* 제목</th>
							<td><input type="text" name="companionTitle" class="title_inp" required/></td>
						</tr>
						<tr>
							<th>* 내용</th>
							<td><textarea class="content_inp" name="companionContent">${courseList }</textarea></td>
						</tr>
					</tbody>
				</table>
                <div class="detail_btn_box" align="center">
                    <button class="hdmy_detail_btn">등록</button>
                    <button class="hdmy_detail_btn" type="submit">취소</button>
                </div>
            </form>
        </div> <!-- inset_box -->
    </div>
    
    <jsp:include page="../common/footer.jsp"/>
    

</body>
</html>