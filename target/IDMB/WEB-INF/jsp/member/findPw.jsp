<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">

	<!-- Include Bootstrap -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
	<link rel="javascript" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js">
	
	<!-- Include jquery -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
	<script src="${pageContext.request.contextPath}/resources/js/find.js?v=<%=System.currentTimeMillis()%>"></script>

	<title>IDMB</title>

</head>

<body>

	<div class="container" style="text-align: center;">
		<div class="row slider-text justify-content-center align-items-center">
			<div class="col-xl-12 ftco-animate">
				<form id="findPwForm" action="/IDMB/findPwResult.do" method="post"
					class="billing-form">
					<h2 class="mb-4 billing-heading">비밀번호 찾기</h2>
					<br>
					<hr>
					<br>
					<div class="row align-items-end" style="text-align: center">

						<div class="col-md-4 mx-auto" align="center">
							<h6 class="mb-4" style="text-align: center;">이름</h6>
							<div class="form-group d-flex">
								<input type="text" id="name" name="name" class="form-control"
									maxlength="8" noBlank>
							</div>
						</div>
						<div class="w-100"></div>

						<div class="col-md-4 mx-auto" align="center">
							<h6 class="mb-4" style="text-align: center;">아이디</h6>
							<div class="form-group d-flex">
								<input type="text" id="id" name="id" size="11"
									maxlength="20" class="form-control" noSpecial>
							</div>
						</div>
						<div class="w-100"></div>
						<br>
						
						<div class="col-md-4 mx-auto" align="center">
							<h6 class="mb-4" style="text-align: center;">휴대폰 번호</h6>
							<div class="form-group d-flex">
								<input type="text" id="phone" name="phone" size="11"
									maxlength="11" class="form-control" numberOnly>
							</div>
						</div>

						<div class="w-100"></div>
						<p></p>

						<div class="col-md-6 mx-auto">
							<input type="button" value="찾기" class="btn btn-primary py-2 px-4"
								style="padding-right: 30px;" onClick="return formCheck()">
						</div>
					</div>
					<p></p>
				</form>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
</body>
</html>