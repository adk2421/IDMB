<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/adminBoard.css" type="text/css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>일단메봐</title>
<script>
function insertFaq()	{
	location.href = "/IDMB/adminInsertFaqForm.do"
}
</script>
</head>
<body>
<div class="header">
	<!-- 관리자 메인 바로가기 -->
	<div class="box1">
		<a href="adminMain.do"><img alt="adminlogo" src="img/adminLogo.png" ></a>
		<div align="right">
		<ul style="list-style-type:none">
			<li style="display:inline"><a href="adminMemberList.do" >회원 관리</a></li>
			<li id="title-text1" style="display:inline"><a href="adminProductList.do" >상품 관리</a></li>
			<li id="title-text1" style="display:inline"><a href="adminOrderList.do" >주문 관리</a></li>
			<li id="board-ad" style="display:inline"><a href="adminNoticeList.do" >게시판 관리</a></li>
		</ul>	
		</div>
	</div>
	<hr>
	
	<!-- 관리자 게시판 바로가기 -->
	<div class="box2" style="display: flex; justify-content: center;">
	<ul style="list-style-type:none">
		<li style="width:500px; display:inline"><a href="adminNoticeList.do" >공 지 사 항</a></li>
		<li id="title-text2" style="display:inline"><a href="adminReviewList.do" >상 품 후 기</a></li>
		<li id="faq-list" style="display:inline"><a href="adminFaqList.do?f_category=cost" >F A Q</a></li>
		<li id="title-text2" style="display:inline"><a href="adminQnaMain.do" >1:1 문 의</a></li>
	</ul>
	</div>

	
	<br>
</div>	
	<div class="container" >
	<form class="f_box"action="adminFaqList.do" method="get">
		<button type="submit" name="f_category" id="f_category" value="cost">주문/결제</button>
		<button type="submit" name="f_category" id="f_category" value="shipping">배송문의</button>
		<button type="submit" name="f_category" id="f_category" value="cancel">배송변경/취소</button>
		<button type="submit" name="f_category" id="f_category" value="exchange">교환/반품</button>
		<button type="submit" name="f_category" id="f_category" value="logon">회원가입/로그인</button>	
	</form>
	</div>
	
	<br>
	
	<table id="faq-tb">
		<tbody>
		<c:forEach var="faq" items="${adminFaqList}">
			<tr>
				<td id="faq-td"><b>Q. ${faq.F_TITLE}</b>
					<br>
					A. ${faq.F_CONTENTS}
				</td>
				<td id="faq-td">
					<button id="mbtn2" type="button" onClick="location.href='adminUpdateFaqForm.do?f_num=${faq.F_NUM}'">수정</button>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<br><br>
	
	
	<div class="footer">
		<button id="faqadd" type="button" onClick="insertFaq()">FAQ 작성</button>
	
		${paging.pageHtml}
	</div>
	
	
</body>
</html>