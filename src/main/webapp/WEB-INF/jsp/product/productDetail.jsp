<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 보기</title>
<script>

</script>
</head>
<body>
<h2>상품 상세정보</h2>
    <table border ="1">
        <tr>
            <td>
            <img src="img/bag9.jpg"  width="200" height="250" border="0" id="previewImage">
            </td>
        </tr>
    </table>


    <table border = "1" style = "height: 300px; width: 500px;">
        <tr align = "center">
            <td> 상품명</td> 
            <td>${product.P_NAME}</td>
        </tr>

        <tr align = "center">
            <td>가격</td>
            <td><fmt:formatNumber value="${product.P_PRICE}" pattern="###,###,###"/></td> 
        </tr>

        <tr align = "center">
            <td>종류</td>
            <td>${product.P_KIND }</td>

         <tr align = "center">
            <td>구매수량</td>
            <td>

            <select name="p_count" id="p_count">
		
			 <option value=""></option>
  			<c:forEach var="i" begin="1" end="30">
    			<option value="${i}">${i}</option>
 			 </c:forEach>
	        </select>&nbsp;개

        <tr align = "center">
            <td> 총 구매 금액</td>
            <td><fmt:formatNumber pattern="###,###,###" value="${product.P_PRICE * p_count }"/></td>
        </tr>

        </table>

        <p><button onclick="location.href='orderForm.do?p_code=${product.P_CODE}&p_count=${p_count}'">주문하기</button>

         <p><button onclick="alert('찜하기가 완료되었습니다.')">찜하기</button></p> 

     </body>
 </html>