<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<link type="text/css"href="css/adminQna.css"rel="stylesheet">  
<link rel="stylesheet" href="css/style.css" type="text/css">
<meta charset="UTF-8">
<title>일단메봐</title>
<script>
function insertCheck() {
	
	var form = document.getElementById("qnaInsertForm");
	var Q_CONTENTS = document.getElementById("q_contents");
	
	if(confirm("답변을 작성하시겠습니까?") == true){
		if(Q_CONTENTS.value.trim()==""){
			alert("답변을 작성해주세요.");
			Q_CONTENTS.focus();
			return false;
		} else {
			form.submit();
		}
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
			<li id="borad-ad"style="display:inline"><a href="adminNoticeList.do" >게시판 관리</a></li>
		</ul>	
		</div>
	</div>
	<hr>
<div class="container">	
	<div class="top">
		<img src="img/${adminQnaBean.Q_CATEGORY}QNA.png" width="75" border="0" id="imageQNA2">
		<div id="qd-list">
			<c:if test="${adminQnaBean.Q_CATEGORY == 'product'}">상품 문의</c:if>
			<c:if test="${adminQnaBean.Q_CATEGORY == 'preship'}">배송 전 문의</c:if>
			<c:if test="${adminQnaBean.Q_CATEGORY == 'aftership'}">배송 후 문의</c:if>
			<c:if test="${adminQnaBean.Q_CATEGORY == 'exchange'}">교환/반품 문의</c:if>
		</div>
	</div>
	<div class="q-form">	
		<form method="post" id="qnaInsertForm" action="adminInsertQna.do">	
		
		<table>
				<tr>
					<td id="title-td">제&emsp;목
					<input type="text" value="${adminQnaBean.Q_TITLE}" readonly></td>
					<td id="day-td">작성일 &emsp;&emsp;
						<fmt:formatDate value="${adminQnaBean.Q_DATE}" pattern="yyyy.MM.dd"/>
					</td>
				</tr>
			</table>	
			<div class="q-form-list1">
				<label>작성자</label>				
					<input id="writer"type="text" size="8" value="${adminQnaBean.Q_ID}" readonly>
			</div>		
			<div class="q-form-list1">	
				<label>상품명</label>
						<input id="p_name" type="text" size="10" value="${adminQnaBean.Q_PRODUCT}" readonly>
			</div>	
			<div class="q-form-list4">		
				<label>문의 내용</label>
						<input  id="q_content2" type="text" style="width:393px;height:150px;"
							 value="${adminQnaBean.Q_CONTENTS}" readonly>
			</div>
			<div class="q-form-list3">
			<label>답변 내용</label>
						<textarea id="q_contents" name="q_contents" maxlength="500"></textarea>		
			</div>
		</form>
	</div>
</div>		
	<br><br>
<div class="footer">	
	<input type="hidden" id="q_code" name="q_code" value="${adminQnaBean.Q_CODE}">
	<input type="hidden" id="q_category" name="q_category" value="${adminQnaBean.Q_CATEGORY}">
	<input type="hidden" id="q_title" name="q_title" value="[답변]${adminQnaBean.Q_TITLE}">
	<input type="hidden" id="q_product" name="q_product" value="${adminQnaBean.Q_PRODUCT}">
	<input type="hidden" id="q_groupnum" name="q_groupnum" value="${adminQnaBean.Q_GROUPNUM}">
	
	<div class="fbtn">
		<button id="ans-btn" type="button" onclick="insertCheck()">답 변 달 기</button>
		<button id="back-btn" type="button" onclick="location.href='adminQnaDetail.do?q_num=${adminQnaBean.Q_NUM}'">돌 아 가 기</button>
	</div>
</div>

</body>
</html>