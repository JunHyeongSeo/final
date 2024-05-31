<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>등록</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <style>
            div{
                /* border : 1px solid red;  */
                box-sizing : border-box;
                background-color: #ffffff;
            }          
        
            #wrap{
                width: 1200px;
                height: 850px;
                margin: 0 auto;
                /* border : 1px solid red; */
                position: relative;
            }


            /*마이페이지 전체 박스*/
            #content{ 
                width: 800px;
                height: 720px;
                margin: 0 auto;
                margin-top: 200px;
                /* background-color: #FFF2D7; */
                border-radius: 20px;
                border : 4px solid #FF9843; 
                position: relative;
            }

           
            /*귤 아이콘*/
            .icon-Img{
                width: 130px;
                height: 150px;
                background-color: transparent;
                position: absolute;
                top: -130px; 
                left: 2%; 
            }

            /*타이틀 박스*/
            #titleBox     
            {
                width: 700px;
                height: 50px;
                margin-top: 30px;
                margin-left: 50px;
                text-align: center;
                line-height: 50px;
                font-size: 20px;
                font-weight: bold;

            }

            /*내용 박스*/
            #detailBox
            {
                width: 700px;
                height: 540px;
                margin-left: 50px;
                padding-left: 110px;
                margin-top: 30px;

            }
           
            /*-------------------------------------------------------------------------*/

            .background-Box{
                width: 450px;
                height: 120px;
                padding-top: 10px;
                background-color: #f7d3a0;
                border-radius: 10px;
                margin-top: 15px;
                margin-left: 20px;
            }

            .imgBox{
                width: 100px;
                height: 100px;
                margin-left: 30px;
                margin-right: 30px;
                float: left;
                background-color: #f7d3a0;
                /* border: 1px solid rgb(170, 0, 204); */
            }

            .imgBox > img{
                width: 100px;
                height: 100px;
            }

            .detail{
                width: 250px;
                height: 100px;
                float: left;
                background-color: #f7d3a0;
                /* border: 1px solid rgb(0, 163, 204); */
            }

            div > h5{
                padding-top: 5px;
                font-size: 14px;
                font-weight: bold;
            }

            div > p{
                font-size: 14px;
                margin: 0 auto;
                font-weight: bold;
            }

            div > .form-control{
                width: 500px;
                height: 35px;
                border: none;
                border-radius: 8px;
                padding-left: 10px;
                border: 1px solid #e2e2e2;
            }
            #categoryBox{
                width: 500px;
                height: 80px;
                /* border: 1px solid #dd309b; */
                
            }

            #box1{
                width: 500px;
                height: 80px;
                /* border: 1px solid #009e42; */
            }

            #box2{
                width: 500px;
                height: 340px;
                /* border: 1px solid #d6a400; */
            }
            #box3{
                width: 500px;
                height: 300px;
                border-radius: 8px;
                border: 1px solid lightgray;
                font-size: 15px;
                padding-left: 7px;
                padding-top: 7px;
                resize: none;
                
            }

            #box4{
                width: 500px;
                height: 45px;
                padding-top: 5px;
                padding-left: 370px;
                /* border: 1px solid #0087d6; */
            }
            .btn-a{
                width: 60px;
                height: 35px;
                background-color: #FF9843;
                border: 0;
                border-radius: 10px;
                margin-bottom: 4px;
                color: #ffffff;
                font-size: 12px;
            }

            .btn-b{
                width: 60px;
                height: 35px;
                background-color: #9e9e9e;
                border: 0;
                border-radius: 10px;
                margin-bottom: 4px;
                color: #ffffff;
                font-size: 12px;
            }

            #category{ /*카테고리*/
                border: 1px solid rgb(212, 212, 212);
                border-radius: 8px;
                width: 100px;
                height: 37px;
                font-size: 15px;
                color: #727272;
                padding-left: 7px;
            }


    </style>    
</head>
<body>
    <jsp:include page="../common/header.jsp"/>
    <div id="wrap">
        <div id="content">
            <img class="icon-Img" src="resources/image/mypageIcon.png">

            <div id="titleBox">글 등록하기</div>
            
			<form id="enrollForm" method="post" action="insert.customer" enctype="multipart/form-data"> 
			    <div id="detailBox">
			        <div id="categoryBox">
			            <p>선택</p>
			            <select name="category" id="category">
			                <option value="1">문의</option>
			                <option value="2">신고</option>
			            </select>                    
			        </div>
			        <div id="box1">
			            <p>문의 제목</p>
			            <input type="text" class="form-control" name="customerTitle">
			        </div>
			        <div id="box2">
			            <p>문의 내용</p>
			            <textarea id="box3" class="form-control" name="customerContent"></textarea>
			        </div>
			        <div id="box4">
			            <button type="submit" class="btn-a">등록</button>
			            <button type="button" class="btn-b" onclick="location.href='list.customerView';">목록</button>
			        </div>
			    </div>
			</form>
        </div>
    </div>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>