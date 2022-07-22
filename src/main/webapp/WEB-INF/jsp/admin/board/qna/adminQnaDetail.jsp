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
function deleteCheck() {
	if(confirm("문의를 삭제하시겠습니까?") == true){
		location.href="/IDMB/adminDeleteQna.do?q_num=${adminQnaBean.Q_NUM}"
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
					<div style="border:1px solid black;width:400px;height:150px;">
						${adminQnaBean.Q_CONTENTS}
					</div>
				</td>
			</tr>
			<tr>
				<td><b>답변 내용</b></td>
				<td colspan="5">
					<div style="border:1px solid black;width:400px;height:150px;">
						${adminQnaReBean.Q_CONTENTS}
					</div>
				</td>
			</tr>		
		</tbody>
	</table>
	
	<br><br>
	
	<c:if test="${adminQnaBean.Q_STATUS == '답변대기'}">
		<button type="button" onclick="location.href='adminInsertQnaForm.do?q_num=${adminQnaBean.Q_NUM}'">답 변 달 기</button>
	</c:if>
	<c:if test="${adminQnaBean.Q_STATUS != '답변대기'}">
		&emsp;&emsp;&emsp;
	</c:if>
	
	&emsp;&emsp;
		
	<c:if test="${adminQnaBean.Q_TITLE == '[삭제됨]'}">
		&emsp;&emsp;&emsp;&emsp;&emsp;
	</c:if>	
	<c:if test="${adminQnaBean.Q_TITLE != '[삭제됨]'}">
		<button type="button" onclick="deleteCheck()">문 의 삭 제</button>
	</c:if>	
	
	&emsp;&emsp;
	
	<button type="button" onclick="location.href='adminQnaList.do?q_category=${adminQnaBean.Q_CATEGORY}'">돌 아 가 기</button>
	
</body>
</html>