<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
	<!-- Include jquery -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css?v=<%=System.currentTimeMillis()%>">
		
	<script>
		// 포커스 이동
		function focusdiv() {
			console.log("focus 실행");
			document.getElementById("divFocus").tabIndex = -1;
			document.getElementById("divFocus").focus();
		
			// 사용법 <a href="javascript:focusdiv();">
		}
		
		// 주문 처리 현황 값이 NULL이면 0으로 변경
		function orderProc() {
			if (<%= request.getAttribute("배송대기") %> == null)
			$('#o_proc_val1').text("0");
			if (<%= request.getAttribute("배송준비중") %> == null)
			$('#o_proc_val2').text("0");
			if (<%= request.getAttribute("배송중") %> == null)
			$('#o_proc_val3').text("0");
			if (<%= request.getAttribute("베송완료") %> == null)
			$('#o_proc_val4').text("0");
			
			console.log(sessionStorage.length);
		}
		
		// 메인페이지 이동
		function main() {
			location.href = "/IDMB/mainpageProductList.do";
		}
		
		// 최근 본 상품
		function viewedProduct() {
			var Arr = [];
			var Obj = new Object();
			var temp;
			
			for (var i=0; i<sessionStorage.length; i++) {
				temp = sessionStorage.getItem(i);
				Obj[i] = temp;
				Arr = { P_CODE : Obj };	
			}
			
			$.ajax({
				url :"viewedProductAjax.do",
				data: Arr,
				type : "post",
				dataType : "json",
				
				success: function(data) {
					console.log("성공");
				  }
			});
		}
		
		function productDetail(p_code) {
			
			/* var Obj = new Object();
			Obj["P_CODE"] = p_code;
			console.log("1 " + Obj["P_CODE"]);
			console.log("3 " + p_code);
			
			$.ajax({
				url :"productDetailAjax.do",
				data: Obj,
				type : "post",
				dataType : "json",
				
				success: function(data) {
					console.log("성공");
					
				  }
			}); */
			
			location.href = "productDetail.do?p_code=" + p_code;
		}
		
		function qnaDetail(q_num) {
			location.href = "qnaDetail.do?q_num=" + q_num;
		}
		
		// 페이지 로딩 시, 자동 실행
		$(document).ready(function() {
			orderProc();
			viewedProduct();
		});
		
	</script>
	
	<title>IDMB</title>
	
</head>
<body>
	<div class="wrap">
		<div>
			<h2>마이페이지</h2>
		</div>
		
		<div>
			<p><a href="/IDMB/myInfoModifyForm.do">회원정보 수정</a> | 배송주소록 관리</p>
		</div>
		
		<div>
			<img src="/IDMB/resources/img/user.png" style="width:200px; height:200px; padding:15px" />
			
			<div class="leftVertical">
				<p>${name}님, 환영합니다.</p>
				<br/>
				<p>
					<a href="/IDMB/myOrderList.do">주문내역</a> | 
					<a href="/IDMB/basketList.do">장바구니</a> | 
					관심상품 | 
					최근 본 상품 | 
					<a href="/IDMB/qnaList.do">내 게시글</a>
				</p>
				
				<table>
					<tr>
						<td>
							<p>총 주문</p>
							<p>331,944,300원</p>
						</td>
						
						<td>
							<p>적립금</p>
							<p>${reserve}원 <button>조회</button></p>
						</td>
						
						<td>
							<p>쿠폰</p>
							<p>3개 <button>조회</button></p>
						</td>
					</tr>
				</table>
			</div>
		</div>
		
		<div>
			<div class="vertical">
			<p>- 회원님의 혜택 정보 -</p>
				
				<div class="vertical">
					<p>[welcome] 등급 회원입니다.</p>
					<p>[lucky] 등급까지 남은 구매금액은 30,000,000원입니다.</p>
					<p>승급 기준에 따른 예상 금액이므로 총 주문 금액과 다를 수 있습니다.</p>
				</div>
			</div>
		</div>
		
		<div>
			<div class="vertical">
				<p>- 주문 처리 현황 -</p>
				
				<div class="vertical">
					<table>
						<tr>
							<td class="button_tr" onclick="alert('aa')">
								<p id="o_proc_key1">배송대기</p>
								<p id="o_proc_val1"><%= request.getAttribute("배송대기") %></p>
							</td>
							
							<td class="button_tr" onclick="alert('aa')">
								<p id="o_proc_key2">배송준비중</p>
								<p id="o_proc_val2"><%= request.getAttribute("배송준비중") %></p>
							</td>
							
							<td class="button_tr" onclick="alert('aa')">
								<p id="o_proc_key3">배송중</p>
								<p id="o_proc_val3"><%= request.getAttribute("배송중") %></p>
							</td>
							<td class="button_tr" onclick="alert('aa')">
								<p id="o_proc_key4">배송완료</p>
								<p id="o_proc_val4"><%= request.getAttribute("배송완료") %></p>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		
		<div>
			<div class="vertical">
				<p>- 주문 상품 정보 -</p>
				
				<table>
				    <thead>
				        <tr>
				            <th>주문번호</th>
				            <th>이미지</th>
				            <th>상품정보</th>
				            <th>수량</th>
				            <th>상품구매금액</th>
				            <th>배송상태</th>
				        </tr>
			        </thead>
			        
			        <c:forEach var="order" items="${myOrderList}">
				        <tr class="button_tr" onclick="orderDetail(${order.O_NUM})">
					        <td>
					        	<p>${order.O_DATE}</p>
					        	<p id="orderNum${order.O_NUM}">P00929${order.O_NUM}</p>
					        </td>
					        <td><img src="/IDMB/img/${order.P_IMAGE}" /></td>
					        <td>${order.O_NAME}</td>
					        <td>${order.O_COUNT}</td>
					        <td>${order.O_TOTAL}원</td>
					        <td>${order.O_STATUS}</td>
				        </tr>
				    </c:forEach>
				</table>
			</div>
		</div>
		
		<div>
			<div class="vertical">
				<p>- 최근 본 상품 -</p>
				
				<table>
					<thead>
						<tr>
							<td>이미지</td>
							<td>상품명</td>
							<td>종류</td>
							<td>판매가</td>
							<td>찜</td>
						</tr>
					</thead>
					
					<c:forEach var="product" items="${viewedProduct}">
						<tr class="button_tr" onclick="productDetail(${product.P_CODE})">
							<td><img src="/IDMB/img/${product.P_IMAGE}" /></td>
							<td>${product.P_NAME}</td>
							<td>${product.P_KIND}</td>
							<td>${product.P_PRICE}</td>
							<td>${product.P_ZIM}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		
		<div>
			<div class="vertical">
				<p>- 내 게시글 -</p>
				
				<table>
					<tr>
						<td>번호</td>
						<td>분류</td>
						<td>제목</td>
						<td>작성자</td>
						<td>작성일</td>
						<td>상태</td>
					</tr>
					
					<c:forEach var="qna" items="${myQnaList}">
				        <tr class="button_tr" onclick="qnaDetail(${qna.Q_NUM})">
					        <td>${qna.Q_NUM}</td>
					        <td>${qna.Q_CATEGORY}</td>
					        <td>${qna.Q_TITLE}</td>
					        <td>${qna.Q_ID}</td>
					        <td>${qna.Q_DATE}</td>
					        <td>${qna.Q_STATUS}</td>
				        </tr>
				    </c:forEach>
				    
				</table>
			</div>
		</div>
		
		<div>
			<div class="vertical">
				<p>- 내가 작성한 리뷰 -</p>
				
				<table>
					<tr>
						<td>번호</td>
						<td>제목</td>
						<td>작성자</td>
						<td>작성일</td>
						<td>조회</td>
					</tr>
					
					<c:forEach var="review" items="${myReviewList}">
				        <tr class="button_tr" onclick="alert('aa')">
					        <td>${review.R_NUM}</td>
					        <td>${review.R_NAME}</td>
					        <td>${review.R_ID}</td>
					        <td>${review.R_DATE}</td>
					        <td>${review.R_RECOMMEND}</td>
				        </tr>
				    </c:forEach>
				</table>
			</div>
		</div>
		
		
		
	</div>
</body>
</html>