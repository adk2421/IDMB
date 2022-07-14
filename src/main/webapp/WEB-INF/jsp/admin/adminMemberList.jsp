<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일단메봐</title>
</head>

<body>
		
	<table>
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>가입일</th>
				<th>탈퇴여부</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="member" items="${adminMemberBeanList}">
		<tr>
			<td>${member.ID}</td>
			<td>${member.NAME}</td>
			<td>${member.JOINDATE}</td>
			<td>${member.DELFLAG}</td>
		</tr>
		</c:forEach>
	</tbody>
	</table>
	
	
</body>
</html>