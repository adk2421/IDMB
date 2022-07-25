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
function noticeList() {
	location.href = "/IDMB/noticeList.do";
}
function reviewList() {
	location.href = "/IDMB/reviewList.do";
}
function faqList() {
	location.href = "/IDMB/faqList.do?f_category=cost";
}
function qnaList() {
	location.href = "/IDMB/qnaMain.do";
}
</script>

</head>
<body>
		&emsp;
	<button type="button" onClick="noticeList()">공지 사항</button>
		&emsp;&emsp;&emsp;&emsp;
	<button type="button" onClick="reviewList()">상품 후기</button>
		&emsp;&emsp;&emsp;&emsp;
	<button type="button" onClick="faqList()">자주 묻는 질문</button>
		&emsp;&emsp;&emsp;&emsp;
	<button type="button" onClick="qnaList()">1:1 문의</button>
	
	<br><br>
	
	<table>
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