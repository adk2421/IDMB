<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
    <link rel="canonical" href="joinform.jsp">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css">
    
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<script src="${pageContext.request.contextPath}/resources/js/join.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/addressAPI.js"></script>

    <title>IDMB</title>
    
</head>

<body>
    <form id="joinForm" action="/IDMB/join.do" method="post">
        <div class="wrap">
            <div class="join">
            
                <h2>회원가입</h2>
                
                <div class="join_input">
                    아이디
                    <input type="text" name="id" id="id" oninput="inputNoSpecial(this)" />
                </div>
                <div class="join_input">
                    비밀번호
                    <input type="text" name="passwd" id="passwd" oninput="inputNoBlank(this)" />
                </div>
                <div class="join_input">
                    비밀번호 확인
                    <input type="text" name="passwdcheck" id="passwdcheck" oninput="inputNoBlank(this)" />
                </div>
                <div class="join_input">
                    이름
                    <input type="text" name="name" id="name" oninput="inputKoreanOnly(this)" />
                </div>
                <div class="join_input">
                    핸드폰 번호
                    <input type="text" name="phone" id="phone" oninput="inputNoSpecial(this)" />
                </div>
                <div class="join_input">
                    생일
                    <input type="date" name="birth" id="birth" oninput="inputNoSpecial(this)" />
                </div>
                <div class="join_input">
                    이메일
                    <input type="text" name="email" id="email" oninput="inputNoSpecial(this)" />
                </div>
                <div class="join_input">
                    주소
                    <input type="text" name="postcode" id="postcode" value="11111" size="6" />
                    <input type="button" value="주소찾기"name="findAddress" id="findAddress" onclick="execDaumPostcode()"/>
                </div>
                <div class="join_input">
                    <input type="text" name="address1" id="address1" value="" readonly />
                </div>
                <div class="join_input">
                    <input type="text" name="address2" id="address2" value="" placeholder="상세 주소" />
                </div>
                
                <div class="submit">
                    <input type="button" value="가입" onclick="return formCheck()">
                </div>
            </div>
        </div>
    </form>
</body>
</html>
