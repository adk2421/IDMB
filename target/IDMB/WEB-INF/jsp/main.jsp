<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
	<script>
	// 로그아웃
	function logout(Path) {
		console.log("logout 실행")
		location.href = Path + "/logout.do";
	}
	</script>
	<title>메인 페이지</title>
</head>
<body>
	<input type="button" name="logout" id="logout" value="로그아웃" onclick="logout('${pageContext.request.contextPath}')" />
</body>
</html>