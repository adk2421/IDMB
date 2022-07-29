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
	var Q_TITLE = document.getElementById("q_title");
	var Q_PRODUCT = document.getElementById("q_product");
	
	if(confirm("문의를 작성하시겠습니까?") == true){
		if(Q_CONTENTS.value.trim()==""){
			alert("문의을 작성해주세요.");
			Q_CONTENTS.focus();
			return false;
		} else if(Q_TITLE.value.trim()==""){
			alert("제목을 작성해주세요.");
			Q_TITLE.focus();
			return false;
		} else if(Q_PRODUCT.value.trim()==""){
			alert("제목을 작성해주세요.");
			Q_PRODUCT.focus();
			return false;
		} else {
			form.submit();
		}
	}
}
</script>
</head>
<body>

	<img src="img/insertQNA.jpg" width="75" border="0" id="qnaimage">
		<font size="25">문의 하기</font>
	
<form method="post" id="qnaInsertForm" action="insertQna.do">	
	<table>
		<tbody>
			<tr>
				<td><b>제목</b></td>
				<td><input type="text" name="q_title" id="q_title" value="상품 문의 합니다."></td>
				<td><b>작성자</b></td>		
				<td><input type="text" size="8" value="${id}" readonly>
					<input type="hidden" name="q_id" id="q_id" value="${id}">
				</td>
				<td><b>작성일</b></td>
				<td>
					<c:set var="ymd" value="<%=new java.util.Date()%>" />
					<input type="text" size="8"
						value="<fmt:formatDate value="${ymd}" pattern="yyyy.MM.dd"/>" readonly>
				</td>
				
				
			</tr>
			<tr>
				<td><b>문의 종류</b></td>
				<td>
					<select name="q_category" id="q_category">
						<option value="product">상품 문의</option>
						<option value="preship">배송 전 문의</option>
						<option value="aftership">배송 후 문의</option>
						<option value="exchange">교환/반품 문의</option>
					</select>
				</td>
			
				<td><b>상품명</b></td>
				<td colspan="3">
					<input type="text" size="10" name="q_product" id="q_product">
					<input type="hidden" name="q_code" id="q_code" value="2">
				</td>
			</tr>
			<tr>
				<td><b>문의 내용</b></td>
				<td colspan="5">
					<textarea id="q_contents" name="q_contents"
						style="width:400px; height:150px; text-align:left;"
						maxlength="500"></textarea>
				</td>
			</tr>
			<tr>
				<td><b>답변 내용</b></td>
				<td colspan="5">
					<div style="border:1px solid black; width:400px; height:150px;">
					</div>
				</td>
			</tr>
			<tr>
				<td><b>비밀번호</b></td>
				<td colspan="5">
					<input type="password" name="q_contentspw" id="q_contentspw" size="8">
				</td>
			</tr>
					
		</tbody>
	</table>
		
	<br><br>
	
	
	<button type="button" onclick="insertCheck()">문 의 작 성</button>
		&emsp;&emsp;
	<button type="button" onclick="location.href='qnaMain.do'">돌 아 가 기</button>

</form>
</body>
</html>