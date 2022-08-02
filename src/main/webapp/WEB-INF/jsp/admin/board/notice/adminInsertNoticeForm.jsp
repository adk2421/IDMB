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
function insertCheck() {
	
	var form = document.getElementById("noticeInsertForm");
	var N_TITLE = document.getElementById("n_title");
	var N_CONTENTS = document.getElementById("n_contents");
	
	if(confirm("공지를 작성하시겠습니까?") == true){
		if(N_TITLE == null){
			alert("제목을 작성해주세요.");
			N_TITLE.focus();
			return false;
		} else if (N_CONTENTS == null){
			alert("내용을 작성해주세요.");
			N_CONTENTS.focus();
			return false;
		} else{
			form.submit();
		}
	}
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
			<li id="title-text1"style="display:inline"><a href="adminProductList.do" >상품 관리</a></li>
			<li id="title-text1"style="display:inline"><a href="adminOrderList.do" >주문 관리</a></li>
			<li id="board-ad"style="display:inline"><a href="adminNoticeList.do" >게시판 관리</a></li>
		</ul>	
		</div>
	</div>
	<hr>
<div class="container">
	<form method="post" id="noticeInsertForm" action="adminInsertNotice.do">
		<table style="width:490px; margin:auto; text-align: left;">
			<tbody>
				<tr>
					<td><b>제목</b></td>
					<td>
						<input type="text" maxlength="50" id="n_title" name="n_title" placeholder="제목을 입력해 주세요.">
					</td>
				</tr>
				<tr>
					<td><b>작성일</b></td>
					<td>
						<c:set var="ymd" value="<%=new java.util.Date()%>" />
						<fmt:formatDate value="${ymd}" pattern="yyyy년 MM월 dd일 a hh:mm" />
					</td>
				</tr>
				<tr>
					<td><b>조회수</b></td>
					<td>0</td>
				</tr>
				<tr>
					<td><b>내용</b></td>			
				</tr>			
			</tbody>
		</table>
	</form>	
	<div style="width:490px; height:285px; margin:auto;">
		<textarea id="n_contents" name="n_contents" maxlength="500" placeholder="내용을 입력해 주세요.."></textarea>
	</div>
</div>
	<br>
<div class="footer">	
	<div class="fbtn" style="margin:auto; text-align: center;">
		<button id="wbtn"type="button" onClick="insertCheck()">작 성</button>
		<button id="cancle"type="button" onclick="cancel()">취 소</button>
	</div>
</div>
</body>
</html>