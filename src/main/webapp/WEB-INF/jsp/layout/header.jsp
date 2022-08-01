<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="/IDMB/resources/css/header.css?v=<%=System.currentTimeMillis()%>">
	<script>
	function main() {
		location.href="/IDMB/";
	}
	</script>
</head>
<body>
	<div class="nav">
		<div class="left" align="left">
			<a href="mainpageProductList.do">
				<img class="logo" src="/IDMB/img/simple_logo.png"/> IDMB
			</a>
		</div>
		
		<div class="right">
			<c:if test="${ empty id }">
				<ul>
					<li><a href="loginForm.do">LOGIN</a>　|　</li>
					<li><a href="joinForm.do">JOIN</a>　|　</li>
					<li><a href="noticeList.do">COMMUNITY</a></li>　
				</ul>
			</c:if>
			
			<c:if test="${! empty id }">
				<ul>
					<li><a href="logout.do">LOGOUT</a>　|　</li>
					<li><a href="basketList.do">CART</a>　|　</li>
					<li><a href="myPage.do">MY PAGE</a>　|　</li>
					<li><a href="myOrderList.do">ORDER</a>　|　</li>
					<li><a href="noticeList.do">COMMUNITY</a></li>　
				</ul>
			</c:if>
		</div>
	</div>

</body>
</html>