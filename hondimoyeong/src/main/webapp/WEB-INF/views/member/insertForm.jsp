<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>회원가입</title>

    <style>
            div{
                box-sizing : border-box;
                background-color: #ffffff;
            }

            #wrap{ 
                width: 1200px;
                height: 800px;
                margin: 0 auto;
            }

            /*회원가입 전체 박스*/
            #content{ 
                width: 500px;
                height: 700px;
                margin: 0 auto;
                margin-top: 100px;
                background-color: #FFF2D7;
                border-radius: 20px;
            }


             /*회원가입 박스*/ 
            #signupTitle  
            {
                width: 490px;
                height: 100px;
                padding-top: 35px;
                text-align: center; 
                border-radius: 20px;
                background-color: #FFF2D7;
            }
            
            /*아이디 박스*/ 
            #idBox, #pwConfirmBox, #pwBox, #nameBox, #emailBox, #phoneBox
            {
                width: 490px;
                height: 65px;
                padding-top: 5px;
                padding-left: 115px;
                margin-bottom: 10px;
                background-color: #FFF2D7;
                
            }

            
            /*비밀번호~연락처 박스
            #pwBox, #nameBox, #emailBox, #phoneBox    
            {
                width: 490px;
                height: 65px;
                padding-top: 5px;
                padding-left: 115px;
                background-color: #FFF2D7;
                
            }
*/ 
            /*회원가입 버튼 박스*/
            #signupButton    
            {
                width: 490px;
                height: 50px;
                padding-left: 115px;
                background-color: #FFF2D7;
                margin-top: 20px;

            }
            
            /*비밀번호~연락처 인풋박스*/
           div> .form-control{ 
                width: 260px;
                height: 30px;
                border: none;
                border-radius: 8px;
                padding-left: 10px;
                
            }



           div > p{
                font-size: 14px;
                font-weight: bold;
                margin: 0 auto;
                padding-bottom: 1px;
                color: rgb(51, 51, 51);
            }
           
            /*버튼 스타일*/
            #signupButton > button { 
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


            #checkResult, #pwdCheckResult, #emailCheckResult, #phoneCheckResult{
                width: 260px;
                height: 15px;
                background-color: #FFF2D7;
                padding-left: 5px;
                padding-top: 1px;          
                font-weight: bold;   
            }
            #linkBox   
            {
                width: 390px;
                height: 30px;
                padding-left: 155px;
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

    </style>    
</head>
<body>

    <jsp:include page="../common/header.jsp"/>

    <div id="wrap">
        <div id="content">
            <div id="signupTitle">
                <h4>🍊 회원가입</h4>
            </div>
            
            <form action="insert.member" method="post">
                <div id="idBox">
                    <p>아이디</p>
                    <input type="text" class="form-control" name="userId" required maxlength="15" placeholder="영문, 숫자만 입력해 주세요." oninput="idValidateInput(this)">
                    <div id="checkResult" style="font-size:0.7em; display:none;"></div>
                </div>
                <div id="pwBox">
                    <p>비밀번호</p>
                    <input type="password" class="form-control" name="userPwd" required maxlength="100" placeholder="비밀번호를 입력해 주세요.">
                </div>
                <div id="pwConfirmBox">
                    <p>비밀번호 확인</p>
                    <input type="password" class="form-control" name="checkPwd" required maxlength="100" placeholder="다시 한 번 입력해 주세요.">
                    <div id="pwdCheckResult" style="font-size:0.7em; display:none;"></div>
                </div>
                <div id="nameBox">
                    <p>이름</p>
                    <input type="text" class="form-control" name="userName" required maxlength="20" oninput="nameValidateInput(this)" placeholder="이름을 입력해 주세요.">
                </div>
                <div id="emailBox">
                    <p>이메일</p>
                    <input type="text" class="form-control" name="email" required maxlength="30"  oninput="emailValidateInput(this)" placeholder="이메일을 입력해 주세요.">
                    <div id="emailCheckResult" style="font-size:0.7em; display:none;"></div>
                </div>
            <div id="phoneBox">
                <p>연락처</p>
                <input type="text" class="form-control" name="phone" maxlength="11" required placeholder="(-)제외 숫자만 입력해 주세요." oninput="phoneValidateInput(this)">
                <div id="phoneCheckResult" style="font-size:0.7em; display:none;"></div>
            </div>
                <div id="signupButton">
                    <button type="submit" id="joinBtn">가입하기</button>
                </div>
            <div id="linkBox">
                <a href="login">로그인</a> | <a href="searchIdForm">아이디 찾기</a> | <a href="searchPwdForm">비밀번호 찾기</a>
            </div>
            </form>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp"/>

    <script>
    $(function() {
        const $idInput = $('[name="userId"]'); 
        const $checkResult = $('#checkResult');
        const $joinSubmit = $('#joinBtn');
        
        const $pwdInput = $('[name="userPwd"]');
        const $pwdCheckInput = $('[name="checkPwd"]');
        const $pwdCheckResult = $('#pwdCheckResult');

        function validateForm() {
            const isIdValid = $checkResult.text() === '사용 가능한 아이디입니다.';
            const isPwdValid = $pwdCheckResult.text() === '비밀번호가 일치합니다.';
            const isEmailValid = $('#emailCheckResult').text() === '사용 가능한 이메일입니다.';
            const isPhoneValid = $('#phoneCheckResult').text() === '사용 가능한 연락처입니다.' || $('#phoneCheckResult').text() === '연락처는 11자리여야 합니다.'; 
            const isPhoneLengthValid = $('[name="phone"]').val().length === 11;
            return isIdValid && isPwdValid && isEmailValid && isPhoneValid && isPhoneLengthValid;
        }

        // 초기에는 버튼을 활성화
        $joinSubmit.attr('disabled', false);

        $joinSubmit.click(function(event) {
            if (!validateForm()) {
                event.preventDefault(); 
                alert('모든 정보를 입력해 주세요.');
            }
        });

        $idInput.keyup(function() {
            if($idInput.val().length >= 5){
                $.ajax({
                    url : 'idCheck.member',
                    data : {checkId : $idInput.val()},
                    success : function(result) {
                        if(result.substr(4) == 'N') {
                            $checkResult.show().css('color', 'crimson').text('이미 사용 중인 아이디입니다.');
                            $joinSubmit.attr('disabled', true);
                        } else {
                            $checkResult.show().css('color', '#33b325').text('사용 가능한 아이디입니다.');
                            $joinSubmit.attr('disabled', false); 
                        }
                    },
                    error : function() {
                        console.log('아이디 중복체크용 JSJA 통신 실패~');
                    }
                });
            } else {
                $checkResult.hide();
                $joinSubmit.attr('disabled', true);
            }
        });

        $('[name="email"]').keyup(function() {
            if ($(this).val().length > 0) {
                $.ajax({
                    url: 'emailCheck.member',
                    data: { email: $(this).val() },
                    success: function(result) {
                        if (result.substr(4) == 'N') {
                            $('#emailCheckResult').show().css('color', 'crimson').text('이미 사용 중인 이메일입니다.');
                            $joinSubmit.attr('disabled', true);
                        } else {
                            $('#emailCheckResult').show().css('color', '#33b325').text('사용 가능한 이메일입니다.');
                            $joinSubmit.attr('disabled', false);
                        }
                    },
                    error: function() {
                        console.log('이메일 중복체크용 JSJA 통신 실패~');
                    }
                });
            } else {
                $('#emailCheckResult').hide();
                $joinSubmit.attr('disabled', true);
            }
        });

        $('[name="phone"]').keyup(function() {
            if ($(this).val().length === 11) {
                $.ajax({
                    url: 'phoneCheck.member',
                    data: { phone: $(this).val() },
                    success: function(result) {
                        if (result.substr(4) == 'N') {
                            $('#phoneCheckResult').show().css('color', 'crimson').text('이미 사용 중인 연락처입니다.');
                            $joinSubmit.attr('disabled', true);
                        } else {
                            $('#phoneCheckResult').show().css('color', '#33b325').text('사용 가능한 연락처입니다.');
                            $joinSubmit.attr('disabled', false); 
                        }
                    },
                    error: function() {
                        console.log('연락처 중복체크용 JSJA 통신 실패~');
                    }
                });
            } else if ($(this).val().length === 10) {
                $('#phoneCheckResult').show().css('color', '#2C73D2').text('연락처는 11자리여야 합니다.');
                $joinSubmit.attr('disabled', true);
            } else {
                $('#phoneCheckResult').hide();
                $joinSubmit.attr('disabled', true);
            }
        });

        $pwdCheckInput.keyup(function() {
            if ($pwdInput.val() === $pwdCheckInput.val()) {
                $pwdCheckResult.show().css('color', '#33b325').text('비밀번호가 일치합니다.');
                $joinSubmit.attr('disabled', false); 
            } else {
                $pwdCheckResult.show().css('color', 'crimson').text('비밀번호가 일치하지 않습니다.');
                $joinSubmit.attr('disabled', true);
            }
        });
    });

    function idValidateInput(input) {
        input.value = input.value.replace(/[^a-z0-9]/gi, '');
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