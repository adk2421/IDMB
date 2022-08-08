<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
 <!-- Bootstrap JS CDN -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" 
        crossorigin="anonymous"></script>

<!-- css연결 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainpageProductList.css?v=<%=System.currentTimeMillis()%>">
<meta charset="UTF-8">
<title>상품 목록</title>


</head>
<body>
<div class="header">
<!-- 메인페이지 로고 -->

	<a href="/IDMB/"><img src="img/logo.png" width="140" class="main_logo"></a>

			
<!-- 검색창 -->
	<div class="search-box">
		<form action="searchProduct.do" method="get">
			<input type=text name="searchValue" id="search" placeholder="검색어....." >
			<button type="submit" class="search-icon" ><i class="fa fa-search"></i></button>
		</form>
	</div>
<br><br>

<!-- 상품 종류별로 이동 -->


<nav id="topMenu">
	<ul>
		<li><a class="menuLink" href="bestProductList.do">BEST</a></li>
		<li><a class="menuLink" href="newProductList.do">NEW</a></li>
		<li><a class="menuLink" href="kindProductList.do?p_kind=숄더백">숄더백</a></li>
		<li><a class="menuLink" href="kindProductList.do?p_kind=크로스백">크로스백</a></li>
		<li><a class="menuLink" href="kindProductList.do?p_kind=메신저백">메신저백</a></li>
		<li><a class="menuLink" href="kindProductList.do?p_kind=클러치백">클러치백</a></li>
		<li><a class="menuLink" href="kindProductList.do?p_kind=백팩">백팩</a></li>
		<li><a class="menuLink" href="kindProductList.do?p_kind=미니백">미니백</a></li>
	</ul>
</nav>
</div>
<br>

<br><br>

<div class="container">
	<div>
		<h2>&lt;&nbsp;BEST 3&nbsp;&gt;</h2>
	</div>
	<br><br>
	
	<table id="best_tb">
		<tbody>
			<c:forEach var="bestProduct" items="${productBestList}">
			<td width="300" style="padding-left:100px;">
				
				<a href="productDetail.do?p_code=${bestProduct.P_CODE}">
				<img src="img/${bestProduct.P_IMAGE}" width="250" id="previewImage"></a>
				<div style="text-align:center;"><h4>${bestProduct.P_NAME}</h4>
				<p>가격 : ${bestProduct.P_PRICE}</p></div>
			</td>
			</c:forEach>
		</tbody>
	</table>
	
	<br><br>
	<hr>
	<br><br>
	<div><h2>&lt;&nbsp;NEW ITEM&nbsp;&gt;</h2></div>
	<br><br>
	<table id="newitem_tb">
		<tbody>
			<c:forEach var="newProduct" items="${productNewList}">
			<td width="300" style="padding-left:100px;">
				<a href="productDetail.do?p_code=${newProduct.P_CODE}">
				<img src="img/${newProduct.P_IMAGE}" width="250" id="previewImage"></a>
				<div style="text-align:center;"><h4>${newProduct.P_NAME}</h4>
				<p>가격 : ${newProduct.P_PRICE}</p></div>
			</td>
			</c:forEach>
		</tbody>
	</table>

</div>


</body>
</html>