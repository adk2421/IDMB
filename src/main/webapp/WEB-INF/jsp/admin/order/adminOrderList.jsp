<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/adminorder.css" type="text/css">
<meta charset="UTF-8">
<title>일단메봐</title>
</head>
<body>

	<!-- 관리자 메인 툴바 -->
	<div>
		<a href="adminMain.do"><img alt="adminlogo" src="img/adminLogo.png" ></a>
		<div align="right">
		<ul style="list-style-type:none">
			<li style="display:inline"><a href="adminMemberList.do" >회원 관리</a></li>
			<li id="title-text1"style="display:inline"><a href="adminProductList.do" >상품 관리</a></li>
			<li id="order-ad"style="display:inline"><a href="adminOrderList.do" >주문 관리</a></li>
			<li id="title-text1"style="display:inline"><a href="adminNoticeList.do" >게시판 관리</a></li>
		</ul>	
		</div>
	</div>
	<hr>

	<div style="margin:auto; text-align: center;">
	<form action="adminOrderList.do" method="get">
		<select name="ostatus" id="ostatus">
			<option value="" <c:if test="${ostatus == null}">selected</c:if>>전체</option>
			<option value="wait" <c:if test="${ostatus =='wait'}">selected</c:if>>배송 대기</option>
			<option value="ing" <c:if test="${ostatus =='ing'}">selected</c:if>>배송 중</option>
			<option value="fin" <c:if test="${ostatus =='fin'}">selected</c:if>>배송 완료</option>			
		</select>
		<input type="search" name="searchValue" id="search" placeholder="주문자명 ..." value="${searchValue}"/>
		<button class="search-icon" href=""><i class="fa fa-search"></i></button>
	</form>
	</div>
	
	<table style="margin:auto; text-align: center;" border=1>
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
	${paging.pageHtml}
</body>
</html>