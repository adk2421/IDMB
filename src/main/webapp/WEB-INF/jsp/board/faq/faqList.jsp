<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일단메봐</title>
<!-- Bootstrap CSS CDN -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
		crossorigin="anonymous">
	<!-- Bootstrap JS CDN -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" 
		crossorigin="anonymous"></script>

	<!-- css연결 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css?v=<%=System.currentTimeMillis()%>">

<script>

</script>
</head>
<body>

	<hr><p>

	<!-- 게시판 바로가기 -->
	<div class="short" style="display: flex; justify-content: center;">
	<ul style="list-style-type:none">
		<li style="width:500px; display:inline"><a class="short" href="noticeList.do" >공 지 사 항 &nbsp;&nbsp;</a></li>
		<li style="display:inline"><a class="short" href="reviewList.do" >상 품 후 기 &nbsp;&nbsp;</a></li>
		<li style="display:inline"><a class="short" href="faqList.do?f_category=cost" >F A Q &nbsp;&nbsp;</a></li>
		<li style="display:inline"><a class="short" href="qnaMain.do" >1:1 문 의 &nbsp;&nbsp;</a></li>
	</ul>
	</div>
	
	<br>
	
	<div class="button" style="margin:auto; text-align: center;">
	<form action="faqList.do" method="get">
			&emsp;
		<button type="submit" name="f_category" id="f_category" value="cost">주문/결제</button>
			&emsp;
		<button type="submit" name="f_category" id="f_category" value="shipping">배송문의</button>
			&emsp;
		<button type="submit" name="f_category" id="f_category" value="cancel">배송변경/취소</button>
			&emsp;
		<button type="submit" name="f_category" id="f_category" value="exchange">교환/반품</button>
			&emsp;
		<button type="submit" name="f_category" id="f_category" value="logon">회원가입/로그인</button>	
	</form>
	</div>
	
	<br>
	
	<div class="accordion" id="accordionFlushExample">
 		<div class="accordion-item">
    		<h2 class="accordion-header" id="flush-headingOne">
     			<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
        			<div class="size">
        			<c:forEach var="faq" items="${faqList}">

               	 	Q. ${faq.F_TITLE}
               	 	</c:forEach>
                	</div>

                 </button>
              </h2>
              <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
      			<div class="accordion-body">
                    <c:forEach var="faq" items="${faqList}">
                        A. ${faq.F_CONTENTS}

                    </c:forEach>
                </div>
              </div>
          </div>
      </div>
	<br><br>

</body>
</html>