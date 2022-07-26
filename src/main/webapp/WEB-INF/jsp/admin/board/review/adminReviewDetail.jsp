<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일단메봐</title>
<script>
function deleteCheck() {
	if(confirm("후기를 삭제하시겠습니까?") == true){
		location.href = "/IDMB/adminDeleteReview.do?r_num=${adminReviewBean.R_NUM}";
	}		
}

function cancel() {
	location.href = "/IDMB/adminReviewList.do"	
}
</script>
</head>
<body>

	<!-- 관리자 메인 툴바 -->
	<div>
		<a href="adminMain.do"><img alt="adminlogo" src="img/adminLogo.png" ></a>
		<div align="right">
		<ul style="list-style-type:none">
			<li style="display:inline"><a href="adminMemberList.do" >회원 관리</a></li>
			<li style="display:inline"><a href="adminProductList.do" >상품 관리</a></li>
			<li style="display:inline"><a href="adminOrderList.do" >주문 관리</a></li>
			<li style="display:inline"><a href="adminNoticeList.do" >게시판 관리</a></li>
		</ul>	
		</div>
	</div>
	<hr>

<table style="margin:auto; text-align: center;" border=1>
	<tbody>
		<tr>
			<td rowspan="4">
				<img src="img/${adminReviewProduct.P_IMAGE}" width="150" border="0"	id="previewImage">
			</td>
			<td><b>상품 번호</b></td>
			<td>${adminReviewProduct.P_CODE}</td>
		</tr>
		<tr>
			<td><b>종류</b></td>
			<td>${adminReviewProduct.P_KIND}</td>
		</tr>
		<tr>
			<td><b>상품명</b></td>
			<td>${adminReviewProduct.P_NAME}</td>
		</tr>
		<tr>
			<td><b>가격</b></td>
			<td>${adminReviewProduct.P_PRICE}</td>
		</tr>

	</tbody>
</table>

<br>

<table style="margin:auto; text-align: center;" border=1>
	<tbody>
		<tr>
			<td><b>작성자</b></td>
			<td>${adminReviewBean.R_ID}</td>
			<td><b>별점</b></td>
			<td>${adminReviewBean.R_RATE}</td>
		</tr>
		<tr>
			<td><b>작성일</b></td>
			<td colspan="3">
				<fmt:formatDate value="${adminReviewBean.R_DATE}"
					pattern="yyyy년 MM월 dd일 a hh:mm"/>
			</td>
		</tr>	
		<tr>
			<td><b>내용</b></td>
			<td colspan="3">
				${adminReviewBean.R_CONTENTS}
			</td>	
		</tr>
	</tbody>
</table>

<br>

<div style="margin:auto; text-align: center;">
<button type="button" onClick="deleteCheck()">후 기 삭 제</button>
	&emsp;&emsp;
<button type="button" onClick="cancel()">돌 아 가 기</button>
</div>
</body>
</html>