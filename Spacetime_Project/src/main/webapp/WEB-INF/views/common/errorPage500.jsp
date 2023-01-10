<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="wrap">		
	<jsp:include page="header.jsp" />
	<div class="main">
		 <div align="center">
	        <img src="resources/images/profile_default.png" style="width:300px; height:300px;">
	        <br><br>
	        <h1 style="font-weight:bold;">서비스 이용에 불편을 드려 죄송합니다.</h1>
	        <br>
	        <h3>시스템 에러가 발생하여 페이지를 표시할 수 없습니다.<br>
	        관리자에게 문의하시거나 잠시 후 다시 시도해주세요.</h3>
	    </div>
	</div>
    <jsp:include page="footer.jsp" />
</div>
</body>
</html>