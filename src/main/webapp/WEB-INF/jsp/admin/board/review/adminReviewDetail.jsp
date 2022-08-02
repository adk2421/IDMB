<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/adminDetail.css" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200&display=swap" rel="stylesheet">
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

/* const drawStar = (target) => {
    document.querySelector(`.star span`).style.width = `${target.value * 10}%`;
  } */
</script>
</head>
<body>

	<!-- 관리자 메인 툴바 -->
	<div class="header">
		<a href="adminMain.do"><img alt="adminlogo" src="img/adminLogo.png" ></a>
		<div class="box1" align="right">
		<ul style="list-style-type:none">
			<li style="display:inline"><a href="adminMemberList.do" >회원 관리</a></li>
			<li id="title-text1"style="display:inline"><a href="adminProductList.do" >상품 관리</a></li>
			<li id="title-text1"style="display:inline"><a href="adminOrderList.do" >주문 관리</a></li>
			<li id="board-ad"style="display:inline"><a href="adminNoticeList.do" >게시판 관리</a></li>
		</ul>	
		</div>
	</div>
	<hr>
<div class="container">
	<div class="tb1">
	<table id="product-tb">
		<tbody>
			<tr>
				<td id="img" rowspan="4">
					<img src="img/${adminReviewProduct.P_IMAGE}" width="160" id="previewImage">
				</td>
				<td id="p-num"><b>상품 번호</b></td>
				<td id="p-num">${adminReviewProduct.P_CODE}</td>
			</tr>
			<tr>
				<td><b>종류</b></td>
				<td id="k">${adminReviewProduct.P_KIND}</td>
			</tr>
			<tr>
				<td><b>상품명</b></td>
				<td id="pn">${adminReviewProduct.P_NAME}</td>
			</tr>
			<tr>
				<td id="p"><b>가격</b></td>
				<td id="pr">${adminReviewProduct.P_PRICE}</td>
			</tr>
	
		</tbody>
	</table>
	</div>
	
	<br>
	<div class="tb2">
	<table id="review-tb" >
		<tbody>
			<tr>
				<td id="td"><b>작성자</b></td>
				<td >${adminReviewBean.R_ID}</td>
				<td id="td"><b>별점</b></td>
				<td ">${adminReviewBean.R_RATE}
					<!-- <span class="star">
  						★★★★★
  						<span>★★★★★</span>
  					<input type="range" oninput="drawStar(this)" value="1" step="1" min="0" max="10">
					</span> -->
				
				</td>
			</tr>
			<tr>
				<td id="td"><b>작성일</b></td>
				<td colspan="3">
					<fmt:formatDate value="${adminReviewBean.R_DATE}"
						pattern="yyyy년 MM월 dd일 a hh:mm"/>
				</td>
			</tr>	
			<tr>
				<td id="td"><b>내용</b></td>
				<td colspan="3">
					${adminReviewBean.R_CONTENTS}
				</td>	
			</tr>
		</tbody>
	</table>
	</div>
</div>
<br>
<div class="footer">
	<div class="rb-btn"style="margin:auto; text-align: center;">
		<button id="rc-btn" type="button" onClick="deleteCheck()">후 기 삭 제</button>
			&emsp;&emsp;
		<button id="back-btn"type="button" onClick="cancel()">돌 아 가 기</button>
	</div>
	</div>
</body>
</html>