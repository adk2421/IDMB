<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/adminBoardForm.css" type="text/css">
<meta charset="UTF-8">
<title>일단메봐</title>
<script>
function cancel() {
	location.href = "/IDMB/noticeList.do";
}
</script>
</head>
<body>
<table style="width:490px; margin:auto; text-align: left;">
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

<div  class="notice-content" style="width:400px; height:280px; border:1px solid black; margin:auto;border-radius:5px; padding:5px;">
	${noticeBean.N_CONTENTS}
</div>

<br>
<div style="margin:auto; text-align: center;">
<button id="back"type="button" onclick="cancel()">돌 아 가 기</button>
</div>
</body>
</html>