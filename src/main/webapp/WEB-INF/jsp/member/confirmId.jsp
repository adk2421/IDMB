<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

   <script>
   if(${! empty msg}) {
      alert('${msg}');
      history.back();
   }
    location.href='${pageContext.request.contextPath}${url}';
    </script>

</body>
</html>