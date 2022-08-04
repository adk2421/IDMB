<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>IDMB</title>
</head>
<body>

	<script>
	
		if(${! empty msg}) {
			alert('${msg}');
		}
		
		location.href='/IDMB${url}';
		
	</script>
    
</body>
</html>