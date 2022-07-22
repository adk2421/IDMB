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
				<b>비밀번호찾기 결과</b>
			</span>
	</div>
	<hr>
	<div style="text-align: center">
		<c:if test="${empty Find}">
			<br>
			<br>
			<br>
        	고객님의 비밀번호는 ${passwd} 입니다.
        </c:if>
        
		<br> <br> <br>
		
		<c:if test="${!empty Find}">
			<br>
			<br>
			<br>
        	존재하지 않는 회원 입니다.
        </c:if>
        
		<br> <br> <br>

		<p></p>

		<input type="button" value="로그인" class="btn btn-primary py-2 px-4"
			onClick="location.href='/IDMB/loginForm.do'">

		<p></p>

	</div>

</body>
</html>