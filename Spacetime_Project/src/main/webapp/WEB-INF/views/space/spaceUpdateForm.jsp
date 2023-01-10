<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SpaceTime</title>
 <!-- 주소 찾기 api -->
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <!-- 위도경도 찾아올 지도 api -->
  <script type="text/javascript"
    src="//dapi.kakao.com/v2/maps/sdk.js?appkey=20d54a9ccfedaf218ee82f9ec713bce0&libraries=services"></script>
<style>
    body * {
      box-sizing: border-box;
    }

    .main {
      overflow: hidden;
      background-color: rgb(250, 250, 250);
    }

    #spInsertForm {
      overflow: hidden;
      width: 800px;
      margin: 30px auto;
    }

    .space-main-title {
      font-size: 25px;
      font-weight: 600;
      color: rgb(54, 54, 54);
    }

    #spInsertForm hr {
      border: 2px solid rgb(39, 123, 192);
      margin-bottom: 20px;
    }

    .space-title {
      overflow: hidden;
      font-size: 18px;
      font-weight: 600;
      margin-bottom: 20px;
      color: rgb(54, 54, 54);

    }

    .space-title .lcount {
      float: right;
      font-size: 12px;
      font-weight: 600;
    }

    .space-content {
      margin-bottom: 30px;
    }

    .space-content input[class="itype1"] {
      width: 100%;
      height: 40px;
      padding: 0 10px;
      outline: none;
      border: 1px solid lightgray;
      color: rgb(54, 54, 54);

    }

    .stypeNo-area {}

    /*input 은 숨겨주기*/
    .stypeNo-area input[type=radio] {
      display: none;
    }

    /*input 바로 다음의 label*/
    .stypeNo-area input+label {
      display: inline-block;
      cursor: pointer;
      background-color: rgb(224, 224, 224);
      color: rgb(54, 54, 54);

      padding: 8px 20px;
      margin-right: 25px;
      margin-bottom: 20px;
      font-size: 17px;
      font-weight: 700;
      border-radius: 10px;
      border: none;
    }


    .stypeNo-area input:checked+label {
      background-color: rgb(253, 193, 55);
      color: rgb(39, 123, 192);
    }

    .stypeNo-area label:hover {
      background-color: rgb(253, 193, 55);
      color: rgb(39, 123, 192);

    }

    .space-content input[class="itype2"] {
      width: 100%;
      height: 40px;
      padding: 0 10px;
      outline: none;
      border: 1px solid lightgray;
      color: rgb(54, 54, 54);

    }

    .space-content .tarea-type1 {
      width: 100%;
      height: 100px;
      border: 1px solid lightgray;
      outline: none;
      padding: 10px;
      resize: none;
      color: rgb(54, 54, 54);

    }
    .space-content .tarea-type2 {
      width: 100%;
      height: 300px;
      border: 1px solid lightgray;
      outline: none;
      padding: 10px;
      resize: none;
      color: rgb(54, 54, 54);

    }


	/* 해시 태그 */
    .hashtag-div {
      overflow: hidden;
      float: left;
    }

    .hashtag-div>div {
      float: left;
    }

    input[name="hashtagInput"] {
      width: 30%;
      padding: 5px 10px;
      outline: none;
      margin-left: 30px;
      border: 1px solid lightgray;
      border-radius: 10px;
      color: rgb(54, 54, 54);
      font-size: 14px;
      font-weight: 500;
    }

    .hashtag-area {
      overflow: hidden;
    }

    .hashtag-area>div {
      float: left;
      padding: 5px 10px;
      margin-right: 10px;
      margin-top: 10px;
      font-size: 14px;
      font-weight: 500;
      background-color: rgb(253, 193, 55);
      border-radius: 5px;
    }

    .hashtag {
      position: relative;
    }

    .hashtag i {
      position: absolute;
      top: -7px;
      right: -5px;
      font-size: 14px;
      cursor: pointer;
    }

    /* -------------------------------------- */

    .space-small-area {
      overflow: hidden;
    }

    .space-small-area>div {
      width: 22%;
    }

    .space-small-area>div:nth-child(1) {
      float: left;
    }

    .space-small-area>div:nth-child(2) {
      float: left;
      margin-left: 4%;
    }
    .space-small-area>div:nth-child(3) {
      float: left;
      margin-left: 4%;
    }

    .space-small-area>div:nth-child(4) {
      float: right;
    }

    .space-small-title {
      overflow: hidden;
      font-size: 18px;
      font-weight: 600;
      margin-bottom: 20px;
    }

    .space-small-content {
      margin-bottom: 30px;
    }

    .space-small-content input {
      width: 100%;
      height: 40px;
      padding: 0 10px;
      outline: none;
      border: 1px solid lightgray;
    }

    .space-img-area {
      margin-bottom: 30px;
      overflow: hidden;

    }

    .space-img-area>div {
      float: left;
      border: 1px solid lightgray;
      padding: 20px 15px;
      width: 80%;
      height: 150px;
      font-size: 12px;
      font-weight: 500;
      color: rgb(43, 43, 43);
      background-color: #fff;
      overflow-x: auto;
      white-space: nowrap;
    }


    .space-img-area>div>div {
      margin-right: 20px;
      display: inline-block;
      height: 100%;
      position: relative;
    }

    .space-img-area img {
      height: 100%;
    }

    .space-img-area i {
      position: absolute;
      top: 0px;
      right: 3px;
      font-size: 25px;
      font-weight: 500;
      color: rgb(241, 196, 15);
      border: #fff;
      cursor: pointer;
    }

    .space-img-area>button {
      float: right;
      width: 15%;
      height: 50px;
      background-color: rgb(39, 123, 192);
      color: white;
      border: none;
      font-size: 18px;
      cursor: pointer;
      font-weight: 600;
    }

    .space-address-area {
      margin-bottom: 15px;
    }

    .space-address-area>input {
      display: inline-block;
      border: 1px solid lightgray;
      padding: 0 10px;
      outline: none;
      width: 80%;
      height: 40px;
      font-size: 12px;
      font-weight: 500;
      color: rgb(54, 54, 54);
      background-color: #fff;
      cursor: pointer;
    }

    .space-address-area>button {
      float: right;
      width: 15%;
      height: 40px;
      background-color: rgb(39, 123, 192);
      color: white;
      border: none;
      font-size: 18px;
      font-weight: 600;
      cursor: pointer;
    }

    #spaceInsertBtn {
      float: right;
      width: 200px;
      height: 50px;
      background-color: rgb(39, 123, 192);
      color: white;
      border: none;
      font-size: 18px;
      font-weight: 600;
      cursor: pointer;
      margin-bottom: 40px;
    }
    
    /* 공간 신청  모달 */
      #spaceInsertModal .modal-content {
        width: 450px;
        margin: auto;
        border: 1px solid gray;
        border-radius: 10px;
        overflow: hidden;
        margin-top: 150px;
      }

      #spaceInsertModal .modal-header {
        background-color: rgb(39, 123, 192);
        text-align: center;
        color: white;
        font-size: 18px;
        border-bottom: none;
        display: block;
        padding: 10px;
        margin-bottom: 10px;
      }

      #spaceInsertModal .modal-body {
        text-align: center;
        margin-top: 30px;
      }

      #spaceInsertModal h4 {
        margin-bottom: 20px;
      }

      #spaceInsertModal h5 {
        color: rgb(39, 123, 192);
      }

      #spaceInsertModal .modal-footer {
        margin: 0 auto 20px;
        border: none;
      }

      #spaceInsertModal button {
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

      #spaceInsertModal button:nth-child(1) {
        background-color: rgb(158, 158, 158);
      }

      #spaceInsertModal button:nth-child(2) {
        background-color: rgb(253, 193, 55);
         color: black;
      }

      #spaceInsertModal button:nth-child(1):hover {
        background-color: rgb(136, 136, 136);
        font-size: 20px;
        font-weight: 600;
      }

      #spaceInsertModal button:nth-child(2):hover {
        background-color: rgb(255, 187, 27);
        font-size: 20px;
        font-weight: 600;
        color: black;
      }
      /* -------------------------------------- */
      .denymsg {
      
      
      }
      
      /* Chrome, Safari, Edge, Opera */
		input::-webkit-outer-spin-button,
		input::-webkit-inner-spin-button {
		  -webkit-appearance: none;
		  margin: 0;
		}
		
		/* Firefox */
		input[type=number] {
		  -moz-appearance: textfield;
		}
      
  </style>
</head>
<body>
	<div class="wrap">		
	<jsp:include page="../common/hostHeader.jsp" />
	<div class="main">
    <form id="spInsertForm" method="post" action="update.sp" enctype="multipart/form-data">
	    <input type="hidden" name="hostNo" value="${loginMember.memNo }">
	    <input type="hidden" name="spaceNo" value="${s.spaceNo}">
	    <input type="hidden" name="mainChg" value="">
	    <input type="hidden" name="thumChg" value="">
      <div class="space-main-title">공간 정보 입력</div>
      <hr />
   		<c:if test="${s.spaceStatus eq 'N'}">
		<div class="space-title" style="color:rgb(231, 76, 60);">
		  반려 사유
		</div>
		<div class="space-content">
		  <div class="denymsg">
		  	${s.denyMessage}
		  </div>
		</div>
       	</c:if>
     
      <div class="space-title">
        공간 이름
        <div class="lcount"><span>0</span><span> / 30자</span></div>
      </div>
      <div class="space-content">
        <input type="text" class="itype1" name="spaceTitle" placeholder="고유 업체명을 입력해주세요" value="${s.spaceTitle} "/>
      </div>
      <div class="space-title">
        공간 유형
      </div>
      <div class="space-content stypeNo-area">
      <c:forEach var="s" items="${stypeList }">
		<input type="radio" id="stype${s.stypeNo }" name="stypeNo" value="${s.stypeNo }">
        <label class="stype-btn" for="stype${s.stypeNo }">${s.stypeName }</label>
	 </c:forEach>
      </div>
      <div class="space-title">
        공간 소제목
        <div class="lcount"><span>0</span><span> / 150자</span></div>
      </div>
      <div class="space-content">
        <textarea type="text" class="tarea-type1" name="spaceSubTitle" maxlength="150"
          placeholder="공간 소제목 정보를 입력해주세요">${s.spaceSubTitle }</textarea>
      </div>
      <div class="space-title">
        공간 소개
      <input type="text" name="hashtagInput" placeholder="#해시태그 입력" />        
        <div class="lcount"><span>0</span><span> / 1500자</span></div>
        <div class="hashtag-area">
          <input type="hidden" name="hashtag">
        </div>
      </div>
      <div class="space-content">
        <textarea type="text" class="tarea-type2" name="spaceInfo" maxlength="1500"
          placeholder="공간 정보를 상세하게 소개해주세요">${s.spaceInfo }</textarea>
      </div>
      <div class="space-small-area">
        <div class="space-small">
          <div class="space-small-title">
            금액(1시간당,원)
          </div>
          <div class="space-small-content">
            <input type="number" name="hourPrice" placeholder="금액" value="${s.hourPrice }" />
          </div>
        </div>
        <div class="space-small">
          <div class="space-small-title">
            최대 수용인원
          </div>
          <div class="space-small-content">
            <input type="number" name="maxPeople" placeholder="최대 인원" value="${s.maxPeople }" />
          </div>
        </div>
        <div class="space-small">
          <div class="space-small-title">
            운영 시작시간
          </div>
          <div class="space-small-content">
            <input type="number" name="openTime" placeholder="시작시간" value="${s.openTime }" />
          </div>
        </div>
        <div class="space-small">
          <div class="space-small-title">
            운영 종료시간
          </div>
          <div class="space-small-content">
            <input type="number" name="closeTime" placeholder="종료시간" value="${s.closeTime }" />
          </div>
        </div>
      </div>

      <div class="space-title">
        대표 이미지
      </div>
      <div class="space-img-area main-img-area">
        <div>
          <div><img src="${aList[0].getAttachmentReName()}" /><i class='fa fa-times' aria-hidden='true' onclick='mainImgFileDel(this)'></i></div>
        </div>
        <button type="button" class="main-img-btn">파일첨부</button>
        <input id="mainImgFile" type='file' name='upfile' style="display: none;">
      </div>

      <div class="space-title main-img">
        이미지
      </div>
      <div class="space-img-area thum-img-area">
        <div>
        <c:choose>
        <c:when test="${aList.size() eq 1 }">
                  추가 이미지를 등록해주세요
        </c:when>
        <c:otherwise>
        <c:forEach var="a" begin="1" end="${aList.size()-1 }" items="${aList}" varStatus="status">
        <c:set var="i" value="${status.index}" />
        <div><img class="thum${i}" src="${aList[i].getAttachmentReName()}"/><i class='fa fa-times' aria-hidden='true' ></i></div>
        </c:forEach>
        </c:otherwise>
        </c:choose>
        </div>
        <button type="button" class="thum-img-btn">파일첨부</button>
      </div>
      <div class="file-area">
      </div>
      <div class="space-title">
        주소
      </div>
      <div class="space-address-area">

        <input type="text" name="addressDefault" placeholder="공간 주소를 입력해주세요" value="${s.addressDefault }"  onclick="daumPost()" readonly/>
        <button type="button" onclick="daumPost()">주소등록</button>
      </div>
      <div class="space-content">
        <input type="text" class="itype1" name="addressDetail" placeholder="상세 주소" value="${s.addressDetail }" />
        <input type="hidden" name="latitude" value="${s.latitude }">
        <input type="hidden" name="longitude" value="${s.longitude }">
      </div>
      <div class="space-title">
        연락처
      </div>
      <div class="space-content">
        <input type="text" class="itype1" name="tel" placeholder="- 포함해서 입력해주세요" value="${s.tel }" />
      </div>
      <button type="button" id="spaceInsertBtn"  onclick="valichk()">검수 신청하기</button>
    </form>
    <!-- 공간 신청  Modal -->
    <div class="modal" id="spaceInsertModal">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <!-- Modal Header -->
          <div class="modal-header">검수 신청</div>
          <!-- Modal body -->
          <div class="modal-body">
            <h4>공간 수정시 재검수가 필요합니다.</h4>
            <h5>공간 검수를 신청하시겠습니까?</h5>
          </div>
          <!-- Modal footer -->
          <div class="modal-footer">
            <button type="button" data-dismiss="modal">닫기</button>
            <button type="button" onclick="spaceSubmit()">검수신청하기</button>
          </div>
        </div>
      </div>
    </div>
    
  </div>	
	<jsp:include page="../common/footer.jsp" />
	</div>
	<script>
    //이미지 변경 여부
    let mainChg = 0;
    let thumChg = [];
    
    // 추가 이미지 식별 번호 메인이미지는 뺀다.
    let thumNo = ${aList.size()}-1;
    
	// 페이지 로딩 후 기본 체크
	$(function () {
		var hashtag ="${s.hashtag}".split(",");
		
		hashtag.forEach((value, index, array) => {
		    $(".hashtag-area").append("<div class='hashtag'><span>#" + value + "</span><i class='fa fa-minus-square' aria-hidden='true'></i></div>");
		});
		$("#stype"+${s.stypeNo}).prop("checked",true);
		
		 for(var i = 0; i < thumNo; i++) {
			 thumChg.push(0);
         }
		 //textarea br 개행으로 변경
		 var text = $("textarea[name=spaceInfo]").val();
		 var result = text.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
		 $("textarea[name=spaceInfo]").val(result);
		 
	});

	 // 글자수 체크
	$(function() {
		$('#spInsertForm input').keyup(function () {		
            $(this).parent().prev().children().children().first().text($(this).val().length);  			
		});
		$('#spInsertForm textarea').keyup(function () {		
			 $(this).parent().prev().children().children().first().text($(this).val().length);  
		});
		$('input[name=spaceTitle]').parent().prev().children().children().first().text($('input[name=spaceTitle]').val().length);  		
		$('textarea[name=spaceSubTitle]').parent().prev().children().children().first().text($('textarea[name=spaceSubTitle]').val().length);  		
		$('textarea[name=spaceInfo]').parent().prev().children().children().first().text($('textarea[name=spaceInfo]').val().length);  		
	});

    $(function () {
      // 대표 이미지 첨부
      $(".main-img-btn").click(function () {
        $("#mainImgFile").click();
      });

      $("#mainImgFile").on("change", function () {
    	mainChg =1;
        if ($(this)[0].files.length == 1) {
          var filename = $(this)[0].files[0].name;

          if (!validFileType(filename)) {
            alert("허용하지 않는 확장자 파일입니다.");
            $(this).val("");
            $(".main-img-area>div").text("대표 이미지를 등록해주세요");
            return false;
          }
          if (!validFileSize($(this)[0].files[0])) {
            alert("파일 사이즈가 10MB를 초과합니다.");
            $(this).val("");
            $(".main-img-area>div").text("대표 이미지를 등록해주세요");
            return false;
          }
          if (!validFileNameSize(filename)) {
            $(".main-img-area>div").text("대표 이미지를 등록해주세요");
            alert("파일명이 30자를 초과합니다.");
            $(this).val("");
            return false;
          }

          $(".main-img-area>div").text("");
          $(".main-img-area>div").append("<div><img/><i class='fa fa-times' aria-hidden='true' onclick='mainImgFileDel(this)'></i></div>");

          var reader = new FileReader();
          reader.readAsDataURL($(this)[0].files[0]);
          reader.onload = function (e) {
            $(".main-img-area img").attr("src", e.target.result);
          };

        } else {
          $(".main-img-area>div").text("대표 이미지를 등록해주세요");
        }
      });

      // 추가 이미지 첨부
      $(".thum-img-btn").click(function () {
        thumNo++;
        $(".file-area").append("<input type='file' name='upfile' id='thum" + thumNo + "' style='display:none;' >");
        $("#thum" + thumNo).click();
      });
      $(".file-area").on("change", "input[name='upfile']", function () {
        if ($(this)[0].files.length == 1) {
          var filename = $(this)[0].files[0].name;

          if (!validFileType(filename)) {
            alert("허용하지 않는 확장자 파일입니다.");
            $(this).remove();
            return false;
          }
          if (!validFileSize($(this)[0].files[0])) {
            alert("파일 사이즈가 10MB를 초과합니다.");
            $(this).remove();
            return false;
          }
          if (!validFileNameSize(filename)) {
            alert("파일명이 30자를 초과합니다.");
            $(this).remove();
            return false;
          }

          if ($(".thum-img-area>div>div").length == 0) {
            $(".thum-img-area>div").text("");
          }
          $(".thum-img-area>div").append("<div><img class='thum" + thumNo + "'/><i class='fa fa-times' aria-hidden='true' ></i></div>");

          var reader = new FileReader();
          reader.readAsDataURL($(this)[0].files[0]);
          reader.onload = function (e) {
            $(".thum" + thumNo).attr("src", e.target.result);
          };
        }
      });
      // 추가 이미지 삭제
      $(".thum-img-area").on("click", "i", function () {
        var fileId = $(this).prev().attr("class");
        $("#" + fileId).remove();
        $(this).parent().remove();
        
        //기존 추가이미지 수
        var toImg = thumChg.length;
        console.log("기존 추가이미지 수 : "+toImg);
        //삭제하려는 추가이미지 인덱스
        var index = fileId.substr(4);
        console.log("삭제이미지인덱스"+index);
        if(index <= toImg) {
        	thumChg[index-1] = 1;
        }
        
        if ($(".thum-img-area>div>div").length == 0) {
          $(".thum-img-area>div").text("추가 이미지를 등록해주세요");
        }
      });

    });
    // 메인 이미지 삭제
    function mainImgFileDel(i) {
      mainChg =1;
      $(i).parent().remove();
      
      var agent = navigator.userAgent.toLowerCase();
      //파일초기화 크로스 브라우징 
      if ((navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1)) {
        $("#mainImgFile").replaceWith($("#mainImgFile").clone(true));
      } else { //크롬 파폭 
        $("#mainImgFile").val("");
        $(".main-img-area>div").text("대표 이미지를 등록해주세요");
      }
    }
    // 파일 유효성 검사
    function validFileType(filename) {
      const fileTypes = ["png", "jpg", "jpeg"];
      return fileTypes.indexOf(filename.substring(filename.lastIndexOf(".") + 1, filename.length).toLowerCase()) >= 0;
    }
    function validFileSize(file) {
      if (file.size > 10000000) { //10MB
        return false;
      } else {
        return true;
      }
    }
    function validFileNameSize(filename) {
      if (filename.length > 30) { //30자
        return false;
      } else {
        return true;
      }
    }
    
 // 해시태그 
    $(function () {
      $("input[name=hashtagInput]").focusin(function () {
        if ($(this).val().trim() == "") {
          $(this).val("#");
        }
      });
      
      $("input[name=hashtagInput]").focusout(function () {
     	  	if ($(this).val().trim() != "#" && $(this).val().trim().substr(0,1) == "#" ) {
     	  		if($(".hashtag").length>7) {
  	   	  		alert("해시태그는 최대 8개까지 등록 가능합니다.");
     	  		}else if($(this).val().length>10) {
  	   	  		alert("해시태그는 최대 10글자까지 입력할 수 있습니다.");
     	  		}else {
  	   	  		$(".hashtag-area").append("<div class='hashtag'><span>" + $(this).val() + "</span><i class='fa fa-minus-square' aria-hidden='true'></i></div>");
     	  		}
          }
     	    $(this).val("");
     	 	return false;
      });
      $("input[name=hashtagInput]").keydown(function () {
    	  //backspace 막기 
          if ($(this).val() == "#" && event.keyCode === 8) {
            return false;
          }
      });
      
      $("input[name=hashtagInput]").keyup(function () {    
          //space  
          if (event.keyCode === 32 && $(this).val().trim() !== "#" && $(this).val().trim().substr(0,1) == "#") {
          	if($(".hashtag").length>7) {
  	   	  		alert("해시태그는 최대 8개까지 등록 가능합니다.");
     	  		}else if($(this).val().length>10) {
  	   	  		alert("해시태그는 최대 10글자까지 입력할 수 있습니다.");
     	  		}else {
  	   	  		$(".hashtag-area").append("<div class='hashtag'><span>" + $(this).val() + "</span><i class='fa fa-minus-square' aria-hidden='true'></i></div>");
     	  		}
          	$(this).val("#");
          	return false;
          }else  if (event.keyCode === 13 && $(this).val() != "#" && $(this).val().trim().substr(0,1) == "#") {
              //enter  
              if($(".hashtag").length>7) {
  	   	  		alert("해시태그는 최대 8개까지 등록 가능합니다.");
     	  		}else if($(this).val().length>10) {
  	   	  		alert("해시태그는 최대 10글자까지 입력할 수 있습니다.");
     	  		}else {
  	   	  		$(".hashtag-area").append("<div class='hashtag'><span>" + $(this).val() + "</span><i class='fa fa-minus-square' aria-hidden='true'></i></div>");
     	  		}
              $(this).val("#");
          	return false;
          }
          //특수문자 막기
          var regExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi;
          if (regExp.test($(this).val().substr(1))) {
          	$(this).val("#"+$(this).val().replace(regExp, ""));
          }
        });
        
      $(".hashtag-area").on("click", "i", function () {
        $(this).parent().remove();
      });
    });
    
    // 주소 검색 api 
    var geocoder = new kakao.maps.services.Geocoder();
    
     daumPost = () => {
      new daum.Postcode({
        oncomplete: function (data) { //선택시 입력값 세팅
          $("input[name=addressDefault]").val(data.address);
          $("input[name=addressDetail]").focus();
          $("input[name=latitude]").val();
          $("input[name=longitude]").val();
          geocoder.addressSearch(data.address, callback);  
        }
      }).open();
    }
    
    var callback = function(result, status) {
    	if (status === kakao.maps.services.Status.OK) {
    		$("input[name=longitude]").val(result[0].x); // 경도
    		$("input[name=latitude]").val(result[0].y);  // 위도
    	}
    };
    
    // 공간 등록 유효성 검사
    $(function () {
      $("#spInsertForm input").not("input[name=hashtagInput]").keydown(function () {
        if (event.keyCode === 13) {
          event.preventDefault();
          valichk();
        }
      });
    });

       valichk= () => {
    	   
      	if($("input[name=spaceTitle]").val().trim() == "") {
  			alert("공간 이름을 입력해주세요.");
  			$("input[name=spaceTitle]").focus();
  			return false;
  		}
      	if($("input[name=stypeNo]:radio:checked").length < 1){
      		alert("공간 타입을 선택해 주세요.");
      		return false;
      	}
    	if($("textarea[name=spaceInfo]").val() == "") {
    		alert("공간 소개를 입력해주세요.");
    		$("textarea[name=spaceInfo]").focus();
  			return false;
  		}
    	if($("input[name=hourPrice]").val().trim() == "") {
  			alert("1시간당 대여금액을 입력해주세요.");
  			$("input[name=hourPrice]").focus();
  			return false;
  		}
    	if($("input[name=maxPeople]").val().trim() == "") {
  			alert("최대 수용인원을 입력해주세요.");
  			$("input[name=maxPeople]").focus();
  			return false;
  		}
    	if($("input[name=openTime]").val().trim() == "") {
  			alert("운영 시작시간을 입력해주세요.");
  			$("input[name=openTime]").focus();
  			return false;
  		}
    	if($("input[name=closeTime]").val().trim() == "") {
  			alert("운영 종료시간을 입력해주세요.");
  			$("input[name=closeTime]").focus();
  			return false;
  		}
    	
    	//메인이미지 변경했을경우
   		if (mainChg ==1 && $("#mainImgFile").val().trim() == "") {
               alert("대표 이미지를 첨부해주세요.");
               return false;
        }
    	
    	if ($("input[name=addressDefault]").val().trim() == "") {
            alert("주소를 입력해주세요.");
            $("input[name=addressDefault]").focus();
            return false;
        }
    	if ($("input[name=addressDetail]").val().trim() == "") {
            alert("주소를 입력해주세요.");
            $("input[name=addressDetail]").focus();
            return false;
        }
    	if ($("input[name=tel]").val().trim() == "") {
            alert("연락처를 입력해주세요.");
            $("input[name=tel]").focus();
            return false;
        }
    	
    	// 숫자 유효성 검사
     	var regExp = /^[0-9]+$/;
    	
     	if(!regExp.test($("input[name=hourPrice]").val())) {
           alert("대여금액은 숫자만 입력 가능합니다.");
           $("input[name=hourPrice]").focus();
           return false;
       }
     	if(!regExp.test($("input[name=maxPeople]").val())) {
            alert("최대 수용인원은 숫자만 입력 가능합니다.");
            $("input[name=maxPeople]").focus();
            return false;
        }
     	if(!regExp.test($("input[name=openTime]").val())) {
     		alert("시작시간은 숫자만 입력 가능합니다 .");
           $("input[name=openTime]").focus();
           return false;
       }
     	if(!regExp.test($("input[name=closeTime]").val())) {
     		alert("종료시간은 숫자만 입력 가능합니다 .");
           $("input[name=closeTime]").focus();
           return false;
       }
     	
     	 var openTime = $("input[name=openTime]").val();
     	var closeTime = $("input[name=closeTime]").val();
     	
     	if(parseInt(openTime) >= parseInt(closeTime)) {
  			alert("운영 종료시간은 시작 시간보다 같거나 빠를 수 없습니다.\n다시 입력해주세요.");
  			$("input[name=closeTime]").focus();
  			return false;
  		}
     	//해시태그 합치기
     	var hashtag = [];
     	$(".hashtag>span").each(function() {
     		hashtag.push($(this).text().substr(1).trim());
     	});
     	
     	if($(".hashtag>span").length != 0) {
     		$("input[name=hashtag]").val(hashtag.join(","));
     	}     
     	$("input[name=mainChg]").val(mainChg);
     	$("input[name=thumChg]").val(thumChg.join(","));
     	
     	$('#spaceInsertModal').modal('show');
      }
       spaceSubmit = () => {
    	   $("#spInsertForm").submit();
       }
    	
    
  </script>
	
</body>
</html>