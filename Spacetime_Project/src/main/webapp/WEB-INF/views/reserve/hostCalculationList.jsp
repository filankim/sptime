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

    #CalList_Host {
      width: 1000px;
      margin: 0 auto;
    }

    #CalList_Host>div:nth-child(1) {
      font-size: 25px;
      font-weight: 800;
      margin-bottom: 20px;
    }

    #CalList_Search {
      margin-bottom: 25px;
    }

    #CalList_Search::after {
      content: "";

      display: block;

      clear: both;
    }

    #CalList_Search>div {
      float: left;
    }

    #CalList_Search>.calT1 {
      width: 33%;
    }

    #CalList_Search>.calT2 {
      width: 23%;
    }

    #CalList_Search>.calT3 {
      width: 44%;
    }

    #CalList_Search .cTitle {
      font-size: 20px;
      font-weight: 700;
      margin-bottom: 15px;
    }

    /* select box*/

    #theme {
      box-sizing: border-box;
      width: 170px;
    }

    #theme2 {
      box-sizing: border-box;
      width: 250px;

      display: inline-block;
    }

    .calselect {
      position: relative;
      border-radius: 5px;
      padding: 12px 10px  0 10px;
      height: 50px;
      cursor: pointer;
      border: 1px solid rgb(204, 204, 204);
      background: url("resources/images/reserve/selectarrow.png") calc(100% - 5px) center no-repeat;
      background-size: 20px;
      box-sizing: border-box;
    }
    .stext {
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
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
      max-height: 0;
      display: none;
    }

    .calselect.active .option-list {
      max-height: 250px;
      z-index:3;
    }

    .option {
      padding: 10px 10px;
      font-size: 13px;
     font-weight: 500;
    }

    .option:hover {
      background-color: #f2f2f2;
    }

    /* -------------*/
	#hostCaltb th,
	#hostCaltb td {
		text-align: center;
	}
	#hostCaltb tr {
		cursor: pointer;
	}
    #CalList_Host button {
      float: right;
      width: 150px;
      height: 50px;
      background-color: rgb(39, 123, 192);
      color: white;
      border-radius: 5px;
      border: none;
      font-size: 18px;
    }

    /* input date */
    .input_date_box>* {
      float: left;
    }

    .caldate1,
    .caldate2 {
      height: 50px;
      width: 120px;
      position: relative;
    }

    .input_date_box input {
      height: 50px;
      width: 100%;
      text-align: center;
      border: 1px solid rgb(204, 204, 204);
      outline: none;
      cursor: pointer;
    }

    .input_date_box>div:nth-child(2) {
      width: 50px;
      height: 50px;
      line-height: 45px;
      text-align: center;
    }

    .input_date_box i {
      position: absolute;
      top: 50%;
      right: 10px;
      transform: translate(0, -50%);
      color: rgb(204, 204, 204);
    }

    .ui-widget-header {
      border: none !important;
      background-color: rgb(253, 193, 55) !important;
    }

    .ui-state-default,
    .ui-widget-content .ui-state-default,
    .ui-widget-header .ui-state-default,
    .ui-button,
    html .ui-button.ui-state-disabled:hover,
    html .ui-button.ui-state-disabled:active {
      border: 1px solid #fff !important;
      font-weight: normal !important;
      color: #454545 !important;
      text-align: center !important;
      font-size: 17px;
    }

    .ui-state-default {
      background: #fff !important;
    }

    .ui-state-active,
    .ui-widget-content .ui-state-active,
    .ui-widget-header .ui-state-active,
    a.ui-button:active,
    .ui-button:active,
    .ui-button.ui-state-active:hover {
      background: #007fff !important;
      color: #ffffff !important;
    }

    .ui-state-highlight,
    .ui-widget-content .ui-state-highlight,
    .ui-widget-header .ui-state-highlight {
      background: rgb(253, 193, 55) !important;
      color: #ffffff !important;
    }

    .ui-widget.ui-widget-content {
      width: 300px;
    }

    .ui-datepicker .ui-datepicker-title {
      font-size: 15px;
    }

    .ui-datepicker .ui-datepicker-header {
      width: 100%;
    }

    .ui-datepicker th {
      font-size: 15px;
      padding: 0.7em !important;
    }

    .ui-datepicker-calendar th:first-child {

      color: #ff0000 !important;
    }

    .ui-datepicker-calendar th:nth-last-child(1) {
      color: #0d47a1 !important;
    }


    .ui-datepicker-calendar tr td:first-child a {
      color: #ff0000 !important;
    }

    .ui-datepicker-calendar tr td:nth-last-child(1) a {
      color: #0d47a1 !important;
    }
    
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
    
     /* 예약 정보 모달 */
      #reserveInfoModal .modal-content {
        width: 650px;
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
        padding: 15px 65px 25px;
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


      /* -------------------------------------- */
    
  </style>
</head>
<body>
<div class="wrap">		
	<jsp:include page="../common/hostHeader.jsp" />
<div class="main">
   <div id="CalList_Host">
    <div>정산 내역 리스트</div>

    <form action="schhostCalList.re" method="get" id="CalList_Search">
      <div class="calT1">
        <div class="cTitle">이용 기간</div>
        <div class="input_date_box">
          <div class="caldate1">
            <input type="text" name="sdate" id="datepicker">
          </div>
          <div>-</div>
          <div class="caldate2">
            <input type="text" name="edate" id="datepicker2">
          </div>
        </div>
      </div>
      <div class="calT2">
        <div class="cTitle">정산 상태</div>
        <section id="theme">
          <div class="calselect">
            <div class="text ctext">상태</div>
            <ul class="option-list">
              <li class="option">전체</li>
              <li class="option">예정</li>
              <li class="option">완료</li>
            </ul>
            <input type="hidden" name="cstatus" value="전체">
          </div>
        </section>
      </div>
      <div class="calT3">
        <div class="cTitle">공간</div>
        <section id="theme2">
          <div class="calselect">
            <div class="text stext">전체</div>
            <ul class="option-list">
              <li class="option">전체</li>
	           	<c:forEach var="s" items="${sList }">
	           	<li class="option">${s.spaceTitle }</li>
	           	</c:forEach>
            </ul>
            <input type="hidden" name="stitle" value="전체">
          </div>
        </section>
        <button type="submit" >검색</button>
      </div>
    </form>
    <table id="hostCaltb" class="table">
      <thead>
        <tr>
          <th>예약번호</th>
          <th>공간명</th>
          <th>예약자명</th>
          <th>이용일자</th>
          <th>결제방법</th>
          <th>정산금액</th>
          <th>정산일자</th>
          <th>상태</th>
        </tr>
      </thead>
      <tbody>
      <c:choose>
      <c:when test="${pList.size() eq 0}">
      	<tr>
      	<td colspan="8">정산내역이 없습니다.</td>
      	</tr>
      </c:when>
      <c:otherwise>
      <c:forEach var="p" items="${pList }" >
      	<tr onclick="revInfoModalOpen(this)">
      	  <td>${p.reserveNo}</td>
      	  <td>${p.reserve.spaceTitle }</td>
      	  <td>${p.reserve.memNo }</td>
          <td>${p.reserve.useDate }</td>
          <td>${p.payMethod}</td>
          <td><fmt:formatNumber  value="${p.reserve.price*0.9 }" />원</td>
          <c:choose>
 	      <c:when test="${p.payStatus eq '완료'}">
 	      <td>${p.reserve.reserveDate}</td>
 	      </c:when>
 	      <c:otherwise>
 	      <td>-</td>
 	      </c:otherwise>
 	      </c:choose>
          <td>${p.payStatus}</td>
          <fmt:formatNumber var="oprice" value="${p.reserve.price}" />
          <input type="hidden"  value="${p.reserve.reserveCount }">
          <input type="hidden"  value="${p.reserve.startTime }">
          <input type="hidden"  value="${p.reserve.endTime }">
          <input type="hidden"  value="${p.reserve.denyMessage }"> 
          <input type="hidden"  value="${oprice }"> 
        </tr>
      </c:forEach>
      </c:otherwise>
      </c:choose>
      </tbody>
    </table>
    <c:if test="${pList.size() ne 0}">
    <ul class="pagination">
 		   <c:choose>
	   		<c:when test="${ pi.currentPage eq 1 }">
	   			<li class="page-item no-page-prev disabled"><a class="page-link">&lt;</a></li>
	   		</c:when>
	   		<c:otherwise>
	   			<li class="page-item no-page-prev"><a class="page-link" >&lt;</a></li>
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
                  <td style="width: 23%">예약번호</td>
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
                  <td>결제금액</td>
                  <td id="revPrice"></td>
                </tr>
                <tr>
                  <td>정산금액</td>
                  <td id="calPrice"></td>
                </tr>
                <tr>
                  <td>결제수단</td>
                  <td id="payMethod"></td>
                </tr>
                <tr>
                  <td>정산상태</td>
                  <td id="calStatus"></td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
    
    
</div>	
	<jsp:include page="../common/footer.jsp" />
</div>
	<script>
	
	//페이징
	$(function () {
    	$(".page-link").each(function() {
      		if ($(this).text() == "${pi.currentPage}") {
      			$(this).attr("id", "active-page");
      			$(this).parent().addClass("disabled");
      		} else {
      			$(this).removeAttr("id", "active-page");
      		}
      	});
    	
    	var cstatus= "${cstatus}";
    	var stitle = "${stitle}";
    	var sdate = "${sdate}";
    	var edate = "${edate}";
    	var prevNo = "${pi.currentPage-1}";
		var nextNo = "${pi.currentPage+1}";
		
		if(cstatus == "" && stitle == "" &&  sdate == "" &&  edate == "") {
			$(".no-page-prev>a").click(function() {
				location.href ="hostCalList.re?rpage="+prevNo;
			});
			$(".page-btn>a").click(function() {
				location.href ="hostCalList.re?rpage="+$(this).text();
			});
			$(".no-page-next>a").click(function() {
				location.href ="hostCalList.re?rpage="+nextNo;
			});
     	}else {
     		$(".stext").text(stitle);
     		$(".ctext").text(cstatus);
     		$("input[name=stitle]").val(stitle);     		
     		$("input[name=cstatus]").val(cstatus);
     		$("input[name=sdate]").val(sdate);
     		$("input[name=edate]").val(edate);
     		
     		$(".stext").text(stitle);
     		$(".ctext").text(cstatus);

     		$(".no-page-prev>a").click(function() {
				location.href ="schhostCalList.re?rpage="+prevNo+"&stitle="+stitle+"&cstatus="+cstatus+"&sdate="+sdate+"&edate="+edate;
			});
			$(".page-btn>a").click(function() {
				location.href ="schhostCalList.re?rpage="+$(this).text()+"&stitle="+stitle+"&cstatus="+cstatus+"&sdate="+sdate+"&edate="+edate;
			});
			$(".no-page-next>a").click(function() {
				location.href ="schhostCalList.re?rpage="+nextNo+"&stitle="+stitle+"&cstatus="+cstatus+"&sdate="+sdate+"&edate="+edate;
			});
		}
	});
	
      $(function () {
        $.datepicker.setDefaults({
          dateFormat: 'yy-mm-dd'
          , changeYear: true //콤보박스에서 년 선택 가능
          , changeMonth: true //콤보박스에서 월 선택 가능   
          , prevText: '이전 달',
          nextText: '다음 달',
          monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
          monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
          dayNames: ['일', '월', '화', '수', '목', '금', '토'],
          dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
          dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
          showMonthAfterYear: true,
          yearSuffix: '년'
        });
        $("#datepicker").datepicker();
        $("#datepicker2").datepicker();
       
        var sdate = "${sdate}";
    	var edate = "${edate}";
        if(sdate == "" &&  edate == "") {
        	 //From의 초기값을 오늘 날짜로 설정
            $('#datepicker').datepicker('setDate', '-7D');
            //To의 초기값을 내일로 설정
            $('#datepicker2').datepicker('setDate', 'today');
        }
      });

      $(function () {
        $(".calselect").click(function () {
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
      });

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
      	$("#revPhone").text($(tr).children("input").eq(3).val());
      	var price = $(tr).children("input").eq(4).val()
      	$("#revPrice").text(price+"원");
      	$("#calPrice").text($(tr).children().eq(5).text());
      	$("#payMethod").text($(tr).children().eq(4).text());
      	$("#calStatus").text($(tr).children().eq(7).text());

        $("#reserveInfoModal").modal("show");
    	  
      }
    </script>
</body>
</html>