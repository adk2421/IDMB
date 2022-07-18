// join.js
	
	/* 회원가입 입력 값 유효성 체크 */
	function formCheck() {
		var id = document.getElementById("id");
		var passwd = document.getElementById("passwd");
		var passwdcheck = document.getElementById("passwdcheck");
		var name = document.getElementById("name");
		var phone = document.getElementById("phone");
		var birth = document.getElementById("birth");
		var email = document.getElementById("email");
		var postcode = document.getElementById("postcode");
		var address1 = document.getElementById("address1");
		var address2 = document.getElementById("address2");
		
		if(id.value.trim() == ""){
			alert("아이디를 입력해주세요.");
			id.focus();
			return false;
		}
		
		if(passwd.value.trim() == ""){
			alert("비밀번호를 입력해주세요.");
			passwd.focus();
			return false;
		}
		
		if(passwdcheck.value != passwd.value){
			alert("비밀번호가 일치하지 않습니다.");
			passwdcheck.focus();
			return false;
		}
		
		if(name.value.trim() == ""){
			alert("이름을 입력해주세요.");
			name.focus();
			return false;
		}
		
		if(phone.value.trim() == ""){
			alert("핸드폰 번호를 입력해주세요.");
			phone.focus();
			return false;
		}
		
		if(birth.value.trim() == "") {
			alert("생년월일을 입력해주세요.");
			birth.focus();
			return false;
		}
		
		if(email.value.trim() == ""){
			alert("이메일을 입력해주세요.");
			email.focus();
			return false;
		}
		
		if(JUMIN2.value.length<7) {
			alert("주민등록번호 뒷자리를 모두 입력해주세요.");
			JUMIN2.focus();
			return false;
		}
		
		if(address1.value.trim() == ""){
			alert("주소를 입력해주세요.");
			address1.focus();
			return false;
		}
	
		document.joinForm.submit();
	}
	
	/* 특수문자 없이 영어, 숫자만 받기 */
	function inputNoSpecial(key)  {
		key.value = key.value.replace(/[^a-z0-9]/ig, '')
	}
	
	/* 한글만 받기 */
	function inputKoreanOnly(key)  {
		key.value = key.value.replace(/^[가-힣]/ig, '')
	}
	
	/* 공백 받지 않기 */
	function inputNoBlank(key)  {
		key.value = key.value.replace(/\s/gi, '')
	}
	
	/* 숫자만 받기 */
	function inputNumberOnly(key)  {
		key.value = key.value.replace(/[^0-9]/ig, '')
	}