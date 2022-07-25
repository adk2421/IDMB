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
<table border=1>
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

<table border=1>
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
<button type="button" onClick="deleteCheck()">후 기 삭 제</button>
	&emsp;&emsp;
<button type="button" onClick="cancel()">돌 아 가 기</button>

</body>
</html>