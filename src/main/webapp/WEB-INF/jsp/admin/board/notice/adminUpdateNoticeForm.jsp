<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일단메봐</title>
<script>
function updateCheck() {
	
	var form = document.getElementById("noticeUpdateForm");
	var N_TITLE = document.getElementById("n_title");
	var N_CONTENTS = document.getElementById("n_contents");
	
	if(confirm("공지를 수정하시겠습니까?") == true){
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

function deleteCheck() {
	if(confirm("공지를 삭제하시겠습니까?") == true){
		location.href = "/IDMB/adminDeleteNotice.do?n_num=${adminNoticeBean.N_NUM}";
	}	
}

function cancel() {
	location.href = "/IDMB/adminNoticeList.do";
}
</script>
</head>
<body>
<form method="post" id="noticeUpdateForm"
	action="adminUpdateNotice.do?n_num=${adminNoticeBean.N_NUM}">
	<table>
		<tbody>
			<tr>
				<td><b>제목 </b></td>
				<td><input type="text" maxlength="50" id="n_title" name="n_title"
					value="${adminNoticeBean.N_TITLE}">
				</td>
			</tr>
		</tbody>
	</table>
	<br><br>
	<b>내용</b><br>
	<div style="width:490px; height:293px; border:1px solid black;">
		<textarea id="n_contents" name="n_contents" rows="20" cols="65" maxlength="500">
			${adminNoticeBean.N_CONTENTS}
		</textarea>
	</div>

	<br>
	<button type="button" onClick="updateCheck()">수 &emsp; 정</button>
       &emsp;&emsp;
    <button type="button" onClick="deleteCheck()">삭 &emsp; 제</button>
       &emsp;&emsp;
	<button type="button" onclick="cancel()">취 &emsp; 소</button>	
</form>
</body>
</html>