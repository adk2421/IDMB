<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/adminForm.css" type="text/css">

<meta charset="UTF-8">
<title>일단메봐</title>
<script>
function updateCheck() {
	
	var form = document.getElementById("faqUpdateForm");
	var F_TITLE = document.getElementById("f_title");
	var F_CONTENTS = document.getElementById("f_contents");
	
	if(confirm("FAQ를 수정하시겠습니까?") == true){
		if(F_TITLE.value.trim()==""){
			alert("질문 내용을 작성해주세요.");
			F_TITLE.focus();
			return false;
		} else if (F_CONTENTS.value.trim()==""){
			alert("질문 답변을 작성해주세요.");
			F_CONTENTS.focus();
			return false;
		} else{
			form.submit();
		}
	}
}

function deleteCheck() {
	if(confirm("FAQ를 삭제하시겠습니까?") == true){
		location.href = "/IDMB/adminDeleteFaq.do?f_num=${adminFaqBean.F_NUM}";
	}	
}

function cancel() {
	location.href = "/IDMB/adminFaqList.do?f_category=cost";
}
</script>
</head>
<body>

	<!-- 관리자 메인 바로가기 -->
	<div class="header">
		<a href="adminMain.do"><img alt="adminlogo" src="img/adminLogo.png" ></a>
		<div class="box1"align="right">
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
<form method="post" id="faqUpdateForm"
	action="adminUpdateFaq.do?f_num=${adminFaqBean.F_NUM}">
	<table>
		<tbody>
			<tr>
				<td id="td1"><b>질문 종류</b></td>
				<td>
					<select name="f_category" id="f_category">
						<option value=""
							<c:if test="${adminFaqBean.F_CATEGORY == 'NULL'}">selected</c:if>>---선택하세요---</option>
						<option value="cost" 
							<c:if test="${adminFaqBean.F_CATEGORY == 'cost'}">selected</c:if>>주문/결제</option>
						<option value="shippin"
							<c:if test="${adminFaqBean.F_CATEGORY == 'shippin'}">selected</c:if>>배송문의</option>
						<option value="cancle"
							<c:if test="${adminFaqBean.F_CATEGORY == 'cancle'}">selected</c:if>>배송변경/취소</option>
						<option value="exchange"
							<c:if test="${adminFaqBean.F_CATEGORY == 'exchange'}">selected</c:if>>교환/반품</option>
						<option value="logon"
							<c:if test="${adminFaqBean.F_CATEGORY == 'logon'}">selected</c:if>>회원가입/로그인</option>
					</select>
				</td>
			</tr>
			<tr>
				<td id="td1"><b>질문 내용</b></td>
				<td>
					<input type="text" maxlength="50" name="f_title" id="f_title" size="50"
						value="${adminFaqBean.F_TITLE}"> 
				</td>
			</tr>
			<tr>
				<td id="td1"><b>질문 답변</b></td>
				<td>
					<textarea id="f_contents" name="f_contents"
						style="width:700px;padding:5px;" maxlength="300">${adminFaqBean.F_CONTENTS}</textarea> 
				</td>
			</tr>	
		</tbody>
	</table>
	</form>
</div>	
	<br>
<div class="header">	
	<div class="fbtn" style="display: flex; justify-content: center;">
		<button type="button" onclick="updateCheck()">수 정</button>
		<button type="button" onclick="deleteCheck()">삭 제</button>	
		<button type="button" onclick="cancel()">취 소</button>
	</div>
</div>

</body>
</html>