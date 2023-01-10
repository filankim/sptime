<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style>

    /* content */
    /* div { border: 1px black solid; } */
	#header_area { height: 80px; }
	#content { 
		width: 100%;
		height: 850px; 
        /*height: auto; /* 공지사항의 테이블이 클릭될 때마다 세로 길이에 영향을 끼쳐 자동으로 조절되게 바꿈 */
		display: flex;
	}
	
	#content>div { height: 100%; float: left; padding-top:40px;}
	
	#content_1, #content_3 { width: 20%; }
	#content_2 { width: 60%; }
	
    /* --------------------------- */
    /* content_2 내용물 css */

    #text>p {
        border-bottom: 5px solid #277BC0;
        font-size: 35px;
        font-weight: bold;
    }
</style>
</head>
<body>
    <div class="wrap">
        <div id="header_area"><jsp:include page="../common/header.jsp" /></div>
        <div id="content">
            <div id="content_1"></div>
            
            <!--컨텐츠작성부분 -->
            <div id="content_2" style="height: 100%;">

                <div id="text" style="height: 100px;">
                    <p>공지사항 수정</p>
                </div>
                <div>
                    <form id="postForm" method="post" action="">
                        <table width="100%">
                            <tr>
                            	<td style="display:none;"><input type="hidden" name="noticeNo" value="${ n.noticeNo }"></td>
                                <td height="60px"><input type="text" class="form-control" name="noticeTitle" value="${ n.noticeTitle }" required  style="width: 100%;"></td>
                            </tr>
                            <tr>
                                <td height="500px"><textarea name="noticeCont" class="form-control" style="width: 100%; height: 100%; resize: none;">${ n.noticeCont }</textarea></td>
                            </tr>
                        </table>
                        <div align="center" style="height:80px; padding-top: 30px;">
                            <a class="btn btn-secondary" style="width: 100px;" onclick="javascript:history.go(-1);">취소</a>
                            &nbsp;
                            <a class="btn btn-primary" style="width: 100px; background-color: #277BC0;" onclick="postFormSubmit(1);">수정</a>
                            &nbsp;
                            <a class="btn btn-danger" style="width: 100px;" onclick="postFormSubmit(2);">삭제</a>
                        </div>
                    </form>
                    <script>
		            	function postFormSubmit(num) {
							
		            		if(num == 1) { // 수정하기 버튼 클릭 시 num == 1 : update.no

		            			$("#postForm").attr("action", "update.no").submit();
		            			
		            		} else { // 삭제하기 버튼 클릭 시 num == 2 : delete.no
		            			
		            			$("#postForm").attr("action", "delete.no").submit();
		            		}
		            	}
                    </script>
                </div>
            </div>
            <div id="content_3"></div>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </div>
</body>
</html>