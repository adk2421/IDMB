<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>이미지</td>
			<td>작성자</td>
			<td>상품이름</td>
			<td>작성일</td>
			<td>내용</td>
			<td>별점</td>
			<td>추천수</td>
		</tr>
		
		<tr>
        	<td><img src="/IDMB/img/${reviewDetail[0].P_IMAGE}" style="width: 100px; height: 100px;"/></td>
			<td>${reviewDetail[0].R_ID}</td>
			<td>${reviewDetail[0].R_NAME}</td>
			<td>${reviewDetail[0].R_DATE}</td>
			<td>${reviewDetail[0].R_CONTENTS}</td>
			<td>${reviewDetail[0].R_RATE}</td>
			<td>${reviewDetail[0].R_RECOMMEND}</td>
        </tr>
        
        <c:if test="${reviewDetail[1].R_ID != null}">
        	<tr>
		       	<td>☞</td>
				<td>${reviewDetail[1].R_ID}</td>
				<td>${reviewDetail[1].R_NAME}</td>
				<td>${reviewDetail[1].R_DATE}</td>
				<td>${reviewDetail[1].R_CONTENTS}</td>
				<td>${reviewDetail[1].R_RATE}</td>
				<td></td>
			</tr>
		</c:if>
	</table>
</body>
</html>