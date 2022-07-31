<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일단메봐</title>
<script>
function pinsert() {
	location.href = "/IDMB/adminInsertProductForm.do";
}
</script>
</head>
<body>

	<!-- 관리자 메인 툴바 -->
	<div>
		<a href="adminMain.do"><img alt="adminlogo" src="img/adminLogo.png" ></a>
		<div align="right">
		<ul style="list-style-type:none">
			<li style="display:inline"><a href="adminMemberList.do" >회원 관리</a></li>
			<li style="display:inline"><a href="adminProductList.do" >상품 관리</a></li>
			<li style="display:inline"><a href="adminOrderList.do" >주문 관리</a></li>
			<li style="display:inline"><a href="adminNoticeList.do" >게시판 관리</a></li>
		</ul>	
		</div>
	</div>
	<hr>
	<table style="margin:auto; text-align: center;" border=1>
		<thead>
			<tr>
				<th>종류</th>
				<th>상품명</th>
				<th>가격</th>
				<th>재고</th>
				<th>판매량</th>
				<th>기능</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="product" items="${adminProductList}">
		<tr>
			<td>${product.P_KIND}</td>
			<td><a href="productDetail.do?p_code=${product.P_CODE}">
				${product.P_NAME}</a></td>
			<td>
				<fmt:formatNumber value="${product.P_PRICE}" pattern="###,###,###원"/>
			</td>
			<td>${product.P_STOCK}개</td>
			<td>${product.P_SELL}개</td>
			<td><button type="button"
					onClick="location.href='adminUpdateProductForm.do?p_code=${product.P_CODE}'">
				수정</button>	
			</td>
			
		</tr>
		</c:forEach>
	</tbody>
	</table>
	
	<div style="margin:auto; text-align: center;">
	<form action="adminProductList.do" method="get">
		<button type="button" onClick="pinsert()">상품 등록</button>
			&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
		<input type="text" name="searchValue" id="searchValue" placeholder="상품명 ..." value="${searchValue}"/>
		<button type="submit">검색</button>
	</form>
	</div>
	${paging.pageHtml}

</body>
</html>