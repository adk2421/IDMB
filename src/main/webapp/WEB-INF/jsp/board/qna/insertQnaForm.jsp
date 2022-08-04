<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일단메봐</title>
<!-- Bootstrap CSS CDN -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
		crossorigin="anonymous">
	<!-- Bootstrap JS CDN -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" 
		crossorigin="anonymous"></script>

	<!-- css연결 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/insertqnaform.css?v=<%=System.currentTimeMillis()%>">

	<!-- icon -->
	<!-- 문의하기 -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
	<!-- 비밀번호 -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
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
	<br>
	
<div class="container">
	
	<span id="qnaimage" class="material-symbols-outlined" style="font-size:40px; margin:auto;">
edit
</span>
	<!-- <img src="img/insertQNA.jpg" width="75" border="0" id="qnaimage"> -->
		<font size="25"><b>문의 하기</b></font>
	
<form method="post" id="qnaInsertForm" action="insertQna.do">	
	<table style="width:900px;">
		<tbody style= "margin:auto;">
			<tr>
				<td><b>제목</b></td>
				<td style="float:left; padding-left:15px;"><input style="width:300px;" type="text" name="q_title" id="q_title" value="상품 문의 합니다." readonly></td>
				<td><b>작성자</b></td>		
				<td style="float:left; width: 100px;"><input style="width: 100px;"type="text" size="8" value="${id}" readonly>
					<input type="hidden" name="q_id" id="q_id" value="${id}">
				</td>
				
				<td style="width: 100px; "><b>작성일</b></td>
				<td style="float:left;">
					<c:set var="ymd" value="<%=new java.util.Date()%>" />
					<input type="text" size="8"
						value="<fmt:formatDate value="${ymd}" pattern="yyyy.MM.dd"/>" readonly style="width: 100px; ">
				</td>
			</tr>
			
			<tr>
				<td><b>문의 종류</b></td>
				<td style="padding-left:18px; height: 20px">
					<select class="form-select" name="q_category" id="q_category">
						<option value="product">상품 문의</option>
						<option value="preship">배송 전 문의</option>
						<option value="aftership">배송 후 문의</option>
						<option value="exchange">교환/반품 문의</option>
					</select>
				</td>
			
				<td><b>상품명</b></td>
				<td style="float:left;" colspan="3">
					<input type="text" size="10" name="q_product" id="q_product" style="width: 100px; ">
					<input type="hidden" name="q_code" id="q_code" value="2">
				</td>
			</tr>
			
			<tr style="padding: 20px 20px 20px 20px;">
				<td><b>문의 내용</b></td>
				<td style="padding-left:14px;" colspan="5">
					<textarea id="q_contents" name="q_contents"
						style="margin:auto; width:800px; height: 200px; text-align:left;"
						maxlength="500"></textarea>
				</td>
			</tr>
			
			<tr>
				<td><b>답변 내용</b></td>
				<td colspan="5">
					<div style="margin:auto; border:1px solid black; width:800px; height:200px; text-align:left;">
					</div>
				</td>
			</tr>
			<tr>
				<td><b>비밀번호</b></td>
				
				
				<td style="float:left; padding-left:15px" colspan="5">
				
				<input type="password" name="q_contentspw" id="q_contentspw" size="8">
				
				</td>
			</tr>
					
		</tbody>
	</table>
		
	<br><br>
	
	
	<button class="insert" type="button" onclick="insertCheck()">문 의 작 성</button>
		&emsp;&emsp;
	<button class="back" type="button" onclick="location.href='qnaMain.do'">돌 아 가 기</button>

</form>
</div>
</body>
</html>