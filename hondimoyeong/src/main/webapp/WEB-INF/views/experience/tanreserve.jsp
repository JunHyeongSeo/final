<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
 #reserve{
 		text-align: center;
    	padding-top : 20px;
    	padding-left : 15px;
        width: 1200px;
        height: 800px;
        margin: auto;
    }

    #a{
        width: 50%;
        height: 75%;
        float : left;
    }
    #aa{
    	widht : 100%;
    }
    #aa > img{
    	padding-top:5px;
    	
    	width:190px;
    }
    #b{
        width: 580px;
        height: 75%;
        float : left;
    }

    #b > img{
    	padding-top:10px;
        width: 100%;
        height: 100%;
    }
    
    table{
		width:100%;
		height:50%;
		margin:auto;
	}
	table, th, td{
		border:1px solid #222;
		border-collapse : collapse;
	}
    th{
		background-color: #fdc696;
	}
	td{
		background-color: #ececec;
	}
	
	#select{
		width:25%;
		height:10%;
		float:left;
	}
	#d{
		width:25%;
		height:10%;
		float:left;
	}
	#f{
		width:25%;
		height:10%;
		float:left;
	}
	
	#select_wrap{
		width:25%;
		height:10%;
		float:left
	}
	
	#logi{
		width:70%;
		height:25%;
	}
	#ll{
		width:20%;
		height:25%;
		float:left;
	}
    

</style>
<body>
    <jsp:include page ="../common/header.jsp" />



<div id="reserve">
	<div id="a">
		<!-- <img src="/res/images/sub2_1/table.jpg?6" class="sub2_1table wow fadeInUp" data-wow-delay="0.3s" /> -->
		<table class="type08">
				<h6>※ 5세이하 입장료는 무료입니다.</h6>
		    <thead>
		    <tr>
		      <th width="20%" scope="cols">감귤품종</th>
		        <th width="20%" scope="cols">입장요금<br></th>
		      <th width="25%" scope="cols">체험시기</th>
		      <th width="" scope="cols">Kg당 가격
		      (현장에서 결재)</th>
		      </tr>
		    </thead>
		    <tbody>
		    
		    
		     <tr>
		        <th scope="row">노지감귤</th>
		        <td>5,000원</td>
		        <td class="type09">10월 중순 ~ 1월 초</td>
		        <td class="type09">2,500원</td>
		      </tr>
		       <tr>
		        <th scope="row">황금향</th>
		        <td>10,000원</td>
		        <td class="type09">11월 ~ 12월</td>
		        <td class="type09">8,000원</td>
		      </tr>
		       <tr>
		        <th scope="row">한라봉</th>
		        <td>10,000원</td>
		        <td class="type09">12월 중순 ~ 1월</td>
		        <td class="type09">8,000원</td>
		      </tr>
		       <tr>
		        <th scope="row">레드향</th>
		      <td>10,000원</td>
		        <td class="type09">1월 중순 ~ 2월</td>
		        <td class="type09">9,000원</td>
		      </tr>
		       <tr>
		        <th scope="row">천혜향</th>
		       <td>10,000원</td>
		        <td class="type09">2월 초 ~3월 초</td>
		        <td class="type09">9,000원</td>
		      </tr>
		       <tr>
		        <th scope="row">카라향</th>
		       <td>10,000원</td>
		        <td class="type09">4월 말 ~ </td>
		        <td class="type09">9,000원</td>
		      </tr>
		    </tbody>
		</table>
		
		<div id="aa">
		<img src="http://bongbongfarm.com/res/images/sub2_1/top1.jpg?2"/>
		<img src="http://bongbongfarm.com/res/images/sub2_1/top2.jpg?2"/>
		<img src="http://bongbongfarm.com/res/images/sub2_1/top3.jpg?2"/>
		</div>
	</div>
	<div id="b">
		<img id="imgg" src='resources/image/귤귤.gif' />
	</div>
	
	<form method="post" action="kakaoPay">
	
	<div id="d" >
		<input class="form-control" type="date" name="experienceDate" id="Date"><!-- 2 -->
	</div>
	
	<div id="select">                                        
		<select name="courseSeq" id="courseSeq" class="form-control">
			<option value="카라향">카라향</option>
		</select>   
		
		<input id="gul" type="hidden" name="experienceDivide" value="카라향"><!-- 1 -->
		
	</div>
	<div id="f">
		<select class="form-control" id="changeaqua1">
			<option value="종일(09:30 - 18:00)">종일(09:30 - 18:00)</option>
		</select>
		
		<input  type="hidden" name="experienceTime" value="종일(09:30 - 18:00)"><!-- 2 -->
	</div>	
				
	<div id="select_wrap">
		<select onchange="tanpeople();" name="cmpaCnt" id="cmpaCnt" class="form-control">
		    <option value="1">1</option>
		    <option value="2">2</option>
		    <option value="3">3</option>
		    <option value="4">4</option>
		</select>
		<input type="hidden" id="person1-val" name="experiencePeople" value="1"><!-- 5 -->
	</div>
		<input type="hidden" id="category" name="category" value="감귤체험"><!-- 6 -->
	
	
	<div>
		<c:choose>
			<c:when test="${ empty sessionScope.loginUser}"><br>
			<div id="logi">
				<h3>결제를 하기 위해선 로그인 해야 합니다. <a class="btn btn-outline-warning" href="login">로그인하러가기</a></h3>
			</div>
			</c:when>
			
			<c:otherwise>
			<div id="ll">
			
				<input type="text" class="form-control" name="price" id="price" value="10000"
				 style="width:100px; hegith:100px; float:left; readonly">
				 
				 <button type="submit"  id="btn1" class="btn btn-outline-warning">
					<img src="resources/image/kakao.png" style="width:90px; height:30px;">
				</button>
			</div>
				
			</c:otherwise>
		</c:choose>
	</div>
	</form>

</div>


	<script>
		var now_utc = Date.now() // 지금 날짜를 밀리초로
		// getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
		var timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
		// new Date(now_utc-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환
		var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
		document.getElementById("Date").setAttribute("min", today);
		
		$(function(){
			$('#btn1').click(() => {
		
			var dateString = $("#Date").val();
			console.log(dateString);
			
			people = $('#cmpaCnt').children('option:selected').text();
			$('#cmpaCnt').children('option:selected').text(people);
			
			$('#person1-val').val(people);
			console.log($('#person1-val').val());
		
			});
		});
		function tanpeople(){
			person = $('#cmpaCnt').children('option:selected').text();
			console.log(person)
			
			if( person == 1){
				$('#price').val(10000);
			}
			else if( person == 2){
				$('#price').val(20000);
			}
			else if(person == 3){
				$('#price').val(30000);
			}
			else{
				$('#price').val(40000);
			}
			
		}
		
		
	</script>





	<jsp:include page ="../common/footer.jsp" />


</body>
</html>