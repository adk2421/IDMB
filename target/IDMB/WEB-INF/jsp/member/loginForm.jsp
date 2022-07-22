<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
    <link rel="canonical" href="loginform.jsp">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css?v=<%=System.currentTimeMillis()%>">

	<script src="${pageContext.request.contextPath}/resources/js/login.js?v=<%=System.currentTimeMillis()%>"></script>

    <title>IDMB</title>
    
</head>

<body>
    <form id="loginForm" action="/IDMB/login.do" method="post">
        <div class="wrap">
            <div class="login">
            
                <h2>로그인</h2>
                
                <div class="login_sns">
                    <li><a href=""><i class="fab fa-instagram"></i></a></li>
                    <li><a href=""><i class="fab fa-facebook-f"></i></a></li>
                    <li><a href=""><i class="fab fa-twitter"></i></a></li>
                </div>
                
                <div class="login_div">
                    <h4>ID</h4>
                    <input type="text" name="id" id="id" placeholder="아이디" oninput="inputNoSpecial(this)" />
                </div>
                
                <div class="login_div">
                    <h4>Password</h4>
                    <input type="password" name="passwd" id="passwd" placeholder="비밀번호" oninput="inputNoBlank(this)" onkeypress="keyPress()" />
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
