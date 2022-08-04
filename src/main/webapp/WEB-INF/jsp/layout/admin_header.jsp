<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	
	<link rel="stylesheet" href="/IDMB/resources/css/layout.css?v=<%=System.currentTimeMillis()%>">
	
	<script>
		function main() {
			location.href="/IDMB/";
		}
	</script>
	
</head>

<body>
	<div class="nav">
		<div class="left" align="left">
			<img class="logo" src="/IDMB/img/simple_logo.png"/> IDMB
		</div>
		<br>
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
					<li><a href="adminMain.do">MANAGEMENT</a>　|　</li>
					<li><a href="adminNoticeList.do">COMMUNITY</a></li>　
				</ul>
			</c:if>
		</div>
	</div>

</body>
</html>