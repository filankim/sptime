 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공간 상세 페이지</title>
<!-- 부트페이 -->
<script src="https://js.bootpay.co.kr/bootpay-4.2.6.min.js" type="application/javascript"></script>
<!-- W3.CSS(슬라이드) -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--  fullCalendar -->
  <!-- fullcalendar CDN -->
  <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
  <!-- fullcalendar 언어 CDN -->
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>

  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.0.0/index.global.min.js'></script>
<style>

	.disabled{
		pointer-events: none; 
		cursor: default; 
	}

    #content {
        width: 1200px;
        margin: 0 auto;
        margin-top: 50px;
        margin-bottom: 50px;
    }
      
    .sheader {
        overflow: hidden;
        font-size: 45px;
        font-weight: 800;
        margin-bottom: 20px;
      }

    .sub_title {
        overflow: hidden;
        font-size: 25px;
        font-weight: 300;
        margin-bottom: 40px;
        color: grey;
    }

		/* 후기 css */
		.nodata {
		  	text-align: center;
		  	 font-size: 25px;
	        font-weight: 600;
		  
		  }

		#reviewDiv {
		 width: 800px;
		 margin: 0 auto;
		}
		.review-row {
		   border-bottom: 1px solid lightgray;
		}

      .review-area, .host-area {

        overflow:hidden;
      }
      .host-area {
              margin-bottom: 20px;
      }
       .review-area>div, .host-area>div {
       		float:left;
       }
       .rleft {
       	width : 150px;
       	text-align: center;
       	font-size: 17px;
        font-weight: 700;
        padding-bottom: 20px;
       }
       .rright {
      	 width: calc(100% - 150px);
       }
       .rleft img {
       	  display: block;
		  margin: 20px auto 10px;
	 	  width: 60px;
		  height:60px;     	
	 	  background-color: white;
      }  

      .rtitle {
      margin-top: 10px;
        margin-bottom: 10px;
        overflow: hidden;
      }
      .rtitle > span:nth-child(1) {
        float: left;
        font-size: 15px;
        font-weight: 500;
        color: rgb(253, 193, 55);
      }
       .rtitle > span:nth-child(2) {
        float: right;
        font-size: 16px;
        font-weight: 500;
        cursor: pointer;
        margin-left: 13px;
      }
       .rtitle > span:nth-child(3) {
        float: right;
        font-size: 16px;
        font-weight: 500;

      }
      .rtitle .fa-thumbs-o-up, .rtitle .fa-thumbs-up {
      	cursor: pointer;
        color: #4B56D2;
      }
      
      .rtitle .fa-triangle-exclamation {
        color: #DD5353;
      }

      .rcontent-area {
        overflow: hidden;
        margin-bottom: 15px;
      }
      .rcontent {
        font-size: 15px;
        font-weight: 600;
        color: rgb(54, 54, 54);
        margin-bottom: 15px;
      }
      .rcontent-img-area > div {
        overflow: hidden;
        float: left;
        height: 117px;
        margin-right: 10px;
      }
      .rcontent-img-area img {
        cursor: pointer;
        height: 100%;
      }

      .rdate {
        font-size: 12px;
        font-weight: 500;
        color: rgb(127, 127, 127);
        margin-bottom: 15px;
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
	  
      /* -------------*/
      
      #imgOverlay {
	        background: #495579;
	        bottom: 0;
	        height: 100%;
	        left: 0;
	        opacity: 0;
	        overflow: hidden;
	        position: fixed;
	        right: 0;
	        top: 0;
	        visibility: hidden;
	        width: 100%;
	        z-index: 9;
	        -webkit-transition: all 0.2s ease-in-out;
	        -moz-transition: all 0.2s ease-in-out;
	        transition: all 0.2s ease-in-out;
      	}
	    #imgOverlay.slideon {
	        opacity: 1;
	        visibility: visible;
	        -webkit-transition: all 0.2s ease-in-out;
	        -moz-transition: all 0.2s ease-in-out;
	        transition: all 0.2s ease-in-out;
	    }
      

      #imgOverlay .overlay-area {
        position: relative;
        height: 100%;
        overflow: hidden;
      }
      .overlay-area>div {
      	float: left;
      	position: relative;
      	height: 100%;
      	overflow: hidden;
      }
       .overlay-area>div:nth-child(1) {
       	width: 10%;
       }
       .overlay-area>div:nth-child(2) {
       	width: 80%;
       }
       .overlay-area>div:nth-child(3) {
       	width: 10%;
       }
      #imgOverlay img {
   	   position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
      	max-width: 800px;
      	max-height: 600px;
      	
      }
      #imgOverlay i {
      	position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
        font-size: 60px;
        color: white;
        cursor: pointer;
      }
      #imgOverlay .fa-times {
      	position: absolute;
		top: 50px;
		right: 50px;
        font-size: 50px;
        color: lightgray;
        cursor: pointer;
      }
      
    

      /* -------------------------------------- */

       /* 페이지네이션 */
      .pagination {
        justify-content: center;
        margin-top: 15px;
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


    /* 이미지 */
    #space_area {
        overflow: hidden;
        margin-bottom: 40px;
      }

      #space_area > div {
        width: 31%;
      }

      #space_area > div:nth-child(1) {
        float: left;
      }

      #space_area > div:nth-child(2) {
        float: left;
        margin-left: 3.5%;
      }

      #space_area > div:nth-child(3) {
        float: right;
      }

      .space > div:nth-child(2) {
        padding: 15px 10px;
        font-size: 16px;
        font-weight: 600;
        color: rgb(68, 68, 68);
      }

      /* .space {
        width: 100%;
      }

      .reserve {
        width: 30%;
      } */

      .img_area .space_state {
        position: absolute;
        right: 0;
        top: 0;
        width: 70px;
        height: 30px;
        padding: 0;
        border: none;
        font-size: 15px;
        font-weight: 600;
      }

      .img_area .conok {
        background-color: rgb(253, 193, 55);
      }

      .img_area .conwait {
        background-color: rgb(224, 224, 224);
      }

      .img_area .conrefuse {
        background-color: rgb(231, 76, 60);
        color: white;
      }

      .img_area > img {
        width: 100%;
        height: 200px;
        background-size: cover;
        transition: transform 0.3s ease-in-out;
      }

      .img_btn_area {
        display: none;
        position: absolute;
        top: 0;
        left: 0;
        height: 100%;
        width: 100%;
      }

      .button_img_prev,
      .button_img_next {
        width: 40px;
        height: 100%;
        border: none;
        background-color: rgba(0, 0, 0, 0.2);
      }

      .button_img_next {
        float: right;
      }

      .img_btn_area i {
        font-size: 30px;
        color: white;
      }

      .space .stitle {
        font-size: 20px;
        font-weight: 600;
        color: rgb(51, 51, 51);
      }

      .space hr {
        border: 1px solid rgb(112, 112, 112);
      }

      .space .sprice {
        float: right;
      }

      .space_btn_area button {
        float: left;
        height: 50px;
        color: white;
        border: none;
        font-size: 18px;
        font-weight: 500;
      }

      .space_btn_area button:nth-child(1) {
        /* width: 0%; */
        background-color: rgb(39, 123, 192);
      }

      .space_btn_area button:nth-child(2) {
        /* width: 30%; */
        background-color: rgb(94, 94, 94);
      }

      #reserve_title {
        border-bottom: 1px solid gray;
      }
      
      .img_btn{
      	background: none;
        border: none;
      }

      .space_img {
        width: 700px; 
        height: 400px;
      }

      /* 가로스크롤  */
      .swiper-wrapper{
        line-height: 18px;
        -webkit-font-smoothing: antialiased;
        color: #000;
        font-weight: 400;
        font-family: NanumBarunGothic,"나눔바른고딕",NanumGothic,"돋움",Dotum,Helvetica,"Apple SD Gothic Neo",Sans-serif!important;
        border: 0;
        font-size: 100%;
        vertical-align: middle;
        -webkit-text-size-adjust: 100%;
        list-style: none;
        position: relative;
        width: 100%;
        height: 100%;
        z-index: 1;
        display: flex;
        transition-property: transform,-webkit-transform;
        box-sizing: content-box;
        transition-timing-function: ease-out;
        margin: 0 auto;
        padding: 10px 0;
        transition-duration: 0ms;
        transform: translate3d(0px, 0px, 0px);

      }

      .slide-wrapper {
        border: 1px solid black;
      }

       /* 슬라이드 */
      .mySlides {display:none;}
      
      /* 해쉬태그 */
	   .tag {
	    margin: 6px 6px 6px 0;
	    padding: 0 15px;
	    height: 29px;
	    font-size: 14px;
	    line-height: 29px;
	    border-radius: 29px;
	        background-color: #fff;
	    border: 1px solid #e0e0e0;
	}
	
	#chatBtn {
        background-color: rgb(39, 123, 192);
        color: white;
        border-radius: 5px;
        border: none;
        font-size: 15px;
        padding: 5px 10px;
	}
	/* 채팅방 모달 */
      #chattingModal .modal-content {
        width: 450px;
        margin: auto;
        border: none;
        border-radius: 10px;
        overflow: hidden;
      }

      #chattingModal .modal-header {
        background-color: rgb(39, 123, 192);
        text-align: center;
        color: white;
        font-size: 23px;
        border-bottom: none;
        display: block;
        padding: 10px;
      }

      #chattingModal .modal-body {
        height : 600px;
        padding: 15px 20px;
        background-color: #FBFACD;
        overflow: auto;
      }


	  #chatFooter {
	  	margin:0;
	  	padding:0;
	  	overflow: hidden;
	  }
	  #chatFooter>div {
	  margin:0;
	  padding:10px;
	  	overflow : hidden;
	  	width: 100%;
	  }
	  #chatFooter textarea {
	  width: 68%;
      height: 50px;
      border: 1px solid lightgray;
      outline: none;
      padding: 5px 10px;
      resize: none;
      color: rgb(54, 54, 54);
      margin-right: 2%;
      font-size: 12px;
      border-radius: 5px;
      
	  
	  }
	  #chatFooter button {
		  float:right;
		  margin:0;
		   width:30%;
		  height: 50px;
		  background-color:  rgb(253, 193, 55);
        font-size: 22px;
        font-weight: 600;
          color: white;
                 border-radius: 5px;
                 border:none;
	  }
	  #chatFooter button:hover {
          color: rgb(39, 123, 192);
	  }
	  

	  #chattingModal .sender {
	  	overflow: hidden;
	  	margin-bottom: 10px;
	  }
	   #chattingModal .sender>div {
	  	float:left;
	  }
	  
	  #chattingModal .sender>div:nth-child(1) {
	  	width: 10%;
	  }
	   #chattingModal .sender>div:nth-child(2) {
	  	width: 90%;
	  }
	  #chattingModal .sender img {
		  display: block;
		  margin: 20px auto 10px;
	 	  width: 30px;
		  height:30px;     	
	  }
	  #chattingModal .sender .sname {
	 	 font-size: 12px;
        font-weight: 500;
	  }
	  #chattingModal .sender .scontent-area {
	  	overflow: hidden;
	  
	  }
	  #chattingModal .sender .srealcontent {
		float:left;
	  	border-radius: 5px;
	  	padding:4px 5px;
	  	background-color: white;
	  	border:1px solid gray;
	  	max-width: 75%;
	  	position : relative;
	  	font-size: 15px;
        font-weight: 500;
        white-space:pre-wrap;
	  }
	  
	  #chattingModal .sender .sdate {
	 	position : absolute;
	 	bottom : 0;
	 	right : -58px;
	    font-size: 10px;
        font-weight: 500;
        color: rgb(107, 107, 107);
	  
	  }
	  #chattingModal .receiver {
	  	  margin-bottom: 10px;
	  }
	  #chattingModal .receiver .rcontent-area {
	  	overflow: hidden;
	  }
	  #chattingModal .receiver .rrealcontent {
		float:right;
	  	border-radius: 5px;
	  	padding:4px 5px;
	  	background-color: white;
	  	border:1px solid gray;
	  	max-width: 75%;
	  	position : relative;
	  	font-size: 15px;
        font-weight: 500;
        white-space:pre-wrap;
	  }
	  
	  #chattingModal .receiver .rdate {
	 	position : absolute;
	 	bottom : 0;
	 	left : -58px;
	    font-size: 10px;
        font-weight: 500;
        color: rgb(107, 107, 107);
	  }
	
	/* 달력 border 없애기   */
	.fc-theme-standard .fc-scrollgrid {
    border: none;
    }
    .forReserve {
	    background-color: rgb(253, 193, 55);
	    color: white;
	    border-radius: 5px;
	    border: none;
	    font-size: 15px;
	    padding: 5px 10px;
	}
}
	
      /* -------------------------------------- */
	
</style>
</head>
<body>
<div class="wrap">		
	<jsp:include page="../common/header.jsp" />
    <div id="spaceList_Host">
        <div id="content">
            <div class="sheader" style="padding-top: 100px;">
                ${ s.spaceTitle }                
            </div>
            
            <div class="sub_title">
                ${ s.spaceSubTitle }
            </div>
            
            <div class="tags">
                <c:forTokens var="hashtag" items="${ s.hashtag }" delims=",">
	               	 <span class="tag">
				       # ${ hashtag }
	             		</span>
			   </c:forTokens>
            </div>

            <table>
                <tr><!-- 왼쪽 화면 -->
                    <td  style="padding-right: 100px; width:1200px; heigt:600px;" align="center">
                        <!-- 공간이미지, 제목 등 -->
                        <div class="space" style="width: 700px;">
                            <div class="w3-content w3-section" style="max-width:500px">
                            <c:forEach var="sa" items="${ sa }">
                              <img src="${ sa.attachmentReName }" class="mySlides w3-animate-right" style="width:100%" alt="사진 없음" />
                            </c:forEach>
                            <br><br><br><br><br><br><br><br><br>
                          </div>
                        </div>
						  <!-- 슬라이드 -->
                          <script>
	                            var myIndex = 0;
	                            carousel();
	                            
	                            function carousel() {
	                              var i;
	                              var x = document.getElementsByClassName("mySlides");
	                              for (i = 0; i < x.length; i++) {
	                                x[i].style.display = "none";  
	                              }
	                              myIndex++;
	                              if (myIndex > x.length) {myIndex = 1}    
	                              x[myIndex-1].style.display = "block";  
	                              setTimeout(carousel, 2500);    
	                            }
	                            
                            </script>
                    </td>
                    <td> <!-- 오른쪽 화면 -->

                        <!-- 예약 -->
                        <div class="reserve">
                            <div id="reserve_title" style="font-size: 25px; font-weight: 800;">
                                예약하기
                                <!-- 신고버튼 -->
                                <c:choose>
                                <c:when test="${(!empty loginMember) and (loginMember.memNo ne s.hostNo) }">
                                <button type="button" class="img_btn" id="report_btn" data-toggle="modal" data-target="#report-Modal"><img src="resources/images/space/siren_icon.png" width="40px" height="30px"></button>
                                </c:when>
                                <c:when test="${empty loginMember}">
                                <button type="button" class="img_btn" id="report_btn" onclick="denyChat()"><img src="resources/images/space/siren_icon.png" width="40px" height="30px"></button>
                                </c:when>
                                </c:choose>
                                <!-- 북마크 버튼 -->
                                <span id="bookmark">
                                	<c:choose>
                                    <c:when test="${ count eq 0 }">
                                        <img src="resources/images/heart.png" width="35px" height="35px" class="likeControl" id="eventUnLike" style="cursor: pointer;">
                                        <img src="resources/images/heart2.png" width="35px" height="35px" class="likeControl" id="eventLike" style="display:none; cursor: pointer;">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="resources/images/heart2.png" width="35px" height="35px"  class="likeControl" id="eventLike" style="cursor: pointer;">
                                        <img src="resources/images/heart.png" width="35px" height="35px"  class="likeControl" id="eventUnLike" style="display:none; cursor: pointer;">
                                    </c:otherwise>
                                </c:choose>
                                </span>
                                
                                
                                <script>
                                $(function() {
                                	$("#bookmark").on("click", ".likeControl", function() {
                                        if(${ empty loginMember }) {
                                        	console.log("호출");
                                            alert("로그인 후 이용 가능한 서비스입니다.");
                                        } else {
                                            if($("#eventLike").css("display") == "none") {
                                                $.ajax({
                                                    url: "like.sp",
                                                    data: {
                                                        spaceNo: ${ s.spaceNo },
                                                        memNo: ${ loginMember.memNo }
                                                    },
                                                    success: function(result) {
                                                        $("#eventLike").show();
                                                        $("#eventUnLike").hide();
                                                    },
                                                    error: function() {
                                                        console.log("ajax failure");
                                                    }
                                                });
                                            } else {
                                                $.ajax({
                                                    url: "deletelike.sp",
                                                    data: {
                                                        spaceNo: ${ s.spaceNo },
                                                        memNo: ${ loginMember.memNo }
                                                    },
                                                    success: function(result) {
                                                        $("#eventLike").hide();
                                                        $("#eventUnLike").show();
                                                    },
                                                    error: function() {
                                                        console.log("ajax failure");
                                                    }
                                                });
                                            }
                                        }
                                	});
                                });
                                </script>
                                
                            </div>
                            
                            <!-- 달력/시간 -->
                            <table id="tbl-reserve2" class="table table-borderless">
                                <tr>
                                    <th>
                                        <script>
                                        		
                                        		var startTime = -1;
                                        		var endTime = -1;
                                        		 
                                        		var timeCount = 0;
                                        		
		                                        // 시간 선택하는 함수 - onclick
		                                   		function selectTime(k) {
		                                        	
		                                        	
		                                        	if(startTime == -1) {
		                                        		
		                                        		$("#time" + k + "").css("background-color","rgb(253, 193, 55)");
			                                   			startTime = $("#time" + k + "").find(".time").text();
		                                        		
		                                        	} else if((startTime != -1) && (endTime == -1)) {
		                                        		
		                                        		$("#time" + k + "").css("background-color","rgb(253, 193, 55)");
			                                   			endTime = $("#time" + k + "").find(".time").text();
			                                   			
			                                   			if(startTime > endTime) {
			                                   				$(".swiper-slide").css("background-color","white");
				                                   			
			                                        		$("#time" + k + "").css("background-color","rgb(253, 193, 55)");
				                                   			startTime = $("#time" + k + "").find(".time").text();
				                                   			endTime = -1
			                                   			}
			                                   			
			                                   			
		                                        		
		                                        	} else {
			                                   			// 색 초기화 
			                                   			$(".swiper-slide").css("background-color","white");
			                                   			
		                                        		$("#time" + k + "").css("background-color","rgb(253, 193, 55)");
			                                   			startTime = $("#time" + k + "").find(".time").text();
			                                   			endTime = -1
			                                   			
			                                   			
		                                        	}
		                                        	
		                                        	// 시작시간 끝시간 사이 자동색칠 
		                                        	if((endTime != -1) && (startTime < endTime)) {
		                                        		for(var i=startTime; i<= endTime; i++){
		                                        			$("#time" + i + "").css("background-color","rgb(253, 193, 55)");
		                                        			
		                                        			
		                                        			//console.log(i);
		                                        			
		                                        			//console.log($("#time"+ i + "").css("text-decoration") == "line-through solid rgb(211, 211, 211)");
		                                        			
		                                        			/* if($("#time"+ i + "").css("text-decoration","line-through") == true){ */
		                                        			if($("#time"+ i + "").css("text-decoration") == "line-through solid rgb(211, 211, 211)"){
		                                        				
		                                        				alert("중복되는 예약이 있습니다. 예약시간을 다시 확인해주세요.");

		                                        				$(".swiper-slide").css("background-color","white");
			                                   					startTime = -1;
			                                            		endTime = -1;
		                                        			}
		                                        			
			                                   					
			                                   				
		                                        			
		                                        		}
		                                        	}
		                                        	var realEndTime = endTime;
		                                        	realEndTime = parseInt(realEndTime);
		                                        	startTime = parseInt(startTime);
		                                        	if(realEndTime == -1) {
		                                        		realEndTime = startTime;
		                                        	}  
		                                        	
		                                        	realEndTime += 1;
		                                        	
		                                        	
		                                        	// 총결제금액 등급별 할인 
		                                        	if("${loginMember.grCode}" == "태양"){ // 5퍼 할인 
		                                        		
		                                        		totalPrice = (realEndTime - startTime) * ${ s.hourPrice} * 0.95;
		                                        		
		                                        	}else if("${loginMember.grCode}" == "지구"){ //3퍼 할인 
		                                        		
		                                        		totalPrice = (realEndTime - startTime) * ${ s.hourPrice} * 0.97;
		                                        		
		                                        	} else { // 달 일때 할인 없음  
		                                        		
		                                        		totalPrice = (realEndTime - startTime) * ${ s.hourPrice};
		                                        		
		                                        	}
		                                        	
		                                        	
		                                        	
		                                        	/* totalPrice = (realEndTime - startTime) * ${ s.hourPrice}; */
		                                        	timeCount = realEndTime - startTime;
		                                        	

	                                        		 $("#selectedTime").text(startTime + "시 - " + realEndTime + "시"); // 모달에 시간 대입 
	                                        		 $("#totalPrice").text(totalPrice); // 모달에 결제금액 대입 
		                                        	
		                                        	// console.log("startTime : " + startTime + " / endTime : " + endTime);
		                                        	
		                                   		}
	                                        	
	                                        	document.addEventListener('DOMContentLoaded', function() {
	                                        		  var calendarEl = document.getElementById('calendar');

	                                        		  var calendar = new FullCalendar.Calendar(calendarEl, {
	                                        			  contentHeight: "auto",
	                                        			  initialView: 'dayGridMonth',
	                                        			  validRange: function(nowDate) {
	                                        				    return {
	                                        				      start: nowDate
	                                        				    };
	                                        			},
	                                        		  dateClick: function (dateClickInfo) {
		                                        		  // get all fc-day element
		                                        		  const fcDayElements = document.querySelectorAll(
		                                        		    ".fc-daygrid-day.fc-day"
		                                        		  );
		                                        		  // init background color found element
		                                        		  fcDayElements.forEach((element, key, parent) => {
		                                        		    element.style.backgroundColor = "";
		                                        		  });
		                                        		  // set background color clicked Element
		                                        		  dateClickInfo.dayEl.style.backgroundColor = "lightgrey";
		                                        		  
		                                        		  var selectedDate = dateClickInfo.dateStr;
		                                        		  
		                                        		 /*  console.log(dateClickInfo.dateStr);  */
		                                        		 $("#selectedDate").text(dateClickInfo.dateStr); // 모달에 날짜 대입 
		                                        		 
		                                        		 
		                                        		  
		                                        		// 시간예약 현황 불러오기 
			                                        	$.ajax({
		                                                    url: "getReserveTime.re",
		                                                    data: {
		                                                        spaceNo: ${ s.spaceNo }
		                                                    },
		                                                    success: function(result) {
		                                                    	
		                                                    	var hours = new Date().getHours();
		                                                    	// console.log(hours);
		                                                    	var date =  new Date();
		                                                    	date = date.getFullYear() + '-' + (date.getMonth()+1) + '-' + date.getDate();
																
		                                                    	console.log(date);
		                                                    	console.log(dateClickInfo.dateStr);
		                                                    	
		                                                    	var resultStr="";
		                                                    	
		                                                    	
		                                                    	for(var k=0; k<24;k++){
		                                                    		
		                                                    		resultStr += "<li class='swiper-slide able' id='time" + k + "'>"
            														    /* + "<a class='time_box' href='confirm-modal' data-toggle='modal' data-target='#confirm-modal'>" */
            														    + "<a class='time_box' id= 'time_box'" + k + "' onclick='return selectTime(" + k + ");'>"
            														    + "<span class='time'>" + k + "</span>"
            														    + "<br>"
            														    + "<span class='price'>" + ${s.hourPrice } + "</span>"
            														    + "</a>"
            														    + "</li>"; 
            														    

		                                                    	}
		                                                    	

	                                                    		$("#reserveTimeArea>ul").html(resultStr);
	                                                    		
	                                                    		// console.log(result.length);
	                                                    		
		                                                    	
		                                                    	 for(var i=0; i<result.length; i++) {
		                                                    		
 		                                                    		if(result[i].endTime == -1){ // endTime -1 경우 
 		                                                    		
 		                                                    			for(var j=result[i].startTime; j<=result[i].startTime; j++){
 	 		                                                    			

 	            														    if(dateClickInfo.dateStr == result[i].useDate) {
 	        		                                                    		
 	        		                                                    		/* $("#time"+ j + ">a").attr('href','#'); // disable
 	 		                                                    			 	$("#time"+ j + ">a").attr('data-toggle',''); // disable */
 	 		                                                    			 	$("#time"+ j + ">a").attr('class','disabled'); // disable
 	 		                                                    			 	
 	 		                                                    			 	
 	 		                                                    			 	$("#time"+ j + "").css("text-decoration","line-through");  
 	 		                                                    			 	$("#time"+ j + "").css("color","lightgrey");  
 	        		                                                    		
 	        		                                                    	} 

 	 		                                                    		}
 		                                                    		
 		                                                    		} else {
 		                                                    			for(var j=result[i].startTime; j<=result[i].endTime; j++){
 	 		                                                    			

 	            														    if(dateClickInfo.dateStr == result[i].useDate) {
 	        		                                                    		
 	        		                                                    		/* $("#time"+ j + ">a").attr('href','#'); // disable
 	 		                                                    			 	$("#time"+ j + ">a").attr('data-toggle',''); // disable */
 	 		                                                    			 	$("#time"+ j + ">a").attr('class','disabled'); // disable
 	 		                                                    			 	
 	 		                                                    			 	
 	 		                                                    			 	$("#time"+ j + "").css("text-decoration","line-through");  
 	 		                                                    			 	$("#time"+ j + "").css("color","lightgrey");  
 	        		                                                    		
 	        		                                                    	} 

 	 		                                                    		}
 		                                                    		}
 		                                                    		

    	                                                    		
 		                                							
 		                                						}
		                                                    	 
		                                                    	 

		                                                    		
		                                                    		if(dateClickInfo.dateStr == date){
		                                                    		
		                                                    			for(var a=0; a<=hours ; a++){
		                                                    				$("#time"+ a + ">a").attr('class','disabled'); // disable
		                                                      			 	
		                                                      			 	
		                                                      			 	$("#time"+a + "").css("text-decoration","line-through");  
		                                                      			 	$("#time"+ a + "").css("color","lightgrey");  
		                                                    			}
		                                                    		
		                                                    		}
		                                                    		

		                                                    },
		                                                    error: function() {
		                                                        console.log("getting reserve time ajax failure");
		                                                    }
		                                                });
		                                        		 
			                                        /* 	 if(hours<=k ) {
	                                                    		
                                              			 	$("#time"+ k + ">a").attr('class','disabled'); // disable
                                              			 	
                                              			 	
                                              			 	$("#time"+ k + "").css("text-decoration","line-through");  
                                              			 	$("#time"+ k + "").css("color","lightgrey");  
			                                        	 } */
		                                        		  
		                                        		  
		                                        		}
	                                        		  });

	                                        		  calendar.render();
	                                        		});
	                                        	

                                           	 
	                                        
                                        </script>
                                        
                                        <div id="calendar">
                                        	
                                        </div>
	
                                    </th>
                                </tr>
                                <tr>
                                    <th>
                                        <b>예약시간</b> <br>

                                        <div class="reserve_time_wrap scroll" style="width: 400px; overflow-x: scroll;" align="center">
                                          <div id="reserveTimeArea" class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode" style="padding: 10px;">
                                            <ul class="swiper-wrapper time_list" style="transition-duration: 0ms;transform: translate3d(0px, 0px, 0px);">
                                            	<!-- 동적으로 생성될 자리 -->
                                            </ul>
                                                
                                            <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
                                          </div>
                                        </div>

                                        <!-- 좌우스크롤 -->
                                        <script>
                                          moveScrollLeft = function() {
                                            var _scrollX = $('.scroll').scrollLeft();
                                            $('.test').scrollLeft(_scrollX + 100);
                                          };
                                          
                                          
                                        </script>
                                        
                                        <div align="center">
                                        <br>
                                        예약인원 <input type="number" class="reserveCount" min="1" value="1" name="reserveCount" style="width:40px; text-align:center; border: 1px solid lightgrey; border-radius: 3px;">
                                        <br><br>
                                        <c:choose>
                                        <c:when test="${(!empty loginMember) and (loginMember.memNo ne s.hostNo) }">
                                        <button type="button" id="chatBtn" onclick="chatModalOpen(this)">일대일문의</button>
                                        </c:when>
                                        <c:when test="${empty loginMember}">
                                         <button type="button" id="chatBtn" onclick="denyChat()">일대일문의</button>
                                        </c:when>
                                        </c:choose>
                                        
                                        <input type="button" class="forReserve" value="예약하기" data-toggle="modal" data-target="#confirm-modal">
                                        <input type="hidden" value="${s.hostNo}">
                                        
                                        </div>
                                        
                                        
                                    </th>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
                <!-- 하단 -->
                <tr>
                    <td colspan="2">

                        <hr>

                        <!-- 공간소개 -->
                        <h3>공간소개</h3>
                            ${ s.spaceInfo }
                        </p>
                    </td>
                </tr>
            </table>
			<!-- 리뷰 -->
			<br><br>
              <h3>리뷰</h3>
              <div id="reviewDiv">
              <c:choose>
		      <c:when test="${rList.size() eq 0}">
		      	<div class="nodata"><i class="fa fa-commenting-o" aria-hidden="true" style="font-size: 50px;"></i><br>아직 작성된 리뷰가 없습니다.</div>     
		      </c:when>
		      <c:otherwise>
		      
		      <c:forEach var="r" items="${rList }" varStatus="status.index">
		      <div class="review-row">
		      <div class="review-area" id="review${r.reviewNo}">
		      <div class="rleft">
		       <c:choose>
                <c:when test="${empty r.member.profilePath}">
                 <img src='resources/images/logo.png'  >
                </c:when>
                <c:otherwise>
                <img src='${r.member.profilePath}' class='rounded-circle'	 >
                </c:otherwise>
                </c:choose>
				${r.member.memName }
		      </div>
		      <div class="rright">
			      <div class="rtitle">
			        	<span>
			        	<fmt:parseNumber var="i" value="${r.rating/2}" integerOnly="true" />
			        	<c:set var="j" value="${r.rating%2}" />
			        	<c:if test="${i ne 0 }"><c:forEach begin="1" end="${i}" ><i class="fa fa-star" aria-hidden="true"></i></c:forEach></c:if><c:if test="${j ne 0 }"><i class="fa fa-star-half-o" aria-hidden="true"></i></c:if><c:if test="${ (5-i-j) ne 0 }"><c:forEach begin="1" end="${5-i-j}" ><i class="fa fa-star-o" aria-hidden="true"></i></c:forEach></c:if></span>
			        	<c:if test="${r.memNo ne loginMember.memNo}" >
			        	<span onclick="reviewReportModalOpen(this,${r.memNo})">신고하기 <i class="fa-solid fa-triangle-exclamation"></i></span>
			        	</c:if>
			        	<span style="cursor: default;">
			        	<c:choose>
			        	<c:when test="${(empty loginMember) or (r.memNo eq loginMember.memNo)}">
			        		좋아요 ${r.reviewLike.reviewNo}
			        	</c:when>
			        	<c:otherwise>
				        	<c:choose>
				        	<c:when test="${r.reviewLike.memNo eq 0}">
				        		<i class="fa fa-thumbs-o-up" aria-hidden="true" onclick="reviewLike(this, ${r.reviewNo},${loginMember.memNo}, ${r.reviewLike.memNo}, ${r.reviewLike.reviewNo})"></i>  ${r.reviewLike.reviewNo}
				        	</c:when>
				        	<c:otherwise>
								<i class="fa fa-thumbs-up" aria-hidden="true" onclick="reviewLike(this, ${r.reviewNo},${loginMember.memNo}, ${r.reviewLike.memNo}, ${r.reviewLike.reviewNo})"></i>  ${r.reviewLike.reviewNo}	
				        	</c:otherwise>
				        	</c:choose>
			        	</c:otherwise>
			        	</c:choose></span>
			        	
			      </div>
			      
			        <div class="rcontent-area">
			          <div class="rcontent">${r.reviewCont}</div>
			          <div class="rcontent-img-area">
			            	<c:if test="${!empty r.reviewAttach1 }">
			           		 <div>
				                <img class="img1" src="${r.reviewAttach1}" alt="" />
				              </div>
			            	</c:if>
			            	<c:if test="${!empty r.reviewAttach2 }">
			           		 <div>
				                <img class="img2" src="${r.reviewAttach2}" alt="" />
				              </div>
			            	</c:if>
			            	<c:if test="${!empty r.reviewAttach3 }">
			           		 <div>
				                <img class="img3" src="${r.reviewAttach3}" alt="" />
				              </div>
			            	</c:if>
			          </div>
			        </div>
			        <div class="rdate">${r.reviewEnrollDate }</div>
			        <input type="hidden" name="reviewNo" value="${r.reviewNo }">
			        <c:if test="${!empty r.hostAnswer}">
			        
			        </c:if>
		      </div>
		      </div>
		      <c:if test="${!empty r.hostAnswer}">
		       <div class="host-area">
		      	 <div class="rleft">
			       <c:choose>
	                <c:when test="${empty r.member.hostStatus}">
	                 <img src='resources/images/logo.png'  >
	                </c:when>
	                <c:otherwise>
	                <img src='${r.member.hostStatus}' class='rounded-circle'	 >
	                </c:otherwise>
	                </c:choose>
					호스트
			      </div>
			      <div class="rright">
				       <div class="hotitle">호스트 답글</div>
					   <div class="answer-area">
					       	 	<div style="white-space:pre;">${r.hostAnswer }</div>
					    </div>
				   </div>
		       </div>
		       </c:if>
		      </div>
		      </c:forEach>
		    
		      <ul class="pagination">
		 		   <c:choose>
			   		<c:when test="${ pi.currentPage eq 1 }">
			   			<li class="page-item no-page-prev disabled"><a class="page-link">&lt;</a></li>
			   		</c:when>
			   		<c:otherwise>
			   			<li class="page-item no-page-prev"><a class="page-link" onclick="reviewPaging(${ pi.currentPage-1 })">&lt;</a></li>
			   		</c:otherwise>
			   	</c:choose>	       
			       <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
			       	<li class="page-item page-btn"><a class="page-link" onclick="reviewPaging(${ p })">${ p }</a></li>
			       </c:forEach>
			       <c:choose>
			       	<c:when test="${ pi.currentPage eq pi.maxPage }">
			       		<li class="page-item no-page-next disabled"><a class="page-link" >&gt;</a></li>
			       	</c:when>
			       	<c:otherwise>
			      	 	<li class="page-item no-page-next"><a class="page-link" onclick="reviewPaging(${ pi.currentPage+1 })">&gt;</a></li>
			       	</c:otherwise>
			       </c:choose>
		      </ul>
		      </c:otherwise>
		      </c:choose>
		      </div>
        </div>
      </div>

    <!-- 예약 확인 Modal -->
         <div class="modal" id="confirm-modal">
          <div class="modal-dialog">
              <div class="modal-content">
                  <!-- Modal Header -->
                  <c:choose>
                  	<c:when test="${empty loginMember}">
                  	<div class="modal-body">
                      <div style="padding:30px;" align="center">
                          <b style="font-size:20px;">로그인 후 이용해주세요.</b> <br><br>
                          <button type="button"  class="btn btn-primary" onclick="$('#confirm-modal').modal('hide')">닫기</button>
                          <br>
                      </div>
                      </div>
                  	</c:when>
                  	<c:otherwise>
                  	
                  	<div class="modal-header" style="font-size: 30px; font-weight:600;">예약 확인</div>
                      <!-- Modal body -->
                      <div class="modal-body">
                      <div style="padding:30px;">
                          <b>결제하시겠습니까?</b>
                          <br><br>
                          <table style="line-height: 2; padding: 5px;">
                              <tr>
                                  <td>예약공간</td>
                                  <td>${ s.spaceTitle }</td>
                              </tr>
                              <tr>
                                  <td>예약날짜</td>
                                  <td id="selectedDate"></td>
                              </tr>
                              <tr>
                                  <td>예약시간</td>
                                  <td id="selectedTime"></td>
                              </tr>
                              <tr>
                                  <td>결제예정금액</td>
                                  <td id="totalPrice"></td>
                              </tr>
                          </table>
                          <br>
                      </div>
                      
                        <%-- post 버전으로 넘기기 위한 form hidden --%>
                        <form action="payUpdate.do" method="post">
                            <input type="hidden" name="rId"> <%-- 결제번호(부트페이 제공) --%>
                            <!-- <input type="hidden" name="oId"> --> <%-- 주문번호(payment 테이블 PK) --%>
                            <input type="hidden" name="rUrl"> <%-- 결제 영수증 URL(부트페이 제공) --%>
                            <input type="hidden" name="payMethod"> <%-- 결제 방식(부트페이 제공) --%>
                            
                            <input type="hidden" name="reserveCount">
                            <input type="hidden" name="useDate">
                            <input type="hidden" name="startTime">
                            <input type="hidden" name="endTime">
                            <input type="number" name="price" style="display:none;">
                            <input type="hidden" name="memNo" value="${ loginMember.memNo }">
                             <input type="hidden" name="spaceNo" value="${ s.spaceNo }">
                             
                            <script>
                            
                            $(".forReserve").click(function() {
                                var totalPrice2 = $("#totalPrice").text();
                                
                                $("form>input[name=reserveCount]").val($(".reserveCount").val());
                                $("form>input[name=useDate]").val(selectedDate.innerText);
                                $("form>input[name=startTime]").val(startTime);
                                $("form>input[name=endTime]").val(endTime);
                                $("form>input[name=price]").val(totalPrice2);
                            })
                            
                            
                            </script>
                            
                            <button type="submit" style="display:none;"></button>
                        </form>
                      
                      
                      

                       <!-- Modal footer -->
                      <div class="modal-footer">
                          <button type="button"  class="btn btn-light" onclick="$('#confirm-modal').modal('hide')">닫기</button>
                          <button type="button" class="btn btn-primary" id="bootPayment">결제하기</button> <!-- 결제버튼 여기 -->

                        <!-- 부트페이 -->
                        <script>
                          // 로고 눌렀을 시 질척모달창, 모달창에서 홈으로 갈 시 입력한 가정보 삭제하는 서블릿 호출 
                          function toHome() {
                              // 원본참고하기
                          }

                          // 결제하기 버튼 클릭 시 부트페이 결제 함수 실행
                          $(document).ready(function() {
                              $("#bootPayment").click(function() {
                                  toPay();
                              });
                          });
                          

                    	    var price = 0;
							if("${loginMember.grCode}" == "태양"){ // 5퍼 할인 
		               		
								price = ${ s.hourPrice} * 0.95;
		               		
		                   	}else if ("${loginMember.grCode}" == "지구"){ //3퍼 할인 
		                   		
		                   		price =  ${ s.hourPrice} * 0.97;
		                   		
		                   	} else { // 달 일때 할인 없음  
		                   		price =  ${ s.hourPrice};
		                   		
		                   	}
                          

                          // 부트페이 결제 함수
                          async function toPay() {
                              try {
                                  const response = await Bootpay.requestPayment({
                                      "application_id": "638d424dd01c7e001e7bd63e", // 부트페이에서 발급해주는 ID
                                      "price": totalPrice, 
                                      "order_name": "${s.spaceTitle}",
                                      "order_id": "test",
                                      "tax_free": 0, 
                                      "user": { // loginMember 객체로부터 추출
                                          "id": "회원아이디",
                                          "username": "${loginMember.memName}",
                                          "phone": "${loginMember.phone}",
                                          "email": "${loginMember.email}"
                                      },
                                      "items": [
                                            {
                                              "id": "temporary",
                                              "name": "결제",
                                              "qty": timeCount,
                                              "price": price
                                            
                                            }
                                          ],
                                      "extra": {
                                          "open_type": "iframe", // 결제창 열리는 방식
                                          "card_quota": "0", // 할부 개월 수(무할부)
                                          "escrow": false,
                                          "display_success_result" : true,
                                          "display_error_result" : true
                                          // "separately_confirmed" : true
                                      }
                                  })

                                  switch (response.event) {
                                      case 'issued':
                                          // 가상계좌 입금 완료 처리
                                          break;
                                      case 'done':
                                    	  sendMessage("reserve", "${s.memId}", "${s.spaceTitle}");
                                          // 결제 완료 시 hidden으로 숨긴 input들 안에 부트페이 데이터를 넣고 서블릿으로 요청
                                          console.log(response);
                                          $("form>input[name=rId]").val(response.data.receipt_id);
                                          /* $("form>input[name=oId]").val(response.data.order_id); */
                                          $("form>input[name=rUrl]").val(response.data.receipt_url);
                                          $("form>input[name=payMethod]").val(response.data.method);
                                          $("form>button[type=submit]").click();
                                          
                                          

                                          break;
                                      case 'confirm': //payload.extra.separately_confirmed = true; 일 경우 승인 전 해당 이벤트가 호출됨
                                          console.log(response.receipt_id)
                                          /**
                                           * 1. 클라이언트 승인을 하고자 할때
                                           * // validationQuantityFromServer(); //예시) 재고확인과 같은 내부 로직을 처리하기 한다.
                                           */
                                          const confirmedData = await Bootpay.confirm() //결제를 승인한다
                                          if(confirmedData.event === 'done') {
                                              //결제 성공
                                          } else if(confirmedData.event === 'error') {
                                              //결제 승인 실패
                                          }

                                          /**
                                           * 2. 서버 승인을 하고자 할때
                                           * // requestServerConfirm(); //예시) 서버 승인을 할 수 있도록  API를 호출한다. 서버에서는 재고확인과 로직 검증 후 서버승인을 요청한다.
                                           * Bootpay.destroy(); //결제창을 닫는다.
                                           */
                                          break;
                                  }
                                 
                              } catch (e) {
                                  // 결제 진행중 오류 발생
                                  // e.error_code - 부트페이 오류 코드
                                  // e.pg_error_code - PG 오류 코드
                                  // e.message - 오류 내용
                                  console.log(e.message)
                                  switch (e.event) {
                                      case 'cancel':
                                          // 사용자가 결제창을 닫을때 호출
                                          // 결제 실패 alert창과 함께 홈으로 가기 + 가정보 delete 하는 서블릿 호출
                                          location.href="detail.sp?sno=" + ${s.spaceNo};
                                          console.log(e.message);
                                          alert("결제가 취소되었습니다.");
                                          break;
                                      case 'error':
                                          // 결제 승인 중 오류 발생시 호출
                                          // 결제 실패 alert창과 함께 홈으로 가기 + 가정보 delete 하는 서블릿 호출
                                    	  console.log(e.error_code);
                                          location.href="detail.sp?sno=" + ${s.spaceNo};
                                          alert("결제가 취소되었습니다.");
                                          break;
                                  }
                              }
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

	<!--공간 신고 Modal -->
      <div class="modal" id="report-Modal">
        <form action="reportSpace.sp" method="get" id="reportInfoSubmit">
        <input type="hidden" name="sno" id="sno" value="${ s.spaceNo }"> 
        <%-- <input type="hidden" name="mno" id="mno" value="${ loginUser.getMemNo }">  --%>
        <script>
        </script>
          <div class="modal-dialog">
            <div class="modal-content">
              <!-- Modal Header -->
              <div class="modal-header">공간 신고</div>
              <!-- Modal body -->
              <div class="modal-body">
                
              <!--  신고유형 선택 드롭박스  -->
              <div>
                <b>신고유형</b> <br>
                <div class="selectType">
                  <label for="type_select">신고유형선택</label>&nbsp;&nbsp;&nbsp;
                    <select id="type_select" name="reportType">
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
                <b>신고내용</b>  <br>
                <div>
                  <textarea id="reportContent" name="reportContent" cols="50" rows="3" placeholder="신고 내용을 입력해주세요."></textarea>
                </div>              
                </div>
                <!-- Modal footer -->
                <div class="modal-footer">
                  <button type="button" class="btn btn-light" onclick="$('#report-Modal').modal('hide');">취소</button>
                  <button type="submit" class="reportBtn btn btn-danger">신고하기</button>
                </div>
              </div>
            </div>
        </form>
      </div>
      
      
      <!-- 이미지 뷰 Modal -->
    <div class="modal" id="reviewImgModal">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <!-- Modal body -->
          <div class="modal-body">
            <img src="" alt="" />
            <div class="img_btn_area">
              <button
                type="button"
                class="button_img button_img_prev"
                onclick="imgChange(1)"
              >
                <i class="fa fa-angle-left" aria-hidden="true"></i>
              </button>
              <button
                type="button"
                class="button_img button_img_next"
                onclick="imgChange(2)"
              >
                <i class="fa fa-angle-right" aria-hidden="true"></i>
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
    
	<div id="imgOverlay">
            <div class="overlay-area">
            <div><i class="fa fa-angle-left" aria-hidden="true" onclick="imgChange(1)"></i></div>
            <div>
            	<img src="" alt="" />
            </div>
            <div><i class="fa fa-angle-right" aria-hidden="true" onclick="imgChange(2)"></i>
           	 <i class="fa fa-times" aria-hidden="true" ></i></div>
            </div>
	</div>
	
	<!-- 리뷰 사용자 신고 Modal -->
      <div class="modal" id="reviewReportModal">
        <input type="hidden" name="reportMemNo" value="${ loginMember.memNo }"> 
        <input type="hidden" name="reportedMemNo" value=""> 
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
                  <label for="type_select">신고유형선택</label>&nbsp;&nbsp;&nbsp;
                    <select id="type_select" name="reportType">
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
                <b>신고내용</b>  <br>
                <div>
                  <textarea id="reportContent" name="reportContent" cols="50" rows="3" placeholder="신고 내용을 입력해주세요." maxlength="200"></textarea>
                  
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
                  <button type="submit" class="reportBtn btn btn-danger" onclick="reviewReport()" >신고하기</button>
                </div>
              </div>
            </div>
      </div>
      
      <!-- 채팅방 Modal -->
    <div class="modal" id="chattingModal">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <!-- Modal Header -->
          <div class="modal-header">${s.memName}</div>
          <!-- Modal body -->
          <div class="modal-body" id="chatView-${s.hostNo}-${loginMember.memNo}">
          </div>
          <!-- Modal footer -->
          <div id="chatFooter" class="modal-footer">
          		<div >
          			<textarea name="chatMsg"></textarea>
          			<button type="button" onclick="chatInsert(this)"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
          			<input type="hidden" name="sender" value="${s.hostNo }"  > 
          			<input type="hidden" name="senderId" value="${s.memId }"  > 
          			<input type="hidden" name="roomNo"  > 
          		</div>
          </div>
        </div>
      </div>
    </div>
	
  <jsp:include page="../common/footer.jsp" />
</div>
<c:if test="${!empty loginMember}">
<script>
//챗 모달 오픈
function chatModalOpen(btn) {
	
		$.ajax({
			url : "detailChat.me",
			data : {
				sender : $(btn).next().next().val(),
				receiver : ${loginMember.memNo}
			},
			success : result => {
				var str = "";
				var cList = result;
				
				if(cList.length > 0) {
					$("#chatFooter input[name=roomNo]").val(cList[0].roomNo);
					for(var i in cList) {
						if(cList[i].sender == "${loginMember.memNo}") { // 내가 보낸 메시지일경우
							str+= "<div class='receiver'><div class='rcontent-area'>";
							str+= "<div class='rrealcontent'>"+cList[i].message+"<div class='rdate'>"+cList[i].messageDate+"</div></div></div></div>";
						}else { // 내가 받은경우
							str+= "<div class='sender'><div>";
							
							if(typeof cList[i].senderProfilePath == "undefined") {
						    	  str+= "<img src='resources/images/logo.png' 	 >";
						      }else {
						    	  str+= "<img src='"+cList[i].senderProfilePath+"' class='rounded-circle'	 >";
						      }
							str+= "</div><div class='sender-con'>";
							str+= "<div class='sname'>"+cList[i].senderName+"</div>";
							str+= "<div class='scontent-area'>";
							str+= "<div class='srealcontent'>"+cList[i].message+"<div class='sdate'>"+cList[i].messageDate+"</div></div></div></div></div>";
						}
					}
					$("#chattingModal .modal-body").html(str);
					$("#chattingModal .modal-body").scrollTop($("#chattingModal .modal-body")[0].scrollHeight);
				}
			},
			error : () => {
				console.log("통신 실패");
			}
		});
		
		 $("#chattingModal").modal("show");

}
$(function() {
	//챗창 엔터키 막기
	$("textarea[name=chatMsg]").keydown(function () {    
		 if (event.keyCode === 13 && $(this).val().trim() != "") {
			 if (!event.shiftKey) {
				 event.preventDefault();
				 $("#chatFooter button").click();
			 }
		 }
    });
});

// 채팅 인서트
chatInsert = btn => {
	var message = $(btn).prev().val();
	var receiver = $(btn).next().val();
	var receiverId = $(btn).next().next().val();
	var roomNo = $(btn).next().next().next().val();
	
	$.ajax({
		url : "insertChat.me",
		data : {
			message : message,
			sender : ${loginMember.memNo},
			receiver : receiver,
			roomNo : roomNo
		},
		success : result => {
			
			var str = "";
			str+= "<div class='receiver'><div class='rcontent-area'>";
			str+= "<div class='rrealcontent'>"+result.message+"<div class='rdate'>"+result.messageDate+"</div></div></div></div>";
			$("#chattingModal .modal-body").append(str);
			$("#chattingModal .modal-body").scrollTop($("#chattingModal .modal-body")[0].scrollHeight);
			$("#chattingModal textarea[name=chatMsg]").val("");
			sendMessage("chat", receiverId, result.message, result.messageDate, result.roomNo);
			$("#chatFooter input[name=roomNo]").val(result.roomNo);
		},
		error : () => {
			console.log("통신 실패");
		}
	});
}

</script>
</c:if>

<script>	
	denyChat = () => {
		 alert("로그인 후 이용 가능한 서비스입니다.");
	}

	 $(function () {
		// img 컨트롤
		 $("#reviewDiv ").on("mouseover", ".rcontent-img-area img", function() {
	        $(this).css({ transform: "scale(1.1)" });
	      });
		 $("#reviewDiv ").on("mouseleave", ".rcontent-img-area img", function() {
	        $(this).css({ transform: "scale(1.0)" });
	      });
		 $("#reviewDiv ").on("click", ".rcontent-img-area img", function() {
	    	  $("#imgOverlay img").removeAttr("class");
 		      $("#imgOverlay img").attr("src", $(this).attr("src")).addClass($(this).parents(".review-area").attr("id") + "-" + $(this).attr("class"));
	          $("#imgOverlay").addClass("slideon");
	      });
	      $("#imgOverlay .fa-times").click(function () {
	          $("#imgOverlay").removeClass("slideon");
	      });
		
   	});
	
	 function imgChange(type) {
	      var rId = $("#imgOverlay img").attr("class").split("-", 1)[0];
	      var imgCount = $("#" + rId + " .rcontent-img-area img").length;
	      var index = $("#imgOverlay img").attr("class").split("-", 2)[1].substr(3, 1);
	      console.log(rId);
	      console.log(imgCount);
	      console.log(index);

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
	      console.log( $("#" + rId + " .img" + index).attr("src"));
	      
	      $("#imgOverlay img").removeAttr("class");
	      $("#imgOverlay img").addClass(rId + "-img" + index);
	      $("#imgOverlay img").attr("src", $("#" + rId + " .img" + index).attr("src"));
	   }
	 
	 reviewLike  = (i, rno, memNo, lcount, tocount) => {

		 var str ="";
		 if(lcount == 0) {
			 tocount +=1;
			 str+= "<i class='fa fa-thumbs-up' aria-hidden='true' onclick='reviewLike(this, "+rno+", "+memNo+", 1, "+tocount+")'></i>  "+tocount;
		 }else {
			 tocount -=1;
			 str+= "<i class='fa fa-thumbs-o-up' aria-hidden='true' onclick='reviewLike(this, "+rno+", "+memNo+", 0, "+tocount+")'></i>  "+tocount;
		 }
		 
		 $.ajax({
				url : "like.rv",
				data : {
					reviewNo : rno,
					memNo : memNo,
					lcount : lcount
				},
				success : result => {
					if(result == "success") {
						$(i).parent().html(str);
					}
				},
				error : () => {
					console.log("통신 실패");
				}
		});
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
	 });
	//페이징
	function reviewPaging(page) {
		var sno = ${s.spaceNo};
		
		$.ajax({
			url : "list.rv",
			data : {
				sno : sno,
				page : page
			},
			success : data => {
				var pi = data.pi;
				var rList = data.rList;
				var str ="";
				
				for(var i in rList) {
					
		      str+= "<div class='review-row'>";
		      str+= "<div class='review-area' id='review"+rList[i].reviewNo+"'>";
		      str+= "<div class='rleft'>"
		      if(typeof rList[i].member.profilePath == "undefined") {
		    	  str+= "<img src='resources/images/logo.png' 	 >";
		      }else {
		    	  str+= "<img src='"+rList[i].member.profilePath+"' class='rounded-circle'	 >";
		      }
		      str+= rList[i].member.memName+"</div>";
		      str+= "<div class='rright'><div class='rtitle'><span>";
		      
		      var rating = rList[i].rating;
              var k = parseInt(rating / 2);
              var j = rating % 2;

                for (let index = 0; index < k; index++) {
                    str += "<i class='fa fa-star' aria-hidden='true'></i>";
                }
                if (j == 1) {
                    str += "<i class='fa fa-star-half-o' aria-hidden='true'></i>";
                }
                for (let index = 0; index < 5 - k - j; index++) {
                    str += "<i class='fa fa-star-o' aria-hidden='true'></i>";
                }
                str += "</span>"
	        	if(rList[i].memNo != "${loginMember.memNo}") {
	        		str+= "<span onclick='reviewReportModalOpen(this,"+rList[i].memNo+")'>신고하기 <i class='fa-solid fa-triangle-exclamation'></i></span>";
	        	}
                str += "<span style='cursor:default;'>";
                if(("${loginMember}"=="") || (rList[i].memNo == "${loginMember.memNo}")) {
                	 str += "좋아요 "+rList[i].reviewLike.reviewNo;
                }else {
                	if(rList[i].reviewLike.memNo == 0) {
                		str += "<i class='fa fa-thumbs-o-up' aria-hidden='true' onclick='reviewLike(this, "+rList[i].reviewNo+", ${loginMember.memNo}, "+rList[i].reviewLike.memNo+", "+rList[i].reviewLike.reviewNo+")'></i> "+rList[i].reviewLike.reviewNo;
                	}else {
                		str += "<i class='fa fa-thumbs-up' aria-hidden='true' onclick='reviewLike(this, "+rList[i].reviewNo+", ${loginMember.memNo}, "+rList[i].reviewLike.memNo+", "+rList[i].reviewLike.reviewNo+")'></i> "+rList[i].reviewLike.reviewNo;
                	}
                }
                str += "</span></div>"; // rtitle 끝
               	str += "<div class='rcontent-area'>";
	                str += "<div class='rcontent'>"+rList[i].reviewCont+"</div>";
	                str += "<div class='rcontent-img-area'>";
	                if(rList[i].reviewAttach1 != null) {
	                	str +="<div><img class='img1' src='"+rList[i].reviewAttach1+"' /></div>";
	                }
	                if(rList[i].reviewAttach2 != null) {
	                	str +="<div><img class='img2' src='"+rList[i].reviewAttach2+"' /></div>";
	                }
	                if(rList[i].reviewAttach3 != null) {
	                	str +="<div><img class='img3' src='"+rList[i].reviewAttach3+"' /></div>";
	                }
              	  str += "</div></div>"; // rcontent- area 끝
                str += "<div class='rdate'>"+rList[i].reviewEnrollDate+"</div>";
                str += "<input type='hidden' name='reviewNo' value='"+rList[i].reviewNo+"'>";
                str += "</div></div>"; // rright 끝 그리고 review-area 끝
                if(rList[i].hostAnswer != null) {
	                str += "<div class='host-area'>";
	                str += "<div class='rleft'>";
	                if(rList[i].member.hostStatus == null) {
	                	str += "<img src='resources/images/logo.png'  >";
	                }else {
	                	str += "<img src='"+rList[i].member.hostStatus+"' class='rounded-circle' >";
	                }
	                 str +="호스트</div>";
	                 str += "<div class='rright'>";
	                 str += "<div class='hotitle'>호스트 답글</div>"
	                 str += "<div class='answer-area'>";
	                 str += "<div style='white-space:pre;''>"+rList[i].hostAnswer+"</div>";
	                 str += "</div></div></div>";
                }
                str += "</div>"; //review-row 끝
			}
			      
				str += "<ul class='pagination'>";
				if(pi.currentPage == 1) {
					str += "<li class='page-item no-page-prev disabled'><a class='page-link'>&lt;</a></li>";
				}else {
					str += "<li class='page-item no-page-prev'><a class='page-link' onclick='reviewPaging("+(pi.currentPage-1)+")'>&lt;</a></li>";
				}
				for(var p=pi.startPage; p<=pi.endPage; p++) {
					if(p == pi.currentPage) {
						str += "<li class='page-item page-btn disabled'><a id='active-page' class='page-link' onclick='reviewPaging("+p+")'>"+p+"</a></li>";
					}else {
						str += "<li class='page-item page-btn'><a class='page-link' onclick='reviewPaging("+p+")'>"+p+"</a></li>";
					}
					
				}
				if(pi.currentPage == pi.maxPage) {
					str += "<li class='page-item no-page-next disabled'><a class='page-link'>&gt;</a></li>";
				}else {
					str += "<li class='page-item no-page-next'><a class='page-link' onclick='reviewPaging("+(pi.currentPage+1)+")'>&gt;</a></li>";
				}
				str += "</ul>";
				$("#reviewDiv").html(str);
			
			},
			error : () => {
				console.log("통신 실패");
			}
		});
	}
	 
	</script>
</body>
</html>