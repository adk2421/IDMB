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
	<form action="adminMemberList.do">
		<select name="SORT" id="SORT">
			<option value="id" <c:if test="${SORT=='id'}">selected</c:if>>아 이 디</option>
			<option value="name" <c:if test="${SORT=='name'}">selected</c:if>>이 &emsp; 름</option>
		</select>
		<input type="text" name="searchValue" id="searchValue"
			placeholder="검색어 ..." value="${searchValue}"/>
		<button type="submit">검색</button>
	</form>
	
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
			<td><a href="adminMemberDetail.do?ID=${member.ID}">
				${member.ID}</a></td>
			<td>${member.NAME}</td>
			<td>${member.JOINDATE}</td>
			<td>${member.DELFLAG}</td>
		</tr>
		</c:forEach>
	</tbody>
	</table>
	
	
</body>
</html>