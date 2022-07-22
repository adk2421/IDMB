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

</script>
</head>
<body>
<form action="adminQnaList.do" method="get">
	<input type="hidden" name="q_category" id="q_category" value="${q_category}">
	<table>
		<tbody>
			<tr>
				<td>
					<img src="img/${q_category}QNA.png" width="75" border="0" id="imageQNA">
				</td>
				<td>
					<select name="SORT" id="SORT">
						<option value="title" <c:if test="${SORT =='title'}">selected</c:if>>제 &emsp; 목</option>
						<option value="id" <c:if test="${SORT =='id'}">selected</c:if>>작 성 자</option>
						<option value="product" <c:if test="${SORT =='product'}">selected</c:if>>상 품 명</option>	
					</select>
					<br>
					<input type="text" name="searchValue" id="searchValue" placeholder="검색어 ..." value="${searchValue}"/>
					<button type="submit">검색</button>
				</td>
			</tr>
			<tr>
				<td>
					<c:if test="${q_category == 'product'}"><b>상품 문의</b></c:if>
					<c:if test="${q_category == 'preship'}"><b>배송 전 문의</b></c:if>
					<c:if test="${q_category == 'aftership'}"><b>배송 후 문의</b></c:if>
					<c:if test="${q_category == 'exchange'}"><b>교환/반품 문의</b></c:if>
				</td>

				<td>
					<button type="submit" name="qst" id="qst" value="답변대기">답변 대기</button>
					<button type="submit" name="qst" id="qst" value="답변완료">답변 완료</button>
				</td>
			</tr>
		</tbody>
	</table>
</form>	
	
	
	
	<table border=1>
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
		</tbody>
	</table>

</body>
</html>