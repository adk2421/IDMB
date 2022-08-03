// modify.js

	function formCheck() {
		console.log("formCheck() 실행")
		if (confirm("수정하시겠습니까?") == true) {
			var passwd = document.getElementById("passwd");
			var passwdcheck = document.getElementById("passwdcheck");
			var phone = document.getElementById("phone");
			var email = document.getElementById("email");
			var address2 = document.getElementById("address2");
	
			console.log("formCheck() true 실행")
			if (passwd.value.trim() == "") {
				alert("비밀번호를 입력해주세요.");
				passwd.focus();
				return false;
			}
	
			if (passwdcheck.value != passwdcheck.value) {
				alert("비밀번호가 일치하지 않습니다.");
				passwdcheck.focus();
				return false;
			}
	
			if (phone.value.trim() == "") {
				alert("휴대폰 번호를 입력해주세요.");
				phone.focus();
				return false;
			}
	
			if (email.value.trim() == "") {
				alert("이메일을 입력해주세요.");
				email.focus();
				return false;
			}
	
			if (address2.value.trim() == "") {
				alert("상세 주소를 입력해주세요.");
				address2.focus();
				return false;
			}
	
			document.getElementById('myInfoModifyForm').submit();
		}
	}
	
	// 회원 탈퇴
	function resign(form) {
		if (confirm("탈퇴하시겠습니까?") == true) {
			form.action = "myInfoDelete.do";
			form.submit();
			return true;
		}
	}
	
	$(document).ready(function() {
		var id = $('#id').val();
	});
	
	
	/* 첫 화면 로딩 시 포커스 */
	window.onload = function() {
		document.getElementById("passwd").focus();
	}
	
	// 가입 취소하고 메인 페이지로 이동
	function cancle() {
		location.href = "/IDMB/myPage.do";
	}
	
	/* 특수문자 없이 영어, 숫자만 받기 */
	function inputNoSpecial(key)  {
		key.value = key.value.replace(/[^a-z0-9]/ig, '')
	}
	
	/* 한글만 받기 - 수정해야함 */
	function inputKoreanOnly(key)  {
		key.value = key.value.replace(/[^ㄱ-ㅎ|가-힣]/ig, '')
	}
	
	/* 공백 받지 않기 */
	function inputNoBlank(key)  {
		key.value = key.value.replace(/\s/ig, '')
	}
	
	/* 숫자만 받기 */
	function inputNumberOnly(key)  {
		key.value = key.value.replace(/[^0-9]/ig, '')
	}
