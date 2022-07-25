<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
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

	<img src="img/${adminQnaBean.Q_CATEGORY}QNA.png" width="75" border="0" id="imageQNA">
	<c:if test="${adminQnaBean.Q_CATEGORY == 'product'}">
		<font size="25">상품 문의</font></c:if>
	<c:if test="${adminQnaBean.Q_CATEGORY == 'preship'}">
		<font size="25">배송 전 문의</font></c:if>
	<c:if test="${adminQnaBean.Q_CATEGORY == 'aftership'}">
		<font size="25">배송 후 문의</font></c:if>
	<c:if test="${adminQnaBean.Q_CATEGORY == 'exchange'}">
		<font size="25">교환/반품 문의</font></c:if>

<form method="post" id="qnaInsertForm" action="adminInsertQna.do">	
	<table>
		<tbody>
			<tr>
				<td><b>제목</b></td>
				<td><input type="text" value="${adminQnaBean.Q_TITLE}" readonly></td>
				<td><b>작성자</b></td>		
				<td><input type="text" size="8" value="${adminQnaBean.Q_ID}" readonly></td>
				<td><b>작성일</b></td>
				<td>
					<input type="text" size="8" value=
						"<fmt:formatDate value="${adminQnaBean.Q_DATE}" pattern="yyyy.MM.dd"/>" readonly>
				</td>
			</tr>
			<tr>
				<td><b>상품명</b></td>
				<td colspan="5">
					<input type="text" size="10" value="${adminQnaBean.Q_PRODUCT}" readonly>
				</td>
			</tr>
			<tr>
				<td><b>문의 내용</b></td>
				<td colspan="5">
					<input type="text" style="width:400px;height:150px;"
						 value="${adminQnaBean.Q_CONTENTS}" readonly>
				</td>
			</tr>
			<tr>
				<td><b>답변 내용</b></td>
				<td colspan="5">
					<textarea id="q_contents" name="q_contents"
						style="width:400px;height:150px;" maxlength="500"></textarea>
				</td>
			</tr>		
		</tbody>
	</table>
		
	<br><br>
	
	<input type="hidden" id="q_code" name="q_code" value="${adminQnaBean.Q_CODE}">
	<input type="hidden" id="q_category" name="q_category" value="${adminQnaBean.Q_CATEGORY}">
	<input type="hidden" id="q_title" name="q_title" value="[답변]${adminQnaBean.Q_TITLE}">
	<input type="hidden" id="q_product" name="q_product" value="${adminQnaBean.Q_PRODUCT}">
	<input type="hidden" id="q_groupnum" name="q_groupnum" value="${adminQnaBean.Q_GROUPNUM}">
	
	
	<button type="button" onclick="insertCheck()">답 변 달 기</button>
		&emsp;&emsp;
	<button type="button" onclick="location.href='adminQnaDetail.do?q_num=${adminQnaBean.Q_NUM}'">돌 아 가 기</button>

</form>
</body>
</html>