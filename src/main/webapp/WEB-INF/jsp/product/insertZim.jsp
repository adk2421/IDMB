<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일단메봐</title>
</head>
<body>
<script>
   if(${! empty msg}) {
      alert('${msg}');
   }
    location.href='${url}';
</script>
</body>
</html>