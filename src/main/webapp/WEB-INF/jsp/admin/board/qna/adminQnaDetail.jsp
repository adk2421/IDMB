<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<link type="text/css"href="css/adminQna.css"rel="stylesheet">  
<link rel="stylesheet" href="css/style.css" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>일단메봐</title>
<script>
function deleteCheck() {
	if(confirm("문의를 삭제하시겠습니까?") == true){
		location.href="/IDMB/adminDeleteQna.do?q_num=${adminQnaBean.Q_NUM}"
	}	
}
</script>
</head>
<body>
	<!-- 관리자 메인 툴바 -->
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
	<div class="top">		
		<img src="img/${adminQnaBean.Q_CATEGORY}QNA.png" id="imageQNA2">
		<div id="qd-list">
			<c:if test="${adminQnaBean.Q_CATEGORY == 'product'}">상품 문의</c:if>
			<c:if test="${adminQnaBean.Q_CATEGORY == 'preship'}">배송 전 문의</c:if>
			<c:if test="${adminQnaBean.Q_CATEGORY == 'aftership'}">배송 후 문의</c:if>
			<c:if test="${adminQnaBean.Q_CATEGORY == 'exchange'}">교환/반품 문의</c:if>
		</div>
	</div>
	<div class="q-form">
		<div class="title-day-tb">
			<table>
			<tr>
				<td id="title-td">제&emsp;목
					<input id="pq-title" type="text" value="${adminQnaBean.Q_TITLE}" readonly>
				</td>
				<td id="day-td">작성일 &emsp;&emsp;		
					<fmt:formatDate value="${adminQnaBean.Q_DATE}" pattern="yyyy.MM.dd"/>
				</td></tr>
			</table>
		</div>
		<div class="q-form-list1">
			<label>작성자</label>		
				<input id="writer"type="text" size="8" value="${adminQnaBean.Q_ID}" readonly>
		</div>
		<div class="q-form-list1">	
			<label>상품명</label>
				<input id="p_name" type="text" size="10" value="${adminQnaBean.Q_PRODUCT}" readonly>
		</div>
		<div class="q-form-list3">		
		<label>문의 내용</label>
			<div id="q_content"style="border:1px solid black;width:550px;height:150px;">
						${adminQnaBean.Q_CONTENTS}
			</div>
		</div>
		<div class="q-form-list3">
			<label>답변 내용</label>
				<div id="a_content"style="border:1px solid black;width:550px;height:150px;">
							${adminQnaReBean.Q_CONTENTS}
				</div>
		</div>
	</div>
</div>	
	<br>
<div class="footer">	
	<div class="fbtn">	
		<c:if test="${adminQnaBean.Q_STATUS == '답변대기'}">
			<button id="ans-btn" type="button" onclick="location.href='adminInsertQnaForm.do?q_num=${adminQnaBean.Q_NUM}'">답 변 달 기</button>
		</c:if>
		<c:if test="${adminQnaBean.Q_STATUS != '답변대기'}">
			&emsp;&emsp;&emsp;
		</c:if>	
		<c:if test="${adminQnaBean.Q_TITLE == '[삭제됨]'}">
			&emsp;&emsp;&emsp;&emsp;&emsp;
		</c:if>	
		<c:if test="${adminQnaBean.Q_TITLE != '[삭제됨]'}">
			<button id="q-rmbtn"type="button" onclick="deleteCheck()">문 의 삭 제</button>
		</c:if>	
			<button id="back-btn"type="button" onclick="location.href='adminQnaList.do?q_category=${adminQnaBean.Q_CATEGORY}'">돌 아 가 기</button>
	</div>
</div>	
</body>
</html>