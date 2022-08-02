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
<!-- Bootstrap CSS CDN -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
		crossorigin="anonymous">
	<!-- Bootstrap JS CDN -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" 
		crossorigin="anonymous"></script>

	<!-- css연결 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/orderlist.css?v=<%=System.currentTimeMillis()%>">

<script>

</script>

</head>
<body>

	<div style="text-align:center">
		<p>
		<h1> 주 문 조 회 </h1>
	</div>
	
	<table class="table table-borderless">
    	<thead class="table-light">
       		<tr>
            	<th scope="col">주문상품코드</th>
            	<th scope="col">주문상품이름</th>
            	<th scope="col">주문날짜</th>
            	<th scope="col">주문개수</th>
            	<th scope="col">주문가격</th>
            	<th scope="col">총&emsp;합</th>
            	<th scope="col">배송상태</th>
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
