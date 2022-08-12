<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
	<link rel="stylesheet" href="/IDMB/resources/css/member.css?v=<%=System.currentTimeMillis()%>">

	<!-- Include jquery -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
	<script src="/IDMB/resources/js/find.js?v=<%=System.currentTimeMillis()%>"></script>

	<script>
		// 페이지 로딩 시, 자동 실행
		$(document).ready(function() {
			document.getElementById("name").focus();
		});
	</script>

	<title>IDMB</title>

</head>

<body>
	<form id="findIdForm" action="/IDMB/findIdResult.do" method="post">
		<div class="wrap">
			<div class="find" style="margin-top: 20px;">
			
				<h2>아이디 찾기</h2>
				
				<input type="hidden" id="id" value="@@@@"/>
				
				<div align="center">
					<h4>이름</h4>
					<input type="text" name="name" id="name" maxlength="8" oninput="inputNoBlank(this)" />
				</div>
				
				<div align="center">
					<h4>휴대폰 번호</h4> 
					<input type="text" name="phone" id="phone" size="11" maxlength="11" oninput="inputNumberOnly(this)" />
				</div>
				
				<div class="submit">
					<input class="submit_find" type="button" value="찾기" onClick="return formCheck()">
				</div>			
			</div>
		</div>
	</form>
</body>
</html>