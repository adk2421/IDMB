// find.js

	/* 아이디 찾기 유효성 체크 */
	function formCheck() {
		var form = document.getElementById("findIdForm");
		var name = document.getElementById("name");
		var phone = document.getElementById("phone");
		var id = document.getElementById("id");
			
		if (id.value.trim() == "") {
			alert("아이디를 입력해주세요.");
			id.focus();
			return false;
			
		} else if (name.value.trim() == "") {
			alert("이름을 입력해주세요.");
			name.focus();
			return false;
	
		} else if (phone.value.trim() == "") {
			alert("휴대폰 번호를 입력해주세요.");
			phone.focus();
			return false;
		
		} else {
			if(id.value == "@@@@")
				document.getElementById("id").value = null;
				
			form.submit();
		}
	}
	
	/* 비밀번호를 다 입력하고 엔터키 입력시 로그인 시도 */
	function keyPress() {
		if (window.event.keyCode == 13) {
			return formCheck();
		}
	}

	$(document).on("keyup", "input[numberOnly]", function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );})
	$(document).on("keyup", "input[noBlank]", function() {$(this).val( $(this).val().replace(/\s/gi,"") );})
	$(document).on("keyup", "input[noBlank]", function() {$(this).val( $(this).val().replace("관리자","") );})
	$(document).on("keyup", "input[noSpecial]", function() {$(this).val($(this).val().replace(/[^ㄱ-힣a-zA-Z0-9@]/gi, ""));})

	/* 첫 화면 로딩 시 포커스 */
	window.onload = function() {
		document.getElementById("name").focus();
	}
	