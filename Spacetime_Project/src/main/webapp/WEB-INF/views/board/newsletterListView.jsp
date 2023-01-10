<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴스레터</title>
<style>
    /* content */
    /* div { border: 1px black solid; } */
	#header_area { height: 80px; }
	#content { 
		width: 100%;
		/*height: 1050px;  */
        height: auto; /* 공지사항의 테이블이 클릭될 때마다 세로 길이에 영향을 끼쳐 자동으로 조절되게 바꿈 */
		display: flex;
	}
	
	#content>div { height: 100%; float: left; padding:40px 0px 200px 0px;}
	
	#content_1, #content_3 { width: 20%; }
	#content_2 { width: 60%; }
	
    /* --------------------------- */
    /* content_2 내용물 css */

    #text>p {
        font-size: 33px;
        font-weight: bold;
        padding: 35px;
    }

    a { 
        text-decoration: none;
        cursor: pointer;
    }

    .theme_list {
        line-height: 18px;
        border: 0;
        font-size: 100%;
        vertical-align: middle;
        margin: 0 -13px;
        padding: 0;
    }

    .box {
        padding: 13px;
        width: 33.333%;
        float: left;
        position: relative;
    }

    .box_space {
        margin-top: 0;
        margin: 0;
    }

    .inner {
        padding-top: 100%;
        display: block;
        overflow: hidden;
        position: relative;
        height: 330px;
        border-bottom: 1px solid #ebebeb;
    }

    .inner>.th_area {
        position: absolute;
        top: 0;
        left: 0;
        bottom: 0;
        right: 0;
        z-index: 5;
        color: #fff;
        text-align: center;
    }

    .h_theme {
        position: relative;
        padding: 0 20px 20px;
        padding-bottom: 21px;
        margin: 25px 0;
        font-size: 26px;
        line-height: 34px;
        font-weight: 800;
        vertical-align: top;
    }

    .center_wrap {
        display: table;
        width: 100%;
        height: 100%;
        vertical-align: middle;
    }

    .center { 
        vertical-align: middle;
        display: table-cell; 
    }

    .p_theme {
        font-size: 20px;
        padding: 0 20px;
        z-index: 100;
    }

    .h_theme:after {
        content: "";
        position: absolute;
        width: 22px;
        height: 2px;
        bottom: 0;
        left: 50%;
        margin-left: -9px;
        background-color: #ffd014;
    }

    .th_thumb {
        position: absolute;
        top: 0;
        left: 0;
        bottom: 0;
        right: 0;
        background-size: cover;
        background-position: 50%;
        background-image: url("../../../resources/images/board/MIC.jpg");
    }
</style>
</head>
<body>
    <div class="wrap">
        <div id="header_area"><jsp:include page="../common/header.jsp" /></div>
        <div id="content">
            <div id="content_1"></div>
            
            <!--컨텐츠작성부분 -->
            <div id="content_2">
                <div id="text" align="center"><p>뉴스레터</p></div>
                <div>
                    <c:if test="${ loginMember.memNo eq 1 }">
                        <a class="btn btn-secondary" style="float:right; margin:20px; border-color: #ffd014; background-color: #ffd014;" href="insertForm.ne">글쓰기</a>
                    </c:if>
                </div>
                <br clear="both">
                <div class="theme_list">
                    <c:forEach var="n" items="${ list }">
                        <div class="flex_wrap column3 fluid list_center">
                            <form method="post" action=""> 
                                <article class="box box_space article_theme">
                                    <a class="inner">
                                        <div class="th_area">
                                            <div class="center_wrap">
                                                <div class="center" style="text-shadow: -1px 0 #000, 0 1px #000, 1px 0 #000, 0 -1px #000;">
                                                    <h3 class="h_theme">
                                                        ${n.newsTitle}<br>
                                                    </h3> 
                                                    <p class="p_theme">${n.newsNo}</p>
                                                    <input type="hidden" name="nlno" value="${n.newsNo}">
                                                </div>
                                            </div>
                                        </div> 
                                        <span class="th_thumb" style="background-image: url('${n.newsThumbnail}');"></span>
                                    </a>
                                </article>
                            </form>
                        </div>
                    </c:forEach>
                </div>
                <script>
                    $(function() {
                        $(".box").click(function() {
                        let form = $(this).parent("form");
                        console.log(form.text());
                        form.attr("action", "detail.ne").submit();
                    });
                    })
                </script>
            </div>
            <div id="content_3"></div>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </div>
</body>
</html>