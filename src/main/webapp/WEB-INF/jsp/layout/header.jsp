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
		<ul style="list-style-type:none">
			<li style="display:inline"><a href="loginForm.do">LOGIN</a>　|　</li>
			<li style="display:inline"><a href="joinForm.do">JOIN</a>　|　</li>
			<li style="display:inline"><a href="noticeList.do">COMMUNITY</a></li>　
		</ul>
	</c:if>
	
	<c:if test="${! empty id }">
		<ul style="list-style-type:none">
			<li style="display:inline"><a href="logout.do">LOGOUT</a>　|　</li>
			<li style="display:inline"><a href="basketList.do">CART</a>　|　</li>
			<li style="display:inline"><a href="myPage.do">MY PAGE</a>　|　</li>
			<li style="display:inline"><a href="myOrderList.do">ORDER</a>　|　</li>
			<li style="display:inline"><a href="noticeList.do">COMMUNITY</a></li>　
		</ul>
	</c:if>
	</div>
	<hr/>
	<div class="logo">
		<img class="logo" src="/IDMB/img/logo.png" onclick="location.href = '/IDMB/mainpageProductList.do'">
	</div>
	<div>
		<hr/>
	</div>

</body>
</html>