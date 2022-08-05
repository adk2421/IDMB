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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css?v=<%=System.currentTimeMillis()%>">

<script>

</script>

</head>
<body>

	<br><br><br><br>
	<hr><p>

	<!-- 게시판 바로가기 -->
	<div class="short" style="display: flex; justify-content: center;">
	<ul style="list-style-type:none">
		<li style="width:500px; display:inline"><a class="short" href="noticeList.do" >공 지 사 항 &nbsp;&nbsp;</a></li>
		<li style="display:inline"><a class="short" href="reviewList.do" >상 품 후 기 &nbsp;&nbsp;</a></li>
		<li style="display:inline"><a class="short" href="faqList.do?f_category=cost" >F A Q &nbsp;&nbsp;</a></li>
		<li style="display:inline"><a class="short" href="qnaMain.do" >1:1 문 의 &nbsp;&nbsp;</a></li>
	</ul>
	</div>
	
	
	<table class="tableimg" style="margin:auto; text-align: center; ">
		<tbody>
			<tr>
				<td>
					<a href="qnaList.do?q_category=product">
					<img src="img/productQNA.png" width="100" border="0" id="productQNA"></a>
					<br>상품 문의
				</td> 
				<td>
					<a href="qnaList.do?q_category=preship">
					<img src="img/preshipQNA.png" width="100" border="0" id="preshipQNA"></a>
					<br>배송 전 문의
				</td>
				<td>
					<a href="qnaList.do?q_category=aftership">
					<img src="img/aftershipQNA.png" width="100" border="0" id="aftershipQNA"></a>
					<br>배송 후 문의
				</td>
				<td>
					<a href="qnaList.do?q_category=exchange">
					<img src="img/exchangeQNA.png" width="100" border="0" id="exchangeQNA"></a>
					<br>교환/반품 문의
				</td>
			</tr>
		</tbody>
	</table>
	

</body>
</html>