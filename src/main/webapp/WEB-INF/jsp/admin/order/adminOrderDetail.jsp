<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
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
<form method="post" id="orderCancel" action="adminCancelOrder.do?o_num=${adminOrderBean.O_NUM}">
	<table border=1>
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
				<td>${adminOrderBean.O_TOTAL}</td>
				<td>${adminOrderBean.O_NAME}</td>
				<td>${adminOrderBean.O_COUNT}</td>
				<td>
					<button type="button" onclick="orderCancel()">주문취소</button>
				</td>
			</tr>
		</tbody>
	</table>
	<br/>
</form>
	
<form method="post" id="orderDetailForm" action="adminUpdateOrder.do?o_num=${adminOrderBean.O_NUM}">		
	<table border=1>
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
					01011112222
				</td>
			</tr>
			<tr>
				<td><b>우편번호</b></td>
				<td>${adminOrderBean.O_POSTCODE}</td>
				<td><b>주소</b></td>
				<td>${adminOrderBean.O_ADDRESS1}</td>
			</tr>
			<tr>
				<td><b>상세주소</b></td>
				<td colspan="3">${adminOrderBean.O_ADDRESS2}</td>
			</tr>
			<tr>
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
			</tr>
		</tbody>
	</table>	
	<br/>
	<button type="button" onClick="check()">수 &emsp; 정</button>
         &emsp;&emsp;
	<button type="button" onclick="cancel()">취 &emsp; 소</button>	
</form>
</body>
</html>