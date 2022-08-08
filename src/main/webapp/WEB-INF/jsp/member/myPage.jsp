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
		function focusdiv(id) {
			console.log("focus 실행");
			document.getElementById(id).tabIndex = -1;
			document.getElementById(id).focus();
		
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
			location.href = "productDetail.do?p_code=" + p_code;
		}
		
		function qnaDetail(q_num) {
			location.href = "qnaDetail.do?q_num=" + q_num;
		}
		
		function reviewDetail(r_groupnum) {
			console.log(r_groupnum);
			location.href = "reviewDetail.do?r_groupnum=" + r_groupnum;
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
			
		</div>
		
		<div class="stdWidth">
			<img src="/IDMB/resources/img/user.png" style="width:200px; height:200px; padding:15px" />
			
			<div class="vertical">
				<p>${name}님, 환영합니다.</p>
				<p><a href="/IDMB/myInfoModifyForm.do">회원정보 수정</a></p>
				<p>
					<a href="javascript:focusdiv('orderList');">주문내역</a>　|　
					<!-- 관심상품　|　 -->
					<a href="javascript:focusdiv('viewedProduct');">최근 본 상품</a>　|　
					<a href="javascript:focusdiv('qnaList');">문의내역</a>　|　
					<a href="javascript:focusdiv('myReviewList');">나의 리뷰</a>
				</p>
				
				<table>
					<tr>
						<td>
							<p>총 주문</p>
							<p>331,944,300원</p>
						</td>
						
						<td>
							<p>적립금</p>
							<p>${reserve}원</p>
						</td>
						
						<td>
							<p>쿠폰</p>
							<p>3개 <button>조회</button></p>
						</td>
					</tr>
				</table>
			</div>
		</div>
		
		<div class="stdWidth">
			<div class="vertical">
				<div class="horizen">
					<img class="icon" src="/IDMB/resources/img/ICON_orderProc.png" /><span class="left">주문처리 현황</span>
				</div>
				
				<div class="vertical">
					<table>
						<tr>
							<td class="button_tr" onclick="alert('aa')">
								<p id="o_proc_key1">배송대기</p>
								<p class="count" id="o_proc_val1"><%= request.getAttribute("배송대기") %></p>
							</td>
							
							<td class="next_td">
								>
							</td>
							
							<td class="button_tr" onclick="alert('aa')">
								<p id="o_proc_key2">배송준비중</p>
								<p class="count" id="o_proc_val2"><%= request.getAttribute("배송준비중") %></p>
							</td>
							
							<td class="next_td">
								>
							</td>
							
							<td class="button_tr" onclick="alert('aa')">
								<p id="o_proc_key3">배송중</p>
								<p class="count" id="o_proc_val3"><%= request.getAttribute("배송중") %></p>
							</td>
							
							<td class="next_td">
								>
							</td>
							
							<td class="button_tr" onclick="alert('aa')">
								<p id="o_proc_key4">배송완료</p>
								<p class="count" id="o_proc_val4"><%= request.getAttribute("배송완료") %></p>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		
		<div class="stdWidth">
			<div class="vertical">
				<div class="horizen">
					<img class="icon" src="/IDMB/resources/img/ICON_orderList.png" /><span class="left">주문내역</span>
					<span class="right"><a href="/IDMB/myOrderList.do">더보기 ></a></span>
				</div>
				
				<table>
				    <thead>
				        <tr class="head" id="orderList" >
				            <th>주문번호</th>
				            <th>이미지</th>
				            <th>상품정보</th>
				            <th>수량</th>
				            <th>상품구매금액</th>
				            <th>배송상태</th>
				        </tr>
			        </thead>
			        
			        <c:if test="${myOrderList[0] eq null}">
			        	<tr>
			        		<td colspan="6">
			        			<p>주문하신 상품이 없습니다.</p>
			        		</td>
			        	</tr>
			        </c:if>
			        
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
		
		<div class="stdWidth">
			<div class="vertical">
				<div class="horizen">
					<img class="icon" src="/IDMB/resources/img/ICON_viewedProduct.png" /><span class="left">최근 본 상품</span>
				</div>
				
				<table>
					<thead>
						<tr class="head" id="viewedProduct">
							<th>이미지</th>
							<th>상품명</th>
							<th>종류</th>
							<th>판매가</th>
							<th>찜</th>
						</tr>
					</thead>
					
					<c:if test="${viewedProduct[0] eq null}">
			        	<tr>
			        		<td colspan="6">
			        			<p>최근 본 상품이 없습니다.</p>
			        		</td>
			        	</tr>
			        </c:if>
					
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
		
		<div class="stdWidth">
			<div class="vertical">
				<div class="horizen">
					<img class="icon" src="/IDMB/resources/img/ICON_QNA.png" /><span class="left">문의내역</span>
					<span class="right"><a href="/IDMB/myQnaList.do">더보기 ></a></span>
				</div>
				
				<table>
					<tr class="head" id="qnaList">
						<th>번호</th>
						<th>분류</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>상태</th>
					</tr>
					
					<c:if test="${myQnaList[0] eq null}">
			        	<tr>
			        		<td colspan="6">
			        			<p>작성하신 문의가 없습니다.</p>
			        		</td>
			        	</tr>
			        </c:if>
					
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
		
		<div class="stdWidth">
			<div class="vertical">
				<div class="horizen">
					<img class="icon" src="/IDMB/resources/img/ICON_review.png" /><span class="left">나의 리뷰</span>
					<span>　　　　　　　　</span>
					<span class="right"><a href="/IDMB/reviewList.do">더보기 ></a></span>
				</div>
				
				<div id="myReviewList">
					<hr/>
				</div>
				
				<c:if test="${myReviewList[0] eq null}">
        			<p>작성하신 리뷰가 없습니다.</p>
		        </c:if>
				
				<div class="leftVertical">
					<c:forEach var="review" items="${myReviewList}">
						<div class="horizen">
							<div>
								<img class="thumbnail" src="/IDMB/img/${review.P_IMAGE}" onclick="productDetail(${review.R_CODE})" />
							</div>
							
							<div class="leftVertical">
								<div class="width">
									<p>${review.R_NAME}</p>
									<p>${review.R_RATE}</p>
									<p class="contents">${review.R_CONTENTS}</p>
								</div>
								
								<c:if test="${review.A_CONTENTS != null}">
									<br/>
									<div>
										<input id="answer-btn" type="checkbox" />
	    								<label class="answer-btn" for="answer-btn">답글보기 ▼</label>
										<div class="answer">
											<p class="contents">${review.A_DATE}</p>
											<p class="contents">${review.A_CONTENTS}</p>
										</div>
									</div>
								</c:if>
							</div>
							
							<div class="right">
								<div>
									<p>${review.R_DATE}</p>
									<p><img class="icon" src="/IDMB/resources/img/ICON_like.png" />${review.R_RECOMMEND}</p>
								</div>
							</div>
						</div>
						
						<div>
							<hr/>
						</div>
				    </c:forEach>
			    </div>
				${paging.pageHtml}
			</div>
		</div>
		
		
		
	</div>
</body>
</html>