<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/adminMember.css" type="text/css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>일단메봐</title>

<script>
function cancel() {
	location.href = "/IDMB/adminMemberList.do";
}

function check() {
	var memberDetailForm = document.getElementById("memberDetailForm");
	if(confirm("수정하시겠습니까?") == true){
		memberDetailForm.submit();
		return true;
	}
}
</script>

</head>
<body>

	<!-- 관리자 메인 툴바 -->
	<div class="header">
		<a href="adminMain.do"><img alt="adminlogo" src="img/adminLogo.png" ></a>
		<div align="right" class="box1">
		<ul style="list-style-type:none">
			<li id="member-ad" style="display:inline"><a href="adminMemberList.do" >회원 관리</a></li>
			<li id="title-text1" style="display:inline"><a href="adminProductList.do" >상품 관리</a></li>
			<li id="title-text1" style="display:inline"><a href="adminOrderList.do" >주문 관리</a></li>
			<li id="title-text1" style="display:inline"><a href="adminNoticeList.do" >게시판 관리</a></li>
		</ul>	
		</div>
	</div>
	<hr>
<div class="container">
	<form method="post" id="memberDetailForm" action="adminUpdateMember.do?id=${adminMemberBean.ID}">
		<table>
			<tbody>
				<tr>
					<th><b>아이디</b></th>
					<th>${adminMemberBean.ID}</th>		
				</tr>
				<tr>
					<td><b>비밀번호</b></td>
					<td>${adminMemberBean.PASSWD}</td>
				</tr>
				<tr>
					<td><b>이름</b></td>
					<td>${adminMemberBean.NAME}</td>
				</tr>
				<tr>
					<td><b>전화번호</b></td>
					<td>${adminMemberBean.PHONE}</td>
				</tr>
				<tr>
					<td><b>생년월일</b></td>
					<td>${adminMemberBean.BIRTH}</td>
				</tr>
				<tr>
					<td><b>이메일</b></td>
					<td>${adminMemberBean.EMAIL}</td>
				</tr>
				<tr>
					<td><b>우편번호</b></td>
					<td>${adminMemberBean.POSTCODE}</td>
				</tr>
				<tr>
					<td><b>주소</b></td>
					<td>${adminMemberBean.ADDRESS1}</td>
				</tr>
				<tr>
					<td><b>상세주소</b></td>
					<td>${adminMemberBean.ADDRESS2}</td>
				</tr>
				<tr>
					<td><b>적립금</b></td>
					<td>${adminMemberBean.RESERVE}</td>
				</tr>
				<tr>
					<td><b>가입날짜</b></td>
					<td>${adminMemberBean.JOINDATE}</td>
				</tr>
				<tr>
					<td><b>탈퇴유무</b></td>
					<td>
					<c:if test="${adminMemberBean.DELFLAG == 'N'}">
						<input type="checkbox" size="100" name="delflag" value="Y"> 
					</c:if>
					<c:if test="${adminMemberBean.DELFLAG == 'Y'}">
						<input type="checkbox" size="100" name="delflag" value="Y" checked> 
					</c:if>
					(체크 = 탈퇴함)
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>	
	<br/>
	<div class="footer1">
		<div class="btn">
			<button id="mbtn2" type="button" onClick="check()">수 정</button>
			<button id="cancle2"type="button" onclick="cancel()">취 소</button>
		</div>
	</div>


</body>
</html>