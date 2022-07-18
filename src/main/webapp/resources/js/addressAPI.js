// addressAPI.js	
	
	function execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            
	        document.getElementById('postcode').value = data.zonecode;
	        document.getElementById('address1').value = data.roadAddress;
	        document.getElementById('address2').value = data.roadAddress;
	        
	        }
	    }).open();
    }