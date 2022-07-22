<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일단메봐</title>
</head>
<body>
	<form action="adminOrderList.do" method="get">
		<select name="ostatus" id="ostatus">
			<option value="" <c:if test="${ostatus == null}">selected</c:if>>전체</option>
			<option value="wait" <c:if test="${ostatus =='wait'}">selected</c:if>>배송 대기</option>
			<option value="ing" <c:if test="${ostatus =='ing'}">selected</c:if>>배송 중</option>
			<option value="fin" <c:if test="${ostatus =='fin'}">selected</c:if>>배송 완료</option>			
		</select>
		<input type="text" name="searchValue" id="searchValue" placeholder="주문자명 ..." value="${searchValue}"/>
		<button type="submit">검색</button>
	</form>
	
	<table border=1>
		<thead>
			<tr>
				<th>주문번호</th>
				<th>주문일자</th>
				<th>주문자</th>
				<th>상품명</th>
				<th>주문금액</th>
				<th>주문상태</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="order" items="${adminOrderList}">
		<tr>
			<td>${order.O_NUM}</td>
			<td>
				<fmt:formatDate value="${order.O_DATE}"
					pattern="yyyy년 MM월 dd일"/>
			</td>
			<td>${order.O_ID}</td>
			<td>${order.O_NAME}</td>
			<td>${order.O_TOTAL}</td>
			<td>${order.O_STATUS}</td>
			<td><button type="button"
					onClick="location.href='adminOrderDetail.do?o_num=${order.O_NUM}'">
				수정</button>	
			</td>
		</tr>
	</c:forEach>
	</tbody>
	</table>

</body>
</html>