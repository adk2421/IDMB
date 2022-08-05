<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
    <link rel="canonical" href="joinform.jsp">
    <link rel="stylesheet" href="/IDMB/resources/css/member.css?v=<%=System.currentTimeMillis()%>">
    
	<!-- Include jquery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    
    <!-- Include DaumMapAPI -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<script src="/IDMB/resources/js/join.js?v=<%=System.currentTimeMillis()%>"></script>
	<script src="/IDMB/resources/js/addressAPI.js?v=<%=System.currentTimeMillis()%>"></script>
	
    <title>IDMB</title>
    
</head>

<body>
    <form id="joinForm" action="/IDMB/joinSuccess.do" method="post">
        <div class="wrap">
            <div class="join">
            
                <h2>회원가입</h2>
                
                <div>
	                <div class="join_input">
						<input type="text" name="id" id="id" placeholder="아이디" oninput="inputNoSpecial(this)" />
						<input type="button" name="confirmId" id="confirmId" value="중복확인" onclick="checkId()" />
					</div>
				</div>
				
				<div>
	                <div>
						<input type="password" name="passwd" id="passwd" placeholder="비밀번호" oninput="inputNoBlank(this)" />
					</div>
				</div>
				
				<div>
	                <div>
						<input type="password" name="passwdcheck" id="passwdcheck" placeholder="비밀번호 확인" oninput="inputNoBlank(this)" />
					</div>
				</div>
				
				<div>
	                <div>
						<input type="text" name="name" id="name" placeholder="이름" oninput="inputNoBlank(this)" />
					</div>
				</div>
				
				<div>
	                <div>
						<input type="text" name="phone" id="phone" placeholder="전화번호" oninput="inputNumberOnly(this)" />
					</div>
				</div>
				
				<div>
	                <div>
						<input type="date" name="birth" id="birth" data-placeholder="생년월일" required aria-required="true" />
					</div>
				</div>
				
				<div>
	                <div>
						<input type="email" name="email" id="email" placeholder="이메일" />
					</div>
				</div>
				
				<div>
	                <div class="join_input">
						<input type="text" name="address" id="address" placeholder="주소" readonly />
						<input type="button" name="findAddress" id="findAddress" value="주소찾기" onclick="execDaumPostcode()" />
					</div>
				</div>
				
				<input type="hidden" name="address1" id="address1" aria-label="주소" />
				<input type="hidden" name="postcode" id="postcode" aria-label="우편번호" />
				
				<div>
	                <div>
						<input type="text" name="address2" id="address2" placeholder="상세주소" />
					</div>
				</div>
				
                <div class="button">
                    <input type="button" value="가입" onclick="return formCheck()" />
                    <input type="button" value="취소" onclick="cancle(this.form)" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
