<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공간 관리</title>
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
    /* 공간관리 제목 */
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
    thead th, tbody>tr {
        text-align: center;
    }

    .form-group select { vertical-align: center;}
    
    /* 모달창에서 공간명 */
    .spTitle:hover {
        cursor: pointer;
        color: green;
    }
    
    /* 모달창에서 반려 메세지 */
    .DM {
        padding-top: 20px;
        padding-bottom: 5px;
        text-align: left;
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

        <!-- 공간관리 제목 -->
        <div align="left" id="title"><h3>공간 관리</h3></div>
        
        <!-- 검색창 -->
            <div id="search">
                <form action="searchSp.ad" method="get">
                    <table align="center" id="searchForm">
                        <tr>
                            <td align="right">
                                <input type="hidden" name="currentPage" value="1">
                                <select name="condition" class="select_category form-control mb-2" style="width:70%;">
                                    <option value="spaceTitle">공간명</option>
                                    <option value="hostId">호스트ID</option>
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

        <!-- 컨텐츠 탭 -->
        <div id="tab">
            <!-- 탭 메뉴 -->
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a class="nav-link active all" data-toggle="tab" href="#all" onclick="showSpaceList(1);">전체 공간</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link guest" data-toggle="tab" href="#wait" onclick="showSpaceList(2);">미처리 공간</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link host" data-toggle="tab" href="#accept" onclick="showSpaceList(3);">승인된 공간</a>
                </li>
                <!-- <li class="nav-item">
                    <a class="nav-link host" data-toggle="tab" href="#deny">반려된 공간</a>
                </li> -->
            </ul>
            
            <!-- 탭 내용 -->
            <div class="tab-content">
            
                <!--============================ 전체 조회 ============================-->
                <div class="tab-pane container active" id="all" align="right" >
                    <table class="table spaceList" style="table-layout:fixed;">
                        <thead>
                            <tr>
                                <th style="width:10%;">공간번호</th>
                                <th style="width:15%;">호스트ID</th>
                                <th style="width:45%;">공간명</th>
                                <th style="width:15%;">공간유형</th>
                                <th style="width:15%;">처리여부</th>
                            </tr>
                        </thead>
                        <tbody class="myTable">
                        </tbody>
                    </table>
                    <!-- 페이지 버튼 -->
                    <div class="btnPage" align="center">
                        <ul class="pagination">
                        </ul>
                    </div>
                </div>

                <!--============================ 미처리 공간 조회 ============================-->
                <div class="tab-pane container" id="wait" align="right" >
                    <table class="table spaceList" style="table-layout:fixed;">
                        <thead>
                            <tr>
                                <th style="width:10%;">공간번호</th>
                                <th style="width:15%;">호스트ID</th>
                                <th style="width:45%;">공간명</th>
                                <th style="width:15%;">공간유형</th>
                                <th style="width:15%;">처리여부</th>
                            </tr>
                        </thead>
                        <tbody class="myTable">
                        </tbody>
                    </table>
                    <!-- 페이지 버튼 -->
                    <div class="btnPage" align="center">
                        <ul class="pagination">
                        </ul>
                    </div>
                </div>

                <!--============================ 승인된 공간 조회 ============================-->
                <div class="tab-pane container" id="accept" align="right" >
                    <table class="table spaceList" style="table-layout:fixed;">
                        <thead>
                            <tr>
                                <th style="width:10%;">공간번호</th>
                                <th style="width:15%;">호스트ID</th>
                                <th style="width:45%;">공간명</th>
                                <th style="width:15%;">공간유형</th>
                                <th style="width:15%;">처리여부</th>
                            </tr>
                        </thead>
                        <tbody class="myTable">
                        </tbody>
                    </table>
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

    <!-- 공간검수 처리 모달창 -->
    <div class="modal fade" id="checkSpace">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
            
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title">공간검수</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                
                <!-- Modal body -->
                <form id="spaceStatusForm" action="updateAdminSpace.ad" method="post">
                    <div class="modal-body">
                        <table style="width: 100%;">
                            <thead>
                                <tr id="spStatus">
                                    <input type="hidden" class="spno" name="spaceNo">
                                    <input type="hidden" name="hostMemId">
                                    <th style="width:50px; height: 50px;" align="left">공간명</th>
                                    <td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;" align="left" class="spTitle"></td>
                                </tr>
                            </thead>   
                            <!-- 승인대기일 때  -->
                            <tbody id="spaceStatusW" class="selectBox">
                                <tr>
                                    <th rowspan="2" style="width:100px;">처리</th>
                                    <td class="form-group" align="left">
                                        <select name="spaceStatus" class="select_category form-control mb-2" style="width:50%;">
                                            <!-- <option value="W">승인대기</option> -->
                                            <option value="Y">승인</option>
                                            <option value="N">반려</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    	<textarea name="denyMessage" class="form-control mb-2 inputText" cols="20" rows="5" placeholder="반려 사유를 작성해주세요." disabled required></textarea>
                                    </td>
                                    <td rowspan="2" align="right">
                                    	<button type="submit" class="btn btn-sm btn-light spStatusBtn" onclick="">처리하기</button>
                                    </td>
                                </tr>
                            </tbody>

                            <!-- 승인일 때 -->
                            <tbody id="spaceStatusY" style="display:none;">
                                <tr>
                                    <th style="width:100px;">처리</th>
                                    <td class="form-group spStatus" align="left" style="color: blue;">승인</td>
                                </tr>
                            </tbody>

                            <!-- 반려일 때 -->
                            <tbody id="spaceStatusN" style="display:none;">
                                <tr>
                                    <th rowspan="2" style="width:100px;">처리</th>
                                    <td class="form-group spStatus" align="left" style="color: red;">반려</td>
                                </tr>
                                <tr>
                                    <td class="DM"></td>
                                </tr>
                            </tbody>

                        </table>
                    </div>
                </form> 
                    
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary spaceStatusBtn" data-dismiss="modal">확인</button>
                    <!-- 검수처리가 잘 되면 alert 창 띄우기! -->
                </div>
                
            </div>
        </div>
    </div>

    <script>
        $(document).on("change", "select[name=spaceStatus]", function(){
            var value = $(this).find("option:selected").val();
            var inputText = $(this).closest('.selectBox').find('.inputText');
            var flag = false;
            if (value == 'Y') {
                flag = true;
                $(inputText).val('');
            } else if (value = 'N') {
            	flag = false;
            }
            $(inputText).attr("disabled", flag);
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
    
    <!-- 검수 모달창으로 공간 번호 보내기 -->
    <script>
        $(".spaceList>tbody").on("click", "#changeStatus", function() {
            
        	//공간소켓용 
        	var hostMemId = $(this).children().eq(1).text();
        	$("#checkSpace input[name=hostMemId]").val(hostMemId); 
        	
            var spaceNo = $(this).children().eq(0).text();
            $(".modal-body .spno").val(spaceNo); 
            
            var spaceTitle = $(this).children().eq(2).text();
            $(".modal-body .spTitle").text(spaceTitle); 
            
            var spaceStatus = $(this).children().eq(4).text();
            /* $(".modal-body .spStatus").text(spaceStatus); */
            
            var denyMessage = $(this).children().eq(5).val();
            $(".modal-body .DM").text(denyMessage);
            
            // console.log(spaceStatus);                                                
            
            if (spaceStatus == '승인대기') {
                $('#spaceStatusW').show();
                $('#spaceStatusY').hide();
                $('#spaceStatusN').hide();
                
            } else if(spaceStatus == '승인') {
                $('#spaceStatusY').show();
                $('#spaceStatusW').hide();
                $('#spaceStatusN').hide();
                
            } else if(spaceStatus == '반려') {
                $('#spaceStatusN').show();
                $('#spaceStatusW').hide();
                $('#spaceStatusY').hide();
                
            } 

        });
        
        /* 공간검수 모달창에서 공간명 클릭시 새탭으로 상세정보 확인하기 */
        $("#spStatus").on("click",".spTitle", function() {
            
            var spaceNo = $(".spno").val();
                
            console.log(spaceNo);
            window.open('detail.sp?sno=' + spaceNo,'', 'width=1400, height=1000, location=no, status=no, scrollbars=yes');
        });
        
    </script>
    
    <!-- 탭 리스트 불러오기... -->
    <script>
        
        $(function() {
            showSpaceList();
        });
        
        //공간 검수 업데이트
        spStatusUpdate = () => {
        	$("#spaceStatusForm").submit();
        	sendMessage("spStatusUpdate", $("#checkSpace input[name=hostMemId]").val(), $("#checkSpace .spTitle").text());
        }
        
        function showSpaceList(num, currentPage) {
            
            var tab = "전체 공간";
            
            switch(num) {
            case 1 : tab = "전체 공간"; break;
            case 2 : tab = "미처리 공간"; break;
            case 3 : tab = "승인된 공간"; break;
            }
            
            /* alert(tab); */
            
            $.ajax({
                url : "ajaxsplist.ad",
                data : {tab : tab, cpage : currentPage},
                success : function(result) { // 이 result에는 pi 와 list 가 들어있어야 한다. 
                    
                    /* console.log(result); */
                    /* console.log(result.list[1].spaceTitle); */
                    /* console.log(result.list[1].denyMessage); */
                    
                    var resultStr = "";
    
                    if(result.list.length != 0) {

                        for(var i = 0; i < result.list.length; i++) {
                            
                            resultStr += "<tr data-toggle='modal' data-target='#checkSpace' id='changeStatus'>"
                                            + "<td>" + result.list[i].spaceNo + "</td>"
                                            + "<td>" + result.list[i].hostNo + "</td>"
                                            + "<td style='text-overflow:ellipsis; overflow:hidden; white-space:nowrap;' align='left'>" + result.list[i].spaceTitle + "</td>"
                                            + "<td>"; 
                                                if(result.list[i].stypeNo == '1') {
                                                    resultStr += "파티룸";
                                                } else if (result.list[i].stypeNo == '2') {
                                                    resultStr += "카페";
                                                } else if (result.list[i].stypeNo == '3') {
                                                    resultStr += "공연장";
                                                } else if (result.list[i].stypeNo == '4') {
                                                    resultStr += "연습실";
                                                } else if (result.list[i].stypeNo == '5') {
                                                    resultStr += "공유주방";
                                                } else if (result.list[i].stypeNo == '6') {
                                                    resultStr += "갤러리";
                                                } else if (result.list[i].stypeNo == '7') {
                                                    resultStr += "운동시설";
                                                } else if (result.list[i].stypeNo == '8') {
                                                    resultStr += "스터디룸";
                                                } else if (result.list[i].stypeNo == '9') {
                                                    resultStr += "회의실";
                                                } else if (result.list[i].stypeNo == '10') {
                                                    resultStr += "촬영스튜디오";
                                                } 
                                resultStr += "</td><td>";
                                                if(result.list[i].spaceStatus == 'Y') {
                                                    resultStr += "승인";
                                                } else if (result.list[i].spaceStatus == 'N') {
                                                    resultStr += "반려";
                                                } else if (result.list[i].spaceStatus == 'W') {
                                                    resultStr += "승인대기";
                                                }
                                resultStr += "</td><input type='hidden' name='denyMessage' value='" + result.list[i].denyMessage + "'></tr>";
                        } 
                    } else if(result.list.length == 0) {
                        resultStr += "<tr class='salesTr'><td colspan='5' onclick='event.cancelBubble=true;'>결과가 존재하지 않습니다.</td></tr>";
                    }
                    
                    $(".myTable").html(resultStr); 
                    
                    var resultPi = "";

                    if(result.list.length != 0) {
                    
                        if(result.pi.currentPage == 1) {
                            resultPi += "<li class='page-item no-page-prev disabled'><a class='page-link' href='#'>&lt;</a></li>";
                        } else {
                            resultPi += "<li class='page-item no-page-prev'><a class='page-link' href='#' onclick='showSpaceList(" + num + ", " + result.pi.currentPage  + "- 1);'>&lt;</a></li>"
                        }
                    
                        for(var p = result.pi.startPage; p <= result.pi.endPage; p++) {
                            
                            if(p != result.pi.currentPage) {
                                resultPi += "<li class='page-item page-btn'><a id='' class='page-link' href='#' onclick='showSpaceList(" + num + ", " + p + ");'>" + p +"</a></li>"
                            } 
                            if(p == result.pi.currentPage) {
                                resultPi += "<li class='page-item page-btn' disbled>" + p + "</li>"
                            }
                        }
                        
                        if(result.pi.currentPage == result.pi.maxPage) {
                            resultPi += "<li class='page-item no-page-next disabled'><a class='page-link' href='#'>&gt;</a></li>";
                        } else {
                            resultPi += "<li class='page-item no-page-next'><a class='page-link' href='#' onclick='showSpaceList(" + num + ", " + result.pi.currentPage  + "+ 1);'>&gt;</a></li>"
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