<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니에서 주 문 하 기</title>
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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/orderform.css?v=<%=System.currentTimeMillis()%>">


<script>
function orderCheck() {
	var form = document.getElementById("basketOrderForm");
	var O_RECIEVER = document.getElementById("o_reciever");
	var O_ADDRESS1 = document.getElementById("o_address1");
	var O_ADDRESS2 = document.getElementById("o_address2");
	var O_POSTCODE = document.getElementById("o_postcode");
	
	if(confirm("주문하시겠습니까?") == true) {
		if(O_RECIEVER.value.trim() == ""){
			alert("이름을 입력해주세요.");
			O_RECIEVER.focus();
			return false;
		} else if(O_POSTCODE.value.trim() == ""){
			alert("우편번호를 입력해주세요.");
			O_POSTCODE.focus();
			return false;
		} else if(O_ADDRESS1.value.trim() == ""){
			alert("주소를 입력해주세요.");
			O_ADDRESS1.focus();
			return false;
		} else {
			form.submit();
		}
	}
}

</script>

<!-- 우편 번호 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("o_address1").value = extraAddr;
                
                } else {
                    document.getElementById("o_address2").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('o_postcode').value = data.zonecode;
                document.getElementById("o_address1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("o_address2").focus();
            }
        }).open();
    }
</script>

</head>
<div style="text-align:center">
		<h1> 주문 페이지 </h1>
	</div>
	

	<form method="post" id="basketOrderForm" action="basketOrder.do?b_num=${basketBean.B_NUM}">
		<table class="table table-borderless">
			<thead class="table-light">
			<!-- 상품 정보 -->
				<tr>
					<th scope="col">상&emsp;품</th>			
					<th scope="col">상 품 명</th>
					<th scope="col">상 품 금 액</th>
					<th scope="col">구 매 수 량</th>
					<th scope="col">총 합 계</th>
				</tr>
			</thead>
			<c:set var="sum" value="0" />	
			<tbody>
				<tr>
					<td><img src="img/${basketBean.B_IMAGE}" width="60" border="0" id="previewImage"></td>
					<td>${basketBean.B_NAME}</td> 
					<td>${basketBean.B_PRICE}원</td>
					<td>${basketBean.B_COUNT}개</td>
					<td>${basketBean.B_COUNT * basketBean.B_PRICE }원</td>
					
				</tr>
			</tbody>
		</table>
		<c:set var="sum" value="${sum + (basketBean.B_PRICE * basketBean.B_COUNT)}" />
		
		<input type="hidden" id="o_id" name="o_id" value="${basketBean.B_ID}"/>
		<input type="hidden" id="o_code" name="o_code" value="${basketBean.B_CODE}">
		<input type="hidden" id="o_name" name="o_name" value="${basketBean.B_NAME}">
		<input type="hidden" id="o_count" name="o_count" value="${basketBean.B_COUNT}">		
		<input type="hidden" id="o_price" name="o_price" value="${basketBean.B_PRICE}">
		
		<div class="order_info" >
		<!-- 주문자 정보 -->
		<h2>주문자 정보</h2>
		
		<!-- 이름 -->
		<h6>이 름
			<input type="text" value="${name}" readonly>	
		</h6>
		
		<!-- 핸드폰 번호 -->
		<h6>핸 드 폰 번 호
			<input type="text" id="o_phone" name="o_phone" maxlength="11" value="${phone}" >
		</h6>
		</div>
		
		<hr>
		<br><br>				
		<hr>
		
		<div class="orderaddress">
		<!-- 받는 사람 정보 -->
		<h6>받으시는 분
		<input type="text" id="o_reciever" name="o_reciever" value="${name}">
		</h6>	
			
		<!-- 주소 -->
		<h6>우편번호 &nbsp;
		<input type="text" name="o_postcode" id="o_postcode"
			value="${postcode}">
								
		<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
		</h6>		
						
		<h6>주소&nbsp;&nbsp;
		<input type="text" name="o_address1" id="o_address1"
			value="${address1}">
		-
		<input type="text" name="o_address2" id="o_address2"
			value="${address2}">
		</h6>
		</div>
														
		<hr>
		<br><br>	
						
		<h2> 결 제 금 액 </h2>
		<br>
		
		<div class="sum">		
		<span>주 문 금 액</span>
		<span><fmt:formatNumber pattern="###,###,###" value="${sum}" />원</span>
			&emsp;
	    <span>배 송 비</span>
	    <span>3000원</span>
	    &emsp;
	    						 
	    <span>총 금 액</span>
	    <span><fmt:formatNumber pattern="###,###,###" value="${sum+3000}" />원</span>
	    <input type="hidden" id="o_total" name="o_total" value="${sum+3000}">
				
		<br><br>	
		<h2> 결 제 정 보 </h2>
		<h6>무 통 장 입 금</h6>
		<input type="text" value="우리은행 1234-56-7890" readonly>
				
		<!-- 버튼 -->
		<button type="button" onclick="orderCheck()">주문하기</button>
		
		<br><br>
		</div>
		
	</form>	
</body>
</html>