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
		<h1> �ֹ� ������ </h1>
	</div>
	
	<form method="post" id="basketOrderForm" action="basketOrder.do">
	
	<table border=1>
			<thead>
				<tr>
					<th>�� ǰ ��</th>
					<th>�� ǰ �� ��</th>
					<th>�� �� �� ��</th>
					<th>�� �� ��</th>
				</tr>
			</thead>	
			<tbody>
				<c:forEach var="bList" items="${basketList}">
				<tr>
					<td>${bList.B_NAME }</td>
					<td>${bList.B_PRICE }��</td>
					<td>${bList.B_COUNT}��</td>
					<td>${bList.B_COUNT * bList.B_PRICE }</td>
				</tr>
				</c:forEach>
			</tbody>
			
	</table>
		
	</form>	
</body>
</html>