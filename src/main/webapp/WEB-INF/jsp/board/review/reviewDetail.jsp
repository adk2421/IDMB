<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- Include jquery -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/detail.css?v=<%=System.currentTimeMillis()%>">
<meta charset="UTF-8">
<title>상품후기 상세보기</title>
</head>
<body>
	<a href="/IDMB/"><img src="img/logo.png" width="140" class="main_logo"></a>
	<hr>
	
	<!-- 게시판 바로가기 -->
	<div class="short" style="display: flex; justify-content: center;">
	<ul style="list-style-type:none">
		<li style="width:500px; display:inline"><a class="short" href="noticeList.do" >공 지 사 항 &nbsp;&nbsp;</a></li>
		<li id="product-review"style="display:inline"><a class="short" href="reviewList.do" >상 품 후 기 &nbsp;&nbsp;</a></li>
		<li id="title-text2"style="display:inline"><a class="short" href="faqList.do?f_category=cost" >F A Q &nbsp;&nbsp;</a></li>
		<li id="title-text2"style="display:inline"><a class="short" href="qnaMain.do" >1:1 문 의 &nbsp;&nbsp;</a></li>
	</ul>
	</div><br>

	<table>
		<tr>
			<td>이미지</td>
			<td>작성자</td>
			<td>상품이름</td>
			<td>작성일</td>
			<td>내용</td>
			<td>별점</td>
			<td>추천수</td>
		</tr>
		
		<tr>
        	<td><img src="/IDMB/img/${reviewDetail[0].P_IMAGE}" style="width: 100px; height: 100px;"/></td>
			<td>${reviewDetail[0].R_ID}</td>
			<td>${reviewDetail[0].R_NAME}</td>
			<td>${reviewDetail[0].R_DATE}</td>
			<td>${reviewDetail[0].R_CONTENTS}</td>
			<td>${reviewDetail[0].R_RATE}</td>
			<td>${reviewDetail[0].R_RECOMMEND}</td>
        </tr>
        
        <c:if test="${reviewDetail[1].R_ID != null}">
        	<tr>
		       	<td>☞</td>
				<td>${reviewDetail[1].R_ID}</td>
				<td>${reviewDetail[1].R_NAME}</td>
				<td>${reviewDetail[1].R_DATE}</td>
				<td>${reviewDetail[1].R_CONTENTS}</td>
				<td><span class="star">
					 ★
						<input type="range" oninput="drawStar(this)"
						id="r_rate" name="r_rate" step="1" min="1" max="5" value="">${reviewDetail[1].R_RATE}
					</span>
					</td>
				<td></td>
			</tr>
		</c:if>
	</table>
</body>
</html>