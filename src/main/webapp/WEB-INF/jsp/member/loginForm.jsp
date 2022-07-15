<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
    <link rel="canonical" href="loginform.jsp">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">

    <title>IDMB</title>

    <script>
        /* 로그인 유효성 체크 */
        function formCheck() {
            var form = document.getElementById("loginForm");
            var id = document.getElementById("id");
            var passwd = document.getElementById("passwd");
            
            if (id.value.trim()=="") {
                alert("이메일 주소를 입력해주세요.");
                EMAIL.focus();
                return false;

            } else if (passwd.value.trim()=="") {
                alert("비밀번호를 입력해주세요.");
                return false;

            } else {	
                form.submit();
            }
        }

        /* 로그인 화면에서 엔터키 입력시 로그인 시도 */
        function keyPress() {
            if (window.event.keyCode == 13) {
                return formCheck();	
            }	
        }

        /* 첫 화면 로딩 시 포커스 */
        window.onload = function() {
            document.getElementById("id").focus();
        }

    </script>

    <script>
    	/* 특수문자 없이 한글, 영어, 숫자만 받기 */
    	$(document).on("keyup", "input[noSpecial]", function() {$(this).val( $(this).val().replace(/[^ㄱ-힣a-zA-Z0-9@]/gi,"") );})
        /* 공백 받지 않기 */
    	$(document).on("keyup", "input[noBlank]", function() {$(this).val( $(this).val().replace(/\s/gi,"") );})
    </script>
</head>

<body>
    <form id="loginForm" action="/IDMB/login.do" method="post">
        <div class="wrap">
            <div class="login">
                <h2>IDMB</h2>
                <div class="login_sns">
                    <li><a href=""><i class="fab fa-instagram"></i></a></li>
                    <li><a href=""><i class="fab fa-facebook-f"></i></a></li>
                    <li><a href=""><i class="fab fa-twitter"></i></a></li>
                </div>
                <div class="login_id">
                    <h4>ID</h4>
                    <input type="text" name="id" id="id" placeholder="아이디" noSpecial>
                </div>
                <div class="login_pw">
                    <h4>Password</h4>
                    <input type="password" name="passwd" id="passwd" placeholder="비밀번호" onkeypress="keyPress()" noBlank>
                </div>
                <div class="login_etc">
                    <!--
                    <div class="checkbox">
                        <input type="checkbox" name="" id=""> 아이디 저장
                    </div>
                    -->
                    <div class="sign_up">
                        <a href="/IDMB/joinForm.do">회원가입</a>
                    </div>
                    <div class="forgot_id">
                        <a href="/IDMB/findId.do">ID 찾기</a>
                    </div>
                    <div class="forgot_pw">
                        <a href="/IDMB/findPw.do">PW 찾기</a>
                    </div>
                </div>
                <div class="submit">
                    <input type="button" value="로그인" onclick="return formCheck()">
                </div>
            </div>
        </div>
    </form>
</body>
</html>
