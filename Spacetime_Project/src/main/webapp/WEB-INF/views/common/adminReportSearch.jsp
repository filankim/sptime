<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 검색 결과</title>
<style>
        
    #header_container { height: 80px;}

    /* content 영역 */
    #content {
        margin-left: 25%;
        padding-bottom: 80px;
        width: 60%;
        min-width: 1000px;
        /* height: 100%; */
        /* min-height: 940px; */
        /* background-color: rgba(128, 128, 128, 0.1); */
    }

    /* 검색결과 제목 */
    #title {
        /* border: 1px solid blue; */
        margin: auto;
        margin-top: 80px;
        width: 100%;
    }

    /* 검색 폼 회색 배경 */
    #search {
        margin: auto;
        margin-top: 30px;
        padding: 40px;
        width: 100%;
        min-width: 600px;
        border-radius: 10px;
        background-color: rgb(235, 235, 235);
    }

    /* 검색창 */
    #searchForm {
        width: 70%;
        min-width: none;
    }
    
    /* 탭 메뉴 */
    #tab {
        margin: auto;
        margin-top: 40px;
        width: 100%;
        min-width: 600px;
    }
    
    /* 탭 내용(테이블) */
    .tab-content {
        width: 100%;
        min-width: 600px;
        margin-top: 20px;
    }

    /* 테이블 행 */
    .table>tbody>tr:hover {
        cursor: pointer;
        background-color: rgb(236, 236, 236);
        font-weight: bold;
    }
    thead th, tbody>tr {
        text-align: center;
    }

    /* 모달창 매출 정보 영역 */
    .sales_info {
        margin: auto;
        width: 80%;
    }

    .sales_detail th {height: 50px;}

    .sales_detail_content { text-align: left;}

    .income_detail {text-align: center;}
    .income_detail th, .income_detail td { height: 40px;}

    .income_sum {
        border-top: 2px solid lightgray;
        margin: auto;
        margin-top: 20px;
        padding-top: 30px;
        width: 80%;
        text-align: center;
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
        <div id="header_container"><jsp:include page="header.jsp" /></div>
        <jsp:include page="adminNavi.jsp" />
        <div id="content">

            <!-- 검색결과 제목 -->
            <div align="left" id="title"><h3>신고 검색 결과</h3></div>
            
            <!-- 검색창 -->
            <div id="search">
                <form action="searchR.ad" method="get">
                    <table align="center" id="searchForm">
                        <tr>
                            <td align="right">
                                <input type="hidden" name="currentPage" value="1">
                                <select name="condition" class="select_category form-control mb-2" style="width:70%;">
                                    <option value="reportedMem">신고대상ID</option>
                                    <option value="reportMem">신고자ID</option>
                                    <!-- <option value="reportContent">내용</option> -->
                                </select>
                            </td>
                            <td>
                                <input type="text" name="keyword" class="form-control mb-2 title" id="myInput" placeholder="검색어를 입력해주세요." value="${keyword}" required>
                            </td>
                            <td align="left">
                                <button type="submit" class="btn btn-secondary mb-2">검색</button>
                            </td> 
                        </tr>
                    </table>
                </form>
            </div>
        
            <c:if test="${ not empty condition }">
                <script>
                    $(function() {
                        $("#searchForm option[value=${ condition }]").attr("selected", true);
                    });
                </script>
            </c:if>
            
            <br><br>
            <!-- 컨텐츠 탭 -->
            <div class="tab-pane container active" id="all" align="right" value="all">
                <table class="table reportList" style="table-layout:fixed;">
                    <thead>
                        <tr>
                            <th style="width:10%;">신고번호</th>
                            <th style="width:15%;">신고대상ID</th>
                            <th style="width:15%;">타입</th>
                            <th style="width:35%;">내용</th>
                            <th style="width:15%;">신고일</th>
                            <th style="width:10%;">처리여부</th>
                        </tr>
                    </thead>
                    <tbody class="myTable">
                        <c:choose>
                            <c:when test="${list.size() eq 0}">
                                <tr class='reportTr'>
                                    <td colspan="6" onclick='event.cancelBubble=true;'>결과가 존재하지 않습니다.</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="r" items="${list}">
                                    <tr class='reportTr'>
                                        <td class='rpno' name='rpno'>${r.reportNo}</td>
                                        <td>${r.reportedMemNo}</td>
                                        <td>${r.reportType}</td>
                                        <td align='left' style='text-overflow:ellipsis; overflow:hidden; white-space:nowrap;'>${r.reportContent}</td>
                                        <td>${r.reportDate}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${r.reportStatus eq 'Y'}">
                                                    승인
                                                </c:when>
                                                <c:when test="${r.reportStatus eq 'N'}">
                                                    미처리
                                                </c:when>
                                                <c:when test="${r.reportStatus eq 'D'}">
                                                    반려
                                                </c:when>
                                            </c:choose>
                                        </td> 
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
                <br>
                
                <!-- 페이지 버튼 -->
                <div class="btnPage" align="center">
                    <ul class="pagination">
                        <c:choose>
                            <c:when test="${list.size() eq 0}">
                            </c:when>
                            <c:otherwise>
                                <c:choose>
                                    <c:when test="${pi.currentPage eq 1}">
                                        <li class="page-item no-page-prev disabled"><a class="page-link" href="#">&lt;</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item no-page-prev"><a class="page-link" href="searchR.ad?currentPage=${pi.currentPage - 1}&condition=${condition}&keyword=${keyword}">&lt;</a></li>
                                    </c:otherwise>
                                </c:choose>
            
                                <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
                                    <li class="page-item page-btn"><a id="" class="page-link" href="searchR.ad?currentPage=${p}&condition=${condition}&keyword=${keyword}">${p}</a></li>
                                </c:forEach>
            
                                <c:choose>
                                    <c:when test="${pi.currentPage eq pi.maxPage}">
                                        <li class="page-item no-page-next disabled"><a class="page-link" href="#">&gt;</a></li>        
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item no-page-next"><a class="page-link" href="searchR.ad?currentPage=${pi.currentPage + 1}&condition=${condition}&keyword=${keyword}">&gt;</a></li>
                                    </c:otherwise>
                                </c:choose>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 신고 상세페이지로 연결 -->
    <script>
        $(function() {
            
            $(".reportList tbody").on("click", ".reportTr", function() {
                
                location.href = "rdetail.ad?rpno=" + $(this).children(".rpno").eq(0).text();
            });
        });
    </script>

    <script>
        $(function() {
            $(".page-link").each(function() {
                if ($(this).text() ==${ pi.currentPage}) {
                    $(this).attr("id", "active-page");
                    $(this).parent().addClass("disabled");
                } else {
                    $(this).removeAttr("id", "active-page");
                }
            });
        });
    </script>


</body>
</html>