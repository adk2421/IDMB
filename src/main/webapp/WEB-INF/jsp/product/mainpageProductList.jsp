<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>

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


</head>
<body>
<!-- 메인페이지 로고 -->
<div style="margin: auto; width:150px; height:180px;">
	<a href="/IDMB/"><img src="img/logo.png" width="150" height="180" id="previewImage"></a>
</div>
<br>

<!-- 상품 종류별로 이동 -->

<table style="width:900px; heigth:100px; border:1px solid gray; text-align:center;
"> 
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

<!-- 검색창 -->
<form action="searchProduct.do" method="get">
	
	<input type=text name="searchValue" id="searchValue" placeholder="검색어....." >
	
	<button type="submit">검색</button>
</form>

<br><br>
<b>[BEST 3]</b>
<br><br>

<table style="
	width: 70%;
	margin-left:15%;
	margin-right:15%;
	text-align:center;">
	<tbody>
		<c:forEach var="bestProduct" items="${productBestList}">
		<td width="300">
			<a href="productDetail.do?p_code=${bestProduct.P_CODE}">
			<img src="img/${bestProduct.P_IMAGE}" width="200" id="previewImage"></a>
		</td>
		</c:forEach>
	</tbody>
</table>

<b>[NEW 3]</b>
<br><br>

<table>
	<tbody>
		<c:forEach var="newProduct" items="${productNewList}">
		<td width="300">
			<a href="productDetail.do?p_code=${newProduct.P_CODE}">
			<img src="img/${newProduct.P_IMAGE}" width="200" id="previewImage"></a>
		</td>
		</c:forEach>
	</tbody>
</table>

</body>
</html>