<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/adminProduct.css" type="text/css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>일단메봐</title>
<script>
function formCheck() {
	var form = document.getElementById("updateForm");
	var P_KIND = document.getElementById("p_kind");
	var P_NAME = document.getElementById("p_name");
	var P_PRICE = document.getElementById("p_price");
	var P_STOCK = document.getElementById("p_stock");
	var P_IMAGE = document.getElementById("p_image");
	var P_DETAIL = document.getElementById("p_detail");
	
	if(confirm("상품을 수정하시겠습니까?") == true) {
		if(P_KIND == null) {
			alert("상품 종류를 선택해주세요.");
			P_KIND.focus();
			return false;
		} else if(P_NAME = null || P_NAME.value.trim()=="") {
			alert("상품 이름을 입력해주세요.");
			P_NAME.focus();
			return false;
		} else if(P_PRICE = null || P_PRICE.value.trim()=="") {
			alert("상품 가격을 입력해주세요.");
			P_PRICE.focus();
			return false;
		} else if(P_STOCK = null || P_STOCK.value.trim()=="") {
			alert("상품 수량을 입력해주세요.");
			P_STOCK.focus();
			return false;
		} else if(P_IMAGE = null || P_IMAGE.value.trim()=="") {
			alert("상품 이미지를 넣어주세요.");
			return false;
		} else if(P_DETAIL = null || P_DETAIL.value.trim()=="") {
			alert("상세정보를 입력해주세요.");
			P_DETAIL.focus();
			return false;
		} else {	
			form.submit();
		}
	}
}

function cancel() {
	location.href = "/IDMB/adminProductList.do";
}

function readImage(input) {
	// 인풋 태그에 파일이 있는 경우
	if(input.files && input.files[0]) {
		// 이미지 파일인지 검사 (생략)
		
		// FileReader 인스턴스 생성
		const reader = new FileReader();
		
		// 이미지가 로드가 된 경우
		reader.onload = e => {
			const previewImage = document.getElementById("previewImage");
			previewImage.src = e.target.result;
		};
		
		// reader가 이미지 읽도록 하기
		reader.readAsDataURL(input.files[0]);
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
			<li id="product-ad" style="display:inline"><a href="adminProductList.do" >상품 관리</a></li>
			<li id="title-text1" style="display:inline"><a href="adminOrderList.do" >주문 관리</a></li>
			<li id="title-text1" style="display:inline"><a href="adminNoticeList.do" >게시판 관리</a></li>
		</ul>	
		</div>
	</div>
	<hr>

<div class="container">
<form method="post" id="updateForm"
	action="adminUpdateProduct.do?p_code=${adminProductBean.P_CODE}">
	<table style="margin:auto; text-align: center;" border=1>
		<tbody>
			<tr>
				<td>
					<b>상품 종류</b>
				</td>
				<td>
					<select name="p_kind" id="p_kind">
						<option value="">--선택하세요--</option>
						<option value="숄더백" <c:if test="${adminProductBean.P_KIND == '숄더백'}">selected</c:if>>숄더백</option>
						<option value="클러치백" <c:if test="${adminProductBean.P_KIND == '클러치백'}">selected</c:if>>클러치백</option>
						<option value="크로스백" <c:if test="${adminProductBean.P_KIND == '크로스백'}">selected</c:if>>크로스백</option>
						<option value="메신저백" <c:if test="${adminProductBean.P_KIND == '메신저백'}">selected</c:if>>메신저백</option>
						<option value="레더백" <c:if test="${adminProductBean.P_KIND == '레더백'}">selected</c:if>>레더백</option>
						<option value="백팩" <c:if test="${adminProductBean.P_KIND == '백팩'}">selected</c:if>>백팩</option>
					</select>
				</td>
			</tr>	
			<tr>
				<td>
					<b>상품명</b>
				</td>
				<td>
					<input type="text" maxlength="150" id="p_name" name="p_name"
						value="${adminProductBean.P_NAME}">
				</td>
			</tr>
			<tr>
				<td>
					<b>상품 가격</b>
				</td>	
				<td>
					<input type="text" maxlength="10" id="p_price" name="p_price"
						value="${adminProductBean.P_PRICE}"
						onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
				</td>
			</tr>
			
			<tr>
				<td>
					<b>상품 재고</b>
				</td>	
				<td>
					<input type="text" maxlength="10" id="p_stock" name="p_stock"
						value="${adminProductBean.P_STOCK}"
						onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
				</td>
			</tr>
			
			<tr>
				<td>
					<b>상품 이미지</b>
				</td>	
				<td>
					<input type="file" id="p_image" name="p_image"
						value="${adminProductBean.P_IMAGE}">
				</td>
			</tr>
		
			<tr>
				<td>
					<b>상품 이미지<br>미리보기</b>
				</td>
				<td>
					<img src="img/${adminProductBean.P_IMAGE}" width="300" border="0"
						id="previewImage">
					<script>
						const inputImage = document.getElementById("p_image");
						// input file에 change 이벤트 부여
						inputImage.addEventListener("change", e=> {
							readImage(e.target)
						})
					</script>
				</td>
			</tr>
			
			<tr>
				<td>
					<b>상품 상세 정보</b>
				</td>
				<td>
				<textarea id="p_detail" name="p_detail"
					style="width:300px; height:400px">${adminProductBean.P_DETAIL}</textarea>	
				</td>
			</tr>
			<tr>
				<td>
					<b>상품 판매 유무</b>
				</td>
				<td>
				<c:if test="${adminProductBean.P_DELFLAG == 'N'}">
					<input type="checkbox" size="100" name="p_delflag" value="Y"> 
				</c:if>
				<c:if test="${adminProductBean.P_DELFLAG == 'Y'}">
					<input type="checkbox" size="100" name="p_delflag" value="Y" checked> 
				</c:if>
				(체크 = 판매 중지)
				<br>
				</td>
			</tr>			
		</tbody>
	</table>
	<br>
</form>
</div>	
	<div class="btn">
		<button id="regis" type="button" onClick="formCheck()">수 정</button>
		<button id="cancle" type="button" onclick="cancel()">취 소</button>		
	</div>		
	

</body>
