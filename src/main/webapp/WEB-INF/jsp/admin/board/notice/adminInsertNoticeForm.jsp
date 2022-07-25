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
	
	var form = document.getElementById("noticeInsertForm");
	var N_TITLE = document.getElementById("n_title");
	var N_CONTENTS = document.getElementById("n_contents");
	
	if(confirm("공지를 작성하시겠습니까?") == true){
		if(N_TITLE == null){
			alert("제목을 작성해주세요.");
			N_TITLE.focus();
			return false;
		} else if (N_CONTENTS == null){
			alert("내용을 작성해주세요.");
			N_CONTENTS.focus();
			return false;
		} else{
			form.submit();
		}
	}
}

function cancel() {
	location.href = "/IDMB/adminNoticeList.do";
}
</script>
</head>
<body>
<form method="post" id="noticeInsertForm" action="adminInsertNotice.do">
	<table>
		<tbody>
			<tr>
				<td><b>제목</b></td>
				<td>
					<input type="text" maxlength="50" id="n_title" name="n_title">
				</td>
			</tr>
			<tr>
				<td><b>작성일</b></td>
				<td>
					<c:set var="ymd" value="<%=new java.util.Date()%>" />
					<fmt:formatDate value="${ymd}" pattern="yyyy년 MM월 dd일 a hh:mm" />
				</td>
			</tr>
			<tr>
				<td><b>조회수</b></td>
				<td>0</td>
			</tr>
			<tr>
				<td><b>내용</b></td>			
			</tr>			
		</tbody>
	</table>

	<textarea id="n_contents" name="n_contents" 
		style="width:490px; height:285px;" maxlength="500"></textarea>


	<br>
	<button type="button" onClick="insertCheck()">작 &emsp; 성</button>
       &emsp;&emsp;
       &emsp;&emsp;
	<button type="button" onclick="cancel()">취 &emsp; 소</button>	
</form>
</body>
</html>