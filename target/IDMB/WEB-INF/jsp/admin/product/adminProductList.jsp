<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일단메봐</title>
<script>
function plist() {
	location.href = "/IDMB/adminProductList.do";
}
function pinsert() {
	location.href = "/IDMB/adminInsertProductForm.do";
}
</script>
</head>
<body>
	<form action="adminProductList.do" method="get">
		<button type="button" onClick="plist()">상품 목록</button>
			&emsp;&emsp;
		<button type="button" onClick="pinsert()">상품 등록</button>
			&emsp;&emsp;
		<input type="text" name="searchValue" id="searchValue" placeholder="상품명 ..." value="${searchValue}"/>
		<button type="submit">검색</button>
	</form>
	
	<table border=1>
		<thead>
			<tr>
				<th>종류</th>
				<th>상품명</th>
				<th>가격</th>
				<th>재고</th>
				<th>판매량</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="product" items="${adminProductList}">
		<tr>
			<td>${product.P_KIND}</td>
			<td><a href="productDetail.do?p_code=${product.P_CODE}">
				${product.P_NAME}</a></td>
			<td>${product.P_PRICE}</td>
			<td>${product.P_STOCK}</td>
			<td>${product.P_SELL}</td>
			<td><button type="button"
					onClick="location.href='adminUpdateProductForm.do?p_code=${product.P_CODE}'">
				수정</button>	
			</td>
			
		</tr>
		</c:forEach>
	</tbody>
	</table>
</body>
</html>