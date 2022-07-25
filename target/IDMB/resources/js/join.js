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
		
		console.log("formCheck 실행");
		
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
		
		if(address1.value.trim() == ""){
			alert("주소를 입력해주세요.");
			address1.focus();
			return false;
		}
	
		document.getElementById('joinForm').submit();
	}
	
	/* Ajax */
	
	/* 아이디 중복확인 */
	function checkId() {
	    
	    var id = $("#id").val();
	    
	    if(id.search(/\s/) != -1) { 
	        alert("아이디에는 공백이 들어갈 수 없습니다.");
	        
	    } else {
	        if(id.trim().length != 0) {
	        	
	            $.ajax({
	                url: "confirmIdAjax.do", //통신할 url
	                data: { "id" : id, "message" : "" }, // 좌항-변수, 우항-입력된 데이터
	                contentType: "application/json",
	                
	                success: function(data) {
	                	if(data.message == "사용할 수 있는 아이디입니다.") {
	                		alert(data.message);
	                		$("#submit").removeAttr("id");
	                		
	                	} else {
	                		alert(data.message);
	                        $("#submit").attr("id", "id");
	                	}
	                },
	                
	        		error:function(request, error) {
	        			alert("fail");
	        			// error 발생 이유를 알려준다.
	        		alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
	        		}      
	            });
	            
	        } else {
	            alert("아이디를 입력해주세요.");
	        }        
	    }
	}
	
	// 가입 취소하고 메인 페이지로 이동
	function cancle(form) {
		console.log("cancle 실행")
		location.href = "/IDMB/main.do";
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