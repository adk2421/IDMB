<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일단메봐</title>
<script>
function update() {
	location.href = "/IDMB/adminUpdateNoticeForm.do?n_num=${adminNoticeBean.N_NUM}";
}
function cancel() {
	location.href = "/IDMB/adminNoticeList.do";
}
</script>
</head>
<body>
<table>
	<tbody>
		<tr>
			<td><b>제목</b></td>
			<td>${adminNoticeBean.N_TITLE}</td>
		</tr>
		<tr>
			<td><b>작성일</b></td>
			<td>${adminNoticeBean.N_DATE}</td>
		</tr>
		<tr>
			<td><b>조회수</b></td>
			<td>${adminNoticeBean.N_HIT}</td>
		</tr>	
		<tr>
			<td><b>내용</b></td>			
		</tr>
	</tbody>
</table>

<div style="width:490px; height:293px; border:1px solid black;">
	${adminNoticeBean.N_CONTENTS}
</div>

<br>
<button type="button" onclick="update()">수&emsp;정</button>
	&emsp;&emsp;&emsp;&emsp;
<button type="button" onclick="cancel()">돌 아 가 기</button>
</body>
</html>