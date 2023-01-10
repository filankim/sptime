<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	div { border: 1px black solid; }
	#header_area { height: 80px; }
	#content { 
		width: 100%;
		height: 1050px; 
	}
	
	#content>div { height: 100%; float: left;}
	
	#content_1, #content_3 { width: 15%; }
	#content_2 { width: 70%; }
	
    .table { text-align: center; height: 50px; }
    thead>tr { font-weight: bolder; font-size: medium; }
    tbody>tr { line-height: 35px;}
    .table>tbody>tr:hover { cursor: pointer ;}
	
</style>
</head>
<body>
	
	<div class="wrap">
	
	
	<div id="header_area"><jsp:include page="header.jsp" /></div>
	<div id="content">
		<div id="content_1">왼쪽여백</div>
		
		<!--컨텐츠작성부분 -->
		<div id="content_2">
		<br><br><br>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <td>후원 횟수</td>
                        <td>후원자명</td>
                        <td>후원금액</td>
                        <td>후원날짜</td>
                        <td>아무거나</td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>이경미</td>
                        <td>30000</td>
                        <td>2022-11-01</td>
                        <td>아무거나</td>
                    </tr>
                </tbody>
            </table>
		</div>
		
		<div id="content_3">오른쪽여백</div>
	</div>
	<br clear="both">
	<jsp:include page="footer.jsp" />
	</div>
</body>
</html>