<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
	<title>상품 상세 보기</title>
	
	<!-- Include jquery -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
	<script>
	// 최근 본 상품 세션 등록
	$(document).ready(function() {
		// var maxCount = 10;
		var temp;
			
		// 세션 마지막 값부터 반복 시작
		for (var i=sessionStorage.length; i>0; i--) {
			// 현재 인덱스 앞에 있는 값을 저장
			temp = sessionStorage.getItem(i-1);	
			sessionStorage.setItem(i,temp);	
		}
			
		// 상세페이지로 들어온 상품코드 첫 번째 인덱스에 저장
		sessionStorage.setItem(0,${ProductDetail.P_CODE});
			
		console.log(sessionStorage);
	});
		
	</script>

	<script>
	
	function select(){ 
	   
	       // select element에서 선택된 option의 value가 저장된다.
	    var p_count = $('#count option:selected').val();
	    
	    var price = ${ProductDetail.P_PRICE};
	       
	    var totalprice = p_count*price;
	    document.getElementById("tp").value = totalprice;
	}
	
	function order(){
	var p_count = $('#count option:selected').val();
	
	    var price = ${ProductDetail.P_PRICE};
	       
	    var totalprice = p_count*price;
	    document.getElementById("tp").value = totalprice;
	    
	    location.href='/IDMB/orderForm.do?p_code=${ProductDetail.P_CODE}&p_count='+p_count
	    
	}
	
	 
	function basketCheck() {
		 var form = document.getElementById("insertBasketForm");
		 var b_count = $('#count option:selected').val();
		 document.getElementById("b_count").value = b_count
		 
		 if(confirm("장바구니에 담으시겠습니까?") == true){
			 form.submit();
		 }
		
	}
	
	</script>
<script>
function select(){ 
   
       // select element에서 선택된 option의 value가 저장된다.
    var p_count = $('#count option:selected').val();
    
    var price = ${ProductDetail.P_PRICE};
       
    var totalprice = p_count*price;
    document.getElementById("tp").value = totalprice;
}

function order(){
	if(${empty id}){
		if(confirm("회원만 구매하실수 있습니다! 회원가입 페이지로 이동하시겠습니까?")== true){
			location.href='/IDMB/joinForm.do';
		}
	}
	else{
		if(confirm("상품을 주문하시겠습니까?") == true){
			var p_count = $('#count option:selected').val();
		    var price = ${ProductDetail.P_PRICE}; 
		    var totalprice = p_count*price;
		    document.getElementById("tp").value = totalprice;
		    
		    location.href='/IDMB/orderForm.do?p_code=${ProductDetail.P_CODE}&p_count='+p_count;
		}
	}	
}

function productZim() {
	if(${empty id}){
		alert('로그인이 필요합니다!');
		location.href='/IDMB/loginForm.do';
	}
	else {
		
		if(confirm("상품을 찜하시겠습니까?") == true){
			if(${empty zimCheck}){
				var form = document.getElementById("insertZimForm");
				form.submit();
			}
			else {
				alert('이미 찜한 상품입니다.');
				return false;
			}
		}	
	}
}

function basketCheck() {
	if(${empty id}){
		alert('로그인이 필요합니다!');
		location.href='/IDMB/loginForm.do';
	} else{
		var form = document.getElementById("insertBasketForm");
		var b_count = $('#count option:selected').val();
		document.getElementById("b_count").value = b_count
		
		if(confirm("장바구니에 담으시겠습니까?") == true){
			 form.submit();
		}	
	}	
}

function insertReview() {
	if(${empty id}){
		alert('로그인이 필요합니다!');
		location.href='/IDMB/loginForm.do';
	} else {
		var form = document.getElementById("insertReviewForm");
		var R_CONTENTS = document.getElementById("r_contents");
		
		if(confirm("후기를 작성하시겠습니까?")== true){
			if(${empty orderIdCheck}){
				alert('상품을 구매한 이후에만 리뷰를 작성하실 수 있습니다!');
				return false;
			}
			else {
				form.submit();
			}
		}
	}
}
</script>
</head>
<body>

<div style="margin:auto; width: 500px; height:1500px;">
<h2>${ProductDetail.P_NAME}</h2>
	
	<!-- 상품 정보 -->
	<table style="width:600px; height:400px; border-spacing: 45 0px ;">
		<tr align = "center">
			<td rowspan="5" colspan="2">
				<img src="img/${ProductDetail.P_IMAGE}"  width="200" height="200" border="0" id="previewImage">
			</td>
			<td><b>상품명</b></td> 
            <td>${ProductDetail.P_NAME}</td>
		</tr>
        <tr align = "center">
			<td><b>가격</b></td>
			<td><fmt:formatNumber value="${ProductDetail.P_PRICE}" pattern="###,###,###원"/></td> 
        </tr>
        <tr align = "center">
			<td><b>종류</b></td>
			<td>${ProductDetail.P_KIND }</td>
        <tr align = "center">
        	<td><b>구매수량</b></td>
            <td>
         		<select id="count" name="count" onchange="select()">
            		<option value="1">1</option>
            		<option value="2">2</option>
            		<option value="3">3</option>
            		<option value="4">4</option>
            		<option value="5">5</option>
           			<option value="6">6</option>
            	</select>&nbsp;개
			</td>
 		<tr align = "center">
            <td><b>총 금액</b></td>
            <td>
            	
            	<input type="text" id="tp" size="10" value="${ProductDetail.P_PRICE}" readonly/>원
			</td>
        </tr>
        		
	</table>
	
	<br>
	
	<!-- 주문, 찜, 장바구니 버튼 -->
	<button onclick="order()">주문하기</button>
    
    <form method="post" id="insertZimForm" action="insertZim.do">
    	<input type="hidden" id="id" name="id" value="${id}">
    	<input type="hidden" id="p_code" name="p_code" value="${ProductDetail.P_CODE }">
    	<input type="hidden" id="p_name" name="p_name" value="${ProductDetail.P_NAME }">
		<button type="button" onclick="productZim()">찜하기</button>
    </form>
   

    <form method="post" id="insertBasketForm" action="insertBasket.do">
        <input type="hidden" id="b_id" name="b_id" value="${id }"/>
        <input type="hidden" id="b_code" name="b_code" value="${ProductDetail.P_CODE }"/>
        <input type="hidden" id="b_name" name="b_name" value="${ProductDetail.P_NAME }"/>
        <input type="hidden" id="b_price" name="b_price" value="${ProductDetail.P_PRICE }"/>
        <input type="hidden" id="b_kind" name="b_kind" value="${ProductDetail.P_KIND }"/>
        <input type="hidden" id="b_count" name="b_count" value=""/>
        <input type="hidden" id="b_image" name="b_image" value="${ProductDetail.P_IMAGE }"/> 
        
       
        <button type="button" onclick="basketCheck()">장바구니에 담기</button>
    </form>
	
	<br>
	
	<div style="width: 600px; height: 500px; border: 1px solid black;" >
		${ProductDetail.P_DETAIL}
	</div>
	
	<br>
	
	<!-- 상품 후기 -->
	<b>상품 후기 (${reviewCount})</b>
	<c:forEach var="pReview" items="${productReviewList}">
	<table style="width:600px;" border="1">
		<tbody>
			<tr>
				<td style="width:50px;"><b>작성자</b></td>
				<td style="width:100px;">${pReview.R_ID}</td>
				<td style="width:50px;"><b>작성일</b></td>
				<td style="width:120px;"><fmt:formatDate value="${pReview.R_DATE}" pattern="yy.MM.dd hh:mm"/></td>
				<td style="width:50px;"><b>추천수</b></td>
				<td style="width:30px;">${pReview.R_RECOMMEND}</td>
				<td style="width:50px;"><b>별점</b></td>
				<td style="width:120px;">${pReview.R_RATE}</td>
			</tr>
			<tr>
				<td><b>내용</b></td>
				<td colspan="6" style="width:450px;">${pReview.R_CONTENTS}</td>	
				<td>
				<c:if test="${!empty id}">
					<button type="button" onclick="location.href='recommendUp.do?r_num=${pReview.R_NUM}'">추천</button>
				</c:if>
				</td>
			</tr>
		</tbody>
	</table>
	</c:forEach>
	
	<br>
	
	<!-- 후기 작성 -->
	<form method="post" id="insertReviewForm" action="insertReview.do">
		<input type="hidden" id="r_id" name="r_id" value="${id}">
		<input type="hidden" id="r_code" name="r_code" value="${ProductDetail.P_CODE}">
		<input type="hidden" id="r_name" name="r_name" value="${ProductDetail.P_NAME}">
	
		<table style="width:600px;" border="1">
			<tbody>
				<tr>
					<td style="width:50px;"><b>별점</b></td>
					<td><input type="number" id="r_rate" name="r_rate" min="1" max="5" value="5"></td>
				</tr>
				<tr>
					<td style="width:50px;"><b>내용</b></td>
					<td>
						<textarea style="width:530px; height:100px;"
							id="r_contents" name="r_contents"></textarea>
					</td>	
				</tr>
			</tbody>
		</table>
		<button type="button" onclick="insertReview()">후기작성</button>
	</form>
	${paging.pageHtml}
</div>
    </body>
 </html>