<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
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

    /* 회원관리 제목 */
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

    /* 등급 카테고리 선택 */
    .gradeCate {
        margin-bottom: 20px;
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

    <div id="header_container"><jsp:include page="../common/header.jsp" /></div>
    
    
    <jsp:include page="../common/adminNavi.jsp" />
    
    <div id="content">
    
        <!-- 회원관리 제목 -->
        <div align="left" id="title"><h3>회원 관리</h3></div>
        
        <!-- 검색창 -->
        <div id="search">
            <form action="searchM.ad" method="get">
                <table align="center" id="searchForm">
                    <tr>
                        <td align="right">
                            <input type="hidden" name="currentPage" value="1">
                            <select name="condition" class="select_category form-control mb-2" style="width:70%;">
		                          <option value="name">이름</option>
		                          <option value="id">아이디</option>
		                          <option value="nickName">닉네임</option>
		                          <option value="email">이메일</option>
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

        <!-- 컨텐츠 탭 -->
        <div id="tab">
            <!-- 탭 메뉴 -->
            <ul class="nav nav-tabs">
                <li class="nav-item">
                <a class="nav-link active all" data-toggle="tab" href="#all" onclick="showMemberList(1);">전체 회원</a>
                </li>
                <li class="nav-item">
                <a class="nav-link guest" data-toggle="tab" href="#guest" onclick="showMemberList(2);">게스트</a>
                </li>
                <li class="nav-item">
                <a class="nav-link host" data-toggle="tab" href="#host" onclick="showMemberList(3);">호스트</a>
                </li>
                <li class="nav-item">
                <a class="nav-link black" data-toggle="tab" href="#black" onclick="showMemberList(4);">블랙리스트</a>
                </li>
            </ul>
            
            <!-- 탭 내용 -->
            <div class="tab-content">
            
                <!--============================ 전체 조회 ============================-->            
                <div class="tab-pane container active" id="all" align="right" >
                    <table class="table memberList">
                        <thead>
                            <tr>
                                <th style="width:10%;">회원번호</th>
                                <th style="width:15%;">이름</th>
                                <th style="width:15%;">ID</th>
                                <th style="width:20%;">닉네임</th>
                                <th style="width:10%;">등급</th>
                                <th style="width:15%;">가입일</th>
                                <th style="width:15%;">상태</th>
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

                <!--============================ 게스트 조회 ============================--> 
                <div class="tab-pane container fade" id="guest" align="right" >
                    <table class="table memberList">
                        <thead>
                            <tr>
                                <th style="width:10%;">회원번호</th>
                                <th style="width:15%;">이름</th>
                                <th style="width:15%;">ID</th>
                                <th style="width:20%;">닉네임</th>
                                <th style="width:10%;">등급</th>
                                <th style="width:15%;">가입일</th>
                                <th style="width:15%;">상태</th>
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
                
                <!--============================ 호스트 조회 ============================--> 
                <div class="tab-pane container fade" id="host" align="right" >
                    <table class="table memberList">
                        <thead>
                            <tr>
                                <th style="width:10%;">회원번호</th>
                                <th style="width:15%;">이름</th>
                                <th style="width:15%;">ID</th>
                                <th style="width:20%;">닉네임</th>
                                <th style="width:10%;">등급</th>
                                <th style="width:15%;">가입일</th>
                                <th style="width:15%;">상태</th>
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
                
                <!--============================ 블랙리스트 조회 ============================--> 
                <div class="tab-pane container fade" id="black" align="right" >
                    <table class="table memberList">
                        <thead>
                            <tr>
                                <th style="width:10%;">회원번호</th>
                                <th style="width:15%;">이름</th>
                                <th style="width:15%;">ID</th>
                                <th style="width:20%;">닉네임</th>
                                <th style="width:10%;">등급</th>
                                <th style="width:15%;">가입일</th>
                                <th style="width:15%;">상태</th>
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
    
    <!-- 회원 상세페이지로 연결 -->
    <script>
        $(function() {
            $(".memberList>tbody").on("click", ".memberTr", function() {
                location.href = "mdetail.ad?mno=" + $(this).children(".mno").eq(0).text();
            });
        });
    </script>

    <!-- 페이징 -->
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
    
    <!-- 리스트 불러오기 -->
    <script>
        
        $(function() {
            showMemberList();
        });
        
        function showMemberList(num, currentPage) {
            
            var tab = "전체 회원";
            
            switch(num) {
            case 1 : tab = "전체 회원"; break;
            case 2 : tab = "게스트"; break;
            case 3 : tab = "호스트"; break;
            case 4 : tab = "블랙리스트"; break;
            }
            
            /* alert(tab); */
            
            $.ajax({
                url : "ajaxmlist.ad",
                data : {tab : tab, cpage : currentPage},
                success : function(result) { 
                	
                	// console.log(result.list[0].memStatus);
                	// console.log(result.list[0].blacklist);
                	
                    var resultStr = "";
                    
                    if(result.list.length != 0) {

                        for(var i = 0; i < result.list.length; i++) {
                            
                            resultStr += "<tr class='memberTr'>"
                                            + "<td class='mno'>" + result.list[i].memNo + "</td>"
                                            + "<td>" + result.list[i].memName + "</td>"
                                            + "<td>" + result.list[i].memId + "</td>"
                                            + "<td>" + result.list[i].nickname + "</td>"
                                            + "<td id='grCode'>";
                                            	if(result.list[i].grCode == '태양') {
                                            		resultStr += "<i class='fa-solid fa-sun' style='color: orange;'></i>";
                                            	} else if(result.list[i].grCode == '지구') {
                                            		resultStr += "<i class='fa-solid fa-earth-americas' style='color: green;'></i>";
                                            	} else if(result.list[i].grCode == '달') {
                                            		resultStr += "<i class='fa-solid fa-moon' style='color: #949494;'></i>";
                                            	}
	                             resultStr += "</td><td>" + result.list[i].enrollDate + "</td>"
                                            + "<td>";
                                                if(result.list[i].memStatus == 'N' && result.list[i].blacklist == 'N') {
                                                    resultStr += "가입";
                                                } else if (result.list[i].memStatus == 'N' && result.list[i].blacklist == 'Y') {
                                                    resultStr += "블랙리스트";
                                                }                              
                                resultStr += "</td> </tr>";
                        }
                    } else {
                        resultStr += "<tr class='memberTr'><td colspan='7' onclick='event.cancelBubble=true;'>결과가 존재하지 않습니다.</td></tr>";
                    }
                    
                    $(".myTable").html(resultStr);
                    
                    /* console.log("현재페이지 : " + result.pi.currentPage); */
                    /* console.log("마지막페이지 : " + result.pi.endPage); */
                    
                    var resultPi = "";

                    if(result.list.length != 0) {
                    
                        if(result.pi.currentPage == 1) {
                            resultPi += "<li class='page-item no-page-prev disabled'><a class='page-link' href='#'>&lt;</a></li>";
                        } else {
                            resultPi += "<li class='page-item no-page-prev'><a class='page-link' href='#' onclick='showMemberList(" + num + ", " + result.pi.currentPage  + "- 1);'>&lt;</a></li>"
                        }
                    
                        for(var p = result.pi.startPage; p <= result.pi.endPage; p++) {
                            
                            if(p != result.pi.currentPage) {
                                resultPi += "<li class='page-item page-btn'><a id='' class='page-link' href='#' onclick='showMemberList(" + num + ", " + p + ");'>" + p +"</a></li>"
                            } else {
                                resultPi += "<li class='page-item page-btn' disbled>" + p + "</li>"
                            }
                        }
                        
                        if(result.pi.currentPage == result.pi.maxPage) {
                            resultPi += "<li class='page-item no-page-next disabled'><a class='page-link' href='#'>&gt;</a></li>";
                        } else {
                            resultPi += "<li class='page-item no-page-next'><a class='page-link' href='#' onclick='showMemberList(" + num + ", " + result.pi.currentPage  + "+ 1);'>&gt;</a></li>"
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