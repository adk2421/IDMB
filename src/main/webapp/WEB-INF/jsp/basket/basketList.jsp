<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장바구니 목록</title>

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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/basket.css?v=<%=System.currentTimeMillis()%>">


</head>
<body>

<div class="header">	
		<h2>장바구니 확인</h2>
</div>	
<div class="container">
		<!-- 상품정보 div -->	
		<div class="basketList">
			<table class="table table-borderless">
				<thead class="table-light">
				<tr>
					<th width="150">상품명</th>
					<th width="150">상품금액</th>
					<th>수량</th>
					<th>총 금액</th>
					<th>기능</th>
					<th>주문하기</th>
				</tr>
				</thead>
		
		
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
					<td width="150">
						${basket.B_NAME}
						<input type="hidden" name="b_name" id="b_name" value="${basket.B_NAME}">
						<input type="hidden" name="b_id" id="b_id" value="${basket.B_ID}">
						<input type="hidden" name="b_code" id="b_code" value="${basket.B_CODE}">						
						<input type="hidden" name="b_image" id="b_image" value="${basket.B_IMAGE}">
						<input type="hidden" name="b_kind" id="b_kind" value="${basket.B_KIND}">
					</td>
					<!-- 상품 금액 -->
					<td width="150">
						<fmt:formatNumber pattern="###,###,### 원"	value="${basket.B_PRICE}"/>
						<input type="hidden" name="b_price" id="b_price" value="${basket.B_PRICE}">
					</td>
					<!-- 수량 -->
					<td>
						<input class="counter" type="number" min="1" style="width: 40px"
							name="b_count" id="b_count"	value="${basket.B_COUNT}"/>
					</td>
					<!-- 총 금액 -->
					<td width="250">
						<fmt:formatNumber pattern="###,###,### 원" value="${basket.B_PRICE * basket.B_COUNT}"/>
					</td>
					
				
					<!-- 기능 -->
					<td align="center">
						<input class="update" type="submit" value="수정">
						<button class="delete" type="button" onclick="location.href='deleteBasket.do?b_num=${basket.B_NUM}'">삭제</button>
					</td>
					
					<td>
						<script>
							function bOrder() {
								if(confirm("장바구니 상품을 주문하시겠습니까?") == true){
									location.href='basketOrderForm.do?b_num=${basket.B_NUM}';
								}	
							}
						</script>			
						<button class="order" type="button" onclick="bOrder()">주문하기</button>
					</td>
					
					</form>
				</tr>	
				</c:forEach>
				
				
				<tr>
					<td id="sum_price" colspan="6" align="right">
						<span>배송료 : 3000 원<br></span>
						<c:set var="sum" value="0"/>
						<c:forEach var="basket" items="${basketList}">
							<c:set var="sum" value="${sum + basket.B_PRICE * basket.B_COUNT}"/>
						</c:forEach>
						<span>총 주문 금액 : <fmt:formatNumber pattern="###,###,### 원" value="${sum}"/></span>
					</td>
				</tr>				
				</c:otherwise>
				
			</c:choose>
			</table>
		
		</div>
</div><!-- container div end -->		
<div class="footer1">
	<div class="button">			
		<c:forEach var="basket" items="${basketList}" begin="1" end="1">
		
		<script>
			function blistOrder() {
				if(confirm("장바구니 상품을 전부 주문하시겠습니까?") == true){
					location.href='basketListOrderForm.do?b_id=${basket.B_ID}';
				}	
			}
		</script>
		
			<button class="allorder" type="button" onclick="blistOrder()">전체 주문하기</button>
			<button class="back" type="button" onclick="location.href='searchProduct.do'">계속 쇼핑하기</button>
		</c:forEach>
	
	</div>
</div>
</body>
</html>