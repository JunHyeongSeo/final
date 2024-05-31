<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>아이디 찾기</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <style>
        
            div{
                box-sizing : border-box;
                background-color: #ffffff;
            }

            #wrap{
                width: 1200px;
                height: 600px;
                margin: 0 auto;
                /* border : 1px solid red; */
            }

            #content{ 
                width: 400px;
                height: 450px;
                margin: 0 auto;
                margin-top: 100px;
                background-color: #FFF2D7;
                border-radius: 20px;
                /* border : 1px solid red;  */
            }
            
            #box-title     
            {
                width: 390px;
                height: 100px;
                padding-top: 35px;
                text-align: center; 
                border-radius: 20px;
                background-color: #FFF2D7;
                /* border: 1px solid rgb(0, 255, 64); */
            }

            .input-box   
            {
                width: 390px;
                height: 65px;
                padding-top: 5px;
                padding-left: 70px;
                background-color: #FFF2D7;
                /* border: 1px solid rgb(0, 88, 204); */
            }

            #box-button   
            {
                width: 390px;
                height: 50px;
                padding-left: 70px;
                background-color: #FFF2D7;
                margin-top: 25px;
                /* border: 1px solid rgb(204, 0, 160); */
            }


            div > .form-control{
                width: 260px;
                height: 30px;
                border: none;
                border-radius: 8px;
                padding-left: 10px;
                border: 1px solid #e2e2e2;
            }

            div > p{
                margin: 0 auto;
                padding-bottom: 5px;
                font-size: 14px;
                font-weight: bold; 
            }


            div > button{
                width: 260px;
                height: 40px;
                border-radius: 10px;
                background-color: #FF9843; 
                color: #ffffff; 
                border: none; 
                cursor: pointer; 
                font-size: 14px;
                font-weight: bolder;
                margin-top: 3px;
            }
            #linkBox   
            {
                width: 390px;
                height: 30px;
                padding-left: 120px;
                background-color: #FFF2D7;
            }
            
            .inputBox > .form-control{
                width: 260px;
                height: 36px;
                border: none;
                border-radius: 9px;
                padding-left: 10px;
                border: 1px solid #e2e2e2;
            }
            #linkBox > a{
                display: inline-block;
                margin: 0 auto;
                text-decoration: none; 
                color: #000000;  
                font-size: 12px; 
                font-weight: bold;                 
            }
		    .close {
		        width: 50px;
		        float: right;
		        font-size: 1.5rem;
		        font-weight: 700;
		        line-height: 1;
		        color: #000;
		        text-shadow: 0 1px 0 #fff;
		        opacity: .5;
		        float: left;
		    }





    </style>    
</head>
<body>
    
    <jsp:include page="../common/header.jsp"/>
    
    <div id="wrap">
        <div id="content">
            <div id="box-title">
                <h4>🍊 아이디 찾기</h4>
            </div>
            <div class="input-box">
                <p>이름</p>
                <input type="text" class="form-control" id="userName" maxlength="20" oninput="nameValidateInput(this)" placeholder="이름을 입력해 주세요.">
            </div>
            <div class="input-box">
                <p>연락처</p>
                <input type="text" class="form-control" id="phone"  maxlength="11" placeholder="(-)제외 숫자만 입력해 주세요." oninput="phoneValidateInput(this)">
            </div>
            <div class="input-box">
                <p>이메일</p>
                <input type="text" class="form-control" id="email" maxlength="30"  oninput="emailValidateInput(this)" placeholder="이메일을 입력해 주세요.">
            </div>
            <div id="box-button">
                <button type="button" onclick="findId()">아이디 찾기</button>
            </div>
            <div id="linkBox">
                <a href="insertForm">회원가입</a> | <a href="login">로그인</a> | <a href="searchPwdForm">비밀번호 찾기</a>
            </div>
        </div>
    </div>
    <!-- 아이디 찾기 결과 Modal -->
    <div class="modal fade" id="idModal">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">아이디 찾기 결과</h5>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <div class="modal-body">
                    <p id="userId"></p>
                </div>

                <div class="modal-footer" align="center">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp"/>



    <script>
        function findId() {
            var userName = $('#userName').val();
            var phone = $('#phone').val();
            var email = $('#email').val();

            $.ajax({
                url: 'findId.member',
                type: 'post',
                data: {
                    userName: userName,
                    phone: phone,
                    email: email
                },
                success: (data) => {
                   let maskedUsername;
             
                   maskedUsername = maskUsername(data.userId);
                   
                   if (data.userId == '아이디를 찾을 수 없습니다.') {
                      maskedUsername = data.userId;
                   }
                    
                    $('#userId').text(maskedUsername);
                    $('#idModal').modal('show');
                },
                error: (xhr, status, error) => {
                    console.error('에러:', error);
                }
            });
        }
        
        function maskUsername(username) {
            var masked = '**' + username.substring(2);
            return masked;
        }
        
        function phoneValidateInput(input) {
            input.value = input.value.replace(/[^0-9]/g, '');
        }
        
        function nameValidateInput(input) {
        	input.value = input.value.replace(/[^ㄱ-힣a-zA-Z]/gi, '');
        }

        function emailValidateInput(input) {
        	input.value = input.value.replace(/[ \{\}\[\]\/?,;:|\)*~`!^\-_+┼<>\#$%&\'\"\\\(\=\^ㄱ-힣]/gi, '');
        }
       
    </script>
</body>
</html>