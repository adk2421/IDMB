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
<script>

</script>
</head>
<body>
	<!-- 게시판 바로가기 -->
	<div style="display: flex; justify-content: center;">
	<ul style="list-style-type:none">
		<li style="width:500px; display:inline"><a href="noticeList.do" >공 지 사 항</a></li>
		<li style="display:inline"><a href="reviewList.do" >상 품 후 기</a></li>
		<li style="display:inline"><a href="faqList.do?f_category=cost" >F A Q</a></li>
		<li style="display:inline"><a href="qnaMain.do" >1:1 문 의</a></li>
	</ul>
	</div>
	<hr>
	
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