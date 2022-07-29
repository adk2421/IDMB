<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/admintop.css" type="text/css">
<meta charset="UTF-8">
<title>일단메봐</title>
<script>
function updateCheck() {
	
	var form = document.getElementById("noticeUpdateForm");
	var N_TITLE = document.getElementById("n_title");
	var N_CONTENTS = document.getElementById("n_contents");
	
	if(confirm("공지를 수정하시겠습니까?") == true){
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

function deleteCheck() {
	if(confirm("공지를 삭제하시겠습니까?") == true){
		location.href = "/IDMB/adminDeleteNotice.do?n_num=${adminNoticeBean.N_NUM}";
	}	
}

function cancel() {
	location.href = "/IDMB/adminNoticeList.do";
}
</script>
</head>
<body>
	
	<!-- 관리자 메인 툴바 -->
	<div>
		<a href="adminMain.do"><img alt="adminlogo" src="img/adminLogo.png" ></a>
		<div align="right">
		<ul style="list-style-type:none">
			<li style="display:inline"><a href="adminMemberList.do" >회원 관리</a></li>
			<li style="display:inline"><a href="adminProductList.do" >상품 관리</a></li>
			<li style="display:inline"><a href="adminOrderList.do" >주문 관리</a></li>
			<li style="display:inline"><a href="adminNoticeList.do" >게시판 관리</a></li>
		</ul>	
		</div>
	</div>
	<hr>
<div style="width:490px; margin:auto; text-align:left;">	
<a><img alt="noticelogo" src="img/notice.png" ></a>
</div>

<br>

<form method="post" id="noticeUpdateForm"
	action="adminUpdateNotice.do?n_num=${adminNoticeBean.N_NUM}">
	<table style="width:490px; margin:auto; text-align: left;">
		<tbody>
			<tr>
				<td><b>제목 </b></td>
					<td>
						<input type="text" maxlength="50" id="n_title" name="n_title" value="${adminNoticeBean.N_TITLE}">
					</td>
				
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

	<div style="width:490px; height:285px; margin:auto;">
		<textarea id="n_contents" name="n_contents"
			style="width:490px; height:285px;" maxlength="500">${adminNoticeBean.N_CONTENTS}</textarea>
	</div>

	<br>
	
	<div style="margin:auto; text-align: center;">
		<button type="button" onClick="updateCheck()">수 &emsp; 정</button>
	       &emsp;&emsp;
	    <button type="button" onClick="deleteCheck()">삭 &emsp; 제</button>
	       &emsp;&emsp;
		<button type="button" onclick="cancel()">취 &emsp; 소</button>	
	</div>
</form>
</body>
</html>