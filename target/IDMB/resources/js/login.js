// login.js

	/* 로그인 입력 값 유효성 체크 */
	function formCheck() {
	    var form = document.getElementById("loginForm");
	    var id = document.getElementById("id");
	    var passwd = document.getElementById("passwd");
	    
	    if (id.value.trim()=="") {
	        alert("아이디를 입력해주세요.");
	        id.focus();
	        return false;
	
	    } else if (passwd.value.trim()=="") {
	        alert("비밀번호를 입력해주세요.");
	        passwd.focus();
	        return false;
	
	    } else {	
	        form.submit();
	    }
	}
	
	/* 로그인 화면에서 엔터키 입력시 로그인 시도 */
	function keyPress() {
	    if (window.event.keyCode == 13) {
	        return formCheck();	
	    }	
	}
	
	/* 첫 화면 로딩 시 포커스 */
	window.onload = function() {
	    document.getElementById("id").focus();
	}
	
	/* 특수문자 없이 영어, 숫자만 받기 */
	function inputNoSpecial(key)  {
		key.value = key.value.replace(/[^a-z0-9]/ig, '')
	}
	
	/* 공백 받지 않기 */
	function inputNoBlank(key)  {
		key.value = key.value.replace(/\s/gi, '')
	}
