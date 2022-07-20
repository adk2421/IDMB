<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css?v=<%=System.currentTimeMillis()%>">
	
	<title>IDMB</title>
	
	<script>
		function focusdiv() {
			console.log("focus 실행");
			document.getElementById("divFocus").tabIndex = -1;
			document.getElementById("divFocus").focus();
			
			// 사용법 <a href="javascript:focusdiv();">
		}
	</script>
	
</head>
<body>
	<div class="wrap">
		<div>
			<h2>마이페이지</h2>
			<p style="text-align:right">회원정보 수정 | 배송주소록 관리</p>
		</div>
		
		<div>
			<img src="/IDMB/resources/img/user.png" style="width:200px; height:200px; padding:15px" />
			
			<div class="vertical">
				<p>${name}님, 환영합니다</p>
				<p>주문내역 | 장바구니 | 관심상품 | 최근 본 상품 | 내 게시글</p>
				
				<table>
					<tr>
						<td>
							<p>총 주문</p>
							<p>[getO_total]원</p>
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
							<td>
								<p>총 주문</p>
								<p>[getO_total]원</p>
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
		</div>
		
		<div>
			<div class="vertical">
				<p>- 주문 상품 정보 -</p>
				
				<table>
					<tr>
						<td>주문번호</td>
						<td>이미지</td>
						<td>상품정보</td>
						<td>수량</td>
						<td>상품금액</td>
						<td>주문처리상태</td>
					</tr>
					<tr>
						<td>주문번호</td>
						<td>이미지</td>
						<td>상품정보</td>
						<td>수량</td>
						<td>상품금액</td>
						<td>주문처리상태</td>
					</tr>
				</table>
			</div>
		</div>
		
		<div>
			<div class="vertical">
				<p>- 최근 본 상품 -</p>
				
				<table>
					<tr>
						<td>이미지</td>
						<td>상품명</td>
						<td>옵션정보</td>
						<td>판매가</td>
						<td>주문</td>
					</tr>
					<tr>
						<td>이미지</td>
						<td>상품명</td>
						<td>옵션정보</td>
						<td>판매가</td>
						<td>주문</td>
					</tr>
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
						<td>조회</td>
					</tr>
					<tr>
						<td>번호</td>
						<td>분류</td>
						<td>제목</td>
						<td>작성자</td>
						<td>작성일</td>
						<td>조회</td>
					</tr>
				</table>
			</div>
		</div>
		
		<div>
			<div class="vertical">
				<p>- 내가 작성한 리뷰 -</p>
				
				<table>
					<tr>
						<td>번호</td>
						<td>분류</td>
						<td>제목</td>
						<td>작성자</td>
						<td>작성일</td>
						<td>조회</td>
					</tr>
					<tr>
						<td>번호</td>
						<td>분류</td>
						<td>제목</td>
						<td>작성자</td>
						<td>작성일</td>
						<td>조회</td>
					</tr>
				</table>
			</div>
		</div>
		
		
		
	</div>
</body>
</html>