<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/adminList.css" type="text/css">
<meta charset="UTF-8">
<title>관리자 공지리스트</title>

<!-- Bootstrap CSS CDN -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
		crossorigin="anonymous">
	<!-- Bootstrap JS CDN -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" 
		crossorigin="anonymous"></script>

	<!-- css연결 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css?v=<%=System.currentTimeMillis()%>">

<script>

</script>
</head>
<body>
	
	<br><br><br><br>
	<hr><p>

	<!-- 게시판 바로가기 -->
	<div class="short" style="display: flex; justify-content: center;">
	<ul style="list-style-type:none">
		<li style="width:500px; display:inline"><a class="short" href="noticeList.do" >공 지 사 항 &nbsp;&nbsp;</a></li>
		<li style="display:inline"><a class="short" href="reviewList.do" >상 품 후 기 &nbsp;&nbsp;</a></li>
		<li style="display:inline"><a class="short" href="faqList.do?f_category=cost" >F A Q &nbsp;&nbsp;</a></li>
		<li style="display:inline"><a class="short" href="qnaMain.do" >1:1 문 의 &nbsp;&nbsp;</a></li>
	</ul>
	</div>
	
	<br>
	
	<!-- BEST 리뷰 -->
	<div style="display: flex; justify-content: center;
		font-size:30px; font-color:red;">
		▼ BEST 리뷰!
	</div>
	
	<div style="display: flex; justify-content: center;">
		<c:forEach var="best" items="${bestReviewList}">
			<ul style="list-style-type:none;">
				<li style="text-align:center">${best.R_ID }님</li>
				<li>
					<a href="productDetail.do?p_code=${best.R_CODE}">
					<img src="img/${best.R_NAME}.jpg" width="150" height="150" border="0"
						id="productImage"></a></li>
				<li style="text-align:center">${best.R_NAME}</li>
				
				<li style="text-align:left;">${best.R_CONTENTS }</li>
				<li style="text-align:center">
					<img src="img/rate${best.R_RATE}.png" width="150" height="30" border="0"
						id="rateImage"></li>
				<li style="text-align:left">추천수 : ${best.R_RECOMMEND }</li>
			</ul>
		</c:forEach>
	</div>
	
	<!-- NEW 리뷰 -->
	<div style="display: flex; justify-content: center;
		font-size:30px; font-color:red;">
		▼ NEW 리뷰!
	</div>
	
	<div style="display: flex; justify-content: center;">
		<c:forEach var="newr" items="${newReviewList}">
			<ul style="list-style-type:none;">
				<li style="text-align:center">${newr.R_ID }님</li>
				<li>
					<a href="reviewDetail.do?r_groupnum=${newr.R_GROUPNUM}">
					<img src="img/${newr.R_NAME}.jpg" width="150" height="150" border="0"
						id="productImage"></a></li>
				<li style="text-align:center">${newr.R_NAME}</li>
				
				<li style="text-align:left;">${newr.R_CONTENTS }</li>
				<li style="text-align:center">
					<img src="img/rate${newr.R_RATE}.png" width="150" height="30" border="0"
						id="rateImage"></li>
				<li style="text-align:left">추천수 : ${newr.R_RECOMMEND }</li>
			</ul>
		</c:forEach>
	</div>
	
</body>
</html>