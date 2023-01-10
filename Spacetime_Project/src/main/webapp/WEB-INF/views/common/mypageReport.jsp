<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 신고</title>
<!--부트스트립-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


<style>
#mypage_content {
	font-size: 40px;
	font-weight: bold;
	padding: 50px;
	text-align: center;
}

.table {
	text-align: center;
}

.table tr {
	line-height: 35px;
}

.table>tbody>.data:hover {
	cursor: pointer; /* 일부러 조회된 데이터가 있을 경우에만 포인터 모양 변경 */
}

.table>tbody>.nodata:hover {
	background-color : white; /* 마치 hover 가 안일어난거 같은 효과 */
}

.modal-footer, .modal-header, .modal-body {
	border: none;
}

.hr {
	border-color: black;
}

/* 신고 상세정보 모달창 */
/* 신고 정보 영역 */
.report_info {
	margin: auto;
	width: 90%;
}

/* 신고 상세 정보 테이블 */
#report_detail {
	border-bottom: 2px solid lightgray;
}

#report_detail th, #report_detail td {
	height: 60px;
}

#report_detail th {
	width: 100px;
}

/* 신고 내용 only 내용 */
.reportContent {
	border-top: 2px solid lightgray;
	height: 150px;
}

.reportContent td {
	padding: 20px 0px;
}

/* 승인, 반려 선택 */
#reportStatus {
	color: blue;
	font-weight: bold;
	margin-bottom: 20px;
}

/* 관리자 답변 영역 */
.report_answer {
	margin-top: 20px;
}

.page-btn {
	margin: 0 5px;
}

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

.nodata {
	text-align: center;
	font-size: 25px;
	font-weight: 600;}
	
</style>
</head>

<body>

	<jsp:include page="../common/header.jsp" />

	<div id="content">
		<div id="content_1">왼쪽여백</div>

		<!--컨텐츠작성부분-->
		<div id="content_2" class="">
			<!--마이페이지 내용영역-->
			<div class="container">
				<div id="mypage_content" class="">신고 리스트</div>

				<table class="table table-hover" align="center">
					<thead>
						<tr>
							<th style="width: 350px;">신고유형</th>
							<th>신고시간</th>
							<th>처리여부</th>
						</tr>
					</thead>
					
					<tbody id="content1">
					<c:choose>	
				 	<c:when test="${list.size() eq 0}">
						<tr class="nodata">
							<td colspan="3">
								신고내역이 없습니다.
							</td>
						</tr>
					</c:when> 
				<c:otherwise>
						<c:forEach var="r" items="${ list }">
							<tr class="data" onclick="reportmodalopen(this)">
								<td>${r.reportType}</td>
								<td>${r.reportDate}</td>
								<td><c:choose>
										<c:when test="${r.reportStatus eq 'Y'}">
                                                승인
                                            </c:when>
										<c:when test="${r.reportStatus eq 'N'}">
                                                미처리
                                            </c:when>
										<c:when test="${r.reportStatus eq 'D'}">
                                                반려
                                            </c:when>
									</c:choose></td>
								<input type="hidden" value="${r.reportMemNo}">
								<input type="hidden" value="${r.reportContent}">
								<input type="hidden" value="${r.reportAnswer}">
							</tr>
							</c:forEach>
											
						</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>

			<br>
			<br>
			<!-- 페이지 버튼 -->
			<!-- <div id="btnPage" align="center">
				<button class="btn btn-warning btn-sm">&lt;</button>
				<button class="btn btn-light btn-sm">1</button>
				<button class="btn btn-light btn-sm">2</button>
				<button class="btn btn-light btn-sm">3</button>
				<button class="btn btn-light btn-sm">4</button>
				<button class="btn btn-light btn-sm">5</button>
				<button class="btn btn-warning btn-sm">&gt;</button>
			</div> -->
			<!-- 페이지 버튼 -->
			<div id="pagingArea" align="center" id="btn">
				<ul class="pagination">
					<c:choose>
						<c:when test="${ pi.currentPage eq 1 }">
							<li class="page-item no-page-prev disabled"><a
								class="page-link">&lt;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="report.co?cpage=${ pi.currentPage - 1 }">&lt;</a></li>
						</c:otherwise>
					</c:choose>
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<li class="page-item page-btn"><a class="page-link"
							href="report.co?cpage=${ p }">${ p }</a></li>
					</c:forEach>
					<c:choose>
						<c:when test="${ pi.currentPage eq pi.maxPage }">
							<li class="page-item no-page-next disabled"><a
								class="page-link">&gt;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item no-page-next"><a class="page-link"
								href="report.co?cpage=${ pi.currentPage + 1 }">&gt;</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
		<br>
		<br>
		<br>
		<div id="content_3"></div>

	</div>


	<jsp:include page="../common/footer.jsp" />

	<!-- 신고 상세내역 모달창 -->
	<div class="modal fade" id="reportDetail">
		<div
			class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-lg">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">신고내역 상세조회</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<!-- 신고 정보 -->
					<div class="report_info" align="center">
						<table id="report_detail">
							<tr>
								<th style="width: 150px;">신고일</th>
								<td style="width: 500px;" id="reportDate">2022-10-10</td>
							</tr>
							<tr>
								<th>신고유형</th>
								<td id="reportType">욕설</td>
							</tr>
							<tr class="reportContent">
								<th>신고내용</th>
								<td id="reportContent">신고내용~~<br> <img
									src="data:image/png;base64,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">
									<br>
								<br>
								<br>
								<br>
								<br>
								<br>
								<br>
								<br>
								<br>
								<br>
								<br>
								<br>
								<br>
								<br>
								<br>
								<br>
								<br>
								<br>
								<br>
								<br>신고내용~~
								</td>
							</tr>
						</table>

						<table class="report_answer" align="center">
							<tr>
								<th style="width: 150px;" rowspan="2">관리자 답변</th>
								<td style="width: 500px;">
									<div id="reportStatus">반려</div>
									<div id="reportAnswer">양식에 맞춰 신고해주세요.</div>
								</td>
							</tr>
						</table>
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	<script>
	function reportmodalopen(tr){
		var rtype = $(tr).children("td").eq(0).text();
		var rdate = $(tr).children("td").eq(1).text();
		var rstatus = $(tr).children("td").eq(2).text();
		var rcontent = $(tr).children("input").eq(1).val();
		var ranswer = $(tr).children("input").eq(2).val();
		
		$("#reportType").text(rtype);
		$("#reportDate").text(rdate);
		$("#reportContent").text(rcontent);
		$("#reportStatus").text(rstatus);
		$("#reportAnswer").text(ranswer);
		$("#reportDetail").modal("show");
	}
	
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