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
<meta charset="UTF-8">
<title>일단메봐</title>
<!-- Bootstrap CSS CDN -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
		crossorigin="anonymous">
	<!-- Bootstrap JS CDN -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" 
		crossorigin="anonymous"></script>


<script>
function insertFaq()	{
	location.href = "/IDMB/adminInsertFaqForm.do"
}
</script>
</head>
<body>

<br><br>

<div class="header">
	<!-- 관리자 메인 바로가기 -->
	<div class="box1">

		<a href="adminMain.do"><img alt="adminlogo" src="img/adminLogo.png" ></a>
		<div align="right">
		<ul style="list-style-type:none">
			<li style="display:inline"><a href="adminMemberList.do" >회원 관리</a></li>
			<li id="title-text1" style="display:inline"><a href="adminProductList.do" >상품 관리</a></li>
			<li id="title-text1" style="display:inline"><a href="adminOrderList.do" >주문 관리</a></li>
			<li id="board-faq" style="display:inline"><a href="adminNoticeList.do" >게시판 관리</a></li>
		</ul>	
		</div>
	</div>
	<hr>
	
	<!-- 관리자 게시판 바로가기 -->
	<div class="box2" style="display: flex; justify-content: center;">
	<ul style="list-style-type:none">
		<li style="width:500px; display:inline"><a href="adminNoticeList.do" >공 지 사 항</a></li>
		<li id="title-text2" style="display:inline"><a href="adminReviewList.do" >상 품 후 기</a></li>
		<li id="faq-btn" style="display:inline"><a href="adminFaqList.do?f_category=cost" >F A Q</a></li>
		<li id="title-text2" style="display:inline"><a href="adminQnaMain.do" >1:1 문 의</a></li>
	</ul>
	</div>

	
	<br>
</div>	
	<div class="container" >
	<div class="contain2">
	<form class="f_box"action="adminFaqList.do" method="get">
		<button type="submit" name="f_category" id="f_category" value="cost">주문/결제</button>
		<button type="submit" name="f_category" id="f_category" value="shipping">배송문의</button>
		<button type="submit" name="f_category" id="f_category" value="cancel">배송변경/취소</button>
		<button type="submit" name="f_category" id="f_category" value="exchange">교환/반품</button>
		<button type="submit" name="f_category" id="f_category" value="logon">회원가입/로그인</button>	
	</form>
	</div>
	
	<br><br><br>

	<div class="accordion" id="accordionFlushExample">
 		<div class="accordion-item">
    		<h2 class="accordion-header" id="flush-headingOne">
     			<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
        			<div class="size">

		<c:forEach var="faq" items="${adminFaqList}">
			<b>Q. ${faq.F_TITLE}</b>
			</c:forEach>
					</div>
			</button>
			</h2>	
				<div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
      				<div class="accordion-body">
      					<c:forEach var="faq" items="${adminFaqList}">
							<b>A. ${faq.F_CONTENTS}</b>
				
			
					<button id="mbtn2" type="button" onClick="location.href='adminUpdateFaqForm.do?f_num=${faq.F_NUM}'">수정</button>
				</c:forEach>
				</div>
			</div>
		</div>
	</div>
			
		
		
	
	<br><br>
	</div>
	
	<div class="footer1">
		<button id="faqadd" type="button" onClick="insertFaq()">FAQ 작성</button>
		${paging.pageHtml}
	</div>
	
	
</body>
</html>