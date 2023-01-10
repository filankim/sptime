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
	        <h1 style="font-weight:bold;">페이지를 찾을 수 없습니다.</h1>
	        <br>
	        <h3>페이지가 존재하지 않거나, 사용할 수 없는 페이지입니다.<br>
	        입력하신 주소가 정확한지 다시 한 번 확인해주세요.</h3>
	    </div>
	</div>
    <jsp:include page="footer.jsp" />
</div>
</body>
</html>