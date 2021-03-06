<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
	<title>IDMB</title>
	
</head>
<body>

	<div style="text-align: center">
		<br>
			<span style="font-size: xx-large; color: #82ae46;">
				<b>아이디 찾기 결과</b>
			</span>
	</div>
	<hr>
	<div style="text-align: center">
		<c:if test="${empty Find}">
			<br>
			<br>
			<br>
			고객님의 아이디는 ${id} 입니다.
		
			<p></p>
			<br>
			<br>
			<br>
			<input type="button" value="로그인" class="btn btn-primary py-2 px-4"
				onClick="location.href='/IDMB/loginForm.do'">
			<input type="button" value="비밀번호 찾기" class="btn btn-light py-2 px-4"
				onClick="location.href='/IDMB/findPw.do'">
		</c:if>

		<c:if test="${!empty Find}">
			<br>
			<br>
			<br>
			존재하지 않는 회원입니다.
		
			<p></p>
			<br>
			<br>
			<br>
			<input type="button" value="로그인" class="btn btn-primary py-2 px-4"
				onClick="location.href='/IDMB/loginForm.do'">
			<input type="button" value="회원가입" class="btn btn-light py-2 px-4"
				onClick="location.href='/IDMB/joinForm.do'">
		</c:if>

		<p></p>

	</div>

</body>
</html>