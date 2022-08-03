<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
	<link rel="stylesheet" href="/IDMB/resources/css/member.css?v=<%=System.currentTimeMillis()%>">
	
	<script src="/IDMB/resources/js/find.js?v=<%=System.currentTimeMillis()%>"></script>
	
	<title>IDMB</title>
	
</head>
<body>
	<div class="wrap">
		<div class="find">
		
			<h2 class="result">아이디 찾기 결과</h2>
			<hr>
			
			<div style="text-align: center">
				<c:if test="${empty Find}">

					<p>고객님의 아이디는 "${findId}" 입니다.</p>
					
					<div class="result">
						<input type="button" value="로그인" onClick="location.href='/IDMB/loginForm.do'">
						<input type="button" value="비밀번호 찾기" onClick="sessionFindId('findPw', '${findId}');">
					</div>
				</c:if>

				<c:if test="${!empty Find}">
				
					<p>존재하지 않는 회원입니다.</p>
					
					<div class="result">
						<input type="button" value="로그인" onClick="location.href='/IDMB/loginForm.do'">
						<input type="button" value="회원가입" onClick="location.href='/IDMB/joinForm.do'">
					</div>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>