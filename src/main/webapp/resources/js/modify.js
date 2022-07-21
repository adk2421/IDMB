
function checks() {
	if(confirm("수정하시겠습니까?") == true) {
		var passwd = document.getElementById("passwd");
		var passwdcheck = document.getElementById("passwdcheck");
		var phone = document.getElementById("phone");
		var email = document.getElementById("email");
		var postcode = document.getElementById("postcode");
		var address1 = document.getElementById("address1");
		var address2 = document.getElementById("address2");
		
		if(passwd.value.trim() == ""){
			alert("비밀번호를 입력해주세요.");
			passwd.focus();
			return false;
		}
		
		if(passwdcheck.value != passwdcheck.value){
			alert("비밀번호가 일치하지 않습니다.");
			passwdcheck.focus();
			return false;
		}	
		
		if(phone.value.trim() == ""){
			alert("휴대폰 번호를 입력해주세요.");
			phone.focus();
			return false;
		}
		
		if(email.value.trim() == ""){
			alert("이메일을 입력해주세요.");
			email.focus();
			return false;
		}
		
		if(POSTCODE.value.trim() == ""){
			alert("우편번호를 입력해주세요.");
			POSTCODE.focus();
			return false;
		}
		
		if(ADDRESS1.value.trim() == ""){
			alert("주소를 입력해주세요.");
			ADDRESS1.focus();
			return false;
		}
		
		if(ADDRESS2.value.trim() == ""){
			alert("상세 주소를 입력해주세요.");
			ADDRESS2.focus();
			return false;
		}


		
		document.modifyForm.submit();
	}
}


	function changeForm(val) {
		if (val == "-1") {
			location.href = "myPage.al";
		} else if (val == "0") {
			location.href = "main.jsp?contentPage=/Jumo/myInfoModify.al";
		} else if (val == "1") {
			location.href = "main.jsp?contentPage=/Jumo/myInfoDelete.al";
		}
	}

function submit2(del) {
	if(confirm("탈퇴하시겠습니까?") == true) {
		del.action="myInfoDelete.al";
		del.submit();
		return true;
	}
}

$(document).ready(function() {
	var EMAIL=$('#email').val();
});

    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("ADDRESS2").value = extraAddr;
                
                } else {
                    document.getElementById("ADDRESS2").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('POSTCODE').value = data.zonecode;
                document.getElementById("ADDRESS1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("ADDRESS2").focus();
            }
        }).open();
    }

/* 첫 화면 로딩 시 포커스 */
window.onload = function() {
	document.getElementById("EMAIL").focus();
}
