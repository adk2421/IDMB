<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
    <link rel="canonical" href="joinform.jsp">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css?v=<%=System.currentTimeMillis()%>">
    
    <!-- Include Bootstrap -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
	<link rel="javascript" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js">

	<!-- Include jquery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    
    <!-- Include DaumMapAPI -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<script src="${pageContext.request.contextPath}/resources/js/join.js?v=<%=System.currentTimeMillis()%>"></script>
	<script src="${pageContext.request.contextPath}/resources/js/addressAPI.js?v=<%=System.currentTimeMillis()%>"></script>
	
    <title>IDMB</title>
    
</head>

<body>
    <form id="joinForm" action="/IDMB/joinSuccess.do" method="post">
        <div class="wrap">
            <div class="join">
            
                <h2 class="join_h2">회원가입</h2>
                
                <div class="div_wrap">
	                <div class="input-group mb-3">
						<input type="text" class="form-control" name="id" id="id" placeholder="아이디" oninput="inputNoSpecial(this)" />
						<button type="button" class="btn btn-outline-secondary" name="confirmId" id="confirmId" onclick="checkId()">중복확인</button>
					</div>
				</div>
				
				<div class="div_wrap">
	                <div class="input-group mb-3">
						<input type="password" class="form-control" name="passwd" id="passwd" placeholder="비밀번호" oninput="inputNoBlank(this)" />
					</div>
				</div>
				
				<div class="div_wrap">
	                <div class="input-group mb-3">
						<input type="password" class="form-control" name="passwdcheck" id="passwdcheck" placeholder="비밀번호 확인" oninput="inputNoBlank(this)" />
					</div>
				</div>
				
				<div class="div_wrap">
	                <div class="input-group mb-3">
						<input type="text" class="form-control" name="name" id="name" placeholder="이름" oninput="inputNoBlank(this)" />
					</div>
				</div>
				
				<div class="div_wrap">
	                <div class="input-group mb-3">
						<input type="text" class="form-control" name="phone" id="phone" placeholder="전화번호" oninput="inputNumberOnly(this)" />
					</div>
				</div>
				
				<div class="div_wrap">
	                <div class="input-group mb-3">
						<input type="date" class="form-control" name="birth" id="birth" data-placeholder="생년월일" required aria-required="true" />
					</div>
				</div>
				
				<div class="div_wrap">
	                <div class="input-group mb-3">
						<input type="email" class="form-control" name="email" id="email" placeholder="이메일" />
					</div>
				</div>
				
				<div class="div_wrap">
	                <div class="input-group mb-3">
						<input type="text" class="form-control" name="address" id="address" placeholder="주소" readonly />
						<button type="button" class="btn btn-outline-secondary" name="findAddress" id="findAddress" onclick="execDaumPostcode()">주소찾기</button>
					</div>
				</div>
				
				<input type="hidden" name="address1" id="address1" aria-label="주소" />
				<input type="hidden" name="postcode" id="postcode" aria-label="우편번호" />
				
				<div class="div_wrap">
	                <div class="input-group mb-3">
						<input type="text" class="form-control" name="address2" id="address2" placeholder="상세주소" />
					</div>
				</div>
				
                <div class="button">
                    <input type="button" class="btn btn-outline-secondary" value="가입" onclick="return formCheck()" />
                    <input type="button" class="btn btn-outline-secondary" value="취소" onclick="cancle(this.form)" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
