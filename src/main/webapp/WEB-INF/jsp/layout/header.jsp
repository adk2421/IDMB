<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

	<link rel="stylesheet" href="/IDMB/resources/css/header.css?v=<%=System.currentTimeMillis()%>">

</head>
<body>
	<div class="nav" align="right">
	<c:if test="${ empty id }">
		<ul>
			<li><a href="loginForm.do">LOGIN</a>　|　</li>
			<li><a href="joinForm.do">JOIN</a>　|　</li>
			<li><a href="community.do">COMMUNITY</a></li>　
		</ul>
	</c:if>
	
	<c:if test="${! empty id }">
		<ul>
			<li><a href="logout.do">LOGOUT</a>　|　</li>
			<li><a href="basketList.do">CART</a>　|　</li>
			<li><a href="myPage.do">MY PAGE</a>　|　</li>
			<li><a href="myOrderList.do">ORDER</a>　|　</li>
			<li><a href="community.do">COMMUNITY</a></li>　
		</ul>
	</c:if>
	</div>
	<hr/>
	<div class="logo">
		<img class="logo" src="/IDMB/img/logo.png" onclick="main()">
	</div>
	<div>
		<hr/>
	</div>

</body>
</html>