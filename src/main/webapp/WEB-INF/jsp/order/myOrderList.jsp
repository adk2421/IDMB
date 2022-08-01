<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
<script>

</script>

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
        <c:choose>
       		<c:when test="${myOrderList == null || fn:length(myOrderList) == 0 }">
       		<tr>
       			<td colspan="7">
       				주문하신 상품이 없습니다!
       			</td>
       		</tr>
      		</c:when>
      		<c:otherwise>
			<c:forEach var="order" items="${myOrderList}">
       		<tr>
				<td>${order.O_CODE}</td>
				<td>${order.O_NAME}</td>
				<td>${order.O_DATE}</td>
				<td>${order.O_COUNT}개</td>
				<td>
					<fmt:formatNumber value="${order.O_PRICE}" pattern="###,###,###원"/>
				</td>
				<td>
					<fmt:formatNumber value="${order.O_TOTAL}" pattern="###,###,###원"/>
				</td>
				<td>${order.O_STATUS}</td>
			</tr>
			</c:forEach>     		
      		</c:otherwise>
        </c:choose>
</table>
</body>
</html>
