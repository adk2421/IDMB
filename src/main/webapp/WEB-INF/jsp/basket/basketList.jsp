<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장바구니 목록</title>
<script>

</script>
</head>
<body>
	
	<div style="text-align:center">
		<h2>장바구니 확인</h2>
	</div>
	
	<br>
			 
		<!-- basketList div start -->	
		<div class="basketList">
			<table border="1">
				<tr>
					<th>상품명</th>
					<th>상품 금액</th>
					<th>수량</th>
					<th>총 금액</th>
					<th>기능</th>
					<th>주문하기</th>
				</tr>
			<c:choose>
				<c:when test="${basketList == null || fn:length(basketList) == 0 }">
				<tr>
					<td colspan="6">
						장바구니가 비어있습니다!
						<!-- 상품페이지로 이동하는 링크가 추가되면 좋겠음. -->
					</td>
				</tr>
				</c:when>
				
				<c:otherwise>
				<c:forEach var="basket" items="${basketList}">
				<tr>
					<form method="post" action="updateBasket.do?b_num=${basket.B_NUM}">
					<!-- 상품명 -->
					<td>
						${basket.B_NAME}
						<input type="hidden" name="b_name" id="b_name" value="${basket.B_NAME}">
						<input type="hidden" name="b_id" id="b_id" value="${basket.B_ID}">
						<input type="hidden" name="b_code" id="b_code" value="${basket.B_CODE}">						
						<input type="hidden" name="b_image" id="b_image" value="${basket.B_IMAGE}">
						<input type="hidden" name="b_kind" id="b_kind" value="${basket.B_KIND}">
					</td>
					<!-- 상품 금액 -->
					<td style="width: 80px" align="right">
						<fmt:formatNumber pattern="###,###,### 원"	value="${basket.B_PRICE}"/>
						<input type="hidden" name="b_price" id="b_price" value="${basket.B_PRICE}">
					</td>
					<!-- 수량 -->
					<td>
						<input type="number" min="1" style="width: 40px"
							name="b_count" id="b_count"	value="${basket.B_COUNT}"/>
					</td>
					<!-- 총 금액 -->
					<td style="width: 100px" align="right">
						<fmt:formatNumber pattern="###,###,### 원" value="${basket.B_PRICE * basket.B_COUNT}"/>
					</td>
					<!-- 기능 -->
					<td align="center">
						<input type="submit" value="수정">
						<button type="button" onclick="location.href='deleteBasket.do?b_num=${basket.B_NUM}'">삭제</button>
					</td>
					<td>
						<button type="button" 
							onclick="location.href='basketOrderForm.do?b_num=${basket.B_NUM}'">
						주문하기
						</button>
					</td>
					
					</form>
				</tr>	
				</c:forEach>

				<tr>
					<td colspan="6" align="right">
						배송료 : 3000 원<br>
						<c:set var="sum" value="0"/>
						<c:forEach var="basket" items="${basketList}">
							<c:set var="sum" value="${sum + basket.B_PRICE * basket.B_COUNT}"/>
						</c:forEach>
						총 주문 금액 : <fmt:formatNumber pattern="###,###,### 원" value="${sum}"/>
					</td>
				</tr>				
				</c:otherwise>
			</c:choose>
			</table>
		</div>
		<!-- BasketList div end -->
				
	<c:forEach var="basket" items="${basketList}" begin="1" end="1">
		<button type="button" onclick="location.href='basketListOrderForm.do?b_id=${basket.B_ID}'">주문하기</button>
		<button type="button" onclick="location.href='searchProduct.do'">계속 쇼핑하기</button>
	</c:forEach>
</body>
</html>