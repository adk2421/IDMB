<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일단메봐</title>
<script>
function insertCheck() {
	
	var form = document.getElementById("faqInsertForm");
	var F_TITLE = document.getElementById("f_title");
	var F_CONTENTS = document.getElementById("f_contents");
	
	if(confirm("FAQ를 작성하시겠습니까?") == true){
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

function cancel() {
	location.href = "/IDMB/adminFaqList.do?f_category=cost";
}
</script>
</head>
<body>

	<!-- 관리자 메인 바로가기 -->
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
	
<form method="post" id="faqInsertForm" action="adminInsertFaq.do">
	<table style="width:800px; display: flex; justify-content: center;">
		<tbody>
			<tr>
				<td><b>질문 종류</b></td>
				<td>
					<select name="f_category" id="f_category">
						<option value="cost">주문/결제</option>
						<option value="shippin">배송문의</option>
						<option value="cancel">배송변경/취소</option>
						<option value="exchange">교환/반품</option>
						<option value="logon">회원가입/로그인</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><b>질문 내용</b></td>
				<td>
					<input type="text" maxlength="50" name="f_title" id="f_title" size="50"> 
				</td>
			</tr>
			<tr>
				<td><b>질문 답변</b></td>
				<td>
					<textarea id="f_contents" name="f_contents"
						style="width:600px;" maxlength="300"></textarea> 
				</td>
			</tr>	
		</tbody>
	</table>
	
	<br>
	
	<div style="display: flex; justify-content: center;">
	<button type="button" onclick="insertCheck()">작 &emsp; 성</button>
		&emsp;&emsp;&emsp;&emsp;
	<button type="button" onclick="cancel()">취 &emsp; 소</button>
	</div>
</form>
</body>
</html>