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
	        <h1 style="font-weight:bold;">${ errorMsg }</h1>
	    </div>
	</div>
    <jsp:include page="footer.jsp" />
</div>
</body>
</html>