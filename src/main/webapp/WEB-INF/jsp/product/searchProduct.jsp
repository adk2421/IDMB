<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
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
	
	<input type=text name="searchValue"  id="searchValue" placeholder="검색어...." value="${searchValue}">
	<br>
검색 가격
	<input type=text name="priceValue1"  id="priceValue1" placeholder="최소금액...." value="${priceValue1}"> ~ 
	<input type=text name="priceValue2"  id="priceValue2" placeholder="최대금액...." value="${priceValue2}">

	<input type="submit" value="검색"/>
</form>

<br><br>

<b>전체</b>

<table>

	<tbody>
	<c:forEach var="product" items="${searchList}">
		<tr>
			<td>
				<img src="img/${product.P_IMAGE}" width="100" border="0" id="previewImage"/><br>
				${product.P_NAME}<br>
				${product.P_PRICE}
			</td>
		</tr>
	</c:forEach>
	</tbody>
	</table>








</body>
</html>