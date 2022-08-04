<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/adminProduct.css" type="text/css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>일단메봐</title>
<script>
function pinsert() {
	location.href = "/IDMB/adminInsertProductForm.do";
}
</script>
</head>
<body>

	<!-- 관리자 메인 툴바 -->
	<div class="header">
		<a href="adminMain.do"><img alt="adminlogo" src="img/adminLogo.png" ></a>
		<div align="right" class="box1">
		<ul style="list-style-type:none">
			<li style="display:inline"><a href="adminMemberList.do" >회원 관리</a></li>
			<li id="product-ad" style="display:inline"><a href="adminProductList.do" >상품 관리</a></li>
			<li id="title-text1"style="display:inline"><a href="adminOrderList.do" >주문 관리</a></li>
			<li id="title-text1"style="display:inline"><a href="adminNoticeList.do" >게시판 관리</a></li>
		</ul>	
		</div>
	</div>
	<hr>


	<div class="container">
	<table style="margin:auto; text-align: center;">
		<thead>
			<tr>
				<th>종류</th>
				<th></th>
				<th>상품명</th>
				<th>가격</th>
				<th>재고</th>
				<th>판매량</th>
				<th>기능</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="product" items="${adminProductList}">
		<tr>
			<td>${product.P_KIND}</td>
			<td>
				<img src="img/${product.P_IMAGE}" width="80" border="0">
			</td>
			<td>${product.P_NAME}</td>
			<td>${product.P_PRICE}원</td>
			<td>${product.P_STOCK}</td>
			<td>${product.P_SELL}</td>
			<td><button id="mbtn" type="button"
					onClick="location.href='adminUpdateProductForm.do?p_code=${product.P_CODE}'">
				수정</button>	
			</td>
			
		</tr>
		</c:forEach>
	</tbody>
	</table>
	</div>
	<div class="footer">
	${paging.pageHtml}
	<form action="adminProductList.do" method="get">
		<button id="p-add" type="button" onClick="pinsert()">상품 등록</button>
		<input type="search" name="searchValue" id="search" placeholder="상품명 ..." value="${searchValue}"/>
		<button class="search-icon" type="submit"><i class="fa fa-search"></i></button>
	</form>
	
	</div>
	

</body>
</html>