<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/adminBoardForm.css" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200&display=swap" rel="stylesheet">
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

	<!-- 관리자 메인 툴바 -->
	<div class="header">
		<a href="adminMain.do"><img alt="adminlogo" src="img/adminLogo.png" ></a>
		<div class="box1" align="right">
		<ul style="list-style-type:none">
			<li style="display:inline"><a href="adminMemberList.do" >회원 관리</a></li>
			<li id="title-text1" style="display:inline"><a href="adminProductList.do" >상품 관리</a></li>
			<li id="title-text1" style="display:inline"><a href="adminOrderList.do" >주문 관리</a></li>
			<li id="board-ad"style="display:inline"><a href="adminNoticeList.do" >게시판 관리</a></li>
		</ul>	
		</div>
	</div>
	<hr>
	
	<div class="container">
		<table style="width:490px; margin:auto; text-align: left;">
			<tbody>
				<tr>
					<td><b>제목</b></td>
					<td>${adminNoticeBean.N_TITLE}</td>
				</tr>
				<tr>
					<td><b>작성일</b></td>
					<td>
						<fmt:formatDate value="${adminNoticeBean.N_DATE}"
							pattern="yyyy년 MM월 dd일 a hh:mm"/>
					</td>
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
	

		<div class="notice-content" style="width:400px; height:280px; border:1px solid black; margin:auto;border-radius:5px;">
			${adminNoticeBean.N_CONTENTS}
		</div>
	</div>
<br>
	<div class="footer">
		<div class="fbtn"style="margin:auto; text-align: center;">
			<button id="mbtn"type="button" onclick="update()">수 정</button>
			<button id="b_btn"type="button" onclick="cancel()">돌 아 가 기</button>
		</div>
	</div>
</body>
</html>