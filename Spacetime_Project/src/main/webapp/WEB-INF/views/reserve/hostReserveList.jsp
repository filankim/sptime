<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SpaceTime</title>
<style>
      body * {
        box-sizing: border-box;
      }

      #reserveList_Host {
        width: 1000px;
        margin: 0 auto;
      }

      #reserveList_Host > div:nth-child(1) {
        font-size: 25px;
        font-weight: 800;
        margin-bottom: 20px;
      }

      #reserveList_Host > form {
        overflow: hidden;
        margin-bottom: 25px;
      }

      #reserveList_Host input {
        float: left;
        width: 80%;
        height: 40px;
        padding: 0 10px;
        outline: none;
        border: 1px solid lightgray;
        border-radius: 5px;
      }

      #reserveList_Host button {
        float: right;
        height: 40px;
        width: 150px;
        background-color: rgb(39, 123, 192);
        color: white;
        border-radius: 5px;
        border: none;
        font-size: 18px;
      }
      
      #hReserveTb th,
	   #hReserveTb td {
			text-align: center;
		}
      

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

      /* 예약 정보 모달 */
      #reserveInfoModal .modal-content {
        width: 700px;
        margin: auto;
        border: none;
        border-radius: 10px;
        overflow: hidden;
      }

      #reserveInfoModal .modal-header {
        background-color: rgb(39, 123, 192);
        text-align: center;
        color: white;
        font-size: 23px;
        border-bottom: none;
        display: block;
        margin-bottom: 10px;
      }

      #reserveInfoModal .modal-body {
        padding: 15px 50px;
      }

      #reserveInfotb {
        background-color: white;
        table-layout: fixed;
        margin: 0;
        color: rgb(66, 66, 66);
      }

      #reserveInfotb td {
        vertical-align: middle;
        padding: 0;
        height: 55px;
        font-size: 20px;
        font-weight: 600;
      }

      #reserveInfotb tr:nth-child(2) > td {
        font-size: 23px;
        font-weight: 800;
        color: rgb(14, 99, 168);
      }

      #reserveInfoModal .modal-footer {
        margin: 0 auto 20px;
        border: none;
      }

      #reserveInfoModal button {
        color: white;
        width: 250px;
        height: 60px;
        margin: 0 10px;
        text-align: center;
        font-size: 20px;
        font-weight: 500;
        border-radius: 5px;
        border: none;
      }

      #reserveInfoModal button:nth-child(1) {
        background-color: rgb(231, 76, 60);
      }

      #reserveInfoModal button:nth-child(2) {
        background-color: rgb(253, 193, 55);
      }

      #reserveInfoModal button:nth-child(1):hover {
        background-color: rgb(236, 50, 29);
        font-size: 22px;
        font-weight: 600;
      }

      #reserveInfoModal button:nth-child(2):hover {
        background-color: rgb(255, 187, 27);
        font-size: 22px;
        font-weight: 600;
        color: black;
      }
      #statusMsg {
     	font-size: 30px;
        font-weight: 700;
        padding: 10px 30px;
        border-radius: 3px;
    
      }
      .span-use {
          background-color: rgb(255, 187, 27);
      }
      .span-exp{
         background-color: lightgray;
         color: gray;
      }
      .span-confirm {
          background-color: rgb(39, 123, 192);
      }
      .span-refuse, .span-cancle {
        background-color: rgb(236, 50, 29);
        color:white;
      }

      /* -------------------------------------- */

      /* 예약 확정 모달 */
      #revConfirmModal .modal-content {
        width: 450px;
        margin: auto;
        border: 1px solid gray;
        border-radius: 10px;
        overflow: hidden;
        margin-top: 150px;
      }

      #revConfirmModal .modal-header {
        background-color: rgb(39, 123, 192);
        text-align: center;
        color: white;
        font-size: 18px;
        border-bottom: none;
        display: block;
        padding: 10px;
        margin-bottom: 10px;
      }

      #revConfirmModal .modal-body {
        text-align: center;
        margin-top: 30px;
      }

      #revConfirmModal h4 {
        margin-bottom: 20px;
      }

      #revConfirmModal h5 {
        color: rgb(39, 123, 192);
      }

      #revConfirmModal .modal-footer {
        margin: 0 auto 20px;
        border: none;
      }

      #revConfirmModal button {
        color: white;
        width: 150px;
        height: 60px;
        margin: 0 10px;
        text-align: center;
        font-size: 18px;
        font-weight: 500;
        border-radius: 5px;
        border: none;
      }

      #revConfirmModal button:nth-child(1) {
        background-color: rgb(158, 158, 158);
      }

      #revConfirmModal button:nth-child(2) {
        background-color: rgb(253, 193, 55);
      }

      #revConfirmModal button:nth-child(1):hover {
        background-color: rgb(136, 136, 136);
        font-size: 20px;
        font-weight: 600;
      }

      #revConfirmModal button:nth-child(2):hover {
        background-color: rgb(255, 187, 27);
        font-size: 20px;
        font-weight: 600;
        color: black;
      }

      /* -------------------------------------- */
      /* 예약 취소 모달 */
      #revRejectModal .modal-content {
        background-color: lightgray;
        border-radius: 20px;
        width: 500px;
        height: 400px;
        margin: 80px auto;
        margin-left: 500px;
        padding: 20px;
      }

      #revRejectModal .modal-body {
        background-color: white;
        border-radius: 15px;
      }

      #revRejectModal form {
        width: 100%;
        height: 100%;
      }

      #revRejectModal textarea {
        width: 100%;
        height: 80%;
        border-radius: 5px;
        font-size: 20px;
        border: none;
        outline: none;
        resize: none;
      }

      #revRejectModal button {
        width: 80px;
        height: 50px;
        vertical-align: middle;
        background-color: rgb(231, 76, 60);
        border-radius: 10px;
        font-size: 20px;
        color: white;
        font-weight: 600;
        float: right;
        border: none;
      }

      #revRejectModal button:hover {
        font-size: 22px;
        color: #ffff00;
        font-weight: 700;
      }
    </style>
</head>
<body>
	<div class="wrap">		
	<jsp:include page="../common/hostHeader.jsp" />
	<div class="main">
	<div id="reserveList_Host">
      <div>예약 관리 리스트</div>
      <form action="schRevHostList.re" method="get" id="revList_Search">
        <input
          type="search"
          name="keyword"
          placeholder="예약번호 또는 예약자명"
          value="${keyword }"
        />

        <button type="submit">검색</button>
      </form>
      <table id="hReserveTb" class="table table-hover">
        <thead>
          <tr>
            <th>예약번호</th>
            <th>공간명</th>
            <th>예약자</th>
            <th>예약일</th>
            <th>금액</th>
            <th>상태</th>
          </tr>
        </thead>
        <tbody>
	        <c:choose>
		      <c:when test="${rList.size() eq 0}">
		      	<tr>
		      	<td colspan="6">예약 내역이 없습니다.</td>
		      	</tr>
		      </c:when>
		      <c:otherwise>
		      <fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd HH:MM:ss" />
		         <c:forEach var="r" items="${rList}" varStatus="status">
		         <tr onclick="revInfoModalOpen(this)">
		            <td>${r.reserveNo}</td>
		            <td>${r.space.spaceTitle}</td>
		            <td>${r.member.memName}</td>
		            <td>${r.useDate }</td>
		            <td><fmt:formatNumber value="${r.price}" />원</td>
		            <td>
			            <c:choose>
			            <c:when test="${today >= r.useDate }">
			            	 <c:choose>
				             <c:when test="${r.reserveStatus eq 'W'}">승인불가</c:when>
				             <c:when test="${r.reserveStatus eq 'Y'}">이용완료</c:when>
				             <c:when test="${r.reserveStatus eq 'N'}">예약거절</c:when>
				             <c:when test="${r.reserveStatus eq 'C'}">고객취소</c:when>
				             </c:choose>
			            </c:when>
			            <c:otherwise>
			            	<c:choose>
				             <c:when test="${r.reserveStatus eq 'W'}">승인대기</c:when>
				             <c:when test="${r.reserveStatus eq 'Y'}">예약확정</c:when>
				             <c:when test="${r.reserveStatus eq 'N'}">예약거절</c:when>
				             <c:when test="${r.reserveStatus eq 'C'}">고객취소</c:when>
				             </c:choose>
			            </c:otherwise>
			            </c:choose>
		            </td>
		            <input type="hidden"  value="${r.reserveCount }">
		            <input type="hidden"  value="${r.startTime }">
		         	<input type="hidden"  value="${r.endTime }">
		         	<input type="hidden"  value="${r.denyMessage }">
		         	<input type="hidden"  value="${r.member.phone }">
		         	<input type="hidden"  value="${r.reserveStatus}">
		         	<input type="hidden"  value="${r.member.memId}">
		          </tr>
		         </c:forEach>
		       </c:otherwise>
		       </c:choose>
	        </tbody>
      </table>
      <c:if test="${rList.size() ne 0}">
      <ul class="pagination">
        <c:choose>
	   		<c:when test="${ pi.currentPage eq 1 }">
	   			<li class="page-item no-page-prev disabled"><a class="page-link">&lt;</a></li>
	   		</c:when>
	   		<c:otherwise>
	   			<li class="page-item"><a class="page-link" >&lt;</a></li>
	   		</c:otherwise>
	   	</c:choose>	       
	       <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	       	<li class="page-item page-btn"><a class="page-link" >${ p }</a></li>
	       </c:forEach>
	       <c:choose>
	       	<c:when test="${ pi.currentPage eq pi.maxPage }">
	       		<li class="page-item no-page-next disabled"><a class="page-link" >&gt;</a></li>
	       	</c:when>
	       	<c:otherwise>
	      	 	<li class="page-item no-page-next"><a class="page-link" >&gt;</a></li>
	       	</c:otherwise>
	       </c:choose>
      </ul>
      </c:if>
    </div>

    <!-- 예약정보 Modal -->
    <div class="modal" id="reserveInfoModal">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <!-- Modal Header -->
          <div class="modal-header">예약 정보</div>
          <!-- Modal body -->
          <div class="modal-body">
            <table id="reserveInfotb" class="table table-borderless">
              <tbody>
                <tr>
                  <td style="width: 20%">예약번호</td>
                  <td id="revNo"></td>
                </tr>
                <tr>
                  <td colspan="2">
                    <span id="revTitle" style="cursor: pointer"></span>
                  </td>
                </tr>
                <tr>
                  <td>예약자</td>
                  <td id="revName"></td>
                </tr>
                <tr>
                  <td>예약인원</td>
                  <td id="revCount"></td>
                </tr>
                <tr>
                  <td>예약시간</td>
                  <td id="revTime"></td>
                </tr>
                <tr>
                  <td>연락처</td>
                  <td id="revPhone"></td>
                </tr>
                <tr>
                  <td>금액</td>
                  <td id="revPrice"></td>
                </tr>
              </tbody>
            </table>
            <input type="hidden" name="smemId" value="">
          </div>
          <!-- Modal footer -->
          <div class="modal-footer">
          </div>
        </div>
      </div>
    </div>

    <!-- 예약 확정 Modal -->
    <div class="modal" id="revConfirmModal">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <!-- Modal Header -->
          <div class="modal-header">예약 확정</div>
          <!-- Modal body -->
          <div class="modal-body">
            <h4>예약 확정시 취소가 불가능 합니다.</h4>
            <h5>예약을 확정하시겠습니까?</h5>
          </div>
          <!-- Modal footer -->
          <div class="modal-footer">
        	  <form action="updateHostRev.re" method="post">
	            <button type="button" data-dismiss="modal">닫기</button>
	            <button type="button" onclick="revConfirmSub()">확인</button>
	            <input type="hidden" name="reserveNo" value="">
	            <input type="hidden" name="reserveStatus" value="Y">
	            <input type="hidden" name="denyMessage" value="">
            </form>
          </div>
        </div>
      </div>
    </div>

    <!-- 예약 취소 Modal -->
    <div class="modal" id="revRejectModal">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <!-- Modal body -->
          <div class="modal-body">
            <form action="updateHostRev.re" method="post">
              <textarea
                name="denyMessage"
                placeholder="예약 취소 사유를 입력해주세요."
              ></textarea>
              <input type="hidden" name="reserveNo" value="" />
              <input type="hidden" name="reserveStatus" value="N">
              <button type="button" onclick="revRejectSub()">확인</button>
            </form>
          </div>
        </div>
      </div>
    </div>
	
	</div>	
	<jsp:include page="../common/footer.jsp" />
	</div>
	<script>
	function getDayOfWeek(date){ 
	    const week = ['일', '월', '화', '수', '목', '금', '토'];
	    const dayOfWeek = week[new Date(date).getDay()];
	    return dayOfWeek;
	}
	
    function revInfoModalOpen(tr) {
    	$("#revNo").text($(tr).children().eq(0).text());
    	$("#revTitle").text($(tr).children().eq(1).text());
    	$("#revName").text($(tr).children().eq(2).text());
    	$("#revCount").text($(tr).children("input").eq(0).val()+"명");
    	var totime = $(tr).children("input").eq(2).val() - $(tr).children("input").eq(1).val();
    	var useDate = $(tr).children().eq(3).text();
    	var str = useDate+"("+getDayOfWeek(useDate)+") "+$(tr).children("input").eq(1).val()+":00 ~ "+$(tr).children("input").eq(2).val()+":00 "+totime+"시간";
    	$("#revTime").text(str);
    	$("#revPhone").text($(tr).children("input").eq(4).val());
    	$("#revPrice").text($(tr).children().eq(4).text());
    	$("#reserveInfoModal input[name=smemId]").val($(tr).children("input").eq(6).val());
    	let today = new Date();
    	
    	var useday = useDate+" "+$(tr).children("input").eq(1).val()+":00:00";
    	console.log(today);
    	console.log(useday);
    	
    	const date1 = new Date(today);
    	const date2 = new Date(useday);
    	
    	// 공간 상태
    	let status = $(tr).children("input").eq(5).val();
    	// 지금 시간이 이용 시작시간보다 크면
    	var str =""
    	if(date1.getTime() > date2.getTime()) {
    		if(status == 'W') {
    			str += "<span id='statusMsg' class='span-exp'>예약 승인 기한 만료</span>";
    		}else if(status == 'Y') {
    			str += "<span id='statusMsg' class='span-use'>이용 완료</span>";
    		}else if(status == 'N') {
    			str += "<span id='statusMsg' class='span-refuse'>예약 거절</span>";
    		}else if(status == 'C') {
    			str += "<span id='statusMsg' class='span-cancle'>사용자 취소</span>";
    		}
    		str+= "</span>"
    	}else {
    		if(status == 'W') {
    				 str += "<button type='button' onclick='reserveModal()'' >예약 취소</button>";
    				 str +=  "<button type='button' onclick='confirmModal()'' >예약 확정</button>";
    		}else if(status == 'Y') {
    			str += "<span id='statusMsg' class='span-confirm'>예약 확정</span>";
    		}else if(status == 'N') {
    			str += "<span id='statusMsg' class='span-refuse'>예약 거절</span>";
    		}else if(status == 'C') {
    			str += "<span id='statusMsg' class='span-cancle'>사용자 취소</span>";
    		}
    	}
    	$("#reserveInfoModal .modal-footer").html(str);
        
       $("#reserveInfoModal").modal("show");
 
    }
    revConfirmSub = () => {
		$("#revConfirmModal form").submit();
		sendMessage("revconfirm", $("#reserveInfoModal input[name=smemId]").val(), $("#reserveInfoModal #revTitle").text());
	}
    
    revRejectSub = () => {
		$("#revRejectModal form").submit();
		sendMessage("revreject", $("#reserveInfoModal input[name=smemId]").val(), $("#reserveInfoModal #revTitle").text());
	}
    
    //페이징
	$(function() {
		$(".page-link").each(function() {
      		if ($(this).text() ==${ pi.currentPage}) {
      			$(this).attr("id", "active-page");
      			$(this).parent().addClass("disabled");
      		} else {
      			$(this).removeAttr("id", "active-page");
      		}
      	});
		
		var keyword= "${keyword}";    
    	var prevNo = "${pi.currentPage-1}";
		var nextNo = "${pi.currentPage+1}";
		
		if(keyword == "") {
			$(".no-page-prev>a").click(function() {
				location.href ="revHostList.re?rpage="+prevNo;
			});
			$(".page-btn>a").click(function() {
				location.href ="revHostList.re?rpage="+$(this).text();
			});
			$(".no-page-next>a").click(function() {
				location.href ="revHostList.re?rpage="+nextNo;
			});
     	}else {
     		$("input[name=keyword]").val(keyword);     		

     		$(".no-page-prev>a").click(function() {
				location.href ="schRevHostList.re?rpage="+prevNo+"&keyword="+keyword;
			});
			$(".page-btn>a").click(function() {
				location.href ="schRevHostList.re?rpage="+$(this).text()+"&keyword="+keyword;
			});
			$(".no-page-next>a").click(function() {
				location.href ="schRevHostList.re?rpage="+nextNo+"&keyword="+keyword;
			});
		}
		
	});
	
	confirmModal = () => {
		$("#revConfirmModal input[name='reserveNo']").val($("#reserveInfoModal #revNo").text());
		$("#revConfirmModal").modal("show");
	}
	
	reserveModal = () => {
		$("#revRejectModal input[name='reserveNo']").val($("#reserveInfoModal #revNo").text());
		$("#revRejectModal").modal("show");
	}
	
	</script>
</body>
</html>