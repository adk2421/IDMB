<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/adminod.css" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>일단메봐</title>

<script>
function cancel() {
	location.href = "/IDMB/adminOrderList.do";
}

function check() {
	var orderDetailForm = document.getElementById("orderDetailForm");
	if(confirm("수정하시겠습니까?") == true){
		orderDetailForm.submit();
		return true;
	}
}

function orderCancel(){
	var orderCancel = document.getElementById("orderCancel")
	if(confirm("주문을 취소 하시겠습니까?") == true){
		orderCancel.submit();
		return true;
	}
}
</script>

</head>
<body>

	<!-- 관리자 메인 툴바 -->
	<div class="header">
		<a href="adminMain.do"><img alt="adminlogo" src="img/adminLogo.png" ></a>
		<div class="box1" align="right">
		<ul style="list-style-type:none">
			<li style="display:inline"><a href="adminMemberList.do" >회원 관리</a></li>
			<li id="title-text1"style="display:inline"><a href="adminProductList.do" >상품 관리</a></li>
			<li id="order-ad"style="display:inline"><a href="adminOrderList.do" >주문 관리</a></li>
			<li id="title-text1" style="display:inline"><a href="adminNoticeList.do" >게시판 관리</a></li>
		</ul>	
		</div>
	</div>
	<hr>
<div class="container">
<form method="post" id="orderCancel" action="adminCancelOrder.do?o_num=${adminOrderBean.O_NUM}">
	<table id="ordercancle-tb" style="margin:auto; text-align: center;" >
		<thead>
			<tr>
				<th>주문번호</th>
				<th>주문자</th>
				<th>주문금액</th>
				<th>상품명</th>
				<th>주문수량</th>
				<th>주문취소</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${adminOrderBean.O_NUM}</td>
				<td>${adminOrderBean.O_ID}</td>
				<td>
					<fmt:formatNumber value="${adminOrderBean.O_TOTAL}"
						pattern="###,###,###원"/>
				</td>
				<td>${adminOrderBean.O_NAME}</td>
				<td>${adminOrderBean.O_COUNT}개</td>
				<td>
					<button id="od-cancle"type="button" onclick="orderCancel()">주문취소</button>
				</td>
			</tr>
		</tbody>
	</table>
	<br/>
</form>
	
<form method="post" id="orderDetailForm" action="adminUpdateOrder.do?o_num=${adminOrderBean.O_NUM}">		
	<table id="orderForm-tb" style="margin:auto; text-align: center;" >
		<tbody>
			<tr>
				<td><b>주문번호</b></td>
				<td>${adminOrderBean.O_NUM}</td>
				<td><b>주문일자</b></td>
				<td>
					<fmt:formatDate value="${adminOrderBean.O_DATE}"
						pattern="yyyy년 MM월 dd일 a hh:mm"/>
				</td>
			</tr>
			<tr>
				<td><b>수취인</b></td>
				<td>${adminOrderBean.O_RECIEVER}</td>
				<td><b>연락처</b></td>
				<td>
					<fmt:formatNumber var="phonenum" value="${adminOrderBean.O_PHONE}" pattern="###,###,####"/>
					<c:out value="0${fn:replace(phonenum, ',', '-')}" />
				</td>
			</tr>
			<tr>
				<td><b>우편번호</b></td>
				<td>${adminOrderBean.O_POSTCODE}</td>
				<td colspan="2"></td>
			</tr>
			<tr>
				<td><b>주소</b></td>
				<td>${adminOrderBean.O_ADDRESS1}</td>
				<td><b>상세주소</b></td>
				<td>${adminOrderBean.O_ADDRESS2}</td>
			</tr>
			
			<tr id="status">
				<td><b>처리상태</b></td>
				<td colspan="3">
					<input type="radio" name="o_status" value="배송대기"
						<c:if test="${adminOrderBean.O_STATUS =='배송대기'}">checked</c:if>>
					배송 대기
					<input type="radio" name="o_status" value="배송중"
						<c:if test="${adminOrderBean.O_STATUS =='배송중'}">checked</c:if>>
					배송 중
					<input type="radio" name="o_status" value="배송완료"
						<c:if test="${adminOrderBean.O_STATUS =='배송완료'}">checked</c:if>>
					배송 완료
				</td>
			</tr>
			
		</tbody>
	</table>
	</form>	
	<br/>
	</div>
	
	<div class="footer">
		<div class="rcbtn">
			<button id="mbtn"type="button" onClick="check()">수 정</button>
			<button id="rmbtn"type="button" onclick="cancel()">취 소</button>
		</div>
	</div>	

</body>
</html>