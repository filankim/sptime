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
		/* height: 1050px;  */
        height: auto; /* 공지사항의 테이블이 클릭될 때마다 세로 길이에 영향을 끼쳐 자동으로 조절되게 바꿈 */
		display: flex;
	}
	
	#content>div { height: 100%; float: left; margin:30px 0px;}
	
	#content_1, #content_3 { width: 20%; }
	#content_2 { width: 60%; }
	
    /* --------------------------- */
    /* content_2 내용물 css */


    #text>p {
        font-size: 33px;
        font-weight: bold;
        padding: 35px;
    }

    .upperHr:hover {
        cursor: pointer;
        background-color: rgb(240, 240, 240);
    }

    .answer { height: 0px; }

    .answer>p {
        font-size: 17px;
        display : none;
        box-sizing : border-box;
        padding: 20px 0px;
    }

    /* 페이지 버튼 */
    .pagination {
        margin: auto;
        justify-content: center;
    }

    .pagination a {
        cursor: pointer;
        border: none;
        border-radius: 3px;
        padding: 5px 8px;
        background-color: #eeeeee;
        color: black;
    }

    .pagination a:hover {
        color: rgb(253, 193, 55);
        background-color: #e4e4e4;
        border-color: #ccc;
    }

    #active-page {
        background-color: rgb(253, 193, 55);
        color: white;
    }

    .page-btn {
        margin: 0 5px;
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
                <div id="text" align="center"><p>공지사항</p></div>
                <div id="serch">
                    <div style="border: 3px solid rgb(39, 123, 192); padding: 20px;">
                    	<form method="get" action="searchList.no">
	                        <table width="100%" height="100px" class="list-area">
	                            <tr>
	                                <td colspan="2">공지사항 검색</td>
	                            </tr>
	                            <tr height="30px">
	                                <td><input type="text" name="searchText" class="form-control" placeholder="검색어를 입력해주세요." style="height:100%"></td>
	                                <td width="200px" align="right">
		                                <button type="submit" class="btn btn-primary btn-lg" style="width:160px; height:100%; background-color: #277BC0;">
		                                	<i class="fa-solid fa-magnifying-glass"></i>&ensp;검색
		                                </button>
	                                </td>
	                            </tr>
	                        </table>
                        </form>
                    </div>
                </div>
                <div>
                    <!-- 로그인 후 상태일 경우만 보여지는 글쓰기 버튼 -->
                    <c:if test="${ loginMember.memNo eq 1 }">
                        <a class="btn btn-secondary" style="float:right; margin:20px;" href="enrollForm.no">글쓰기</a>
                    </c:if>
                </div>
                <!--<div style="height: 50px"></div> -->
                <div id="contentTable" align="center" style=" margin-top: 50px; padding: 20px;">
                    <table width="100%">
                        <tbody style="border-top: 2px solid black">           
                            <c:forEach var="n" items="${ list }">
                                <tr class="upperHr" height="60px" style="border-bottom: 1px solid lightgrey;">
                                    <td class="category" align="center" style="width: 10%">공지사항</td> <!-- 카테고리 -->
                                    <td class="question" style="width: 85%">${ n.noticeTitle }</td> <!-- 제목 -->												
                                    <td class="button" style="width: 5%" align="center"><i class="fa-solid fa-chevron-down" style="color:#277BC0"></i></td> <!-- 답변 보이게 하는 버튼 -->
                                </tr>
                                <tr>
                                    <form method="post" action="">                
                                    <td><input type="hidden" name="noticeNo" value="${n.noticeNo}"></td>                      
                                    <td class="answer"> <!-- 공지사항 -->
                                        <p>${n.noticeCont}</p>
                                    </td>
                                    <td class="updateBtn">                                        
                                        <c:if test="${ loginMember.memNo eq 1 }">
                                            <a class="btn btn-primary" style="display:none; width:60px; border-color: rgb(253, 193, 55); background-color:rgb(253, 193, 55);">수정</a>
                                        </c:if>
                                    </td>
                                </form>     
                                </tr>
                            </c:forEach>
                            
                        </tbody>
                    </table>
                </div>
                <div style="height: 50px"></div>
                
                <!-- 페이지 버튼 
                <div class="btnPage" align="center" id="btn">
                    <ul class="pagination" align="center">
                        <c:choose>
                            <c:when test="${pi.currentPage eq 1}">
                                <li class="page-item no-page-prev disabled"><a class="page-link" href="">&lt;</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item no-page-prev"><a class="page-link" href="list.no?cpage=${pi.currentPage - 1}">&lt;</a></li>
                            </c:otherwise>
                        </c:choose>

                        <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
                            <li class="page-item page-btn"><a id="active-page" class="page-link" href="list.no?cpage=${ p }">${ p }</a></li>
                        </c:forEach>
                        
                        <c:choose>
                            <c:when test="${pi.currentPage eq pi.maxPage}">
                                <li class="page-item no-page-next disabled"><a class="page-link" href="#">&gt;</a></li>        
                            </c:when>
                            <c:otherwise>
                                <li class="page-item no-page-next"><a class="page-link" href="list.no?cpage=${pi.currentPage + 1}">&gt;</a></li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>
                -->
            </div>
            <!-- 질문 클릭시 아코디언 함수 -->
            <script>
                $(function() {
                    $(".upperHr").click(function() {

                        let $answer = $(this).next().children().children();

                        if($answer.css("display") == "none") {

                            $(this).nextAll("tr").children(".answer").children("p").slideUp(100);
                            $(this).prevAll("tr").children(".answer").children("p").slideUp(100);

                            $(this).nextAll("tr").children(".updateBtn").children("a").slideUp(100);
                            $(this).prevAll("tr").children(".updateBtn").children("a").slideUp(100);
                            $answer.slideDown(100);

                        } else {
                            $answer.slideUp(100);
                        }
                    });

                    $(".updateBtn a").click(function() {
                        let form = $(this).parent().parent().children("form");
                        console.log(form.text());
                        form.attr("action", "updateForm.no").submit();
                    });
                });
            </script>
            <div id="content_3"></div>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </div>
</body>
</html>