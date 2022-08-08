<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<link type="text/css"href="css/adminQna.css"rel="stylesheet"> 
<link rel="stylesheet" href="css/style.css" type="text/css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">

<meta charset="UTF-8">
<title>일단메봐</title>
<script>

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
	
<div class="container">	
<form action="adminQnaList.do" method="get">
	
	<input type="hidden" name="q_category" id="q_category" value="${q_category}">
				

	
				<div class="qst_btn">	
					<button type="submit" name="qst" id="qst" value="답변대기">답변 대기</button>
					<button type="submit" name="qst" id="qst" value="답변완료">답변 완료</button>
				</div>
			<div id="p_td">
					<img src="img/${q_category}QNA.png" width="130" border="0" id="imageQNA">
				<div id="q-list">
					<c:if test="${q_category == 'product'}"><b>상품 문의</b></c:if>
					<c:if test="${q_category == 'preship'}"><b>배송 전 문의</b></c:if>
					<c:if test="${q_category == 'aftership'}"><b>배송 후 문의</b></c:if>
					<c:if test="${q_category == 'exchange'}"><b>교환/반품 문의</b></c:if>
				</div>	
			</div>
				<div class="search-box">
					<select name="SORT" id="SORT" >
						<option value="" <c:if test="${SORT =='NULL'}">selected</c:if>>선&emsp;택&nbsp;▼</option>
						<option value="title" <c:if test="${SORT =='title'}">selected</c:if>>제 &emsp; 목</option>
						<option value="id" <c:if test="${SORT =='id'}">selected</c:if>>작 성 자</option>
						<option value="product" <c:if test="${SORT =='product'}">selected</c:if>>상 품 명</option>	
					</select>
					<div class="search">
						<input type="search" name="searchValue" id="search" placeholder="검색어 ..." value="${searchValue}"/>
						<button type="submit" class="search-icon" ><i class="fa fa-search"></i></button>
					</div>
				</div>
					
		


	
	
	<div class="tb1">	
	<table id="qnaList_tb">
			<tr>
				<th>글번호</th>
				<th>상품명</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>상태</th>
			</tr>

		<c:forEach var="qna" items="${adminQnaList}">
			<tr>
				<td>
					<c:if test="${qna.Q_ID != '관리자'}">${qna.Q_GROUPNUM}</c:if>
				</td>
				<td>
					<c:if test="${qna.Q_ID != '관리자'}">${qna.Q_PRODUCT}</c:if>
				</td>
				<td>
					<c:if test="${qna.Q_ID != '관리자'}">
						<a href="adminQnaDetail.do?q_num=${qna.Q_NUM}">${qna.Q_TITLE}</a>
					</c:if>
					<c:if test="${qna.Q_ID == '관리자'}">&emsp;${qna.Q_TITLE}</c:if>
				</td>
				<td>${qna.Q_ID}</td>
				<td>
					<fmt:formatDate value="${qna.Q_DATE}" pattern="yy.MM.dd"/>
				</td>
				<td>${qna.Q_STATUS}</td>
			</tr>
		</c:forEach>

	</table>
	</div>
</form>	
</div><br>
<div class="footer1">	
	${paging.pageHtml}
</div>	
</body>
</html>