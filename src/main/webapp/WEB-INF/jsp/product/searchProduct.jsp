<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/menutop.css" type="text/css">
<meta charset="UTF-8">
<title>상품 검색</title>

</head>
<body>
검색창
<form action="searchProduct.do" method="get">
검색어
	<select name="SORT" id="SORT">
		<option value="" <c:if test="${SORT == null}">selected</c:if>>전 체</option>
		<option value="newproduct" <c:if test="${SORT =='newproduct'}">selected</c:if>>최 신 순</option>
		<option value="bestproduct" <c:if test="${SORT =='bestproduct'}">selected</c:if>>인 기 순</option>
		<option value="highproduct" <c:if test="${SORT == 'highproduct'}">selected</c:if>>높은 가격순</option>
		<option value="lowproduct" <c:if test="${SORT =='lowproduct'}">selected</c:if>>낮은 가격순</option>	
	</select>
	
	<input type="text" name="searchValue"  id="searchValue" placeholder="검색어...." value="${searchValue}">
	<br>
검색 가격
	<input type="number" name="priceValue1"  id="priceValue1" placeholder="최소금액...." 
		<c:if test = "${priceValue1 != '0'}">value="${priceValue1}"</c:if>> ~ 
	<input type="number" name="priceValue2"  id="priceValue2" placeholder="최대금액...."
		<c:if test = "${priceValue2 != '99999999'}">value="${priceValue2}"</c:if>>

	<input type="submit" value="검색"/>
</form>

<br><br>

<b>전체</b>

<table>
	<tfoot>
		<c:if test="${searchList.size() == 0}">
			<br>
			상품이 없습니다.
		</c:if>
	</tfoot>
	
	<tbody>
	<c:forEach var="product" items="${searchList}" begin="0" end ="4">
			<td width="200" height="200">
				<a href="productDetail.do?p_code=${product.P_CODE}">
				<img src="img/${product.P_IMAGE}" width="150" height="150" border="0" id="productImage"/></a><br>
				<a href="productDetail.do?p_code=${product.P_CODE}">
				${product.P_NAME}</a><br>
				<fmt:formatNumber pattern="###,###,### 원" value="${product.P_PRICE}"/>
			</td>
	</c:forEach>
	<tr></tr>
	<c:forEach var="product" items="${searchList}" begin="5" end ="9">
			<td width="200" height="200">
				<a href="productDetail.do?p_code=${product.P_CODE}">
				<img src="img/${product.P_IMAGE}" width="150" height="150" border="0" id="productImage"/></a><br>
				<a href="productDetail.do?p_code=${product.P_CODE}">
				${product.P_NAME}</a><br>
				<fmt:formatNumber pattern="###,###,### 원" value="${product.P_PRICE}"/>
			</td>
	</c:forEach>
	<tr></tr>
	<c:forEach var="product" items="${searchList}" begin="10" end ="14">
			<td width="200" height="200">
				<a href="productDetail.do?p_code=${product.P_CODE}">
				<img src="img/${product.P_IMAGE}" width="150" height="150" border="0" id="productImage"/></a><br>
				<a href="productDetail.do?p_code=${product.P_CODE}">
				${product.P_NAME}</a><br>
				<fmt:formatNumber pattern="###,###,### 원" value="${product.P_PRICE}"/>
			</td>
	</c:forEach>
	
	</tbody>
	</table>


</body>
</html>