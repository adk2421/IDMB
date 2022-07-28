<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/adminReview.css" type="text/css">
<meta charset="UTF-8">
<title>일단메봐</title>
<script>

</script>
</head>
<body>

	<!-- 관리자 메인 툴바 -->
	<div>
		<a href="adminMain.do"><img alt="adminlogo" src="img/adminLogo.png" ></a>
		<div class="box1"align="right">
		<ul style="list-style-type:none">
			<li style="display:inline"><a href="adminMemberList.do" >회원 관리</a></li>
			<li  id="title-text1" style="display:inline"><a href="adminProductList.do" >상품 관리</a></li>
			<li  id="title-text1" style="display:inline"><a href="adminOrderList.do" >주문 관리</a></li>
			<li  id="board-ad" style="display:inline"><a href="adminNoticeList.do" >게시판 관리</a></li>
		</ul>	
		</div>
	</div>
	<hr>	

	<!-- 관리자 게시판 바로가기 -->
	<div class="box2"style="display: flex; justify-content: center;">
	<ul style="list-style-type:none">
		<li id="title-text2" style="width:500px; display:inline"><a href="adminNoticeList.do" >공 지 사 항</a></li>
		<li id="product-review" style="display:inline"><a href="adminReviewList.do" >상 품 후 기</a></li>
		<li id="title-text2" style="display:inline"><a href="adminFaqList.do?f_category=cost" >F A Q</a></li>
		<li id="title-text2" style="display:inline"><a href="adminQnaMain.do" >1:1 문 의</a></li>
	</ul>
	</div>

	
	<br>
	<div class="search"style="margin:auto; text-align: center;">
	<form action="adminReviewList.do" method="get">
		<select name="SORT" id="SORT">
			<option value="id" <c:if test="${SORT =='id'}">selected</c:if>>아 이 디</option>
			<option value="product" <c:if test="${SORT =='product'}">selected</c:if>>상 품 명</option>	
		</select>
		<input id="search" type="search" name="searchValue"  placeholder="검색어 ..." value="${searchValue}"/>
		<button class="search-icon" href=""><i class="fa fa-search"></i></button>
	</form>
	</div>
	
	<br>
	
	<table style="margin:auto; text-align: center;" border=1>
		<thead>
			<tr>
				<th>후기번호</th>
				<th>작성일</th>
				<th>별점</th>
				<th>상품명</th>
				<th>후기</th>
				<th>작성자</th>
				<th>기능</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="review" items="${adminReviewList}">
			<tr>
				<td>${review.R_GROUPNUM}</td>
				<td>
					<fmt:formatDate value="${review.R_DATE}"
						pattern="yyyy년 MM월 dd일"/>
				</td>
				<td>
					${review.R_RATE}
			<!-- 별점의 수을 입력받아서 별 개수가 다르게 이미지 파일을 출력하는게 좋을것 같음 -->		
				</td>
				<td>
					<a href="adminReviewDetail.do?r_num=${review.R_NUM}&p_code=${review.R_CODE}">
					${review.R_NAME}</a>
				</td>
				<td>${review.R_CONTENTS}</td>
				<td>${review.R_ID}</td>
				<td>
					<c:if test="${review.R_ID != null}">
						<button id="rmbtn"type="button" onClick="location.href='adminDeleteReview.do?r_num=${review.R_NUM}'">삭제</button>	
					</c:if>
				</td>
			</tr>		
		</c:forEach>
		</tbody>
	</table>
</body>
</html>