<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/adminBoard.css" type="text/css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>일단메봐</title>
</head>

<body>
	<!-- 관리자 메인 툴바 -->
	<div class="header">
		<a href="adminMain.do"><img alt="adminlogo" src="img/adminLogo.png" ></a>
		<div align="right" class="box1">
		<ul style="list-style-type:none">
			<li id="title-text1" style="display:inline"><a href="adminMemberList.do" >회원 관리</a></li>
			<li id="title-text1" style="display:inline"><a href="adminProductList.do" >상품 관리</a></li>
			<li id="title-text1" style="display:inline"><a href="adminOrderList.do" >주문 관리</a></li>
			<li id="title-text1" style="display:inline"><a href="adminNoticeList.do" >게시판 관리</a></li>
		</ul>	
		</div>
	</div>
	<hr>
	
	<div class="container">	
	<table id="qna-maintb">
		<tbody>
			<tr>
				<td id="qna-td">
					<a href="adminMemberList.do">
					<img src="img/adminMember.png" width="100" border="0" id="adminMember"></a>
					<br>회원 관리
				</td>
				<td id="qna-td">
					<a href="adminProductList.do">
					<img src="img/adminProduct.png" width="100" border="0" id="adminProduct"></a>
					<br>상품 관리
				</td>
				<td id="qna-td">
					<a href="adminOrderList.do">
					<img src="img/adminOrder.png" width="100" border="0" id="adminOrder"></a>
					<br>주문 관리
				</td>
				<td id="qna-td">
					<a href="adminNoticeList.do">
					<img src="img/adminBoard.png" width="100" border="0" id="adminBoard"></a>
					<br>게시판 관리
				</td>
			</tr>
		</tbody>
	</table>
</div>
</body>
</html>