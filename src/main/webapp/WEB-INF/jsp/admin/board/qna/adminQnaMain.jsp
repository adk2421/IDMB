<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/adminBoard.css" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>일단메봐</title>
<script>
function noticeList() {
	location.href = "/IDMB/adminNoticeList.do";
}
function reviewList() {
	location.href = "/IDMB/adminReviewList.do";
}
function faqList() {
	location.href = "/IDMB/adminFaqList.do?f_category=cost";
}
function qnaList() {
	location.href = "/IDMB/adminQnaMain.do";
}
</script>

</head>
<body>

	<!-- 관리자 메인 툴바 -->
	<div class="header">
		<a href="adminMain.do"><img alt="adminlogo" src="img/adminLogo.png" ></a>
		<div class="box1"align="right">
		<ul style="list-style-type:none">
			<li style="display:inline"><a href="adminMemberList.do" >회원 관리</a></li>
			<li id="title-text1"style="display:inline"><a href="adminProductList.do" >상품 관리</a></li>
			<li id="title-text1"style="display:inline"><a href="adminOrderList.do" >주문 관리</a></li>
			<li id="board-ad"style="display:inline"><a href="adminNoticeList.do" >게시판 관리</a></li>
		</ul>	
		</div>
	
	<hr>
	
	<!-- 관리자 게시판 바로가기 -->

	<div style="display: flex; justify-content: center;">
	<ul style="list-style-type:none">
		<li style="width:500px; display:inline"><a href="adminNoticeList.do" >공 지 사 항</a></li>
		<li id="title-text2"style="display:inline"><a href="adminReviewList.do" >상 품 후 기</a></li>
		<li id="title-text2"style="display:inline"><a href="adminFaqList.do?f_category=cost" >F A Q</a></li>
		<li id="qna-list"style="display:inline"><a href="adminQnaMain.do" >1:1 문 의</a></li>
	</ul>
	</div>
</div>	
	
	<br>
<div class="container">	
	<table id="qna-maintb">
		<tbody>
			<tr>
				<td id="qna-td">
					<a href="adminQnaList.do?q_category=product">
					<img src="img/productQNA.png" width="100" border="0" id="productQNA"></a>
					<br>상품 문의
				</td>
				<td id="qna-td">
					<a href="adminQnaList.do?q_category=preship">
					<img src="img/preshipQNA.png" width="100" border="0" id="preshipQNA"></a>
					<br>배송 전 문의
				</td>
				<td id="qna-td">
					<a href="adminQnaList.do?q_category=aftership">
					<img src="img/aftershipQNA.png" width="100" border="0" id="aftershipQNA"></a>
					<br>배송 후 문의
				</td>
				<td id="qna-td">
					<a href="adminQnaList.do?q_category=exchange">
					<img src="img/exchangeQNA.png" width="100" border="0" id="exchangeQNA"></a>
					<br>교환/반품 문의
				</td>
			</tr>
		</tbody>
	</table>
</div>
<div class="footer1"></div>	

</body>
</html>