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
<title>신상품 목록</title>
</head>
<body>
<form action="newProductList.do" method="get">
<input type=text name="searchValue"  id="searchValue" placeholder="검색어...." value="${searchValue}">
	<br>
검색 가격
	<input type=text name="priceValue1"  id="priceValue1" placeholder="최소금액...." value="${priceValue1}"> ~ 
	<input type=text name="priceValue2"  id="priceValue2" placeholder="최대금액...." value="${priceValue2}">

	<input type="submit" value="검색"/>
</form>
</body>
</html>