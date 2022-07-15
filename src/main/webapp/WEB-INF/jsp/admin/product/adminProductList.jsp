<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일단메봐</title>
</head>
<body>
	<form action="adminProductList.do" method="get">
		<input type="text" name="searchValue" id="searchValue" value="${searchValue}"/>
		<button type="submit">검색</button>
	</form>
	<table>
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
			<td><a href="adminProductDetail.do?id=${product.ID}">
				${product.P_KIND}</a></td>
			<td>${product.P_NAME}</td>
			<td>${product.P_PRICE}</td>
			<td>${product.P_STOCK}</td>
			<td>${product.P_SELL}</td>
		</tr>
		</c:forEach>
	</tbody>
	</table>
</body>
</html>