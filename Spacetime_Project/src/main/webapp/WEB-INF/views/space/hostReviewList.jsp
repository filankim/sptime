<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SpaceTime</title>
<style>
body * {
	box-sizing: border-box;
}

#spReviewDiv {
	width: 800px;
	margin: 30px auto;
	color: rgb(54, 54, 54);
}

.space-main-title {
	font-size: 25px;
	font-weight: 600;
	color: rgb(54, 54, 54);
}

#spReviewDiv hr {
	border: 2px solid rgb(39, 123, 192);
	margin-bottom: 20px;
}

#revListSearchForm {
	margin-bottom: 25px;
}

#revListSearchForm::after {
	content: "";
	display: block;
	clear: both;
}

#revListSearchForm input {
	float: left;
	width: 27%;
	height: 50px;
	padding: 0 10px;
	outline: none;
	border: 1px solid lightgray;
	border-radius: 5px;
}

#revListSearchForm button {
	float: right;
	width: 150px;
	height: 50px;
	background-color: rgb(39, 123, 192);
	color: white;
	border-radius: 5px;
	border: none;
	font-size: 18px;
}

#revListSearchForm button:hover {
	font-size: 20px;
}

/* select box*/
#theme1, #theme2 {
	float: left;
	box-sizing: border-box;
	width: 230px;
	margin-right: 3%;
	font-size: 14px;
	font-weight: 500;
}

#theme2 {
	width: 120px;
}

.rev-select {
	position: relative;
	border-radius: 5px;
	padding: 12px 15px;
	height: 50px;
	cursor: pointer;
	border: 1px solid rgb(204, 204, 204);
	background: url("resources/images/reserve/selectarrow.png")
		calc(100% - 5px) center no-repeat;
	background-size: 20px;
	box-sizing: border-box;
}

.option-list {
	background-color: #fff;
	border: 1px solid rgb(204, 204, 204);
	list-style: none;
	padding: 0;
	border-radius: 5px;
	box-sizing: border-box;
	position: absolute;
	top: 100%;
	left: 0;
	width: 100%;
	overflow: auto;
	display: none;
}

.stext {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.rev-select.active .option-list {
	max-height: 190px;
	z-index: 3;
}

.option {
	padding: 10px 15px;
	font-size: 12px;
	font-weight: 500;
}

.option:hover {
	background-color: #f2f2f2;
}

.nodata {
	text-align: center;
	font-size: 25px;
	font-weight: 600;
}
/* -------------*/

/* 페이지네이션 */
.pagination {
	justify-content: center;
}

.pagination a {
	cursor: pointer;
	border: none;
	border-radius: 5px;
	padding: 5px 8px;
	background-color: #eeeeee;
	color: black;
}

.no-page-prev a, .no-page-next a {
	background-color: #eeeeee !important;
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
/* -------------*/

/* 후기 css */
.review-area {
	border-bottom: 1px solid lightgray;
	margin-bottom: 20px;
}

.rtitle, .rwriter {
	margin-bottom: 10px;
	font-weight: 600;
}

.rtitle {
	font-size: 12px;
	color: rgb(54, 54, 54);
}

.rtitle>span {
	float: right;
	font-size: 15px;
	font-weight: 500;
	color: rgb(253, 193, 55);
}

.rwriter {
	font-size: 17px;
	color: rgb(52, 152, 219);
}

.rcontent-area {
	overflow: hidden;
	margin-bottom: 15px;
}

.rcontent {
	float: left;
	width: calc(100% - 350px);
	font-size: 15px;
	font-weight: 600;
	color: rgb(54, 54, 54);
}

.rcontent-img-area {
	float: right;
	width: 350px;
}

.rcontent-img-area>div {
	float: right;
}

.rcontent-img-area>div>div {
	overflow: hidden;
	float: left;
	width: 100px;
	height: 75px;
	margin-left: 7px;
}

.rcontent-img-area img {
	cursor: pointer;
	width: 100%;
	height: 100%;
}

.rdate {
	font-size: 12px;
	font-weight: 500;
	color: rgb(127, 127, 127);
	margin-bottom: 20px;
}

.rdate>span {
	float: right;
	font-size: 14px;
	font-weight: 500;
	cursor: pointer;
}

.rdate .fa-triangle-exclamation {
	color: #DD5353;
}

.hotitle {
	font-size: 18px;
	font-weight: 600;
	margin-bottom: 10px;
}

.answer-area {
	overflow: hidden;
	margin-bottom: 30px;
}

.answer-text, .answer-area>.sub-btn {
	height: 120px;
}

.answer-text {
	border: 1px solid lightgray;
	width: calc(100% - 150px);
	padding: 10px;
	margin: 0;
	float: left;
}

.answer-text>textarea {
	width: 100%;
	height: calc(100% - 25px);
	font-size: 15px;
	font-weight: 500;
	border: none;
	outline: none;
	padding: 0;
	resize: none;
	display: inline-block;
}

.lcount {
	float: right;
	margin: 5px;
	font-size: 12px;
	font-weight: 500;
	color: rgb(127, 127, 127);
}

.answer-area>.sub-btn {
	float: right;
	width: 150px;
	text-align: center;
	font-size: 20px;
	font-weight: 500;
	border: none;
	background-color: rgb(39, 123, 192);
	color: white;
}

.upd-btn, .del-btn {
	float: right;
	width: 150px;
	height: 50px;
	text-align: center;
	font-size: 20px;
	font-weight: 500;
	border: none;
	border-radius: 5px;
	margin: 20px 0 0 20px;
	background-color: rgb(39, 123, 192);
	color: white;
}

.del-btn {
	background-color: gray;
}

.del-btn:hover, .upd-btn:hover {
	font-size: 22px;
}

/* -------------*/
/* 리뷰 이미지 모달 */
#reviewImgModal .modal-content {
	width: 600px;
	margin: auto;
	border: 1px solid gray;
	border-radius: 10px;
	overflow: hidden;
	margin-top: 200px;
}

#reviewImgModal .modal-body {
	margin: 0 auto;
	padding: 10px 0;
}

#reviewImgModal img {
	width: 600px;
	height: 450px;
}

#reviewImgModal .img_btn_area {
	display: none;
	position: absolute;
	top: 0;
	left: 0;
	height: 100%;
	width: 100%;
}

.button_img_prev, .button_img_next {
	width: 40px;
	height: 100%;
	border: none;
	background-color: rgba(0, 0, 0, 0.2);
	cursor: pointer;
}

.button_img_next {
	float: right;
}

.img_btn_area i {
	font-size: 30px;
	color: white;
}

/* -------------------------------------- */

#reportContent {
	width: 100%;
	height: 100px;
	resize: none;
}

</style>
</head>
<body>
	<div class="wrap">
		<jsp:include page="../common/hostHeader.jsp" />
		<div class="main">
			<div id="spReviewDiv">
				<div class="space-main-title">이용 후기 관리</div>
				<hr />
				<form action="schHostRvwList.rv" method="get" id="revListSearchForm">
					<section id="theme1">
						<div class="rev-select">
							<div class="text stext">공간 전체</div>
							<ul class="option-list">
								<li class="option">공간 전체</li>
								<c:forEach var="s" items="${sList }">
									<li class="option">${s.spaceTitle }</li>
								</c:forEach>
							</ul>
							<input type="hidden" name="stitle" value="공간 전체">
						</div>
					</section>
					<section id="theme2">
						<div class="rev-select">
							<div class="text htext">답글 상태</div>
							<ul class="option-list">
								<li class="option">답글 전체</li>
								<li class="option">답글 있음</li>
								<li class="option">답글 없음</li>
							</ul>
							<input type="hidden" name="hanswer" value="">
						</div>
					</section>
					<input type="search" name="key" placeholder="예약번호 또는 예약자명" />
					<button type="submit">검색</button>
				</form>

				<c:choose>
					<c:when test="${rList.size() eq 0}">
						<div class="nodata">
							이용후기가 없습니다.<br>
						</div>
					</c:when>
					<c:otherwise>

						<c:forEach var="r" items="${rList }" varStatus="status.index">
							<div class="review-area" id="review${r.reviewNo}">
								<div class="rtitle">
									예약번호 : ${r.reserveNo} <span> <fmt:parseNumber var="i"
											value="${r.rating/2}" integerOnly="true" /> <c:set var="j"
											value="${r.rating%2}" /> <c:if test="${i ne 0 }">
											<c:forEach begin="1" end="${i}">
												<i class="fa fa-star" aria-hidden="true"></i>
											</c:forEach>
										</c:if> <c:if test="${j ne 0 }">
											<i class="fa fa-star-half-o" aria-hidden="true"></i>
										</c:if> <c:if test="${ (5-i-j) ne 0 }">
											<c:forEach begin="1" end="${5-i-j}">
												<i class="fa fa-star-o" aria-hidden="true"></i>
											</c:forEach>
										</c:if></span>
								</div>
								<div class="rwriter">${r.member.memName }-
									${r.space.spaceTitle }</div>
								<div class="rcontent-area">
									<div class="rcontent">${r.reviewCont}</div>
									<div class="rcontent-img-area">
										<div>
											<c:if test="${!empty r.reviewAttach1 }">
												<div>
													<img class="img1"
														src="${r.reviewAttach1}"
														alt="" />
												</div>
											</c:if>
											<c:if test="${!empty r.reviewAttach2 }">
												<div>
													<img class="img2"
														src="${r.reviewAttach2}"
														alt="" />
												</div>
											</c:if>
											<c:if test="${!empty r.reviewAttach3 }">
												<div>
													<img class="img3"
														src="${r.reviewAttach3}"
														alt="" />
												</div>
											</c:if>
										</div>
									</div>
								</div>
								<div class="rdate">${r.reviewEnrollDate }
									<span onclick="reviewReportModalOpen(this,${r.memNo})">신고하기
										<i class="fa-solid fa-triangle-exclamation"></i>
									</span>
								</div>

								<div class="hotitle">호스트 답글</div>
								<input type="hidden" name="reviewNo" value="${r.reviewNo }">
								<c:choose>
									<c:when test="${empty r.hostAnswer}">
										<div class="answer-area">
											<div class="answer-text">
												<textarea name="hostAnswer"
													placeholder="이용후기를 남긴 고객에게 전하는 답글을 작성해주세요." maxlength="100"></textarea>
												<div class="lcount">
													<span>0</span> / 100
												</div>
											</div>
											<button type="button" class="sub-btn"
												onclick="answerSub(this)">등록</button>
										</div>
									</c:when>
									<c:otherwise>
										<div class="answer-area">
											<div style="white-space: pre;">${r.hostAnswer }</div>
											<button type="button" class="upd-btn"
												onclick="answerMod(this, 1)">수정</button>
											<button type="button" class="del-btn"
												onclick="answerMod(this, 2)">삭제</button>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
						</c:forEach>

						<ul class="pagination">
							<c:choose>
								<c:when test="${ pi.currentPage eq 1 }">
									<li class="page-item no-page-prev disabled"><a
										class="page-link">&lt;</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item no-page-prev"><a class="page-link">&lt;</a></li>
								</c:otherwise>
							</c:choose>
							<c:forEach var="p" begin="${ pi.startPage }"
								end="${ pi.endPage }">
								<li class="page-item page-btn"><a class="page-link">${ p }</a></li>
							</c:forEach>
							<c:choose>
								<c:when test="${ pi.currentPage eq pi.maxPage }">
									<li class="page-item no-page-next disabled"><a
										class="page-link">&gt;</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item no-page-next"><a class="page-link">&gt;</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</c:otherwise>
				</c:choose>
			</div>

			<!-- 이미지 뷰 Modal -->
			<div class="modal" id="reviewImgModal">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<!-- Modal body -->
						<div class="modal-body">
							<img src="" alt="" />
							<div class="img_btn_area">
								<button type="button" class="button_img button_img_prev"
									onclick="imgChange(1)">
									<i class="fa fa-angle-left" aria-hidden="true"></i>
								</button>
								<button type="button" class="button_img button_img_next"
									onclick="imgChange(2)">
									<i class="fa fa-angle-right" aria-hidden="true"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 리뷰 사용자 신고 Modal -->
			<div class="modal" id="reviewReportModal">
				<input type="hidden" name="reportMemNo"
					value="${ loginMember.memNo }"> <input type="hidden"
					name="reportedMemNo" value="">
				<div class="modal-dialog">
					<div class="modal-content">
						<!-- Modal Header -->
						<div class="modal-header">사용자 신고</div>
						<!-- Modal body -->
						<div class="modal-body">
							<!--  신고유형 선택 드롭박스  -->
							<div>
								<b>신고유형</b> <br>
								<div class="selectType">
									<label for="type_select">신고유형선택</label>&nbsp;&nbsp;&nbsp;<select
										id="type_select" name="reportType">
										<option>욕설</option>
										<option>인신공격</option>
										<option>음란</option>
										<option>비매너</option>
										<option>혐오컨텐츠</option>
										<option>시설물관련</option>
										<option>기타</option>
									</select>
								</div>
							</div>
							<br>
							<!-- 신고내용 -->
							<b>신고내용</b> <br>
							<div>
								<textarea id="reportContent" name="reportContent" cols="50"
									rows="3" placeholder="신고 내용을 입력해주세요." maxlength="200"></textarea>

							</div>
						</div>
						<script>
							$(document).ready(function () {
								$('#reportContent').summernote({
									placeholder: '신고할 내용과 증빙 가능한 이미지를 첨부해주세요.<br>증빙이 되지 않으면 신고가 처리되지 않습니다.',
									lang: "ko-KR",
									height: 200,
									minHeight: 200,
									maxHeight: 200
								});

							});
                    
						</script>
						<!-- Modal footer -->
						<div class="modal-footer">
							<button type="button" class="btn btn-light" data-dismiss="modal">취소</button>
							<button type="submit" class="reportBtn btn btn-danger"
								onclick="reviewReport()">신고하기</button>
						</div>
					</div>
				</div>
			</div>


			<script>

    $(function () {
    	//페이징
    	$(".page-link").each(function() {
      		if ($(this).text() =="${pi.currentPage}") {
      			$(this).attr("id", "active-page");
      			$(this).parent().addClass("disabled");
      		} else {
      			$(this).removeAttr("id", "active-page");
      		}
      	});
    	
    	var key= "${key}";
    	var stitle = "${stitle}";
    	var hanswer = "${hanswer}";
    	var prevNo = "${pi.currentPage-1}";
		var nextNo = "${pi.currentPage+1}";
		console.log(prevNo);
		console.log(nextNo);
		
		if(key == "" && stitle == "" &&  hanswer == "") {
			$(".no-page-prev>a").click(function() {
				location.href ="hostRvwList.rv?rpage="+prevNo;
			});
			$(".page-btn>a").click(function() {
				location.href ="hostRvwList.rv?rpage="+$(this).text();
			});
			$(".no-page-next>a").click(function() {
				location.href ="hostRvwList.rv?rpage="+nextNo;
			});
     	}else {
     		$(".stext").text(stitle);
     		
     		$("input[name=stitle]").val(stitle);     		
     		$("input[name=key]").val(key);
     		
     		if(hanswer == "") {
     			$(".htext").text("답글 전체");
     		}else {
     			$(".htext").text(hanswer);
     			$("input[name=hanswer]").val(hanswer);
     		}
     		
     		$(".no-page-prev>a").click(function() {
				location.href ="schHostRvwList.rv?rpage="+prevNo+"&stitle="+stitle+"&hanswer="+hanswer+"&key="+key;
			});
			$(".page-btn>a").click(function() {
				location.href ="schHostRvwList.rv?rpage="+$(this).text()+"&stitle="+stitle+"&hanswer="+hanswer+"&key="+key;
			});
			$(".no-page-next>a").click(function() {
				location.href ="schHostRvwList.rv?rpage="+nextNo+"&stitle="+stitle+"&hanswer="+hanswer+"&key="+key;
			});
		}
    	
    	
    	
      // 셀렉트 컨트롤
      $(".rev-select").click(function () {
        if ($(this).hasClass("active") == false) {
          $(this).addClass("active");
          $(this).children("ul").show();
        } else {
          $(this).removeClass("active");
          $(this).children("ul").hide();
        }
      });

      $("section").on("click", ".option", function () {
        $(this).parent().siblings("div").text($(this).text());
        $(this).parent().siblings("input").val($(this).text());
      });

      // img 컨트롤

      $(".rcontent-img-area img").mouseover(function () {
        $(this).css({ transform: "scale(1.1)" });
      });
      $(".rcontent-img-area img").mouseleave(function () {
        $(this).css({ transform: "scale(1.0)" });
      });
      $(".rcontent-img-area img").click(function () {
        $("#reviewImgModal img").removeAttr("class");
        $("#reviewImgModal img").attr("src", $(this).attr("src")).addClass($(this).parents(".review-area").attr("id") + "-" + $(this).attr("class"));
        $("#reviewImgModal").modal("show");
      });

      // 모달 이미지 컨트롤 
      $("#reviewImgModal .modal-body").mouseover(function () {
        $(this).children(".img_btn_area").show();
      });
      $("#reviewImgModal .modal-body").mouseleave(function () {
        $(this).children(".img_btn_area").hide();
      });
    });

    function imgChange(type) {
      var rId = $("#reviewImgModal img").attr("class").split("-", 1)[0];
      var imgCount = $("#" + rId + " img").length;
      var index = $("#reviewImgModal img").attr("class").split("-", 2)[1].substr(3, 1);


      if (type == 1) {
        index--;
        if (index == 0) {
          index = imgCount;
        }
      } else {
        index++;
        if (index > imgCount) {
          index = 1;
        }
      }
      $("#reviewImgModal img").removeAttr("class");
      $("#reviewImgModal img").addClass(rId + "-img" + index);
      $("#reviewImgModal img").attr("src", $("#" + rId + " .img" + index).attr("src"));
    }
    // 글자수 체크
	$(function() {
		$('.answer-area').on("keyup", "textarea", function () {		
			 $(this).next().children().first().text($(this).val().length);  
		});
	});
    
	answerSub = (btn) => {
		var $b = $(btn);
		var reviewNo = $b.parent().prev().val();
		var hostAnswer = $b.prev().children().first().val();

		if(hostAnswer.trim() == "") {
  			alert("답글을 입력해주세요.");
  			$b.prev().children().first().val("");
  			$b.prev().children().first().focus();
  			return false;
  		}
		$.ajax({
			url : "inHostAns.rv",
			data : {
				reviewNo : reviewNo,
				hostAnswer : hostAnswer
			},
			success : result => {
				var str = "<div style='white-space:pre;'>"+result+"</div>";
			    str += "<button type='button' class='upd-btn' onclick='answerMod(this,1)''>수정</button>";
			    str += "<button type='button' class='del-btn' onclick='answerMod(this,2)''>삭제</button>";
				
			    $b.parent().html(str);
			},
			error : () => {
				console.log("통신 실패");
			}
		});
	}
	
	answerMod = (btn, type) => {
		var $b = $(btn);
		var reviewNo = $b.parent().prev().val();
		var hostAnswer = $b.prev().text();
		
		var str = "<div class='answer-text'>";
		if(type == 1) { //답글 수정
			str += "<textarea name='hostAnswer' placeholder='이용후기를 남긴 고객에게 전하는 답글을 작성해주세요.'' maxlength='100' >"+hostAnswer+"</textarea>";
            str += "<div class='lcount'><span>"+hostAnswer.length+"</span> / 100</div>";
		}else  { //답글 삭제
			if (!confirm("삭제 후 복원 불가합니다. 삭제하시겠습니까?")) {
	            return false;
	        }
			hostAnswer= null;
			$.ajax({
				type: "post",
				url : "inHostAns.rv",
				async:false,
				data : {
					reviewNo : reviewNo,
				},
				success : result => {
					str += "<textarea name='hostAnswer' placeholder='이용후기를 남긴 고객에게 전하는 답글을 작성해주세요.'' maxlength='100' ></textarea>";
		            str += "<div class='lcount'><span>0</span> / 100</div>";
				},
				error : () => {
					console.log("통신 실패");
				}
			});
		}
		str += "</div>";
        str += "<button type='button' class='sub-btn' onclick='answerSub(this)''>등록</button>";
		$b.parent().html(str);
	}
    
	 // 사용자 리뷰 신고
	 reviewReportModalOpen = (btn, reportedMemNo) => {
		 if(${empty loginMember}) {
            alert("로그인 후 이용 가능한 서비스입니다.");
           return false;
        } 
		 
		var reportMemNo = $("#reviewReportModal input[name=reportMemNo]").val();
		 
		 $.ajax({
				url : "countReport.rv",
				data : {
					reportMemNo : reportMemNo,
					reportedMemNo : reportedMemNo
				},
				success : result => {
					if(result == "success") {
						alert("신고는 하루에 1회 가능합니다.");
					} else {
						$("#reviewReportModal input[name=reportedMemNo]").val(reportedMemNo);
						$("#reviewReportModal textarea[name=reportContent]").val("");
						$("#reviewReportModal").modal("show");
					}
				},
				error : () => {
					console.log("통신 실패");
				}
		});
	 }
	
	 reviewReport = () => {
		 
		 if($("#reviewReportModal textarea[name=reportContent]").val().trim()=="") {
			 alert("신고내용은 필수 입력사항입니다.");
			 return false;
		 }
		 if($("#reviewReportModal textarea[name=reportContent]").val().length<10) {
			 alert("신고내용은 10자 이상 입력해주시기 바랍니다.");
			 return false;
		 }
		 
		 var reportType = $("#reviewReportModal select[name=reportType]").val();
		 var reportContent = $("#reviewReportModal textarea[name=reportContent]").val();
		 var reportMemNo = $("#reviewReportModal input[name=reportMemNo]").val();
		 var reportedMemNo = $("#reviewReportModal input[name=reportedMemNo]").val();
		 
		 $.ajax({
				url : "reportReview.rv",
				type : "post",
				data : {
					reportType : reportType,
					reportContent : reportContent,
					reportMemNo : reportMemNo,
					reportedMemNo : reportedMemNo
				},
				success : result => {
					if(result == "success") {
						$("#reviewReportModal textarea[name=reportContent]").val("");
						$("#reviewReportModal").modal("hide");
						alert("신고가 접수되었습니다.");
					}
				},
				error : () => {
					console.log("통신 실패");
				}
		});
	 }
	
  </script>
		</div>

		<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>