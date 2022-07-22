<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>basketForm</title>
</head>
<div style="text-align:center">
		<h1> 주문 페이지 </h1>
	</div>
	
	<form method="post" id="basketOrderForm" action="basketOrder.do">
	
	<table border=1>
			<thead>
				<tr>
					<th>상 품 명</th>
					<th>상 품 금 액</th>
					<th>구 매 수 량</th>
					<th>총 합 계</th>
				</tr>
			</thead>	
			<tbody>
				<c:forEach var="bList" items="${basketList}">
				<tr>
					<td>${bList.B_NAME }</td>
					<td>${bList.B_PRICE }원</td>
					<td>${bList.B_COUNT}개</td>
					<td>${bList.B_COUNT * bList.B_PRICE }</td>
				</tr>
				</c:forEach>
			</tbody>
			
	</table>
		
	</form>	
</body>
</html>