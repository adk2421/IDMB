<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myOrderList</title>
<style>
    tr{
    text-align: center;}
    td{
    text-align: center;}
</style>
</head>
<body>

<table border=1>
    <thead>
        <tr>
            <th>주문상품코드</th>
            <th>주문상품이름</th>
            <th>주문날짜</th>
            <th>주문개수</th>
            <th>주문가격</th>
            <th>총&emsp;합</th>
            <th>배송상태</th>
        </tr>
        </thead>
        <c:forEach var="order" items="${myOrderList}">
        <tr>
        <td>${order.O_CODE}</td>
        <td>${order.O_NAME}</td>
        <td>${order.O_DATE}</td>
        <td>${order.O_COUNT}</td>
        <td>${order.O_PRICE}</td>
        <td>${order.O_TOTAL}</td>
        <td>${order.O_STATUS}</td>
        </tr>
    </c:forEach>

</table>
</body>
</html>
