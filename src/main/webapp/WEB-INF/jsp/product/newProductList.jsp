<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>



<style>

#menu ul {

list-style-type:none;

/* 좌측 여백 없애기 */

padding-left:0px;

/* 우측 정렬 하기 */

float:right;

}

#menu ul li {

display:inline;

border-left: 1px solid #c0c0c0;

/* 테두리와 메뉴 간격 벌리기. padding: 위 오른쪽 아래 왼쪽; */

padding: 0px 10px 0px 10px;

/* 메뉴와 테두리 사이 간격 벌리기. margin: 위 오른쪽 아래 왼쪽; */

margin: 5px 0px 5px 0px;

}

#menu ul li:first-child {

border-left: none;

}

</style>
<link rel="stylesheet" href="css/menutop.css" type="text/css">
<meta charset="UTF-8">
<title>신상품 목록</title>
</head>
<body>
<!-- 메인페이지 로고 -->
<div style="margin: auto; width:150px; height:180px;">
	<a href="/IDMB/"><img src="img/logo.png" width="150" height="180" id="previewImage"></a>
</div>
<br>

<!-- 상품 종류별로 이동 -->
<table style="
	width: 70%; height: 50px;
	margin-left:15%;
	margin-right:15%;
	border:1px solid gray; text-align:center;">
	<tbody>
		<tr>
			<td>
				<a href="bestProductList.do"><b>BEST</b></a>
			</td>
			<td>
				<a href="newProductList.do"><b>NEW</b></a>
				
			</td>
			<td>
				<a href="kindProductList.do?p_kind=숄더백"><b>숄더백</b></a>
			</td>
			<td>
				<a href="kindProductList.do?p_kind=크로스백"><b>크로스백</b></a>
			</td>
			<td>
				<a href="kindProductList.do?p_kind=메신저백"><b>메신저백</b></a>
			</td>
			<td>
				<a href="kindProductList.do?p_kind=클러치백"><b>클러치백</b></a>
			</td>
			<td>
				<a href="kindProductList.do?p_kind=백팩"><b>백팩</b></a>
			</td>
			<td>
				<a href="kindProductList.do?p_kind=미니백"><b>미니백</b></a>
			</td>
		</tr>
	</tbody>	
</table>

<br>

<form action="newProductList.do" method="get">	
	<input type="text" name="searchValue"  id="searchValue" placeholder="검색어...." value="${searchValue}">
	
	<br>
	
	<input type="number" name="priceValue1"  id="priceValue1" placeholder="최소금액...." 
		<c:if test = "${priceValue1 != '0'}">value="${priceValue1}"</c:if>> ~ 
	<input type="number" name="priceValue2"  id="priceValue2" placeholder="최대금액...."
		<c:if test = "${priceValue2 != '99999999'}">value="${priceValue2}"</c:if>>

	<input type="submit" value="검색"/>
</form>

<br><br>

신상품!

<table>
	<tfoot>
		<c:if test="${newList.size() == 0}">
			<br>
			 검색된 상품이 없습니다.
		</c:if>
	</tfoot>
	<tbody>
		<c:forEach var="product" items="${newList}" begin="0" end ="4">
			<td width="200" height="200">
				<a href="productDetail.do?p_code=${product.P_CODE}">
				<img src="img/${product.P_IMAGE}" width="150" height="150" border="0" id="productImage"/></a><br>
				<a href="productDetail.do?p_code=${product.P_CODE}">
				${product.P_NAME}</a><br>
				<fmt:formatNumber pattern="###,###,### 원" value="${product.P_PRICE}"/>
		

			</td>
		</c:forEach>
		
		<tr></tr>
		
		<c:forEach var="product" items="${newList}" begin="5" end ="9">
			<td width="200" height="200">
				<a href="productDetail.do?p_code=${product.P_CODE}">
				<img src="img/${product.P_IMAGE}" width="150" height="150" border="0" id="productImage"/></a><br>
				<a href="productDetail.do?p_code=${product.P_CODE}">
				${product.P_NAME}</a><br>
				<fmt:formatNumber pattern="###,###,### 원" value="${product.P_PRICE}"/>
		</c:forEach>
	</tbody>
</table>
${paging.pageHtml}
</body>
</html>