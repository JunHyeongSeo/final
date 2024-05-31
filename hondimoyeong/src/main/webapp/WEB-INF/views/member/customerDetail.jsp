<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>상세보기</title>

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
                height: 880px;
                margin: 0 auto;
                /* border : 1px solid red; */
                position: relative;  /* 부모 요소의 위치를 기준으로 자식 요소를 배치할 수 있도록 설정 */
            }


            /*마이페이지 전체 박스*/
            #content{ 
                width: 800px;
                height: 750px;
                margin: 0 auto;
                margin-top: 200px;
                /* background-color: #FFF2D7; */
                border-radius: 20px;
                border : 4px solid #FF9843; 
                position: relative; /* 자식 요소의 위치를 상대적으로 설정 */
            }

           
            /*귤 아이콘*/
            .icon-Img{
                width: 130px;
                height: 150px;
                background-color: transparent;
                position: absolute; /* 부모 요소를 기준으로 배치 */
                top: -130px; /* 부모 요소의 상단에서 75px 위에 위치 */
                left: 2%; /*부모 요소의 가운데에 위치 */
            }

            /*타이틀 박스*/
            #titleBox     
            {
                width: 700px;
                height: 50px;
                margin-top: 30px;
                margin-left: 50px;
                text-align: center; /* 텍스트 가운데 정렬*/
                line-height: 50px;
                font-size: 20px;
                font-weight: bold;
                /* background-color: #FFF2D7; */
                /* border: 1px solid rgb(0, 255, 64); */
            }

            /*내용 박스*/
            #detailBox
            {
                width: 700px;
                height: 540px;
                margin-left: 50px;
                padding-left: 110px;
                margin-top: 30px;
                /* background-color: #FFF2D7; */
                /* border: 1px solid rgb(0, 88, 204); */
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

            .form-control{
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
                color: #727272;
                padding-left: 7px;
                padding-top: 7px;
                resize: none;
            }

            #box4{
                width: 500px;
                height: 45px;
                padding-top: 5px;
                padding-left: 305px;
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

            .btn-c{
                width: 60px;
                height: 35px;
                background-color: #ff7373;
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

            <div id="titleBox">글 상세보기</div>
            <div id="detailBox">
                <div id="categoryBox">
                    <h5>선택</h5>
                    <select name="category" id="category">
                   <c:choose>
                        <c:when test="${customer.category == 1}">
                            <option value="1" selected>문의</option>
                            <option value="2">신고</option>
                        </c:when>
                        <c:when test="${customer.category == 2}">
                            <option value="1">문의</option>
                            <option value="2" selected>신고</option>
                        </c:when>
                        <c:otherwise>
                            <option value="1">문의</option>
                            <option value="2">신고</option>
                        </c:otherwise>
                    </c:choose>
                    </select>                    
                </div>
                <div id="box1">
                    <p>문의 제목</p>
                    <input type="text" class="form-control" name="userId" readonly value="${customer.customerTitle}">
                    <input type="hidden" value="${customer.customerNo}" name="customerNo">
                </div>
                <div id="box2">
                    <p>문의 내용</p>
                    <textarea class="form-control" id="box3" readonly>${customer.customerContent}</textarea>
                </div>
                <div id="box4">
                    <button class="btn-a" onclick="updateForm();">수정</button>
                    <button class="btn-c" onclick="deleteCustomer();">삭제</button>
                    <button class="btn-b" onclick="location.href='list.customerView';">목록</button>
                </div>
            </div>
        </div>
    </div>
   <jsp:include page="../common/footer.jsp"/>


   <script>
      function updateForm(){
         location.href='list.customerUpdateForm?customerNo=' + ${customer.customerNo};
      }
      
      function deleteCustomer() {
         location.href='delete.customer?customerNo=' + ${customer.customerNo};
      }
   </script>


</body>
</html>