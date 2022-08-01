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
	
	<table>
		<thead>
			<tr >
				<th>공지번호</th>
				<th>작성일자</th>
				<th>제목</th>
				<th>조회수</th>
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
				<td><a href="noticeDetail.do?n_num=${notice.N_NUM}">
					${notice.N_TITLE}</a></td>
				<!-- 조회수 -->
				<td>${notice.N_HIT}</td>
			</tr>		
		</c:forEach>
		</tbody>
	</table>
	${paging.pageHtml}
</body>
</html>