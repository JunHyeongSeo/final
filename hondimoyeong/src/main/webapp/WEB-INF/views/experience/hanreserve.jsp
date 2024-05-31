<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery 라이브러리 -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   <!-- 부트스트랩에서 제공하고 있는 스타일 -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
   <!-- 부트스트랩에서 제공하고 있는 스크립트 -->
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
<style>
#table{
	width:1200px;
	height:800px;
	margin:auto;
}
</style>
    
</head>
<body>
	<jsp:include page ="../common/header.jsp" />
	
	<div class="table" id="table">
	
		<form method="post" action="hanlasanreserve">
	
        <table>
           <colgroup>
               <col style="width:25%;">
           </colgroup>
           <tbody>
           <tr>
               <th>탐방로 선택</th>
               <td>
                   <div class="form">                                    
                       <div class="select">                                        
                       <select name="courseSeq" id="courseSeq" onchange="course();" class="form-control">
                       		<option value="" selected="selected">선택</option>                                        
                        	<option value="성판악 코스">성판악 코스</option>
                        	<option value="관음사 코스">관음사 코스</option>
                       </select>
						<input id="course" type="hidden" name="experienceDivide" value=""><!-- 1 -->
                       </div>
                   </div>
               </td>
           </tr>
           <tr>
               <th>탐방날짜</th>
               <td>
                   <div class="form-group input_wrap_row">
						<input type="date" name="experienceDate" id="Date"><!-- 2 -->
                   </div>
               </td>
           </tr>
           <tr>
               <th>탐방 시작 시간</th>
               <td>
                <div class="visitTmArea select_wrap">
                 <select name="" id="visitTm" class="form-control" onchange="courseTime();">
                  <option value="">선택</option>
                  <option value="05:00 ~ 08:00">05:00 ~ 08:00</option>
                  <option value="8:01 ~ 10:00">8:01 ~ 10:00</option>
                  <option value="10:00~13:00">10:00~13:00</option>
                 </select>
                 <input id="time" type="hidden" name="experienceTime" value="종일(09:30 - 18:00)"><!-- 3 -->
                 <input type="hidden" name="price" id="price" value="0"><!-- 4 -->
                 
                </div>
               	 <div>(탐방 예약 시간이 지나면 예약부도 처리 됩니다)</div>
               </td>
           </tr>        
		<c:choose>
			<c:when test="${ empty sessionScope.loginUser}"><br>

			</c:when>
			<c:otherwise>
			<tr>
                 <th>예약자</th>
                 <td>${ sessionScope.loginUser.userName }</td>
            </tr>
		</c:otherwise>
		</c:choose>
           <tr>
               <th>탐방인원</th>
               <td>
                   <div class="form-group">
                       <div class="select_wrap">
                           <select onchange="people();" name="cmpaCnt" id="cmpaCnt" class="form-control">
                               <option value="1">1</option>
                               <option value="2">2</option>
                               <option value="3">3</option>
                               <option value="4">4</option>
                           </select>
                           <input type="hidden" id="person1-val" name="experiencePeople" value="1"><!-- 5 -->
                           
                       </div>
                       	명
                       <span id="current_num" class="visible-xs-block visible-sm-block visible-md-inline visible-lg-inline"></span>
                       <span id="num_info" class="text-blue visible-xs-block visible-sm-block visible-md-block visible-lg-inline"></span>
                   </div>
               </td>
           </tr>
           <tr>
               <th>주의사항</th>
               <td>
                   <ul class="bul">
                       <li>탐방 제한 페널티 제도를 적용하고 있습니다. 예약 후 취소 없이 탐방하지 않으면 1회 3개월, 2회 1년간 예약할 수 없습니다. 미리 탐방 시간 변경 및 탐방 예약취소를 하여 불이익을 당하지 않도록 하시기 바랍니다.</li>
                       <li>탐방 예약 시 제대로 마무리 안되면 예약 대기로 되며, 1일 후 자동 취소되오니 예약 완료 바랍니다.</li>
                       <li>정상 코스인 성판악 탐방로와 관음사 탐방로는 예약하셔야 하며, 그 외 코스는 예약 없이 탐방 가능합니다.</li>
                       <li>절기마다 입산 통제 시간이 있으며, 하산 시간도 있으니 참고하시기 바랍니다.<br> • 동 절 기 05:00~12:00 입산 가능(진달래밭 통제소, 삼각봉 대피소에서 12:00 탐방 통제), 정상 하산 13:30 하산 <br> • 춘추절기 05:00~12:30 입산 가능(진달래밭 통제소, 삼각봉 대피소에서 12:30 탐방 통제), 정상 하산 14:00 하산 <br> • 하 절 기 05:00~13:00 입산 가능(진달래밭 통제소, 삼각봉 대피소에서 13:00 탐방 통제), 정상 하산 14:30 하산 <br> ※ 동절기 11월~2월, 춘추절기 3~4월, 9~10월, 하절기 5~8월, <br> 2024년 7월 1일 탐방시간 전면 변경 한라산국립공원홈페이지 -&gt; 열림마당 -&gt; 공지사항에서 확인하시기 바랍니다.</li>
                       <li>탐방객의 성명, 생년월일, 연락처를 정확히 입력하시고, 추가 정보변경은 불가합니다.</li>
                       <li>탐방객 정보 중복입력시 관리자의 직권으로 예약이 취소될 수 있습니다.</li>
                       <li>탐방 시작 시간 이전 예약취소 가능</li>
                   </ul>
               </td>
           </tr>
           </tbody>
           
       </table>
		<input type="hidden" id="category" name="category" value="한라산"><!-- 6 -->
       
      <c:choose>
		<c:when test="${ empty sessionScope.loginUser}"><br>
			<h3>결제를 하기 위해선 로그인 해야 합니다. <a class="btn btn-outline-warning" href="login">로그인하러가기</a></h3>
		</c:when>
		<c:otherwise>
			<button onclick="btn();" type="submit"  id="btn1" class="btn btn-outline-warning">
				예약하기
		   </button>
		</c:otherwise>
	</c:choose>
	</form>
   </div>
	
	<script>
	var now_utc = Date.now() // 지금 날짜를 밀리초로
	// getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
	var timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
	// new Date(now_utc-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환
	var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
	document.getElementById("Date").setAttribute("min", today);
	
	function btn(){
		
		var dateString = $("#Date").val();
		
		course = $('#courseSeq').children('option:selected').text();
		$('#courseSeq').children('option:selected').text(course);
		
		time = $('#visitTm').children('option:selected').text();
		$('#visitTm').children('option:selected').text(time);
		
		people = $('#cmpaCnt').children('option:selected').text();
		$('#cmpaCnt').children('option:selected').text(people);
		
		$('#course').val(course);
		
		$('#time').val(time);
		
		$('#person1-val').val(people);
	}
		
	</script>

	<jsp:include page ="../common/footer.jsp" />

</body>
</html>