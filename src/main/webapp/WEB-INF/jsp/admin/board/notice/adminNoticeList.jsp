<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/adminList.css" type="text/css">
<meta charset="UTF-8">
<title>관리자 공지리스트</title>
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
function qnaMain() {
	location.href = "/IDMB/adminQnaMain.do";
}
function insertNotice()	{
	location.href = "/IDMB/adminInsertNoticeForm.do"
}


</script>

</head>


<body>

	<!-- 상단카테고리 -->
	<div id="nav_menu">
	<ul style="list-style-type:none">
		<li style="display:inline"><a href="loginForm.do">LOGIN</a></li>
		<li style="display:inline"><a href="joinForm.do">JOIN</a></li>
		<li style="display:inline"><a href="basketList.do">CART</a></li>
		<li style="display:inline"><a href="mypage.do">MY PAGE</a></li>
		<li style="display:inline"><a href="myOrderList.do">ORDER</a></li>
		<li style="display:inline"><a href="community.do">COMMUNITY</a></li>
		<input type="search" name="search"><input type="button" class="img-button"></button>
	</ul>	
	</div>
	
	<div>
		<a href="adminMain.do"><img alt="adminlogo" src="img/adminLogo.png" ></a>
	
		<div align="right">
			<li style="display:inline"><a href="#" >회원 관리</a></li>
			<li style="display:inline"><a href="#" >상품 관리</a></li>
			<li style="display:inline"><a href="#" >주문 관리</a></li>
			<li style="display:inline"><a href="#" >게시판 관리</a></li>
		</div>
	</div>
	<hr>
	
	<div class="titletext1">
		<button type="button"  onClick="noticeList()">공지 사항</button>
			&emsp;&emsp;
		<button type="button" onClick="reviewList()">상품 후기</button>
			&emsp;&emsp;
		<button type="button" onClick="faqList()">자주 묻는 질문</button>
			&emsp;&emsp;
		<button type="button" onClick="qnaMain()">1:1 문의</button>
		
			&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
		<button type="button" onClick="insertNotice()">공지작성</button>
	<table>
		<thead>
			<tr >
				<th>공지번호</th>
				<th>작성일자</th>
				<th>제목</th>
				<th>조회수</th>
				<th>기능</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="notice" items="${adminNoticeList}">
			<tr>	
				<!-- 번호 -->
				<td>${notice.N_NUM}</td>
				<!-- 작성일자 -->
				<td>
					<fmt:formatDate value="${notice.N_DATE}" pattern="yyyy년 MM월 dd일"/>
				</td>
				<!-- 제목 -->
				<td><a href="adminNoticeDetail.do?n_num=${notice.N_NUM}">
					${notice.N_TITLE}</a></td>
				<!-- 조회수 -->
				<td>${notice.N_HIT}</td>
				<!-- 수정버튼 -->
				<td>
					<button type="button" onClick="location.href='adminUpdateNoticeForm.do?n_num=${notice.N_NUM}'">수정</button>	
				</td>
			</tr>		
		</c:forEach>
		</tbody>
	</table>
	</div>
</body>
</html>