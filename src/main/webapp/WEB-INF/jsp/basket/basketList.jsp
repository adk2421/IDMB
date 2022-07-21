<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장바구니 목록</title>
<script>
	

</script>
</head>
<body>
	<div align="right">
		<a href="/IDMB/logout.do">LOGOUT</a>
		<a href="/IDMB/join.do">JOIN</a>
		<a href="/IDMB/mypage.do">MY PAGE</a>
		<a href="/IDMB/order.do">ORDER</a>
		<a href="/IDMB/community.do">COMMUNITY</a>
	</div>
	
	<div style="text-align:center">
		<h2>장바구니 확인</h2>
	</div>
	
	<br>
	<c:choose>
		<c:when test="${basket.B_NUM == 0 }">
			장바구니가 비어있습니다.
		</c:when>
		<c:otherwise>
		<form name="form1" id="form1" method="post" action=${path}/jsp/basket/basketUpdate.do">
		<div class="basketList"><!-- basketList div start -->	
			<table border="1">
				<tr>
					<th><input type="checkbox" name="allProductcheck"/>상품명</th>
					<th>상품 금액</th>
					<th>수량</th>
					<th>금액</th>
					<th>목록 삭제</th>
				</tr>
				<c:forEach var="basket" items="${basket.list}"varStatus="i">
				
				<tr>
					<td><!-- 상품명 -->
						${basket.B_NAME}
					</td>
					<!-- 상품 금액 -->
					<td style="width: 80px" align="right">
						<fmt:formatNumber pattern="###,###,###" value="${product.P_PRICE}"/>
					</td>
					<!-- 수량 -->
					<td>
						<input type="number"style="width: 40px"name="" value=""/>
						<input type="hidden" name="p_code" value="${basket.B_COUNT}"/>
					</td>
					<!-- 금액 -->
					<td stype="width: 100px" align="right">
						<fmt:formatNumber pattern="###,###,###" value="${basket.B_PRICE}"/>
					</td>
					<!-- 목록삭제 -->
					<td align="center">
						<a href="${path}/jsp/basket/delete.do?basketId=${basket.B_NUM}">삭제</a>
					</td>
				</tr>
			</c:forEach>
			
			<tr>
				<td colspan="5" align="right">
					배송료 : <br>
					총 구매 금액 :<fmt:formatNumber pattern="###,###,###" value=""/>
				</td>
			</tr>
			</table>
			</div> <!-- BasketList div end -->
			<input type="hidden" name="count" value=""/>
			<button type="submit" id="btnUpdate">주문하기</button>
			<button type="button" id="btnList">계속 쇼핑하기</button>
		
		</form>
		</c:otherwise>
	</c:choose>
</body>
</html>