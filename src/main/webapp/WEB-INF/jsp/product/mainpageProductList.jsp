<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

<meta charset="UTF-8">
<title>상품 목록</title>
</head>
<body>
	<div id="menu">
	<ul>
		<li><a href="logout.do">LOGOUT</a></li>
		<li><a href="joinForm.do">JOIN</a></li>
		<li>CART</li>
		<li>MY PAGE</li>
		<li>ORDER</li>
		<li>COMMUNITY</li>
	</ul>
	</div>

<a href="mainpageProductList.do">
	<img src="img/logo.png"  width="150" height="180" border="0" id="previewImage">
</a>

		






<form action="searchProduct.do" method="get">
	<input type=text name="searchValue" id="searchValue" placeholder="검색어.....">
	
	<input type=hidden name="SORT" id="SORT" value="">
	<input type=hidden name="priceValue1" id="priceValue1" value="0">
	<input type=hidden name="priceValue2" id="priceValue2" value="99999999">
	
	<button type="submit">검색</button>
</form>

<table border=1>
	<tbody>
		<tr>
			<td>
				<a href="bestProductList.do"><b>BEST</b></a>
			</td>
			<td>
				<a href="newProductList.do"><b>NEW</b></a>
				
			</td>
			<td><b>숄더백</b></td>
			<td><b>크로스백</b></td>
			<td><b>메신저백</b></td>
			<td><b>클러치백</b></td>
			<td><b>백팩</b></td>
		</tr>
	</tbody>	
</table>


<b>[BEST 3]</b>

<table>
	<tbody>
	
	
		<td>
			<a href="productDetail.do?p_code=${product.P_CODE}">
			 
			<img src="img/FREITAG.jpg" width="200" border="" >
			 &emsp; &emsp;&emsp; &emsp;
			<img src="img/bag9.jpg" width="200" height="235"  border="" >
			&emsp; &emsp;&emsp; &emsp;
			<img src="img/ROREN2.jpg" width="200" border="0" >
			</a>
		</td>
	
	</tbody>
</table>




</body>
</html>