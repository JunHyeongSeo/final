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
*{
	box-sizing : border-box;
	margin : 0;
}

    #reserve{
    	padding-top : 20px;
    	padding-left : 15px;
        width: 1200px;
        height: 600px;
        margin: auto;
    }

    #a{
        width: 50%;
        height: 100%;
        float : left;
        padding-top:10px;
        padding-left:10px;
    }

    #title{
        width: 500px;
        height: 80px;
        margin: 30px;
    }

    #select-area{
        width : 500px;
        height: 450px;
        margin : 30px;

    }

    #b{
        width: 580px;
        height: 100%;
        float : left;
    }

    #b > img{
        width: 100%;
        height: 100%;
    }

    .discount{
        right: 0;
        bottom: 0;
        text-align: center;
        width: 60px;
        height: 60px;
        line-height: 20px;
        border-radius: 10px;
        font-size: 18px;
        font-weight: 900;
        color: #fff;
        background-color: #FF6600
    }

    #paybtn{
        width: 90px;
        height: 40px;
    }

	#paybtn > img {
		width : 100%;
		height : 100%;
		
	}
	
	.discount{
	    right: 0;
	    bottom: 0;
	    text-align: center;
	    width: 60px;
	    height: 60px;
	    line-height: 20px;
	    border-radius: 10px;
	    font-size: 18px;
	    font-weight: 900;
	    color: #fff;
	    background-color: #FF6600
	}
	
	#aquaprice{
		font-size:20px;
	}

</style>
    
</head>
<body>
	<jsp:include page ="../common/header.jsp" />
	
	<div id="reserve">
		<div id="a">
			<h1>제주입장권</h1>
			<b>아쿠아리움 + 오션아레나 공연 + 유미의 세포들 특별전 &nbsp;&nbsp;</b><span class="discount">18%</span><br><br>
			
			<form method="post" action="kakaoPay">
				<input type="date" name="experienceDate" id="Date"><!-- 1 -->
				
				<select id="changeaqua1">
					<option value="종일(09:30 - 18:00)">종일(09:30 - 18:00)</option>
				</select>
				
				<input type="hidden" name="experienceTime" value="종일(09:30 - 18:00)">
				
				<select id="changeaqua2">
					<option id="op1" value="제주입장권_대소공통">제주입장권_대소공통</option>
				</select>
				
				<input type="hidden" name="experienceDivide" value="제주입장권_대소공통">
				
				<div id="aquaprice" >
					<!-- 빼기 버튼 -->
					<button type="button" id="sub" class="btn btn-outline-danger">-</button>
					
					<span id="span1" style="width:120px">${ price }</span>원
					<input type="hidden" name="price" id="price" value="36000">
					
					<!-- 더하기 버튼 -->
					<button type="button" id="add" class="btn btn-outline-primary">+</button>&nbsp;
					
					<span id="person1" >1</span>명
					<input type="hidden" id="person1-val" name="experiencePeople" value="1">
				</div>
				
				<br>
				
				<input type="hidden" id="category" name="category" value="아쿠아리움">

				<c:choose>
					<c:when test="${ empty sessionScope.loginUser}"><br>
						<h3>결제를 하기 위해선 로그인 해야 합니다. <a class="btn btn-outline-warning" href="login">로그인하러가기</a></h3>
					</c:when>
					<c:otherwise>
						<button type="submit"  id="btn1" class="btn btn-outline-warning">
							<img src="resources/image/kakao.png" style="width:90px; height:30px;">
					   </button>
					</c:otherwise>
				</c:choose>
				</form>
		</div>
		<div id="b">
			<img id="imgg" src='resources/image/유미의세포들.jpg' />
		</div>
		
	</div>
	
	<script>
	var now_utc = Date.now() // 지금 날짜를 밀리초로
	// getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
	var timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
	// new Date(now_utc-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환
	var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
	document.getElementById("Date").setAttribute("min", today);
	
	let num = 1;
	let price = $('#aquaprice').children('#span1').text();
	
	window.onload = function(){
		if ($('#aquaprice').children('#span1').text() == 36000 ) {
			 $('#sub').attr("disabled", true);	 
		}
		else if($('#aquaprice').children('#span1').text() < 36000){
			$('#btn1').attr("disabled", true);
		}
		
	}
	
	
	$(function(){
		$('#btn1').click(() => {
			
			var dateString = $("#Date").val();
			var timeString = $('#changeaqua1').children('option:selected').text();
			var divideString = $('#changeaqua2').children('option:selected').text();
			var price = $('#aquaprice').children('#span1').text()
			var person = $('#aquaprice').children('#person1').text()
			var category = $('#category').val();
			});
		})

		
		$('#sub').click(function(){
			var person = $('#aquaprice').children('#person1').text();
			newPrice = Number(price) - 36000;
			newperson = Number(person) - 1;
			document.getElementById("span1").textContent = newPrice;
			document.getElementById("person1").textContent = newperson
			
			num = $('#aquaprice').children('#person1').text();
			$('#aquaprice').children('#person1').text(num);
			
			$('#person1-val').val(Number(num));
			
			price = $('#aquaprice').children('#span1').text()
			$('#aquaprice').children('#span1').text(price)
			
			$('#price').val(Number(price));
			
			if ($('#aquaprice').children('#span1').text() == 36000 ) {
				 $('#sub').attr("disabled",true);
			}
			
			if ($('#aquaprice').children('#span1').text() < 36000 ) {
				$('#sub').removeAttr('disabled');
			}
		});
		
		$('#add').click(function(){
			var person = $('#aquaprice').children('#person1').text();
			newPrice = 36000 + Number(price);
			newperson = Number(person) + 1;
		    document.getElementById("span1").textContent = newPrice;
		    document.getElementById("person1").textContent = newperson
	
			num = $('#aquaprice').children('#person1').text();
			$('#aquaprice').children('#person1').text(num);
			$('#person1-val').val(Number(num));
			
			price = $('#aquaprice').children('#span1').text()
			$('#aquaprice').children('#span1').text(price)
			$('#price').val(Number(price));
			
			if ($('#aquaprice').children('#span1').text() != 36000 ) {
				$('#sub').removeAttr('disabled');
			}
			
		});
		
	</script>

	<jsp:include page ="../common/footer.jsp" />

</body>
</html>