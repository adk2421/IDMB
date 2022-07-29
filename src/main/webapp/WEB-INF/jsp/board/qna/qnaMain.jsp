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

</script>

</head>
<body>

	<!-- 게시판 바로가기 -->
	<div style="display: flex; justify-content: center;">
	<ul style="list-style-type:none">
		<li style="width:500px; display:inline"><a href="noticeList.do" >공 지 사 항</a></li>
		<li style="display:inline"><a href="reviewList.do" >상 품 후 기</a></li>
		<li style="display:inline"><a href="faqList.do?f_category=cost" >F A Q</a></li>
		<li style="display:inline"><a href="qnaMain.do" >1:1 문 의</a></li>
	</ul>
	</div>
	<hr>
	
	<table style="margin:auto; text-align: center;">
		<tbody>
			<tr>
				<td>
					<a href="qnaList.do?q_category=product">
					<img src="img/productQNA.png" width="100" border="0" id="productQNA"></a>
					<br>상품 문의
				</td>
				<td>
					<a href="qnaList.do?q_category=preship">
					<img src="img/preshipQNA.png" width="100" border="0" id="preshipQNA"></a>
					<br>배송 전 문의
				</td>
				<td>
					<a href="qnaList.do?q_category=aftership">
					<img src="img/aftershipQNA.png" width="100" border="0" id="aftershipQNA"></a>
					<br>배송 후 문의
				</td>
				<td>
					<a href="qnaList.do?q_category=exchange">
					<img src="img/exchangeQNA.png" width="100" border="0" id="exchangeQNA"></a>
					<br>교환/반품 문의
				</td>
			</tr>
		</tbody>
	</table>
	

</body>
</html>