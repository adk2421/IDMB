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

	<script src="/IDMB/resources/js/modify.js?v=<%=System.currentTimeMillis()%>"></script>
	<script src="/IDMB/resources/js/addressAPI.js?v=<%=System.currentTimeMillis()%>"></script>
	
    <title>IDMB</title>
    
</head>

<body>
    <form id="myInfoModifyForm" action="/IDMB/myInfoModify.do" method="post">
        <div class="wrap">
            <div class="join">
            
                <h2>정보수정</h2>
                
                <div>
	                <div>
						<input type="text" name="id" id="id" placeholder="아이디" oninput="inputNoSpecial(this)" value="${memberBean.id}" readonly />
					</div>
				</div>
				
				<div>
	                <div>
						<input type="password" name="passwd" id="passwd" placeholder="변경할 비밀번호" oninput="inputNoBlank(this)" />
					</div>
				</div>
				
				<div>
	                <div>
						<input type="password" name="passwdcheck" id="passwdcheck" placeholder="변경할 비밀번호 확인" oninput="inputNoBlank(this)" />
					</div>
				</div>
				
				<div>
	                <div>
						<input type="text" name="name" id="name" placeholder="이름" oninput="inputNoBlank(this)" value="${memberBean.name}" readonly />
					</div>
				</div>
				
				<div>
	                <div>
						<input type="text" name="phone" id="phone" placeholder="전화번호" oninput="inputNumberOnly(this)" value="${memberBean.phone}" />
					</div>
				</div>
				
				<div>
	                <div>
						<input type="date" name="birth" id="birth" data-placeholder="생년월일" required aria-required="true" value="${memberBean.birth}" />
					</div>
				</div>
				
				<div>
	                <div>
						<input type="email" name="email" id="email" placeholder="이메일" value="${memberBean.email}" />
					</div>
				</div>
				
				<div>
	                <div class="join_input">
						<input type="text" name="address" id="address" placeholder="주소" readonly value="[${memberBean.postcode}] ${memberBean.address1}" />
						<input type="button" name="findAddress" id="findAddress" value="주소찾기" onclick="execDaumPostcode()" />
					</div>
				</div>
				
				<input type="hidden" name="address1" id="address1" aria-label="주소" value="${memberBean.address1}" />
				<input type="hidden" name="postcode" id="postcode" aria-label="우편번호" value="${memberBean.postcode}" />
				
				<div>
	                <div>
						<input type="text" name="address2" id="address2" placeholder="상세주소" value="${memberBean.address2}" />
					</div>
				</div>
				
                <div class="button">
                    <input type="button" value="변경" onclick="return formCheck()" />
                    <input type="button" value="탈퇴" onclick="return resign(myInfoModifyForm)" />
                    <input type="button" value="취소" onclick="cancle()" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
