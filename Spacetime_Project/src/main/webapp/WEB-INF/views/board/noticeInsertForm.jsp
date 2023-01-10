<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
<style>

    /* content */
    /*div { border: 1px black solid; }*/
	#header_area { height: 80px; }
	#content { 
		width: 100%;
		height: 950px; 
	}
	
    /* -------------------- */
	
	#content>div { height: 100%; float: left; padding-top:40px;}
	
	#content_1, #content_3 { width: 20%; }
	#content_2 { width: 60%; }
	
    /* --------------------------- */

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
                    <p>공지사항 작성</p>
                </div>
                <div>
                    <form method="post" action="insert.no">
                        <table width="100%">
                            <tr>
                                <td height="60px"><input type="text" class="form-control" name="noticeTitle" placeholder="제목을 입력해주세요." required  style="width: 100%;"></td>
                            </tr>
                            <tr>
                                <td height="500px"><textarea name="noticeCont" class="form-control" style="width: 100%; height: 100%; resize: none;" placeholder="내용을 입력해주세요. (최대 3000여 자 입력 가능)"></textarea></td>
                            </tr>
                        </table>
                        <div align="center" style="height:80px; padding-top: 30px;">
                            <button type="button" class="btn btn-secondary" style="width: 100px;">취소</button>
                            &nbsp;
                            <button type="submit" class="btn btn-primary" style="width: 100px; background-color: #277BC0;">작성</button>
                        </div>
                    </form>
                </div>

                <script>
                    /*
                    $(document).ready(function () {
                        $('textarea').summernote({
                            placeholder: '내용을 입력해주세요.',
                            lang: "ko-KR",
                            height: 500,
                            minHeight: 500,
                            maxHeight: 500,
                            callbacks : { 
                                onImageUpload : function(files, editor, welEditable) {
                                    // 파일 업로드(다중업로드를 위해 반복문 사용)
                                    for (var i = files.length - 1; i >= 0; i--) {
                                        uploadSummernoteImageFile(files[i], this);
                                    }
                                }
                            }
                        });

                        // 썸머노트 이미지 업로드를 위한 함수
                        function uploadSummernoteImageFile(file, el) {
                            data = new FormData();
                            data.append("file", file);
                            $.ajax({
                                data : data,
                                type : "POST",
                                url : "uploadSummernoteImageFile.no",
                                contentType : false,
                                enctype : 'multipart/form-data',
                                processData : false,
                                success : function(data) {
                                    $(el).summernote('editor.insertImage', data.url);
                                }
                            });
                        }
                    });
                    */
                </script>

            </div>
            <div id="content_3"></div>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </div>
</body>
</html>