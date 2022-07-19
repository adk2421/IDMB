<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
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
	location.href = "/IDMB/adminFaqList.do";
}
function qnaList() {
	location.href = "/IDMB/adminQnaList.do";
}
function insertNotice()	{
	location.href = "/IDMB/adminInsertNoticeForm.do"
}
</script>
</head>
<body>
	<button type="button" onClick="noticeList()">공지 사항</button>
		&emsp;&emsp;
	<button type="button" onClick="reviewList()">상품 후기</button>
		&emsp;&emsp;
	<button type="button" onClick="faqList()">자주 묻는 질문</button>
		&emsp;&emsp;
	<button type="button" onClick="qnaList()">1:1 문의</button>
		&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	<button type="button" onClick="insertNotice()">공지작성</button>
	
	<table border=1>
		<thead>
			<tr>
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
				<td>${notice.N_NUM}</td>
				<td>${notice.N_DATE}</td>
				<td><a href="adminNoticeDetail.do?n_num=${notice.N_NUM}">
					${notice.N_TITLE}</a></td>
				<td>${notice.N_HIT}</td>
				<td><button type="button" onClick="location.href='adminUpdateNoticeForm.do?n_num=${notice.N_NUM}'">
						수정</button>	</td>
			</tr>		
		</c:forEach>
		</tbody>
	</table>
</body>
</html>