// find.js

	/* 아이디 찾기 유효성 체크 */
	function formCheck() {
		var form = document.getElementById("findPwForm");
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
			// findIdForm 실행
			if(id.value == "@@@@") {
				form = document.getElementById("findIdForm");
			}
				
			form.submit();
		}
	}
	
	function sessionFindId(url, value) {
		sessionStorage.setItem("findId", value);
		location.href='/IDMB/' + url + '.do';
	}
	
	function getSessionFindId() {
		var findId = sessionStorage.getItem("findId");
		return findId;
	}
	
	/* 비밀번호를 다 입력하고 엔터키 입력시 로그인 시도 */
	function keyPress() {
		if (window.event.keyCode == 13) {
			return formCheck();
		}
	}

	/* 첫 화면 로딩 시 포커스 */
	window.onload = function() {
		document.getElementById("name").focus();
	}
	
	/* 특수문자 없이 영어, 숫자만 받기 */
	function inputNoSpecial(key)  {
		key.value = key.value.replace(/[^a-z0-9]/ig, '')
	}
	
	/* 공백 받지 않기 */
	function inputNoBlank(key)  {
		key.value = key.value.replace(/\s/ig, '')
	}
	
	/* 숫자만 받기 */
	function inputNumberOnly(key)  {
		key.value = key.value.replace(/[^0-9]/ig, '')
	}
	