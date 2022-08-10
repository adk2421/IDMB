<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
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

	<!-- css연결 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css?v=<%=System.currentTimeMillis()%>">
	
	<!-- icon -->
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<script>
function insertQna() {
	if(${empty id}){
		alert('로그인이 필요합니다!');
		location.href='/IDMB/loginForm.do';
	} else {
		if(confirm("문의를 작성하시겠습니까?") == true){
			location.href='/IDMB/insertQnaForm.do';
		}
	}
}
</script>
</head>
<body>
<div class="header">	
	<br><br>
	<a href="/IDMB/"><img src="img/logo.png" width="140" class="main_logo"></a>
	<br><br>
	<hr><p>

	<!-- 게시판 바로가기 -->
	<div class="short" style="display: flex; justify-content: center;">
	<ul style="list-style-type:none">
		<li style="width:500px; display:inline"><a class="short" href="noticeList.do" >공 지 사 항 &nbsp;&nbsp;</a></li>
		<li id="title-text2"style="display:inline"><a class="short" href="reviewList.do" >상 품 후 기 &nbsp;&nbsp;</a></li>
		<li id="title-text2"style="display:inline"><a class="short" href="faqList.do?f_category=cost" >F A Q &nbsp;&nbsp;</a></li>
		<li id="qna-list"style="display:inline"><a class="short" href="qnaMain.do" >1:1 문 의 &nbsp;&nbsp;</a></li>
	</ul>
	</div>
</div>	
	<br>
	
<div class="container">
<form action="qnaList.do" method="get">
	<input type="hidden" name="q_category" id="q_category" value="${q_category}">
	<table class="sort">
		<tbody>
			<tr>
				<td>
					<img src="img/${q_category}QNA.png" width="105" border="0" id="imageQNA">
				</td>
				<td id="td2" style= "margin:auto;">
					<select class="form-select" aria-label="Default select example" id="SORT" name="SORT">
						<option value="title" <c:if test="${SORT =='title'}">selected</c:if>>제  목</option>
						<option value="id" <c:if test="${SORT =='id'}">selected</c:if>>작 성 자</option>
						<option value="product" <c:if test="${SORT =='product'}">selected</c:if>>상 품 명</option>	
					</select>
					<p></p>
			 	<div class="search">
					<input class="insearch" type="text" name="searchValue" id="searchValue" placeholder="검색어 ..." value="${searchValue}"/>	
					<button type="submit" class="search-icon" ><i class="fa fa-search"></i></button>
				</div>
				</td>
			</tr>
			<tr>
				<td id="categ">
					<c:if test="${q_category == 'product'}"><b>상품 문의</b></c:if>
					<c:if test="${q_category == 'preship'}"><b>배송 전 문의</b></c:if>
					<c:if test="${q_category == 'aftership'}"><b>배송 후 문의</b></c:if>
					<c:if test="${q_category == 'exchange'}"><b>교환/반품 문의</b></c:if>
				</td>
				<td id="td2">
					<button class="wait" type="submit" name="qst" id="qst" value="답변대기"><b>답변 대기</b></button>
					<button class="end" type="submit" name="qst" id="qst" value="답변완료"><b>답변 완료</b></button>
				</td>
			</tr>
		</tbody>
	</table>


	<br>
	<div  class="tb1">
	<table id="qnatable">
		<thead>
			<tr>
				<th>글번호</th>
				<th>상품명</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>상태</th>
			</tr>
		</thead>
		
		<tbody>
		<c:choose>
			<c:when test="${qnaList == null || fn:length(qnaList) == 0 }">
			<tr>
				<td colspan="6">
					조회 결과가 없습니다.
				</td>
			</tr>
			</c:when>
			<c:otherwise>
			<c:forEach var="qna" items="${qnaList}">
			<tr>
				<td style="border-bottom:1px solid #444; padding:10px;">
					<c:if test="${qna.Q_ID != '관리자'}">${qna.Q_GROUPNUM}</c:if>
				</td>
				<td style="border-bottom:1px solid #444; padding:10px;">
					<c:if test="${qna.Q_ID != '관리자'}">${qna.Q_PRODUCT}</c:if>
				</td>
				<td style="border-bottom:1px solid #444; padding:10px;">
					<c:if test="${qna.Q_ID != '관리자'}">
						<a href="qnaDetail.do?q_num=${qna.Q_NUM}">${qna.Q_TITLE}</a>
					</c:if>
					<c:if test="${qna.Q_ID == '관리자'}">&emsp;${qna.Q_TITLE}</c:if>
				</td>
				<td style="border-bottom:1px solid #444; padding:10px;">${qna.Q_ID}</td>
				<td style="border-bottom:1px solid #444; padding:10px;">
					<fmt:formatDate value="${qna.Q_DATE}" pattern="yy.MM.dd"/>
				</td>
				<td style="border-bottom:1px solid #444; padding:10px;">${qna.Q_STATUS}</td>
			</tr>
			</c:forEach>
			</c:otherwise>
		</c:choose>
		</tbody>
	</table>
	</div>
	</form>
</div> <!-- container div  end -->	
	
	<br>
<div class="footer1">	
	<!-- 문의 버튼 -->
	&nbsp;<button class="qnabtn" style="display:block;"type="button" onclick="insertQna()"><b>문 의 하 기</b></button>
	<br><br><br>

	${paging.pageHtml}
	<br><br>	
</div>
</body>
</html>