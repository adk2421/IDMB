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
	<button type="button" onClick="qnaMain()">1:1 문의</button>
	
	<br><br>
	
	<form action="adminReviewList.do" method="get">
		<select name="SORT" id="SORT">
			<option value="id" <c:if test="${SORT =='id'}">selected</c:if>>아 이 디</option>
			<option value="product" <c:if test="${SORT =='product'}">selected</c:if>>상 품 명</option>	
		</select>
		<input type="text" name="searchValue" id="searchValue" placeholder="검색어 ..." value="${searchValue}"/>
		<button type="submit">검색</button>
	</form>
	
	<br>
	
	<table border=1>
		<thead>
			<tr>
				<th>후기번호</th>
				<th>작성일</th>
				<th>별점</th>
				<th>상품명</th>
				<th>후기</th>
				<th>작성자</th>
				<th>기능</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="review" items="${adminReviewList}">
			<tr>
				<td>${review.R_GROUPNUM}</td>
				<td>
					<fmt:formatDate value="${review.R_DATE}"
						pattern="yyyy년 MM월 dd일"/>
				</td>
				<td>
					${review.R_RATE}
			<!-- 별점의 수을 입력받아서 별 개수가 다르게 이미지 파일을 출력하는게 좋을것 같음 -->		
				</td>
				<td>
					<a href="adminReviewDetail.do?r_num=${review.R_NUM}&p_code=${review.R_CODE}">
					${review.R_NAME}</a>
				</td>
				<td>${review.R_CONTENTS}</td>
				<td>${review.R_ID}</td>
				<td>
					<c:if test="${review.R_ID != null}">
						<button type="button" onClick="location.href='adminDeleteReview.do?r_num=${review.R_NUM}'">삭제</button>	
					</c:if>
				</td>
			</tr>		
		</c:forEach>
		</tbody>
	</table>
</body>
</html>