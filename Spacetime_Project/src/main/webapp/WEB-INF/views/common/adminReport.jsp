<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 관리</title>
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

    /* 신고관리 제목 */
    #title {
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
    .table thead th, .table tbody>tr {
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
        margin: 0 8px;
    }

</style>
</head>
<body>

    <div id="header_container"><jsp:include page="header.jsp" /></div>
    
    <jsp:include page="adminNavi.jsp" />
    
    <div id="content">
        <!-- 신고관리 제목 -->
        <div align="left" id="title"><h3>신고 관리</h3></div>
        
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
                                <!-- <option value="reportContent">신고내용</option> -->
                            </select>
                        </td>
                        <td>
                            <input type="text" name="keyword" class="form-control mb-2 title" id="myInput" placeholder="검색어를 입력해주세요." value="${keyword}" required>
                        </td>
                        <td>
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

        <!-- 컨텐츠 탭 -->
        <div id="tab" >
            <!-- 탭 메뉴 -->
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a class="nav-link active reportStatus" data-toggle="tab" href="#all" onclick="showReportList(1);">전체 신고</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link reportStatus" data-toggle="tab" href="#wait" onclick="showReportList(2);">미처리 신고</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link reportStatus" data-toggle="tab" href="#accept" onclick="showReportList(3);">승인된 신고</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link reportStatus" data-toggle="tab" href="#deny" onclick="showReportList(4);">반려된 신고</a>
                </li>
            </ul>
            
            <!-- 탭 내용 -->
            <div class="tab-content">
                
                <!--============================ 전체 조회 ============================-->
                <div class="tab-pane container active" id="all" align="right" value="all">
                    <table class="table reportList" style="table-layout:fixed;">
                        <thead>
                            <tr>
                                <th style="width:10%;">신고번호</th>
                                <th style="width:25%;">신고대상ID</th>
                                <th style="width:20%;">타입</th>
                                <!-- <th style="width:35%;">내용</th> -->
                                <th style="width:20%;">신고일</th>
                                <th style="width:25%;">처리여부</th>
                            </tr>
                        </thead>
                        <tbody class="myTable">
                        </tbody>
                    </table>
                    <br>
                    <!-- 페이지 버튼 -->
                    <div class="btnPage" align="center">
                        <ul class="pagination">
                        </ul>
                    </div>
                </div>
            
                <!--============================ 미처리 조회 ============================-->
                <div class="tab-pane container fade" id="wait" align="right" name="condition" value="wait">
                    <table class="table reportList" style="table-layout:fixed;">
                        <thead>
                            <tr>
                                <th style="width:10%;">신고번호</th>
                                <th style="width:25%;">신고대상ID</th>
                                <th style="width:20%;">타입</th>
                                <!-- <th style="width:35%;">내용</th> -->
                                <th style="width:20%;">신고일</th>
                                <th style="width:25%;">처리여부</th>
                            </tr>
                        </thead>
                        <tbody class="myTable">
                        </tbody>
                    </table>
                    <br>
                    <!-- 페이지 버튼 -->
                    <div class="btnPage" align="center">
                        <ul class="pagination">
                        </ul>
                    </div>
                </div>

                <!--============================ 승인 조회 ============================-->
                <div class="tab-pane container fade" id="accept" align="right" name="condition" value="accept">
                    <table class="table reportList" style="table-layout:fixed;">
                        <thead>
                            <tr>
                                <th style="width:10%;">신고번호</th>
                                <th style="width:25%;">신고대상ID</th>
                                <th style="width:20%;">타입</th>
                                <!-- <th style="width:35%;">내용</th> -->
                                <th style="width:20%;">신고일</th>
                                <th style="width:25%;">처리여부</th>
                            </tr>
                        </thead>
                        <tbody class="myTable">
                        </tbody>
                    </table>
                    <br>
                    <!-- 페이지 버튼 -->
                    <div class="btnPage" align="center">
                        <ul class="pagination">
                        </ul>
                    </div>
                </div> 

                <!--============================ 반려 조회 ============================-->
                <div class="tab-pane container fade" id="deny" align="right" name="condition" value="deny">
                    <table class="table reportList" style="table-layout:fixed;">
                        <thead>
                            <tr>
                                <th style="width:10%;">신고번호</th>
                                <th style="width:25%;">신고대상ID</th>
                                <th style="width:20%;">타입</th>
                                <!-- <th style="width:35%;">내용</th> -->
                                <th style="width:20%;">신고일</th>
                                <th style="width:25%;">처리여부</th>
                            </tr>
                        </thead>
                        <tbody class="myTable">
                        </tbody>
                    </table>
                    <br>
                    <!-- 페이지 버튼 -->
                    <div class="btnPage" align="center">
                        <ul class="pagination">
                        </ul>
                    </div>
                </div> 
            </div>
        </div>
        <br>
    </div>
    
    <!-- 신고 상세페이지로 연결 -->
    <script>
        $(function() {
            
            $(".reportList>tbody").on("click", ".reportTr", function() {
                
            location.href = "rdetail.ad?rpno=" + $(this).children(".rpno").eq(0).text();
            });
        });
    </script>

    <script>
        $(function() {
            $(".pagination").each(function() {

                console.log($(".pagination").find("li.page-link").val());

                // if ($(this).text() == ${pi.currentPage}) {
                //     $(this).attr("id", "active-page");
                //     $(this).parent().addClass("disabled");
                // } else {
                //     $(this).removeAttr("id", "active-page");
                // }
            });
        });
    </script>
    
    <!-- 리스트 불러오기... -->
    <script>
        
        $(function() {
            showReportList();
        });
        
        function showReportList(num, currentPage) {
            
            var tab = "전체 신고";
            
            switch(num) {
            case 1 : tab = "전체 신고"; break;
            case 2 : tab = "미처리 신고"; break;
            case 3 : tab = "승인된 신고"; break;
            case 4 : tab = "반려된 신고"; break;
            }
            
            // alert(tab);
            // console.log(tab);
            // console.log(currentPage);
            
            $.ajax({
                url : "ajaxrlist.ad",
                data : {tab : tab, cpage : currentPage},
                success : function(result) { // 이 result에는 pi 와 list 가 들어있어야 한다. 
                    
                    // console.log(result);
                    // console.log(result.pi.listCount);
                    
                    var resultStr = "";

                    if(result.list.length != 0) {

                        for(var i = 0; i < result.list.length; i++) {
                            
                            resultStr += "<tr class='reportTr'>"
                                            + "<td class='rpno'>" + result.list[i].reportNo + "</td>"
                                            + "<td>" + result.list[i].reportedMemNo + "</td>"
                                            + "<td>" + result.list[i].reportType + "</td>"
                                           /*  + "<td align='left' style='text-overflow:ellipsis; overflow:hidden; white-space:nowrap;'>" + result.list[i].reportContent + "</td>" */
                                            + "<td>" + result.list[i].reportDate + "</td>"
                                            + "<td>";
                                                    if(result.list[i].reportStatus == 'Y') {
                                                        resultStr += "승인";
                                                    } else if (result.list[i].reportStatus == 'N') {
                                                        resultStr += "미처리";
                                                    } else if (result.list[i].reportStatus == 'D') {
                                                        resultStr += "반려";
                                                    }
                                resultStr += "</td> </tr>";
                        } 

                    } else if(result.list.length == 0) {
                        resultStr += "<tr class='salesTr'><td colspan='5' onclick='event.cancelBubble=true;'>결과가 존재하지 않습니다.</td></tr>";
                    }
                    
                    $(".myTable").html(resultStr); 
                    
                    // console.log(result.pi.startPage);
                    // console.log(result.pi.endPage);
                    // console.log(result.pi.currentPage);
                    
                    var resultPi = "";

                    if(result.list.length != 0) {
                    
                        if(result.pi.currentPage == 1) {
                            resultPi += "<li class='page-item no-page-prev disabled'><a class='page-link' href='#'>&lt;</a></li>";
                        } else {
                            resultPi += "<li class='page-item no-page-prev'><a class='page-link' href='#' onclick='showReportList(" + num + ", " + result.pi.currentPage  + "- 1);'>&lt;</a></li>"
                        }
                    
                        for(var p = result.pi.startPage; p <= result.pi.endPage; p++) {
                            
                            if(p != result.pi.currentPage) {
                                resultPi += "<li class='page-item page-btn'><a id='' class='page-link' href='#' onclick='showReportList(" + num + ", " + p + ");'>" + p +"</a></li>"
                            } 
                            if(p == result.pi.currentPage) {
                                resultPi += "<li class='page-item page-btn' disbled>" + p + "</li>"
                            }
                        }
                        
                        if(result.pi.currentPage == result.pi.maxPage) {
                            resultPi += "<li class='page-item no-page-next disabled'><a class='page-link' href='#'>&gt;</a></li>";
                        } else {
                            resultPi += "<li class='page-item no-page-next'><a class='page-link' href='#' onclick='showReportList(" + num + ", " + result.pi.currentPage  + "+ 1);'>&gt;</a></li>"
                        }
                    }

                    $(".pagination").html(resultPi);
                    
                }, error : function() {
                    console.log("탭 선택 ajax 통신 실패ㅠㅠ");
                }
            });
        }
    </script>
    
</body>
</html>