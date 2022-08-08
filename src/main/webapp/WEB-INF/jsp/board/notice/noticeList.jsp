<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 공지리스트</title>
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

<script>

</script>
</head>
<body>
	<br><br><br><br>
	<hr><p>
<div class="header">
	<!-- 게시판 바로가기 -->
	<div class="short" style="display: flex; justify-content: center;">
	<ul style="list-style-type:none">
		<li id="notice-list"style="width:500px; display:inline"><a class="short" href="noticeList.do" >공 지 사 항 &nbsp;&nbsp;</a></li>
		<li id="title-text1"style="display:inline"><a class="short" href="reviewList.do" >상 품 후 기 &nbsp;&nbsp;</a></li>
		<li id="title-text1"style="display:inline"><a class="short" href="faqList.do?f_category=cost" >F A Q &nbsp;&nbsp;</a></li>
		<li id="title-text1"style="display:inline"><a class="short" href="qnaMain.do" >1:1 문 의 &nbsp;&nbsp;</a></li>
	</ul>
	</div>
</div>		
<div class="container">	
	<table class="noticelist" style="width: 99%;">
		<thead>
			<tr >
				<th scope="col">공지번호</th>
				<th scope="col">작성일자</th>
				<th scope="col">제목</th>
				<th scope="col">조회수</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="notice" items="${noticeList}">
			<tr>	
				<!-- 번호 -->
				<td>${notice.N_NUM}</td>
				<!-- 작성일자 -->
				<td>
					<fmt:formatDate value="${notice.N_DATE}" pattern="yyyy년 MM월 dd일"/>
				</td>
				<!-- 제목 -->
				<td><a class="short" href="noticeDetail.do?n_num=${notice.N_NUM}">
					${notice.N_TITLE}</a></td>
				<!-- 조회수 -->
				<td>${notice.N_HIT}</td>
			</tr>		
		</c:forEach>
		</tbody>
	</table>
</div>	
	<br>
	${paging.pageHtml}
	
</body>
</html>