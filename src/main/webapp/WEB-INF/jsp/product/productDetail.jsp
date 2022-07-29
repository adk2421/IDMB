<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 보기</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
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
</head>
<body>
<h2>상품 상세정보</h2>

    <table border ="1">
        <tr>
            <td>
            <img src="img/${ProductDetail.P_IMAGE }"  width="200" height="250" border="0" id="previewImage">
            </td>
        </tr>
    </table>


    <table border = "1" style = "height: 300px; width: 500px;">
        <tr align = "center">
            <td> 상품명</td> 
            <td>${ProductDetail.P_NAME}</td>
        </tr>

        <tr align = "center">
            <td>가격</td>
            <td><fmt:formatNumber value="${ProductDetail.P_PRICE}" pattern="###,###,###"/></td> 
        </tr>

        <tr align = "center">
            <td>종류</td>
            <td>${ProductDetail.P_KIND }</td>

         <tr align = "center">
            <td>구매수량</td>
            <td>
			
			<select id="count" name="count" onchange="select()">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            </select>&nbsp;개
		
 		<tr align = "center">
            <td> 총 구매 금액</td>
            <td><input type="text" id="tp" value="${ProductDetail.P_PRICE}"/></td>
        </tr>
        
        </table>

        <p><button onclick="order()">주문하기</button>
        <p><button onclick="alert('찜하기가 완료되었습니다.')">찜하기</button></p> 
        
        <form method="post" id="insertBasketForm" action="insertBasket.do">
        
       
        <input type="hidden" id="b_id" name="b_id" value="${id }"/>
        <input type="hidden" id="b_code" name="b_code" value="${ProductDetail.P_CODE }"/>
        <input type="hidden" id="b_name" name="b_name" value="${ProductDetail.P_NAME }"/>
        <input type="hidden" id="b_price" name="b_price" value="${ProductDetail.P_PRICE }"/>
        <input type="hidden" id="b_kind" name="b_kind" value="${ProductDetail.P_KIND }"/>
        <input type="hidden" id="b_count" name="b_count" value=""/>
        <input type="hidden" id="b_image" name="b_image" value="${ProductDetail.P_IMAGE }"/>
        
        
        <p><button type="button" onclick="basketCheck()">장바구니에 담기</button></p>
    
        </form>

     </body>
 </html>