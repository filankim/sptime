<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>header</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- jquery 온라인 방식 -->
<!-- jquery datepicker-->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css" />
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<!-- Popper JS -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<!--아이콘-->
<script src="https://kit.fontawesome.com/c7bfbb0e5b.js"
	crossorigin="anonymous"></script>
<link rel='stylesheet'
	href='http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css'>

<!-- font awesome icon css -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">

<!-- summernote css/js-->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

<!-- SOCKJS -->
<script
	src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

<script src="resources/js/main.js"></script>

<!-- 해피톡 관리자-고객 1대1 채팅 -->
<script>
	    var ht = null;
	    (function(id, scriptSrc, callback) {
	        var d = document,
	            tagName = 'script',
	            $script = d.createElement(tagName),
	            $element = d.getElementsByTagName(tagName)[0];
	
	        $script.id = id;
	        $script.async = true;
	        $script.src = scriptSrc;
	
	        if (callback) { $script.addEventListener('load', function (e) { callback(null, e); }, false); }
	        $element.parentNode.insertBefore($script, $element);
	    })('happytalkSDK', 'https://design.happytalkio.com/sdk/happytalk.chat.v2.min.js', function() {
	        ht = new Happytalk({
	          siteId: '5000100385',
	          siteName: 'SpaceTime',
	          categoryId: '154917',
	          divisionId: '154918'
	      });
	    });
	</script>

<style>

/*
        body {
            font-family: 'Lato', sans-serif;
        }
        */
/* 폰트 */
body {
	font-family: 'Noto Sans KR', sans-serif !important;
}

body * {
	box-sizing: border-box;
}

.wrap {
	position: relative;
	width: 100%;
	min-width: 1000px;
	overflow: hidden;
}

/* ---------- header ---------- */
.header {
	width: 100%;
	min-width: 900px;
	/*border-bottom: 1px solid black;*/
	box-sizing: border-box;
	/*             box-shadow: 0 0 10px rgba(0, 0, 0, 0.55); */
	position: fixed;
	top: 0;
	left: 0;
	background-color: white;
	z-index: 9;
}

.header>div {
	float: left;
	height: 80px;
}

#logo {
	position: relative;
	width: 90px;
}

#logo>img {
	position: absolute;
	margin: auto;
	top: 0;
	bottom: 0;
	left: 20px;
	right: 0;
	width: 50px;
	height: 50px;
	cursor: pointer;
}

#home_btn {
	font-size: 35px;
}

#home_btn>span {
	line-height: 78px;
	cursor: pointer;
}

#m_search_btn {
	padding-left: 80px;
	color: #FFB200;
	font-size: 30px;
	line-height: 78px;
}

#m_search_btn i {
	cursor: pointer;
}

#m_search_bar {
	line-height: 78px;
	padding-left: 10px;
}

#m_search_bar input {
	width: 400px;
	height: 45px;
	padding: 0 10px;
	outline: none;
	border: 1px solid lightgray;
	border-radius: 30px;
}

#menu_btn {
	float: right;
	color: #FFB200;
	font-size: 40px;
	line-height: 78px;
	width: 100px;
	text-align: center;
}

#menu_btn i {
	cursor: pointer;
}
/* ---------- ---------- */
/* ---------- main ---------- */
.main {
	min-height: calc(100vh - 325px);
	margin-top: 90px;
}

/* ---------- 슬라이드 메뉴 ---------- */
#overlay {
	background: #000;
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
	z-index: 8;
	-webkit-transition: all 0.5s ease-in-out;
	-moz-transition: all 0.5s ease-in-out;
	transition: all 0.5s ease-in-out;
}

#overlay.slideon {
	opacity: 0.65;
	visibility: visible;
	-webkit-transition: all 0.5s ease-in-out;
	-moz-transition: all 0.5s ease-in-out;
	transition: all 0.5s ease-in-out;
}

#main-slidemenu {
	position: fixed;
	width: 400px;
	height: 100vh;
	top: 0;
	right: -400px;
	z-index: 11;
	background-color: white;
	-webkit-transition: right .4s;
	-moz-transition: right .4s;
	-ms-transition: right .4s;
	-o-transition: right .4s;
	transition: right .4s;
}

#main-slidemenu.slideon {
	right: 0;
}

#profile_dv {
	overflow: hidden;
	background-color: #FFB200;
	position: relative;
}

#profile_dv i {
	position: absolute;
	font-size: 30px;
	font-weight: 600;
	right: 20px;
	top: 20px;
	cursor: pointer;
	color: rgb(96, 155, 204);
}

#profile_tb {
	width: 80%;
	margin: 20px auto;
}

/* 프로필 이미지 크기 */
#profile-img {
	border: 2px solid #ffc43a;
	border-radius: 100%;
	width: 90px;
	height: 90px;
	background-color: whitesmoke;
}

#profile_tb td {
	padding: 0;
	height: 60px;
}

#profile_tb tr:nth-child(1)>td:nth-child(1) {
	width: 40%;
	text-align: center;
}

#profile_tb tr:nth-child(1)>td:nth-child(2) {
	font-size: 20px;
	font-weight: 600;
	padding-top: 20px;
}

#profile_tb tr:nth-child(2)>td {
	font-size: 14px;
	font-weight: 600;
	padding-bottom: 10px;
}

#profile_tb tr:nth-child(2)>td>a {
	text-decoration: none;
	color: black;
}

#profile_tb tr:nth-child(2)>td>:hover {
	text-decoration: underline;
}

#my_menubtn {
	height: 150px;
	background-color: rgb(96, 155, 204);
	text-align: center;
	font-size: 40px;
	margin: auto;
	overflow: hidden;
}

#my_menubtn_tb {
	width: 100%;
	margin: 30px auto;
	color: white;
}

#my_menubtn_tb i {
	font-size: 60px;
}

#my_menubtn_tb td {
	padding: 0;
}

#my_menubtn_tb tr:nth-child(1)>td {
	text-align: center;
}

#my_menubtn_tb tr:nth-child(1)>td>a {
	text-decoration: none;
	color: white;
}

#my_menubtn_tb tr:nth-child(1)>td>a:hover {
	text-decoration: underline;
}

#my_menubtn_tb tr:nth-child(2)>td {
	font-size: 15px;
	font-weight: 500;
	padding-bottom: 10px;
}

#my_menubtn_tb tr:nth-child(2)>td>a {
	text-decoration: none;
	color: white;
}

#my_menubtn_tb tr:nth-child(2)>td>a:hover {
	text-decoration: underline;
}

.com_infobox>ul:nth-child(1) {
	border-bottom: 3px solid #EDEDED;
}

.com_infobox>ul:nth-child(2) li {
	border-bottom: 1px solid #EDEDED;
	font-size: 15px;
	font-weight: 400;
	padding: 15px 0;
	text-align: center;
	color: grey;
}

.com_infobox>ul:nth-child(1) {
	border-bottom: 2px solid #EDEDED;
}

.com_infobox>ul {
	padding: 10px 0;
	margin-bottom: 0px;
}

.com_infobox>ul:nth-child(2) {
	padding: 0;
}

.com_infobox>ul>li {
	border-bottom: 1px solid #EDEDED;
	display: block;
	font-size: 15px;
	font-weight: bold;
	letter-spacing: 0.12em;
	line-height: 45px;
	text-transform: uppercase;
	padding-left: 30px;
}

.com_infobox ul a {
	color: black;
}

.com_infobox>ul:nth-child(2) li:last-child {
	border-bottom: 1px solid #EDEDED;
}

.com_infobox>ul:nth-child(2) li:hover {
	background-color: #EEEEEE;
	cursor: pointer;
	font-size: 18px;
}

.com_infobox ul li:last-child {
	border: 0;
}

.service-info-ul {
	padding-left: 10px;
	display: none;
}

.service-info-ul>li {
	border-bottom: 1px solid #EDEDED;
	display: block;
	font-size: 15px;
	font-weight: bold;
	letter-spacing: 0.12em;
	line-height: 45px;
	text-transform: uppercase;
}

.service-info-ul>li>a {
	color: grey;
	font-weight: 200;
}

.sign-up {
	background: rgb(39, 123, 192);
	color: #FFF;
	font-family: 'Abel', sans-serif;
	font-size: 16px;
	font-weight: bold;
	height: 80px;
	letter-spacing: 1px;
	line-height: 70px;
	overflow: hidden;
	text-align: center;
	width: 100%;
	position: absolute;
	bottom: 0;
}

.sign-up:hover {
	background: rgb(213, 229, 243);
	color: rgb(39, 123, 192);
	cursor: pointer;
}
/*
        .sign-up a {
            display: block;
        }
        */
.sign-up span {
	margin: 0 auto 0 8px;
}

.sign-up>a {
	color: white;
	width: 100%;
	height: 100%;
	display: inline-block;
	text-decoration: none;
	padding-top: 5px;
	font-size: 20px;
}

.sign-up>a:hover {
	color: rgb(39, 123, 192);
}
/* -------------------- */

/* 알람 css */
#socketAlarmArea {
	position: fixed;
	bottom: 0;
	right: 0;
	background-color: transparent;
	z-index: 11;
	-webkit-transition: right 0.7s;
	-moz-transition: right 0.7s;
	-ms-transition: right 0.7s;
	-o-transition: right 0.7s;
	transition: right 0.7s;
}

.toast {
	background-color: #FCF9BE;
	margin: 25px 20px;
	overflow: hidden;
	width: 300px;
	height: 100px;
	position: relative;
}

.toast i {
	position: absolute;
	right: 7px;
	top: 7px;
	font-size: 17px;
	cursor: pointer;
	color: #434242;
}

.toast-body {
	padding: 0;
	height: 100%;
}

.toast-body>div {
	float: left;
	height: 100%;
}

.toast-left {
	width: 25%;
	position: relative;
}

.toast-right {
	width: 75%;
}

.toast-left img {
	position: absolute;
	margin: auto;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	width: 50px;
	height: 50px;
	background-color: white;
}

.toast-right div:nth-child(1) {
	font-size: 12px;
	height: 45%;
	padding-top: 12px;
	padding-right: 15px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.toast-right div:nth-child(2) {
	height: 55%;
	padding-right: 5px;
}

#autoCompleteContainer {
	display: none;
	border: 1px solid lightgrey;
	border-radius: 15px;
	height: 200px;
	overflow-y: scroll;
	background-color: white;
	margin-top: -16.5px;
	z-index: 999;
}

.autoCompleteUl {
	height: 30px;
}

.autoCompleteContent {
	border-bottom: 1px solid lightgrey;
	font-size: 15px;
	height: 30px;
	list-style: none;
	line-height: 20px;
	padding-left: 0px;
}

.autoCompleteContent :hover {
	cursor: pointer;
	z-index: 1000;
}

/* -------------------- */
</style>
</head>
<body>
</head>
<body>

	<c:if test="${ not empty alertMsg }">
		<script>
			alert("${alertMsg}");
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>
	<!--헤더-->
	<div class="header">
		<button id="testBtn4" style="display: none;">토스트</button>
		<div id="logo">
			<img src="resources/images/logo.png">
		</div>
		<script>
			$(function() {
				$("#logo").click(function() {
					location.href="/";
				})
			})
		</script>
		<div id="home_btn">
			<span style="color: #277BC0;">S</span><span>pace</span><span
				style="color: #FFB200;">T</span><span>ime</span>
		</div>
		<div id="m_search_btn">
			<i class="fa fa-search" aria-hidden="true"></i>
			<!-- <button id="keywordSubmit" type="submit" style="background-color: white; color: rgb(255,178,2); border:none;"><i class="fa fa-search" aria-hidden="true"></i></button> -->
		</div>
		<div>
			<div id="m_search_bar">
				<form id="searchInputForm" action="searchSpaceList.mp" method="get">
					<input type="search" id="searchInput" name="pureKeyword" placeholder=" '#' 입력 시 해시태그 검색이 가능해요!" required> <!-- placeholder=" '#' 입력 시 해시태그 검색이 가능해요!" -->
				</form>
				<div id="autoCompleteContainer"></div>
			</div>
		</div>
		<div id="menu_btn">
			<i class="fa fa-bars" aria-hidden="true" data-toggle="modal"
				data-target="#main-menu-Modal"> </i>
		</div>
	</div>

	<script>
    document.querySelector("#m_search_btn").onclick = () => {
        location.href="searchSpaceList.mp";
    }
   
    //검색어 자동완성기능에 필요한 변수
    var autoCompleteContainer = document.querySelector("#autoCompleteContainer");
    var autoCompleteContent = document.querySelector(".autoCompleteContent");
    var autoCompleteUl = document.querySelector("#autoCompleteUl");
    var searchInput = document.querySelector("#searchInput");
    var inputValue = "";
    
    searchInput.addEventListener("keyup", (e) => {
        inputValue = searchInput.value;
        
        if(e.keyCode == 13){
           	searchStart(searchInput.value);
        }
        
        //입력 시 하단 자동완성 박스 생성
        if(searchInput.value == ""){
        	autoCompleteContainer.style.display = "none";
        } else {
        	autoCompleteContainer.style.display = "block";
        }
        
        //"#"입력여부 확인하여 해시태그자동완성-일반자동완성 변환
        if(searchInput.value.startsWith("#") == true){
            hashtagAutoComplete(searchInput.value);
            autoCompleteListShowUp(words, searchInput.value);
        } else if(searchInput.value != null) {
            autoComplete(searchInput.value);
            autoCompleteListShowUp(words, searchInput.value);
        }
        
        //다른 곳 클릭 시 창 사라지기
        if(searchInput.value === "") {		// 입력창이 비었다면 추천 검색어 리스트 숨김
 	      autoCompleteContainer.classList.add("hide");	
 	    } else {
 	    	autoCompleteContainer.classList.remove("hide");
 	    }
        /* window.addEventListener("click", (e) => {
            if(e.target != autoCompleteContainer){
            	autoCompleteContainer.style.display = "none";
            } else if(autoCompleteContainer.style.display = "none" && e.target == searchInput) {
            	if(e.target == searchInput || e.target == autoCompleteContainer)
            		autoCompleteContainer.style.display = "block";
            }
        }) */
    });
    
    
    document.querySelector("#m_search_btn").onclick = () => {
    	searchStart(inputValue);
    }
    
    //엔터 혹은 검색클릭 시 검색 시작
    function searchStart(pureKeyword){
    	document.querySelector("#searchInputForm").submit();
 	}
    
	$(document).on("click", ".autoCompleteContent", function(){
		if(searchInput.value.startsWith("#") == true){
			console.log("hi");
		} else {
			searchStart(this.innerHTML);
		}
	});
    
	</script>
	<!-- 슬라이드 메뉴 -->
	<div id="overlay"></div>
	<div id="main-slidemenu">
		<div id="profile_dv">
			<c:choose>
				<c:when test="${empty loginMember}">
					<table id="profile_tb">
						<!-- 로그인 전 -->
						<tr>
							<td rowspan="2"><img id="profile-img"
								src="resources/images/profile_default.png"></td>
							<td><a href="enrollLogin.me">로그인 및 회원가입</a></td>
						</tr>

					</table>
					<script>
                        $(function() {
                            $("#profile_tb tr:nth-child(1)>td:nth-child(2)").css("padding-top", "0").css("font-weight","400");
                            $("#profile_tb tr:nth-child(1)>td:nth-child(2)>a").css("text-decoration", "none").css("color", "whitesmoke");
                        })
                    </script>
				</c:when>
				<c:otherwise>
					<table id="profile_tb">
						<!-- 로그인 후 -->
						<tr>
							<td rowspan="2"><img id="profile-img"
								src="${loginMember.profilePath}"></td>
							<td>${ loginMember.memName }님</td>
						</tr>
						<tr>
							<td><a href="myPage.me">프로필 관리 및 수정</a></td>
						</tr>
					</table>
					<c:if test="${empty loginMember.profilePath}">
						<script>
                            $(function() {
                                $("#profile-img").attr("src", "resources/images/profile_default.png");
                            })
                        </script>
					</c:if>
				</c:otherwise>
			</c:choose>
			<i class="fa fa-angle-double-right" aria-hidden="true"></i>
		</div>
		<div id="my_menubtn">
			<table id="my_menubtn_tb">
				<c:choose>
					<c:when test="${loginMember.memNo == 1}">
						<tr>
							<td><a href="schart.ad"><i
									class="fa-sharp fa-solid fa-list-check"></i></a></td>
						</tr>
						<tr>
							<td><a href="schart.ad">관리자 페이지로</a></td>
						</tr>

					</c:when>
					<c:otherwise>
						<tr>
							<td><a href="myReserve.re"><i
									class="fa-solid fa-person-walking-luggage"></i></a></td>
							<td><a href="list.re"><i class="fa-solid fa-user-pen"></i></a></td>
							<td><a href="mypagebookmark.sp"><i
									class="fa-solid fa-heart"></i></a></td>
						</tr>
						<tr style="font-size: 15px;">
							<td><a href="myReserve.re">예약내역</a></td>
							<td><a href="list.re">리뷰내역</a></td>
							<td><a href="mypagebookmark.sp">찜한내역</a></td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
		</div>

		<div class="com_infobox">
			<ul>
				<li><a href="/spacetime">홈으로</a></li>
				<li><a href="list.no">공지사항</a></li>
				<li><a href="list.ne">뉴스레터</a></li>
				<c:if test="${!empty loginMember}">
					<li><a href="note.me">채팅방</a></li>
				</c:if>
				<li><a onclick="openServieInfo()" style="cursor: pointer;">서비스정보</a>
					<ul class="service-info-ul">
						<li><a href="introduction.co">서비스 소개</a></li>
						<li><a href="userAgreement.co">이용약관</a></li>
						<li><a href="privacyPolicy.co">개인정보처리방침</a></li>
						<li><a href="managementPolicy.co">운영정책</a></li>
						<li><a href="report.co">신고함</a></li>
					</ul></li>
			</ul>
			<c:if test="${!empty loginMember}">
				<ul>
					<li onclick="location.href='logout.me'">로그아웃</li>
				</ul>
			</c:if>
		</div>
		<div class="sign-up">
			<a>호스트신청하기</a>
		</div>
	</div>
	<!-- 정산계좌정보 입력 모달창 -->
	<div class="modal fade" id="hostRequest">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">호스트 신청 - 정산계좌 등록</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<form action="hostRequest.me" method="post" name="insertForm"
					onsubmit="return check_submit();">
					<div class="modal-body">
						<table>
							<tr>
								<th style="width: 30%;" required>은행명</th>
								<td><select id=bankid name="bankName"
									class="bank form-control mb-2">
										<option value="" selected>은행명</option>
										<!-- 은행명이 선택된경우 안넘어가게 자바스크립트로 -->
										<option value="KB국민은행">KB국민은행</option>
										<option value="신한은행">신한은행</option>
										<option value="IBK기업은행">IBK기업은행</option>
										<option value="우리은행">우리은행</option>
										<option value="KEB하나은행">KEB하나은행</option>
										<option value="SC제일은행">SC제일은행</option>
										<option value="NH농협">NH농협</option>
										<option value="새마을금고">새마을금고</option>
										<option value="씨티은행">씨티은행</option>
										<option value="한국산업은행">한국산업은행</option>
										<option value="케이뱅크">케이뱅크</option>
										<option value="카카오뱅크">카카오뱅크</option>
										<option value="우체국">우체국</option>
										<option value="수협은행">수협은행</option>
										<option value="KDB산업은행">KDB산업은행</option>
										<option value="광주은행">광주은행</option>
										<option value="부산은행">부산은행</option>
								</select></td>
							</tr>
							<tr>
								<th>계좌번호</th>
								<td><input type="text" name="accountNum"
									class="form-control mb-2" placeholder="계좌번호 입력(- 제외)" required
									oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></td>
							</tr>
							<tr>
								<th>예금주명</th>
								<td><input type="text" name="memName"
									class="form-control mb-2" id="test2" placeholder="실명(예금주명)만 입력"
									required onkeyup="chk_han('test2')"></td>
								<!-- 현재로그인한회원의 이름 == 실명이 일치할경우만 넘어가게 자바스크립트로 -->
							</tr>
						</table>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="submit" class="btn btn btn-primary"
							onClick="hostCalList.re">신청</button>
						<!-- <button type="reset" class="btn btn btn-secondary">취소</button>   -->
					</div>
				</form>
			</div>
		</div>
	</div>

	<script>
	//정산 모달 오픈
		function openBankModal() {
			$("#hostRequest").modal("show");	
		}

        $(function () {
          $("#logo").click(function() {    			
     			location.href = "/spacetime";
     	  });
          $("#home_btn span").click(function() {    			
    			location.href = "/spacetime";
    	  });
        	
          $("#menu_btn>i").click(function () {
            //버튼 클릭 시
            $("#main-slidemenu").addClass("slideon");
            $("#overlay").addClass("slideon");
          });
          $("#overlay").click(function () {
            $("#main-slidemenu").removeClass("slideon");
            $("#overlay").removeClass("slideon");
          });
          $("#profile_dv>i").click(function () {
            $("#main-slidemenu").removeClass("slideon");
            $("#overlay").removeClass("slideon");
          });
        });
         
        function check_submit() 
         { 
          if($("#bankid").val() ==""){ 
          alert("은행명을 선택해주세요."); 
          
          return false; }
        
        if($("input[name=memName]").val() != "${loginMember.memName}"){ 
              alert("본인이름을 입력해주세요."); 
              
              return false; }	
        } 
        
        function chk_han(test2) {
			var regexp = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
			var value = $("#"+test2).val();
			if (regexp.test(value)) {
				$("#"+test2).val(value.replace(regexp,''));
				alert ("한글만 입력이 가능합니다.");
			}
		}
        
        openServieInfo = () => {
        	if($(".service-info-ul").css("display") == "none") { 
                
        		$(".service-info-ul").slideDown(500);

            } else {
                $(".service-info-ul").slideUp(500);
            }
        }
        
        $('.modal').on('hidden.bs.modal', function (e) {
            console.log('modal close');
          $(this).find('form')[0].reset()
        });
    </script>
	<c:choose>
		<c:when test="${ empty loginMember }">
			<script>
                $(".sign-up>a").text("로그인 / 회원가입");
                $(".sign-up>a").attr("href","enrollLogin.me");
            </script>
		</c:when>
		<c:when test="${loginMember.hostStatus eq 'Y'}">
			<script>
	     		$(".sign-up>a").text("호스트 페이지로");
	     		$(".sign-up>a").attr("href","revHostList.re");
	     	</script>
		</c:when>
		<c:otherwise>
			<script>
	     		$(".sign-up>a").text("호스트 신청하기");
	     		$(".sign-up>a").attr("onclick","openBankModal()"); 
	     	</script>
		</c:otherwise>
	</c:choose>

	<!-- 정현 스크립트 -->
	<c:if test="${!empty loginMember}">
		<script>	
	let toastCount = 0;
	var sock = new SockJS("http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/space.sc");

	sock.onmessage = onMessage;
	sock.onclose = onClose;
	sock.onopen = onOpen;
	
	function sendMessage(msgType, receiverId, message, messageDate, roomNo) {
		var msg = {
				msgType : msgType,
				senderNo : "${loginMember.memNo}", 
				senderName : "${loginMember.memName}",
				profilePath : "${loginMember.profilePath}",
				senderId : "${loginMember.memId}",
				receiverId : receiverId, 
				message : message,
				messageDate : messageDate,
				roomNo : roomNo
		};
		sock.send(JSON.stringify(msg));
	}
   		//메시지 수신
   	   		function onMessage(msg) {
   	   			var data = msg.data; // 전달 받은 데이터
   	   			
   	   			socketData = JSON.parse(data); 
   	   	        
   	   			if(socketData.msgType == "chat" && $("#chatTb").length > 0) {
   	  						var str=""
   	  		   				str +=  "<tr id='chatRoom-"+socketData.senderNo+"-${loginMember.memNo}' onclick='chatModalOpen(this)'>";
   	  		   				str +=  "<td>";
   	  		   				if(socketData.profilePath == "") {
   	  					    	  str+= "<img src='resources/images/logo.png' 	 >";
   	  					      }else {
   	  					    	  str+= "<img src='"+socketData.profilePath+"' class='rounded-circle'	 >";
   	  					      }
   	  		   				str +=  "</td>";
   	  		   				str +=  "<td>"+socketData.senderName+"</td>";   				
   	  		   				str +=  "<td>"+socketData.message+"</td>";   				
   	  		   				str +=  "<td>"+socketData.messageDate+"</td>";   	
   	  		   				str += "<input type='hidden'  value='"+socketData.senderNo+"'>"
   	  		   				str += "<input type='hidden'  value='"+socketData.senderId+"'>"
   	  		   				str += "<input type='hidden'  value='"+socketData.roomNo+"'>"
   	  		   				str +=  "</tr>";
   	  		   				
   	  		   				if($("#noChatTd").length > 0) {
   	  		   					$("#noChatTd").remove();
   	  		   				}   			
   	  		   				$("#chatTb #chatRoom-"+socketData.senderNo+"-${loginMember.memNo}").remove();
   	  		   				$("#chatTb tbody").prepend(str);
   	   			}
   	   			
   	   			if(socketData.msgType == "chat" && $("#chattingModal #chatView-"+socketData.senderNo+"-${loginMember.memNo}").length > 0) {
   	   				
   	   				var str=""
   	   				str+= "<div class='sender'><div>";
   					
   					if(socketData.profilePath == "") {
   				    	  str+= "<img src='resources/images/logo.png' 	 >";
   				      }else {
   				    	  str+= "<img src='"+socketData.profilePath+"' class='rounded-circle'	 >";
   				      }
   					str+= "</div><div class='sender-con'>";
   					str+= "<div class='sname'>"+socketData.senderName+"</div>";
   					str+= "<div class='scontent-area'>";
   					str+= "<div class='srealcontent'>"+socketData.message+"<div class='sdate'>"+socketData.messageDate+"</div></div></div></div></div>";
   					$("#chattingModal #chatView-"+socketData.senderNo+"-${loginMember.memNo}").append(str);
   					$("#chattingModal #chatView-"+socketData.senderNo+"-${loginMember.memNo}").scrollTop($("#chattingModal .modal-body")[0].scrollHeight);
   	   				
   	   			}

   	   				toastCount++;
   	   		   	    let toast;
   	   	   			
   	   			    toast = "<div class='toast toast-" + toastCount + "' data - autohide='false' > "; 	
   	   			    toast += "<i class='fa fa-times' aria-hidden='true' data-dismiss='toast'></i>";
   	   	   	        toast += "<div class='toast-body'>"
   	   	   	        toast += "<div class='toast-left'>"
   		   	   	    if(socketData.profilePath == "") {
   		   	   	 		toast += "<img src='resources/images/logo.png' >"   
   				    }else {
   				    	toast += "<img src='"+socketData.profilePath+"' class='rounded-circle' >"   
   				    }
   	   	   	        toast += "</div>"
   	   	   	        toast += "<div class='toast-right'>"
   	   	   	  		if(socketData.msgType == "chat" ) {
   		   	   		    toast += "<div></div>"  
   		   	 	     	toast += "<div class='chat' style='cursor:pointer;'>"+socketData.senderName+"님이 메시지를 보내셨습니다.</div>"
   	   	   	  		}
		   	   	   	else if(socketData.msgType == "reserve" ) {
				   	   	toast += "<div>"+socketData.message+"</div>"   		   	   		
				   	   	toast += "<div class='reserve' style='cursor:pointer;'>"+socketData.senderName+"님이 예약하셨습니다.</div>"   	  
			   	   	}
			   	  		else if(socketData.msgType == "review" ) {
				   	   	toast += "<div>"+socketData.message+"</div>"   
				   	   	toast += "<div class='review' style='cursor:pointer;'>"+socketData.senderName+"님이 후기를 남겼습니다.</div>"   	
			   	   	}
			   	  	else if(socketData.msgType == "spStatusUpdate" ) {
				   	   	toast += "<div>"+socketData.message+"</div>"   
				   	   	toast += "<div class='spStatusUpdate' style='cursor:pointer;'>공간 검수가 끝났습니다.</div>"   	
		   	 	  	}
			   		else if(socketData.msgType == "revconfirm" ) {
				   	   	toast += "<div>"+socketData.message+"</div>"   
				   	   	toast += "<div class='revconfirm' style='cursor:pointer;'>예약이 확정되었습니다.</div>"   	
		   	 	  	}
			   		else if(socketData.msgType == "revreject" ) {
				   	   	toast += "<div>"+socketData.message+"</div>"   
				   	   	toast += "<div class='revreject' style='cursor:pointer;'>예약이 취소되었습니다.</div>"   	
		   	 	  	}
   	   	   	        
   	   	   	        
   	   	    		toast += "</div></div></div>"
   	   			
   		   	        $("#socketAlarmArea").append(toast);
   	   	   	        $(".toast-" + toastCount).toast({ animation: true, delay: 10000 });
   	   	   	        $(".toast-" + toastCount).toast("show");
   	   	   	        $("#socketAlarmArea").addClass("slideon");
   	   			
   	   		}
   		//아웃
   		function onClose(evt) {
   			console.log("연결 끊김");
   		}
   		//인
   		function onOpen(evt) {
   			console.log("연결 인");
   			
   		}
   		$(function() {
   			$("#socketAlarmArea").on("click", ".chat", function() {
   				location.href="note.me";
   			});
   			$("#socketAlarmArea").on("click", ".reserve", function() {
   				location.href="revHostList.re";
   			});
			$("#socketAlarmArea").on("click", ".review", function() {
				location.href="hostRvwList.rv";
   			});
			$("#socketAlarmArea").on("click", ".spStatusUpdate", function() {
				location.href="hostSpaceList.sp";
   			});
			$("#socketAlarmArea").on("click", ".revreject, .revconfirm", function() {
				location.href="myReserve.re";
   			});
   		});
</script>
		<!-- 정현 스크립트  끝-->
	</c:if>
	<div id="socketAlarmArea"></div>
</body>
</html>



