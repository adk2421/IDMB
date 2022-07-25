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
function noticeList() {
	location.href = "/IDMB/noticeList.do";
}
function reviewList() {
	location.href = "/IDMB/reviewList.do";
}
function faqList() {
	location.href = "/IDMB/faqList.do?f_category=cost";
}
function qnaMain() {
	location.href = "/IDMB/qnaMain.do";
}

</script>
</head>
<body>
		&emsp;
	<button type="button" onClick="noticeList()">공지 사항</button>
		&emsp;&emsp;&emsp;&emsp;
	<button type="button" onClick="reviewList()">상품 후기</button>
		&emsp;&emsp;&emsp;&emsp;
	<button type="button" onClick="faqList()">자주 묻는 질문</button>
		&emsp;&emsp;&emsp;&emsp;
	<button type="button" onClick="qnaMain()">1:1 문의</button>
	
	<br><br>
	
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
	
	<br>
	
	<table width="600px" border=1>
		<tbody>
		<c:forEach var="faq" items="${faqList}">
			<tr>
				<td><b>Q. ${faq.F_TITLE}</b>
					<br>
					A. ${faq.F_CONTENTS}
				</td>
				<td>
					&emsp;
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<br><br>

</body>
</html>