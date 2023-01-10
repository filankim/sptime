<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 상세조회</title>
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

    /* 신고 상세조회 전체 틀 */
    #reportDetail {
        border: 2px solid lightgray;
        background-color: white;
        border-radius: 10px;
        margin: auto;
        margin-top: 60px;
        margin-bottom: 20px;
        padding: 40px 0px 20px 0px;
        width: 650px;
        min-height: 570px;
    }

    /* 제목 - 신고내용 상세조회 */
    #report_title { margin: 20px;}

    /* 신고 정보 영역 */
    .report_info {
        margin: auto;
        margin-top: 25px;
        width: 80%;
    }

    /* 신고 상세 정보 테이블 */
    #report_detail {
        border-bottom: 2px solid lightgray;
        border-top: 2px solid lightgray;
    }
    #report_detail th, #report_detail td { height: 60px; }

    /* 신고 내용 only 내용 */
    .reportContent {
        border-top: 2px solid lightgray; 
        height:150px;
    }

    /* 관리자 답변 영역 */
    .report_answer { margin: 20px 0px;}
    #reportStatus { color: red; }
    #reportStatus, #reportAnswer { 
        margin-top: 20px;
        padding-bottom: 20px;
    }
    

</style>
</head>
<body>

    <div class="wrap">
        <div id="header_container"><jsp:include page="header.jsp" /></div>

        <jsp:include page="adminNavi.jsp" />
            
        <!-- 컨텐트 영역 -->
        <div id="content">
            
            <!-- 신고내용 상세조회 -->
            <div id="reportDetail">
            
                <!-- 신고내역 상세조회 제목 -->
                <div align="center" id="title"><h3>신고내역 상세조회</h3></div>

                <!-- 신고 정보 -->
                <div class="report_info" align="center">
                    <input type="hidden" name="rpno" value="${r.reportNo}">
                    <table id="report_detail"> 
                        <tr>
                            <th style="width: 150px;">신고일</th>
                            <td style="width: 500px;">${r.reportDate}</td>
                        </tr> 
                        <tr>
                            <th>신고유형</th> 
                            <td>${r.reportType}</td>
                        </tr> 
                        <tr>
                            <th>신고자 ID</th>
                            <td>${r.reportMemNo}</td>
                        </tr>
                        <tr>
                            <th>신고대상 ID</th>
                            <td>${r.reportedMemNo}</td>
                        </tr>
                        <tr class="reportContent">
                            <th>신고내용</th>
                            <td>${r.reportContent}</td>
                        </tr>                        
                    </table>
                
                    <table class="report_answer" align="center">
                        <tr>
                            <th style="width: 150px;" rowspan="2">관리자 답변</th>
                            <td style="width: 400px;">
                                <div id="reportStatus" align="left">
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
                                </div>
                                <div id="reportAnswer" align="left">
                                	<c:choose>
                                		<c:when test="${r.reportStatus eq 'D' && empty r.reportAnswer}">
                                			반려사유를 작성해주세요.
                                		</c:when> 
                                		<c:otherwise>
                                			${r.reportAnswer}
                                		</c:otherwise>
                                	</c:choose>
                                </div>
                            </td>
                            <td align="right" style="width: 100px;">
                                <a class="btn btn-sm btn-light" data-toggle="modal" data-target="#answer">처리하기</a>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div align="center" style="margin-top: 50px;">
                <a class="btn btn-sm btn-secondary" href="rlist.ad">목록</a>
            </div>
        </div>
    </div>
    
    
    <!-- 신고 상세내역 모달창 -->
    <div class="modal fade" id="answer">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
            
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">신고 처리</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                
                <!-- Modal body -->
                <form action="updateReport.ad" method="post">
                <input type="hidden" name="reportNo" value="${r.reportNo}">
                <input type="hidden" name="reportedMemNo" value="${r.reportedMemNo}">
                    <div class="modal-body">
                        <!-- 신고 정보 -->
                        <div class="report_info">
                            <table class="report_answer" align="center">
                                <tr class="selectBox">
                                    <th style="width: 200px;" rowspan="2" align="left">관리자 답변</th>
                                    <td style="width: 500px;">
                                        <!-- 승인, 반려 선택 -->
                                        <div id="reportStatus" align="left">
                                            <div class="form-group">
                                                <select class="form-control" name="reportStatus" style="width: 70%;">
                                                    <!-- <option value="N">미처리</option> -->
                                                    <option value="Y">승인</option>
                                                    <option class="reportD" value="D">반려</option>
                                                </select>
                                            </div>
                                        </div>
                                        <input type="text" class="form-control mb-2 inputText" style="width:100%;" name="reportAnswer" placeholder="ex) 양식에 맞춰 신고해주세요." value="${r.reportAnswer}" disabled required>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">확인</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <script>
	    $(document).on("change", "select[name=reportStatus]", function(){
			var value = $(this).find("option:selected").val();
			var inputText = $(this).closest('.selectBox').find('.inputText');
			var flag = false;
			if (value == 'Y') {
				flag = true;
				$(inputText).val('');
			}else if (value =='D') {
                flag = false;
            }
			$(inputText).attr("disabled", flag);
		});
	    
    </script>

</body>
</html>