<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<script src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=mn7cwsrvym"></script> <!-- 지도 api -->
<head>
<meta charset="UTF-8">
<title>예약 내역 리스트</title>
<style>

    #header_area { height: 80px; }

    #content {
        line-height: 18px;
        margin: 0;
        border: 0;
        font-size: 100%;
        vertical-align: middle;
        min-height: 648px;
        padding: 70px 0 100px;
        width: 100%;
		height: auto;
        /*height: 1050px; */
    }

    .inner_width {
        width: 50%;
        margin: 0 auto;
    }

    .inner_width .box_form:first-child {
        margin-top: 0;
    }

    .box_form {
        position: relative;
        margin-top: 50px;
    }

    .box_notice {
        border-top: 1px solid #FFF9B0;
        border-bottom: 1px solid #FFF9B0;
        background-color: #fff;
    }

    .box_notice .heading {
        padding: 20px 30px;
        font-size: 18px;
        display: table;
        position: relative;
        width: 100%;
        background-color: #fcd16f;
        border-bottom: 0;
    }

    .heading h3 {
        display: table-cell;
        font-size: 25px;
        line-height: 18px;
    }

    .box_notice .heading .text_rounded {
        top: 14px;
        right: 30px;
        height: 30px;
        padding: 0 16px;
        font-size: 14px;
        line-height: 26px;
        position: absolute;
    }

    .text_rounded {
        display: inline-block;
        background-color: #fff;
        border-radius: 24px;
        border: 1px solid #ccc;
        font-weight: 400;
    }

    p {
        margin-bottom: 0px !important;
    }

    .text_rounded strong {
        font-weight: 800;
        color: #FFB200;
    }

    .box_notice .list_wrap {
        border-left: 1px solid #FFF9B0;
        border-right: 1px solid #FFF9B0;
        padding: 16px 30px;
    }

    .box_notice .refund {
        padding: 12px 0 9px;
        border-top: 1px solid #ebebeb;
        line-height: 18px;
    }

    .box_notice .notice_list.info_host:first-child, .box_notice .refund:first-child {
        border-top: 0;
    }

    .flex_box {
        position: relative;
        display: table;
        width: 100%;
        padding: 5px 0;
    }

    dl {
        margin:0 !important;
    }

    .refund .flex.tit {
        width: 125px;
        padding-top: 0;
        color: #656565;
        font-weight: 400;
        font-size: 16px;
        display: table-cell;
    }

    .box_notice .refund dd {
        font-size: 16px;
        color: #000;
        display: table-cell;
    }

    em {
        vertical-align: top;
        font-style: normal;
    }

    .box_notice .refund.txt_notice {
        color: #656565;
        line-height: 25px;
    }

    .ly_right_wrap {
        position: relative;
    }

    .box_form.reserve_price .heading {
        background-color: transparent;
        border-bottom: 3px solid rgb(96, 155, 204);
        padding: 2px 0 15px;
    }

    .reserve_price_btns {
        position: absolute;
        top: -5px;
        right: 0;
    }

    .btn_cash_receipt, .btn_print {
        display: block;
        float: right;
        margin-left: 5px;
        height: 30px;
        line-height: 28px;
        padding: 0 7px;
        border-radius: 6px;
        border: 1px solid;
        background-color: #fff;
        font-size: 14px;
        color: rgb(39, 123, 192);
    }

    .reserve_price_btns:after {
        display: table;
        clear: both;
        content: "";
    }

    .scroll_box {
        background-color: #fff;
        position: relative;
        overflow-y: auto;
    }

    .reserve_price_wrap {
        padding: 0 20px;
    }

    .basic_box {
        padding-right: 104px;
        position: relative;
    }

    .basic_box dl:first-child, .basic_box dl:last-child {
        border-top: 0;
    }

    .basic_box dl {
        border-top: 1px solid #ebebeb;
    }

    .reserve_price_wrap dl {
        padding: 17px 0 15px 75px;
    }

    .reserve_price_wrap dl dt {
        position: absolute;
        left: 0;
        width: 75px;
        float: left;
        color: #656565;
        font-weight: 400;
    }

    .reserve_price_wrap dl dt, .reserve_price_wrap dl dd {
        font-size: 16px;
        min-height: 24px;
    }

    .line {
        display: block;
    }

    .reserve_price_wrap dl:after, .btn_order_area:after {
        content: "";
        display: table;
        clear: both;
    }

    .reserve_price_wrap .basic_box dl:last-child {
        padding-left: 0;
    }

    .info_price {
        position: absolute;
        top: 0;
        right: 0;
        width: 30%;
        height: 100%;
        padding-bottom: 9px;
    }

    .reserve_price_wrap .info_price dd {
        width: 100%;
        height: 100%;
        display: table;
        text-align: right;
    }

    .txt_price {
        display: table-cell;
        vertical-align: middle;
        color: rgb(39, 123, 192);
    }

    .total_box {
        border-color: rgb(96, 155, 204);
        border-top: 3px solid rgb(96, 155, 204);
    }

    .pull_box {
        padding: 19px 0 23px;
    }

    .btn_responsive {
        display: table;
        width: 100%;
        table-layout: fixed;
    }

    .btn_order_area .btn {
        height: 60px;
        line-height: 60px;
        float: none;
        display: table-cell;
        color: whitesmoke;
        font-size: 18px;
    }

    .btn_responsive .btn.btn_option1 {
        background-color: #656565;
    }

    .btn_responsive .btn.btn_option2 {
        background-color: rgb(39, 123, 192);
    }

    .map_box {
        margin-top: 40px;
        position: relative;
    }

    .host_profile {
        display: table;
        position: relative;
        width: 100%;
        border-bottom: 1px solid #FFF9B0;
        border-top: 1px solid #FFF9B0;
        background-color: #fff;
    }

    .host_profile .inner {
        padding: 30px 30px 40px;
    }

    .sp_name {
        padding-bottom: 20px;
        margin-bottom: 22px;
        border-bottom: 1px solid #e0e0e0;
        font-size: 24px;
        line-height: 26px;
        color: #000;
    }

    .sp_address {
        margin-top: 13px;
    }

    .sp_location, .sp_location a {
        color: #656565;
    }

    .sp_call {
        margin-top: 11px;
    }

    .map {
        position: relative;
        width: 100%;
        height: 640px;
        border: 1px solid #e0e0e0;
        border-top: 0;
    }

</style>
</head>
<body>

	 <!--  jstl 형변환 -->
	<c:set var="now" value="<%=new java.util.Date()%>" />
	<fmt:formatDate var="now" value="${now}" pattern="yyyyMMdd" />
	<fmt:parseDate var="useDate" value="${r.useDate}" pattern="yyyy-MM-dd HH:mm:ss.S"/> <!-- String 을 Date 로 바꿈 -->
	<fmt:formatDate var="useDate1" value="${useDate}" pattern="yyyyMMdd"/> <!-- Date 를 뒤에 시분초 뺀 포맷으로 바꿈 -->
	<fmt:formatDate var="useDate2" value="${useDate}" pattern="yyyy-MM-dd"/> <!-- Date 를 뒤에 시분초 뺀 포맷으로 바꿈 -->
                    
    <div id="spaceList_Host" class="wrap">

        <div id="header_area"><jsp:include page="../common/header.jsp" /></div>

        <div id="content">
            <div class="inner_width">
                <article class="box_form box_notice">
                    <div class="heading">
                        <h3>예약 내용</h3> 
                        <p class="text_rounded">
                            예약번호 : <strong>${r.reserveNo }</strong>
                        </p>
                    </div> 
                    <div class="list_wrap"> 
                        <dl class="flex_box refund">
                            <dt class="flex tit">신청일</dt> 
                            <dd class="flex"> ${ r.reserveDate } </dd>
                        </dl> 
                        <dl class="flex_box refund">
                            <dt class="flex tit">예약공간</dt> 
                            <dd class="flex"> ${ r. spaceTitle}</dd>
                        </dl> 
                        <dl class="flex_box refund">
                            <dt class="flex tit">예약내용</dt> 
                            <dd class="flex">
                                ${ useDate2 } ${ r.startTime }시 - ${ r.endTime}시
                            </dd>
                        </dl> 
                        <dl class="flex_box refund">
                            <dt class="flex tit">예약인원</dt> 
                            <dd class="flex"> ${ r.reserveCount }명 </dd>
                        </dl> 
                    </div>
                </article> 
                <article class="box_form box_notice">
                    <div class="heading">
                        <h3>예약자 정보</h3>
                    </div> 
                    <div class="list_wrap">
                        <dl class="flex_box refund">
                            <dt class="flex tit">예약자명</dt> 
                            <dd class="flex"> ${ r.memName } </dd>
                        </dl> 
                        <dl class="flex_box refund">
                            <dt class="flex tit">연락처</dt> 
                            <dd class="flex"> ${ r.denyMessage } </dd>
                        </dl> 
                        <dl class="flex_box refund">
                            <dt class="flex tit">이메일</dt> 
                            <dd class="flex"> ${ r.email } </dd>
                        </dl>
                    </div>
                </article> 
                <article class="box_form box_notice">
                    <div class="heading">
                        <h3>환불규정 안내</h3>
                    </div> 
                    <div class="list_wrap refund_rule">
                        <p class="txt_notice refund">
                            <em class="warn" style="color: rgb(255, 58, 72);">
                                이용당일(첫 날) 이후에 환불 관련 사항은 호스트에게 직접 문의하셔야 합니다.
                            </em> <br>
                                결제 후 이용시간 8일 전까지는 100% 환불이 가능합니다.
                        </p> 
                        <dl class="flex_box refund">
                            <dt class="flex tit"> 이용 8일 전</dt> 
                            <dd class="flex"> 총 금액의 100% 환불</dd>
                        </dl>
                        <dl class="flex_box refund">
                            <dt class="flex tit">7일 전 ~ 당일</dt>
                            <dd class="flex">환불 불가</dd>
                        </dl>
                    </div>
                </article>
                <article class="box_form right_fixed reserve_price" style="transition: transform 0.5s cubic-bezier(0.39, 0.575, 0.565, 1) 0s; border-bottom: 0px; transform: translateY(0px);">
                    <div class="ly_right_wrap">
                        <div class="ly_right_fixed">
                            <div class="heading">
                                <h3>결제금액</h3>
                                <div class="reserve_price_btns">
                                	<button onclick="window.open('${ r.month }')" class="btn_print">거래명세서 인쇄</button>
                                  		<script>

	           	                         		/* // 거래명세서 새창으로 열기 
	                                           function openReceipt(){
	                                   			concole.log("${ r.month }");
	                                             window.open(${ r.month }, "_blank");
	                                           } */
                                  		</script>
                                    <!-- <a  href=“${ r.month }" class="btn_print">거래명세서 인쇄</a> -->
                                    <!-- href 로 payment의 결제영수증 주소 연결-->
                                                   
                                </div>
                            </div> 
                            <div class="scroll_box">
                                <div class="reserve_price_wrap">
                                    <div class="basic_box">
                                        <dl class="info_date">
                                            <dt>예약날짜</dt>
                                            <dd>
                                                <span class="line"> ${ useDate2 } </span>
                                            </dd>
                                        </dl> 
                                        <dl class="info_date">
                                            <dt>예약시간</dt> 
                                            <dd>
                                            <c:choose>
		                                    	<c:when  test="${r.endTime eq -1}">
		                                    		<span class="line">${ r.startTime }시 - ${ r.startTime + 1 }시 (1시간)</span>
		                                    	</c:when>
		                                    	<c:otherwise>
		                                    		<span class="line">${ r.startTime }시 - ${ r.endTime }시 (${r.endTime - r.startTime }시간)</span>
		                                    	</c:otherwise>
		                                    </c:choose>
                                            
                                            
                                                
                                            </dd>
                                        </dl>
                                        <dl class="info_person">
                                            <dt>예약인원</dt> 
                                            <dd> ${ r.reserveCount }명</dd>
                                        </dl>
                                        <dl>
                                            <dt>결제정보</dt>
                                            <dd>${ r.payMethod }</dd>
                                        </dl> 
                                        <dl class="info_price">
                                            <dt class="blind"></dt> 
                                            <dd><strong class="txt_price">&#8361;&nbsp;${ r.price }</strong></dd>
                                        </dl>
                                    </div>
                                    <div class="total_box">
                                        <dl class="pull_box">
                                            <dt class="pull_left"><strong class="txt_price"></strong></dt> 
                                            <dd class="pull_right align_right" style="float: right;"><strong class="txt_price" style="font-size: 28px;">&#8361;&nbsp;&nbsp;${ r.price }</strong></dd>
                                        </dl>
                                    </div>
                                </div>
                            </div> 
                            <div class="btn_order_area">
                                <div class="btn_responsive">
                                    <a class="btn btn_option1 btn-primary" data-toggle="modal" data-target="#cancle-modal" style="border-color:#656565;">예약취소</a>
                                    <a class="btn btn_option2 btn-primary" onclick="history.back()" style="background-color: #FFB200; border-color: #FFB200;">
                                        <span class="txt_call">확인</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </article> 
                <div class="detail_box map_box type_simple">

                    <div class="host_profile">
                        <div class="inner">
                            <div class="sp_location">
                                <p class="sp_name">${ r. spaceTitle}</p> 
                                <p class="sp_address">${ r.memId } ${ r.gender }</p> 
                                <p class="sp_call">${ r.salesStatus }</p>
                            </div> 
                        </div>
                    </div> 
                    
                   <div id="map" style="width:100%;height:400px;"></div>
					<script>
					  /* var mapOptions = {
					    center: new naver.maps.LatLng(${r.latitude}, ${r.longitude}),
					    zoom: 20
					  };
					
					  var map = new naver.maps.Map('map', mapOptions); */
					  
					  var map = new naver.maps.Map('map', {
						    center: new naver.maps.LatLng(${r.latitude}, ${r.longitude}),
						    zoom: 20
						  });

						  var marker = new naver.maps.Marker({
						    position: new naver.maps.LatLng(${r.latitude}, ${r.longitude}),
						    map: map
						  });
					  
					</script> 
                   <!--  <div class="map">
                    
                    </div>
                    
					<script>
							var mapDiv = document.getElementById('map');
						    var map = new naver.maps.Map(mapDiv);
					</script> -->
					                    
                </div>
            </div>
        </div>
        
       
        <jsp:include page="../common/footer.jsp" />
        
<%--         <!--  jstl 형변환 -->
		<c:set var="now" value="<%=new java.util.Date()%>" />
		<fmt:formatDate var="now" value="${now}" pattern="yyyyMMdd" />
		<fmt:parseDate var="useDate" value="${r.useDate}" pattern="yyyy-MM-dd HH:mm:ss.S"/> <!-- String 을 Date 로 바꿈 -->
		<fmt:formatDate var="useDate1" value="${useDate}" pattern="yyyyMMdd"/> <!-- Date 를 뒤에 시분초 뺀 포맷으로 바꿈 --> --%>

        <!-- 하연아 여기 주석처리 안하면 뜨길래 주석 처리 해놨음!-->
		<!--
                                    <c:out value="${useDate1}" />
                                    <c:out value="${now}" />
                                    <c:out value="${useDate1 - now}" />-->
                                    
        <!-- 취소 Modal -->
        <div class="modal" id="cancle-modal">
            <div class="modal-dialog">
                <div class="modal-content">
                
                <c:choose>
                 	<c:when  test="${ r.reserveStatus eq 'C' }">
                 	
                 	
                 	
                 	
                 	<div class="modal-header" style="font-size: 20px; text-align: center;">알림</div>
                 	
                 		
                 		<div style="font-size: 15px; text-align: center; padding: 20px;">이미 취소된 예약입니다.</div>
                 		
                 		
                 		
                 		
                 		 <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-back" style="background-color: #007bff; color:white;" onclick="$('#cancle-modal').modal('hide');">확인</button>
                            
                        </div>
                 		
                 	</c:when>
                 	<c:otherwise>
                 		
                 		
                 		
                 		
                 		
                 		
                 	
                
                
                    <!-- Modal Header -->
                    <div class="modal-header" style="font-size: 30px; font-weight:600;">예약 취소</div>
                        <!-- Modal body -->
                        <div class="modal-body">
                        <div style="padding:30px;">
                            <b>정말로 예약을 취소하시겠습니까?</b>
                            <br><br>
                            <table style="line-height: 2; padding: 5px;">
                                <tr>
                                    <td>결제금액</td>
                                    <td>${ r.price }원</td>
                                </tr>
                                <tr>
                                    <td>차감금액</td>
                                    <td>
                                    <c:choose>
                                    	<c:when  test="${(useDate1 - now) >= 8 }">
                                    		0 원 
                                    	</c:when>
                                    	<c:otherwise>
                                    		${ r.price } 원
                                    	</c:otherwise>
                                    </c:choose>
                                    </td>
                                </tr>
                                <tr>
                                    <td>환불금액</td>
                                    <td>
                                    <c:choose>
                                    	<c:when  test="${(useDate1 - now) >= 8 }">
                                    		${ r.price } 원
                                    	</c:when>
                                    	<c:otherwise>
                                    		0 원
                                    	</c:otherwise>
                                    </c:choose>
                                    </td>
                                </tr>
                            </table>
                            <br>
                        </div>
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-back" style="background-color: #007bff; color:white;" onclick="$('#cancle-modal').modal('hide');">뒤로가기</button>
                            <button type="button" class="btn btn-primary btn-cancle" style="background-color: lightgray; border-color: lightgray; color:black;" onclick="reserveNoSubmit();">예약취소</button>
                            
                            <form id="rnoSubmit" action="" method="post">
				            	<input type="hidden" name="rno" value="${ r.reserveNo }">
				            </form>
                            
                            <script>
	                            function reserveNoSubmit() {
	    		            		$("#rnoSubmit").attr("action", "cancleMyReserve.re").submit();
	    		            	}
		                	</script>
                        </div>
                        
                        
                        
                        	
                 	</c:otherwise>
                 </c:choose>
                
                        
                        
                    </div>
                </div>
            </div>
        </div>
    
    </div>
	
</body>
</html>