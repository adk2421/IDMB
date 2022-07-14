<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일단메봐</title>
</head>
<body>
	<!-- console창 접근은 가능한데 화면에 출력이 안됨. 
	 그리고 adminMemberBean을 var = "memberbean" 처럼 짧게 줄일 방법이 있었으면 -->
	아이디 : ${adminMemberBean.id}<br>
	비밀번호 : ${adminMemberBean.passwd}<br>
	이름 : ${adminMemberBean.name}<br>
	전화번호 : ${adminMemberBean.phone}<br>
	생년월일 : ${adminMemberBean.birth}<br>
	이메일 : ${adminMemberBean.email}<br>
	우편번호 : ${adminMemberBean.postcode}<br>
	주소 : ${adminMemberBean.address1}<br>
	상세주소 : ${adminMemberBean.address2}<br>
	적립금 : ${adminMemberBean.reserve}<br>
	가입날짜 : ${adminMemberBean.joindate}<br>
	탈퇴유무 : ${adminMemberBean.delflag}<br>
	
</body>
</html>