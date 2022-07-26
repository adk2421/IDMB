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

</script>
</head>
<body>

	<!-- 게시판 바로가기 -->
	<div style="display: flex; justify-content: center;">
	<ul style="list-style-type:none">
		<li style="width:500px; display:inline"><a href="noticeList.do" >공 지 사 항</a></li>
		<li style="display:inline"><a href="reviewList.do" >상 품 후 기</a></li>
		<li style="display:inline"><a href="faqList.do?f_category=cost" >F A Q</a></li>
		<li style="display:inline"><a href="qnaMain.do" >1:1 문 의</a></li>
	</ul>
	</div>
	<hr>
	
	<br>
	
	<div style="margin:auto; text-align: center;">
	<form action="faqList.do" method="get">
			&emsp;
		<button type="submit" name="f_category" id="f_category" value="cost">주문/결제</button>
			&emsp;
		<button type="submit" name="f_category" id="f_category" value="shipping">배송문의</button>
			&emsp;
		<button type="submit" name="f_category" id="f_category" value="cancel">배송변경/취소</button>
			&emsp;
		<button type="submit" name="f_category" id="f_category" value="exchange">교환/반품</button>
			&emsp;
		<button type="submit" name="f_category" id="f_category" value="logon">회원가입/로그인</button>	
	</form>
	</div>
	
	<br>
	
	<table style="margin:auto; text-align: left; width:800px;" border=1>
		<tbody>
		<c:forEach var="faq" items="${faqList}">
			<tr>
				<td><b>Q. ${faq.F_TITLE}</b>
					<br>
					A. ${faq.F_CONTENTS}
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<br><br>

</body>
</html>