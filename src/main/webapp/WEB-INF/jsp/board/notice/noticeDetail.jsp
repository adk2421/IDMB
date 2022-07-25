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
function cancel() {
	location.href = "/IDMB/noticeList.do";
}
</script>
</head>
<body>
<table>
	<tbody>
		<tr>
			<td><b>제목</b></td>
			<td>${noticeBean.N_TITLE}</td>
		</tr>
		<tr>
			<td><b>작성일</b></td>
			<td>
				<fmt:formatDate value="${noticeBean.N_DATE}"
					pattern="yyyy년 MM월 dd일 a hh:mm"/>
			</td>
		</tr>
		<tr>
			<td><b>조회수</b></td>
			<td>${noticeBean.N_HIT}</td>
		</tr>	
		<tr>
			<td><b>내용</b></td>			
		</tr>
	</tbody>
</table>

<div style="width:490px; height:285px; border:1px solid black;">
	${noticeBean.N_CONTENTS}
</div>

<br>
<button type="button" onclick="cancel()">돌 아 가 기</button>
</body>
</html>