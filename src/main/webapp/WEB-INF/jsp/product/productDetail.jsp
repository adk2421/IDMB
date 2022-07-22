<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 보기</title>
</head>
<body>
<h2>상품 상세정보</h2>
<table border ="1">
<tr>
<td>
<img src="img/bag9.jpg"  width="200" height="250" border="0" id="previewImage">
</td>
<td>
<table boder = "1" style = "height: 300px; width: 500px;">
<tr align = "center">
<td> 상품명</td> 
<td>${product.P_NAME}</td>
</tr>
<tr align = "center">
<td>가격</td>
<td><fmt:formatNumber value="${product.P_PRICE}" pattern="###,###,###"/></td> 
</tr>
<tr align = "center">
<td>종류</td>
<input type="
<tr align = "center">
<td>구매수량</td>
<td>
<input type="hidden" name="P_CODE" value="${product.P_COUNT}"/>
<select name = "">
</select>&nbsp;개
<tr align = "center">
<td> 총 구매 금액</td>
<fmt:formatNumber pattern="###,###,###" value="${product.P_PRICE}"/>

<form action=".do" method="get">
<input type = "submit" value = "바로 구매하기">
</form>
<form action="basketList.do" method="get">
<input type = "submit" value = "장바구니">
</form>
<p><button onclick="alert('찜하기가 완료되었습니다.')">찜하기</button></p>

</tr>





</table>
</body>
</html>