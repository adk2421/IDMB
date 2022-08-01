<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/adminMember.css" type="text/css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>일단메봐</title>
</head>

<body>

	<!-- 관리자 메인 툴바 -->
	<div class="header">
		<a href="adminMain.do"><img alt="adminlogo" src="img/adminLogo.png" ></a>
		<div align="right" class="box1">
		<ul style="list-style-type:none">
			<li id="member-ad"style="display:inline"><a href="adminMemberList.do" >회원 관리</a></li>
			<li id="title-text1" style="display:inline"><a href="adminProductList.do" >상품 관리</a></li>
			<li id="title-text1" style="display:inline"><a href="adminOrderList.do" >주문 관리</a></li>
			<li id="title-text1" style="display:inline"><a href="adminNoticeList.do" >게시판 관리</a></li>
		</ul>	
		</div>
	</div>
	<hr>
	
	<div class="container">
	<form action="adminMemberList.do" method="get">
	 <label> 검색어 </label>
		<select name="SORT" id="SORT">
			<option value="id" <c:if test="${SORT =='id'}">selected</c:if>>아 이 디</option>
			<option value="name" <c:if test="${SORT =='name'}">selected</c:if>>이 &emsp; 름</option>
			<option value="phone" <c:if test="${SORT =='phone'}">selected</c:if>>전 화 번 호</option>			
		</select>
		<input type="search" name="searchValue" id="search" placeholder="Search ..." value="${searchValue}"/>
		<button type="submit" class="search-icon" ><i class="fa fa-search"></i></button>
	</form>
	
	
	<table>
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>가입일</th>
				<th>탈퇴여부</th>
			</tr>
		</thead>
		<tbody>
	
		<c:choose>
			<c:when test="${adminMemberList == null || fn:length(adminMemberList) == 0 }">
			<tr>
				<td colspan="5">
					조회 결과가 없습니다.
				</td>
			</tr>
			</c:when>

			<c:otherwise>
			<c:forEach var="member" items="${adminMemberList}">
			<tr>
				<td><a href="adminMemberDetail.do?id=${member.ID}">
					${member.ID}</a></td>
				<td>${member.NAME}</td>
				<td>	
					<fmt:formatNumber var="phonenum" value="${member.PHONE}" pattern="###,###,####"/>
					<c:out value="0${fn:replace(phonenum, ',', '-')}" />
					</td>
				<td>
					<fmt:formatDate value="${member.JOINDATE}" pattern="yyyy년 MM월 dd일"/></td>
				<td>${member.DELFLAG}</td>
			</tr>
			</c:forEach>
			</c:otherwise>
		</c:choose>

	</tbody>
	</table>
</div>
<div class="footer">${paging.pageHtml}</div>	
	
</body>
</html>