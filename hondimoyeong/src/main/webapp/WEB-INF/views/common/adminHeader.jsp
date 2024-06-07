<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        *{
            box-sizing: border-box;
            text-decoration: none;
            margin : 0;
            padding : 0;
        }

        #header{
            width: 1200px;
            height: 180px;
            margin : auto;
            margin-top : 30px;
        }

        h1{
            color : white;
            padding: 3px 0px 0px 20px;
            height: 50px;
            color : #FF9843;
            font-weight : bold;
        }

        #menubar{
            width: 1200px;
            height: 50px;
            margin : auto;
            background-color: #FF9843;
        }

        .menu{
            width: 180px;
            height: 50px;
            text-align: center;
            display : inline-block;
            vertical-align: middle;
            margin-top: 8px;
            margin-left: 30px;
        }

        a{
            font-size: 25px;
            text-align: center;
            height: 50px;
            color : white;
        }

        #btn-area {
            width: 1200px;
            height: 35px;
            text-align: right;
        }

        #toMain{
            border : none;
            border-radius: 20px;
            padding : 5px 15px 5px 15px;
            margin-bottom : 10px;
            margin-right : 15px;
            background-color: #FF9843;
            font-size: 16px;
        }

    </style>
</head>
<body>

	<c:choose>
		<c:when test="${empty sessionScope.loginUser }">
			<script>
					alert('접근권한이 없습니다');
					location.href="${ path }";
			</script>
		</c:when>
		<c:when test="${sessionScope.loginUser.status ne 'A' }">
			<script>
					alert('접근권한이 없습니다');
					location.href="${ path }";
			</script>
		</c:when>
		<c:otherwise>
		    <div id="header">
		        <h1>관리자페이지</h1>
		        <div id="btn-area">
		            <a id="toMain" href="/hondimoyeong">메인이동</a>
		        </div>
		        <div id="menubar">
		            <div class="menu">
		                <a href="admin/course">올레길</a>
		            </div>
		            <div class="menu">
		                <a href="#">게시글</a>
		            </div>
		        </div>
		    </div>
		</c:otherwise>
	
	</c:choose>


</body>
</html>