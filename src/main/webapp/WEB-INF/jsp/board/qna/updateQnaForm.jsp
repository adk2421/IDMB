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
function updateCheck() {
	
	var form = document.getElementById("qnaUpdateForm");
	var Q_CONTENTS = document.getElementById("q_contents");
	
	if(confirm("문의를 수정하시겠습니까?") == true){
		if(Q_CONTENTS.value.trim()==""){
			alert("문의를 작성해주세요.");
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

	<img src="img/${qnaBean.Q_CATEGORY}QNA.png" width="75" border="0" id="qnaimage">
	<c:if test="${qnaBean.Q_CATEGORY == 'product'}">
		<font size="25">상품 문의</font></c:if>
	<c:if test="${qnaBean.Q_CATEGORY == 'preship'}">
		<font size="25">배송 전 문의</font></c:if>
	<c:if test="${qnaBean.Q_CATEGORY == 'aftership'}">
		<font size="25">배송 후 문의</font></c:if>
	<c:if test="${qnaBean.Q_CATEGORY == 'exchange'}">
		<font size="25">교환/반품 문의</font></c:if>

<form method="post" id="qnaUpdateForm" action="updateQna.do?q_num=${qnaBean.Q_NUM}">	
	<table>
		<tbody>
			<tr>
				<td><b>제목</b></td>
				<td><input type="text" value="${qnaBean.Q_TITLE}" readonly></td>
				<td><b>작성자</b></td>		
				<td><input type="text" size="8" value="${qnaBean.Q_ID}" readonly></td>
				<td><b>작성일</b></td>
				<td>
					<input type="text" size="8" value=
						"<fmt:formatDate value="${qnaBean.Q_DATE}" pattern="yyyy.MM.dd"/>" readonly>
				</td>
			</tr>
			<tr>
				<td><b>상품명</b></td>
				<td colspan="5">
					<input type="text" size="10" value="${qnaBean.Q_PRODUCT}" readonly>
				</td>
			</tr>
			<tr>
				<td><b>문의 내용</b></td>
				<td colspan="5">
					<textarea id="q_contents" name="q_contents"
						style="width:400px; height:150px; text-align:left;"
						maxlength="500">${qnaBean.Q_CONTENTS}</textarea>
				</td>
			</tr>
			<tr>
				<td><b>답변 내용</b></td>
				<td colspan="5">
					<div style="border:1px solid black; width:400px; height:150px;">
						${qnaReBean.Q_CONTENTS}
					</div>
				</td>
			</tr>		
		</tbody>
	</table>
		
	<br><br>
	
	
	<button type="button" onclick="updateCheck()">문 의 수 정</button>
		&emsp;&emsp;
	<button type="button" onclick="location.href='qnaDetail.do?q_num=${qnaBean.Q_NUM}'">돌 아 가 기</button>

</form>
</body>
</html>