<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
    <link rel="canonical" href="joinform.jsp">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css">
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<script src="${pageContext.request.contextPath}/resources/js/join.js?v=<%=System.currentTimeMillis()%>"></script>
	<script src="${pageContext.request.contextPath}/resources/js/addressAPI.js?v=<%=System.currentTimeMillis()%>"></script>
	
    <title>IDMB</title>
    
</head>

<body>
    <form id="joinForm" action="/IDMB/joinSuccess.do" method="post">
        <div class="wrap">
            <div class="join">
            
                <h2>회원가입</h2>
                
                <div class="join_input">
                    아이디
                    <input type="text" name="id" id="id" oninput="inputNoSpecial(this)" />
                     <input type="button" value="중복확인"name="confirmId" id="confirmId" onclick="checkId()"/>
                </div>
                <div class="join_input">
                    비밀번호
                    <input type="password" name="passwd" id="passwd" oninput="inputNoBlank(this)" />
                </div>
                <div class="join_input">
                    비밀번호 확인
                    <input type="password" name="passwdcheck" id="passwdcheck" oninput="inputNoBlank(this)" />
                </div>
                <div class="join_input">
                    이름
                    <input type="text" name="name" id="name" />
                </div>
                <div class="join_input">
                    핸드폰 번호
                    <input type="text" name="phone" id="phone" oninput="inputNumberOnly(this)" />
                </div>
                <div class="join_input">
                    생일
                    <input type="date" name="birth" id="birth" />
                </div>
                <div class="join_input">
                    이메일
                    <input type="text" name="email" id="email" />
                </div>
                <div class="join_input">
                    주소
                    <input type="text" name="postcode" id="postcode" size="1" />
                    <input type="button" value="주소찾기"name="findAddress" id="findAddress" onclick="execDaumPostcode()"/>
                </div>
                <div class="join_input">
                    <input type="text" name="address1" id="address1" />
                </div>
                <div class="join_input">
                    <input type="text" name="address2" id="address2" placeholder="상세 주소" />
                </div>
                
                <div class="submit">
                    <input type="button" value="가입" onclick="return formCheck()" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
