<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

</head>
<body>
	<div id="nav_menu" align="right">
	<c:if test="${ empty id }">
		<ul style="list-style-type:none">
			<li style="display:inline"><a href="loginForm.do">LOGIN</a></li>　|　
			<li style="display:inline"><a href="joinForm.do">JOIN</a></li>　|　
			<li style="display:inline"><a href="community.do">COMMUNITY</a></li>　
		</ul>
	</c:if>
	
	<c:if test="${! empty id }">
		<ul style="list-style-type:none">
			<li style="display:inline"><a href="logout.do">LOGOUT</a></li>　|　
			<li style="display:inline"><a href="basketList.do">CART</a></li>　|　
			<li style="display:inline"><a href="myPage.do">MY PAGE</a></li>　|　
			<li style="display:inline"><a href="myOrderList.do">ORDER</a></li>　|　
			<li style="display:inline"><a href="community.do">COMMUNITY</a></li>　
		</ul>
	</c:if>
	</div>
</body>
</html>