<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일단메봐</title>

<script>
function cancel(val) {
	if (val == "1") {
		location.href = "/IDMB/adminMemberList.do";
	} else if (val == "0") {}
}
</script>
<script>
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
<form method="post" id="memberDetailForm" action="adminUpdateMember.do?id=${adminMemberBean.ID}">
	
	아이디 : ${adminMemberBean.ID}<br>
	비밀번호 : ${adminMemberBean.PASSWD}<br>
	이름 : ${adminMemberBean.NAME}<br>
	전화번호 : ${adminMemberBean.PHONE}<br>
	생년월일 : ${adminMemberBean.BIRTH}<br>
	이메일 : ${adminMemberBean.EMAIL}<br>
	우편번호 : ${adminMemberBean.POSTCODE}<br>
	주소 : ${adminMemberBean.ADDRESS1}<br>
	상세주소 : ${adminMemberBean.ADDRESS2}<br>
	적립금 : ${adminMemberBean.RESERVE}<br>
	가입날짜 : ${adminMemberBean.JOINDATE}<br>
	
	탈퇴유무 : 
	<c:if test="${adminMemberBean.DELFLAG == 'N'}">
		<input type="checkbox" size="100" name="delflag" value="Y"> 
	</c:if>
	<c:if test="${adminMemberBean.DELFLAG == 'Y'}">
		<input type="checkbox" size="100" name="delflag" value="Y" checked> 
	</c:if>
	(체크 = 탈퇴함)
	<br>
	
	<button type="button" onClick="check()">수 &emsp; 정</button>
         &emsp;&emsp;
	<button type="button" onclick="cancel(1)">취 &emsp; 소</button>

</form>	
</body>
</html>