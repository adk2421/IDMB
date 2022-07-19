// addressAPI.js	
	
<<<<<<< HEAD
	function execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            
	        document.getElementById('postcode').value = data.zonecode;
	        document.getElementById('address1').value = data.roadAddress;
	        document.getElementById('address').value = "[" + data.zonecode + "] " + data.roadAddress;
        
	        }
	    }).open();
    }
=======
function execDaumPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
			
		document.getElementById('postcode').value = data.zonecode;
		document.getElementById('address1').value = data.roadAddress;
		document.getElementById('address').value = "[" + data.zonecode + "] " + data.roadAddress;
	
		}
	}).open();
}
>>>>>>> branch 'main' of https://github.com/adk2421/IDMB
