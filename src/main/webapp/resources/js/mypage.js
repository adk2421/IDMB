// mypage.js
	
	// 포커스 이동
	function focusdiv() {
		console.log("focus 실행");
		document.getElementById("divFocus").tabIndex = -1;
		document.getElementById("divFocus").focus();
	
		// 사용법 <a href="javascript:focusdiv();">
	}
	
	// 주문 처리 현황 값이 NULL이면 0으로 변경
	function orderProc() {
		if (<%= request.getAttribute("배송대기") %> == null)
		$('#o_proc_val1').text("0");
		if (<%= request.getAttribute("배송준비중") %> == null)
		$('#o_proc_val2').text("0");
		if (<%= request.getAttribute("배송중") %> == null)
		$('#o_proc_val3').text("0");
		if (<%= request.getAttribute("베송완료") %> == null)
		$('#o_proc_val4').text("0");
	}
	
	// 페이지 로딩 시, 자동 실행
	$(document).ready(function() {
		orderProc();
	});
