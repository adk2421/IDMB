<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/kindProduct.css?v=<%=System.currentTimeMillis()%>">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>신상품 목록</title>
</head>
<body>
<br>

<!-- 메인페이지 로고 -->
<div style="margin: auto; width:150px; height:180px;">
	<a href="/IDMB/"><img src="img/logo.png" width="140" id="previewImage"></a>
</div>
<br>

<!-- 상품 종류별로 이동 -->
<nav id="topMenu">
	<ul>
		<li><a class="menuLink" href="bestProductList.do"><b>BEST</b></a></li>
		<li><a class="menuLink" href="newProductList.do"><b>NEW</b></a></li>
		<li><a class="menuLink" href="kindProductList.do?p_kind=숄더백"><b>숄더백</b></a></li>
		<li><a class="menuLink" href="kindProductList.do?p_kind=크로스백"><b>크로스백</b></a></li>
		<li><a class="menuLink" href="kindProductList.do?p_kind=메신저백"><b>메신저백</b></a></li>
		<li><a class="menuLink" href="kindProductList.do?p_kind=클러치백"><b>클러치백</b></a></li>
		<li><a class="menuLink" href="kindProductList.do?p_kind=백팩"><b>백팩</b></a></li>
		<li><a class="menuLink" href="kindProductList.do?p_kind=미니백"><b>미니백</b></a></li>
	</ul>
</nav>


<br>

<div style="margin-left:15%;">
<form action="newProductList.do" method="get">	
	<input type="search" name="searchValue"  id="searchValue" placeholder="검색어...." value="${searchValue}">
	
	<br>
	
	<input type="number" name="priceValue1"  id="priceValue1" placeholder="최소금액...." 
		<c:if test = "${priceValue1 != '0'}">value="${priceValue1}"</c:if>> ~ 
	<input type="number" name="priceValue2"  id="priceValue2" placeholder="최대금액...."
		<c:if test = "${priceValue2 != '99999999'}">value="${priceValue2}"</c:if>>

	<button type="submit" class="search-icon" ><i class="fa fa-search"></i></button>
</form>
</div>

<br><br>

<div style="margin: auto; text-align:center; font-size:30px;">▼ 신상품!<br><br></div>

	<div style="margin: auto; text-align:center;">
		<c:if test="${newList.size() == 0}">
			 검색된 상품이 없습니다.
		</c:if>
	</div>

<table>
	<tbody>
		<c:forEach var="product" items="${newList}" begin="0" end ="4">
			<td width="200" height="200">
				<a href="productDetail.do?p_code=${product.P_CODE}">
				<img src="img/${product.P_IMAGE}" width="150" height="150" border="0" id="productImage"/></a><br>
				<a href="productDetail.do?p_code=${product.P_CODE}">
				${product.P_NAME}</a><br>
				<fmt:formatNumber pattern="###,###,### 원" value="${product.P_PRICE}"/><br>
				<img src="img/zimicon.png" height="20">
				<div style="color: red;">${product.P_ZIM}</div>
			</td>
		</c:forEach>
		
		<tr></tr>
		
		<c:forEach var="product" items="${newList}" begin="5" end ="9">
			<td width="200" height="200">
				<a href="productDetail.do?p_code=${product.P_CODE}">
				<img src="img/${product.P_IMAGE}" width="150" height="150" border="0" id="productImage"/></a><br>
				<a href="productDetail.do?p_code=${product.P_CODE}">
				${product.P_NAME}</a><br>
				<fmt:formatNumber pattern="###,###,### 원" value="${product.P_PRICE}"/><br>
				<img src="img/zimicon.png" height="20">
				<div style="color: red;">${product.P_ZIM}</div>
		</c:forEach>
	</tbody>
</table>
${paging.pageHtml}
</body>
</html>