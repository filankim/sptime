<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출 상세조회</title>
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
        /* margin-top: 70px; */
        width: 100%;
    }

    /* 매출 상세조회 전체 틀 */
    #salesDetail {
        border: 2px solid lightgray;
        background-color: white;
        border-radius: 10px;
        margin: auto;
        margin-top: 60px;
        margin-bottom: 20px;
        padding: 40px 0px 20px 0px;
        width: 650px;
        min-height: 400px;
    }

    /* 제목 - 매출내역 상세조회 */
    #sales_title { margin: 20px;}

    /* 매출 정보 영역 */
    .sales_info {
        margin: auto;
        margin-top: 25px;
        width: 80%;
    }

    /* 매출 상세 정보 테이블 */
    #sales_detail {
        border-bottom: 2px solid lightgray;
        border-top: 2px solid lightgray;
    }
    #sales_detail th, #sales_detail td { height: 60px; }

    /* 공간명 */
    .spTitle:hover {
        color : green;
        cursor: pointer;
    }

    /* 매출 내용 only 내용 */
    .salesContent {
        border-top: 2px solid lightgray; 
        height:150px;
    }
    
    /* 매출 정보 영역 */
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
            
        <!-- 컨텐트 영역 -->
        <div id="content">
            
            <!-- 매출내역 상세조회 -->
            <div id="salesDetail">
            
                <!-- 매출내역 상세조회 제목 -->
                <div align="center" id="title"><h3>매출내역 상세조회</h3></div>

                <!-- 매출 정보 -->
                <div class="sales_info" align="center">
                    <table id="sales_detail"> 
                        <tr>
                        	<input type="hidden" name="month" value="${month}">
                            <input type="hidden" name="sno" value="${r.spaceNo}">
                            <th style="width: 110px;">호스트명</th>
                            <td class="sales_detail_content">${r.memName} &nbsp;&nbsp;
                                <span id="gender">
                                    <c:choose>
                                        <c:when test="${ r.gender eq 'M' }">
                                            [남]
                                        </c:when>
                                        <c:otherwise>
                                            [여]
                                        </c:otherwise>
                                    </c:choose>
                                </span>
                            </td>
                        </tr> 
                        <tr>
                            <th>호스트ID</th> 
                            <td>${r.memId}</td>
                        </tr> 
                        <tr>
                            <th>공간명</th> 
                            <td class="sales_detail_content spTitle" style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;" onclick="window.open('detail.sp?sno=' + ${r.spaceNo}, '', 'width=1400, height=1000, location=no, status=no, scrollbars=yes');">${r.spaceTitle}</td>
                        </tr> 
                        <tr style="border-top: 2px solid lightgray;">
                            <th>매출 내역</th>
                            <td>
                                <table class="income_detail">
                                    <tr>
                                        <th style="width: 200px">예약시간</th>
                                        <th style="width: 150px">결제금액</th>
                                        <th style="width: 150px">매출액</th>
                                    </tr>
                                    <tbody class="myTable">
                                    </tbody>
                                </table>
                                <br>
                                <!-- 페이지 버튼 -->
                                <div class="btnPage" align="center">
                                    <ul class="pagination">
                                    </ul>
                                </div>
                                <br>
                            </td>
                        </tr>             
                    </table>
                    <div align="center" style="margin-top: 30px; margin-bottom: 20px" id="resultIncome">
                    	<h4>${month} 월 총 매출액 : <b>${r.income} 원</b></h4>
                    </div>
                </div>
                
            </div>
            <div align="center" style="margin-top: 50px;">
                <a class="btn btn-sm btn-secondary" onclick="history.back();">목록</a>
            </div>
        </div>
    </div>
    
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
    
    <!-- 매출내역 리스트 조회, 페이징 처리 -->
    <script>
        
        $(function() {
            showSalesList();
        });
        
        function showSalesList(sno, currentPage) {
            
            var sno = ${r.spaceNo};
            var month = $("#sales_detail tr").children().eq(0).val();
            
            $.ajax({
                url : "ajaxsdlist.ad",
                data : { sno : sno, month : month, cpage : currentPage },
                success : function(result) {
                    
                    console.log(result);
                    console.log(sno);
                    
                    /* 매출 내역 리스트 뽑기 */
                    var resultStr = "";
                    
                    for(var i = 0; i < result.list.length; i++) {
                        
                        resultStr += "<tr><td>" + result.list[i].useDate + "&nbsp;&nbsp;" + result.list[i].startTime + ":00</td>"
                                       + "<td>" + result.list[i].price + "</td>"
                                       + "<td>" + result.list[i].income + "</td></tr>";
                    } 

                    $(".myTable").html(resultStr); 
                    
	                /* 매출 내역 리스트 페이징처리 */
                    var resultPi = "";
                    
                        if(result.pi.currentPage == 1) {
                            resultPi += "<li class='page-item no-page-prev disabled'><a class='page-link' href='#'>&lt;</a></li>";
                        } else {
                            resultPi += "<li class='page-item no-page-prev'><a class='page-link' href='#' onclick='showSalesList(" + sno + ", " + result.pi.currentPage  + "- 1);'>&lt;</a></li>"
                        }
                    
                        for(var p = result.pi.startPage; p <= result.pi.endPage; p++) {
                            
                            if(p != result.pi.currentPage) {
                                resultPi += "<li class='page-item page-btn'><a id='' class='page-link' href='#' onclick='showSalesList(" + sno + ", " + p + ");'>" + p +"</a></li>"
                            } 
                            if(p == result.pi.currentPage) {
                                resultPi += "<li class='page-item page-btn' disbled>" + p + "</li>"
                            }
                        }
                        
                        if(result.pi.currentPage == result.pi.maxPage) {
                            resultPi += "<li class='page-item no-page-next disabled'><a class='page-link' href='#'>&gt;</a></li>";
                        } else {
                            resultPi += "<li class='page-it1em no-page-next'><a class='page-link' href='#' onclick='showSalesList(" + sno + ", " + result.pi.currentPage  + "+ 1);'>&gt;</a></li>"
                        }

                    $(".pagination").html(resultPi);
                    
                }, error : function() {
                    console.log("매출 상세내역 조회용 ajax 통신 실패ㅠㅠ");
                } 
            });
        }
    </script>

</body>
</html>