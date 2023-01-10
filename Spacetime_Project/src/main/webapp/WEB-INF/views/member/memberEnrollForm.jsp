<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>

	/*div { border: 1px black solid; }*/
	#header_area { height: 80px; }
	#content { 
		width: 100%;
		height: 1050px; 
	}
	
	#content>div { height: 100%; float: left;}
	
	#content_1, #content_3 { width: 15%; }
	#content_2 { width: 70%; }
	/* ----------------------------- */
	
	/* insertMember */
	#content { height: 1300px; }
    #content_2 { position: relative; }
    #content_2>#join_form { width: 50%; height: 80%; }
    #join_form { 
        padding: 20px;
        position: absolute; 
        margin: auto;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
    }

    #join-area>input, #join-area>select { 
        width: 100%; 
        margin-top: 10px; 
        height: 50px;   
    }

	#emailConfirm {
		display:none;
	}

    #birthday-area>input, #birthday-area>select { 
        width: 32%; 
        height:50px; 
        display: table-cell;
        table-layout: fixed;
        vertical-align: middle;
    }

    .error_next_box { 
        font-family: Dotum,'돋움',Helvetica,sans-serif;
        -webkit-text-size-adjust: none;
        display: none;
        margin: 9px 0 -2px;
        font-size: 12px;
        line-height: 14px;
        color: red;
    }

    .agree-box {
        line-height: 18px;
        margin: 0;
        padding: 0;
        border: 0;
        font-size: 100%;
        vertical-align: middle;
    }

    ul { 
        line-height: 18px;
        margin: 0;
        padding: 0;
        border: 0;
        font-size: 100%;
        vertical-align: middle;
        list-style: none;
    }

    li {
        line-height: 18px;
        list-style: none;
        margin: 0;
        padding: 0;
        border: 0;
        vertical-align: middle;
        position: relative;
        font-size: 13px;
        margin-top: 0;
    }

    .ltype>label {
        display: inline-block;
        padding: 0 0 0 20px;
        cursor: pointer;
        color: #000;
        text-decoration: underline;
    }

    #join_form button {
        display: block;
        width: 100%;
        height: 48px;
        margin-top: 24px;
        background: #FFB200;
        color: #000;
        font-size: 14px;
        line-height: 38px;
        border: 0;
    }

    .layer_popup, .layer_popup2 {
        line-height: 18px;
        padding: 0;
        border: 0;
        font-size: 100%;
        vertical-align: middle;
        display: block;
        z-index: 150;
        padding-top: 51px;
        text-align: center;
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        margin: 0;
        width: auto;
        overflow: auto;
        display:none;
    }

    .popup_wrap {
        line-height: 18px;
        text-align: center;
        margin: 0;
        padding: 0;
        border: 0;
        font-size: 100%;
        position: relative;
        display: inline-block;
        vertical-align: middle;
        width: 700px;
        padding: 25px 15px 15px;
        border-radius: 6px;
        background-color: #f6f6f6;
    }

    .agreements-content {
        line-height: 18px;
        margin: 0;
        padding: 0;
        border: 0;
        font-size: 100%;
        vertical-align: middle;
        text-align: left;
        height: 550px;
        overflow-y: scroll;
    }

    .heading_agree {
        line-height: 18px;
        text-align: left;
        margin: 0;
        border: 0;
        font-size: 100%;
        vertical-align: middle;
        position: relative;
        padding: 0 140px 15px 0;
        padding-top: 15px;
        padding-right: 0;
    }

    .heading_agree>h3 {
        line-height: 18px;
        text-align: left;
        margin: 0;
        padding: 0;
        border: 0;
        vertical-align: middle;
        padding-bottom: 11px;
        display: inline-block;
        font-size: 20px;
        color: #000;
        font-weight: 800;
    }

    .agree_wrap {
        text-align: left;
        margin: 0;
        border: 0;
        font-size: 100%;
        vertical-align: middle;
        position: relative;
        border-top: 1px solid #656565;
        border-bottom: 1px solid #ccc;
        padding: 13px 0 15px;
        line-height: 19px;
    }

    .agree_wrap>dl {
        line-height: 26px;
        padding: 10px 0;
    }

    .agree_wrap>dl>dt {
        color: #277BC0;
        font-weight: 800;
    }

    .agree_wrap dl dd+dt {
        margin-top: 30px;
    }

    .agree_wrap dd {
        margin-top: 10px;
        font-size: 16px;
        line-height: 27px;
        word-break: keep-all;
    }

    ol {
        line-height: 27px;
        word-break: keep-all;
        margin: 0;
        padding: 0;
        border: 0;
        font-size: 100%;
        vertical-align: middle;
        list-style: none;
    }

    ol>li {
        line-height: 27px;
        list-style: none;
        font-size: 100%;
        vertical-align: middle;
        word-break: keep-all;
    }

    .agree_wrap dl dd li ol {
        margin-left: 18px;
        margin-bottom: 10px;
    }

    .btns {
        line-height: 18px;
        text-align: center;
        vertical-align: middle;
        margin-top: 15px;
        border-radius: 6px;
    }

    .btns>.btn {
        background-color: #277BC0;
        margin: 0;
        padding: 0;
        border: 0;
        vertical-align: middle;
        text-decoration: none;
        cursor: pointer;
        display: block;
        text-align: center;
        color: #fff;
        height: 56px;
        line-height: 56px;
        font-size: 20px;
        float: right;
        width: 100%;
        border-radius: 6px;
    }

    .agree_wrap table {
        line-height: 27px;
        word-break: keep-all;
        padding: 0;
        border: 0;
        font-size: 100%;
        vertical-align: middle;
        border-collapse: collapse;
        border-spacing: 0;
        table-layout: fixed;
        width: 100%;
        margin: 10px 0;
        display: table;
    }

    colgroup {
        display: table-column-group;
    }

    .agree_wrap dl table colgroup col:first-child {
        width: 130px;
    }

    tbody { display: table-row-group; }
    tr { display: table-row;}
    td { 
        display: table-cell; 
        line-height: 27px;
        word-break: keep-all;
        border-collapse: collapse;
        border-spacing: 0;
        margin: 0;
        font-size: 100%;
        vertical-align: middle;
        padding: 5px 10px;
        border: 1px solid #ccc;
        text-align: center;
        color: #656565;
    }

    .agree_wrap ul>li {
        line-height: 27px;
        list-style: none;
        margin: 0;
        padding: 0;
        border: 0;
        font-size: 100%;
        vertical-align: middle;
        word-break: keep-all;
    }

    .agree_wrap dl dd li ul {
        margin-left: 18px;
        margin-bottom: 10px;
        word-break: keep-all;
    }

    .agree_wrap dl dd a {
        color: #656565;
    }

    /* ------------------------------------------------- */
</style>
</head>
<body>
	
	<div class="wrap">
		<div id="header_area" style="height:80px;"><jsp:include page="../common/header.jsp" /></div>
	        <div id="content">
	            <div id="content_1"></div>
	            
	            <!--컨텐츠작성부분 -->
	            <div id="content_2">
	            <br><br><br>
	
	                <form id="join_form" action="insert.me" method="post">
	                    <div><legend align="center">회원 가입</legend></div>
	                    <hr>
	                    <div id="join-area">
	                        <input id="memId" name="memId" class="form-control" type="text" placeholder="아이디(8~20자, 영문자/숫자 포함)" 
	                                minlength="8" maxlength="20" required>
	                        <span class="error_next_box" id="idMsg"></span>
							<span class="error_next_box" id="idCheckMsg"></span>
	                        <input id="memPwd" name="memPwd" class="form-control" type="password" placeholder="비밀번호(8~20자, 영문자/숫자/특수기호(-, _제외) 포함)"
	                                minlength="8" maxlength="20" required>
	                        <span class="error_next_box" id="pswd1Msg">8~20자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</span>
	                        <input id="pwOk" type="password" class="form-control" placeholder="비밀번호 확인">
	                        <span class="error_next_box" id="pswd2Msg">비밀번호가 일치하지 않습니다.</span>
	                        <input id="memName" name="memName" class="form-control" type="text" placeholder="이름"
	                                minlength="2" maxlength="6" required>
							<span class="error_next_box" id="nameMsg"></span>
	                        <input id="email" name="email" class="form-control" type="email" placeholder="이메일">
	                        <span class="error_next_box" id="emailMsg">이메일 주소를 다시 확인해주세요.</span>
	                        <!-- 이메일 본인인증 -->
	                        <button id="emailConfirmBtn" type="button" style="background: #277BC0; color: white; margin-top: 10px;">이메일 본인인증</button>
							<input id="emailConfirm" name="emailConfirm" class="form-control" type="text" placeholder="인증 번호를 입력해주세요.">
							<span class="error_next_box" id="emailConfirmMsg"></span>
	                        <hr>

	                        <input id="nickname" name="nickname" class="form-control" type="text" placeholder="닉네임" required>
	                        <span class="error_next_box" id="nickMsg"></span>
							<span class="error_next_box" id="nickCheckMsg"></span>
	                        <select id="gender" name="gender" class="form-control" style="height: 50px;" required>
	                            <option value="M">남자</option>
	                            <option value="F">여자</option>
	                        </select>
	                        <div id="birthday-area" style="margin-top:10px;">
	                            <input id="yyyy" class="form-control" type="text" placeholder="생년" minlength="4" maxlength="4" required>
	                            <select id="MM" class="form-control" style="margin-left: 8px;" required>
	                                <option value="" selected>생월</option>
	                                <option value="01">1월</option>
	                                <option value="02">2월</option>
	                                <option value="03">3월</option>
	                                <option value="04">4월</option>
	                                <option value="05">5월</option>
	                                <option value="06">6월</option>
	                                <option value="07">7월</option>
	                                <option value="08">8월</option>
	                                <option value="09">9월</option>
	                                <option value="10">10월</option>
	                                <option value="11">11월</option>
	                                <option value="12">12월</option>
	                            </select>
	                            <input id="dd" class="form-control" type="text" style="margin-left: 8px;" placeholder="생일" minlength="2" maxlength="2" required>
								<span class="error_next_box" id="yyMsg">정말 이 때 태어나셨나요?</span>
								<input id="birthday" type="hidden" name="birthday">
								<!-- VO로 합치기 위해 input type="hidden" 으로 생년월일 다 합쳐서 birthday로 넘길 것 -->
	                        </div>
	                        <span class="error_next_box" id="birthdayMsg">생년월일을 다시 확인해주세요.</span>
	                        <input id="phone" name="phone" class="form-control" type="text" placeholder="전화번호(- 제외)" required>
							<span class="error_next_box" id="phoneMsg">-을 제외한 유효한 전화번호를 입력해주세요.</span>
							<!-- 정규식 검사 -->
	                        <script>
								$(function() {
        		
									$("#memId").on({blur:function() {
										// 아이디 정규식 영문자, 숫자로만 총 8 ~ 20자로 이루어지게
										let regExp = /^[a-z\d]{8,20}$/i;
										if(!regExp.test($("#memId").val())) {
											$("#idMsg").text("아이디는 총 8~20자의 영문자와 숫자로만 입력 가능합니다.");
											$("#idMsg").css("display", "block");
											$("#memId").select(); // 재입력 유도
											return false;
										} else {
											$("#idMsg").css("display", "none");
											return true;
										}
									}, keyup:function() {
											// 아이디 중복체크
											// 최소 8글자 이상으로 아이디값이 입력되어 있을 때만 ajax 요청
											if($("#memId").val().length >= 8) {

												$.ajax({
													url : "idCheck.me",
													data : {checkId : $("#memId").val()},
													success : function(result) {
														
														// console.log(result);
														
														if(result == "NNNNN") { // 사용 불가능
															
															// 빨간색 메세지 출력
															$("#idCheckMsg").show();
															$("#idCheckMsg").css("color", "red").text("이미 사용중이거나 탈퇴한 아이디입니다.");
															
															// 버튼 비활성화
															$("#join_form button[type=submit]").css("background-color", "lightgray").attr("disabled", true);
															
														} else { // 사용 가능
															// 버튼 활성화
															$("#idCheckMsg").hide();
															$("#join_form button[type=submit]").css("background-color", "#FFB200").attr("disabled", false);
														}
													},
													error : function() {
														console.log("아이디 중복 체크용 ajax 통신 실패!");
													}
												});
											} else { // 8글자 미만일 때 => 버튼 비활성화, 메세지 내용 숨기기
												
												$("#idCheckMsg").hide();
												$("#join_form button[type=submit]").css("background-color", "lightgray").attr("disabled", true);
											}
										}
									})

									$("#memPwd").blur(function() {
										// 비밀번호 정규식
										// 영문자, 숫자, 특수문자(!@#$%^&*()) 로 총 12~20 자 로 이루어져야함
										let regExp = /^[a-z\d!@#$%^&*()]{8,20}$/i;
										if(!regExp.test($("#memPwd").val())) {
											$("#pswd1Msg").text("비밀번호는 총 8~20자의 영문자,숫자,특수문자로만 입력 가능합니다.");
											$("#pswd1Msg").css("display", "block");
											$("#memPwd").select(); // 재입력 유도
											return false;
										} else {
											$("#pswd1Msg").css("display", "none");
											return true;
										}
									})

									$("#pwOk").blur(function() {
										// 비밀번호 유효성 검사
										let pwOk = $("#pwOk").val();
										if($("#memPwd").val() != (pwOk)) {
											$("#pswd2Msg").css("display", "block");
											$("#memPwd").select(); // 비밀번호부터 재입력 유도
											return false;
										} else {
											$("#pswd2Msg").css("display", "none");
											return true;
										}
									})

									$("#memName").blur(function() {
										// 이름 정규식
										// 한글 2~6글자
										let regExp = /^[가-힣]{2,6}$/;
										if(!regExp.test($("#memName").val())) {
											$("#nameMsg").text("한글로 된 2~6자리 이름을 입력해주세요.");
											$("#nameMsg").css("display", "block");
											$("#memName").select(); // 재입력 유도
											return false;
										} else {
											$("#nameMsg").css("display", "none");
											return true;
										}
									})

									$("#email").on({blur:function() {
										// 이메일 정규식
										// - 이메일주소 시작은 숫자나 알파벳으로 시작됨
										// - 이메일 첫째자리 뒤에는 -_. 을 포함하여 들어올 수 있음
										// - 도메인 주소 전에는 @ 포함
										// - . 이 최소한 하나는 있어야 하며 마지막 마디는 2-3자리 여야 함
										let regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
										if(!regExp.test($("#email").val())) {
											$("#emailMsg").text("유효한 이메일 주소를 입력해주세요.");
											$("#emailMsg").css("display", "block");
											$("#email").select(); // 재입력 유도
											return false;
										} else {
											$("#emailMsg").css("display", "none");
											return true;
										}
									}, keyup:function() {
										// 이메일 중복체크
										// 최소 15글자 이상으로 이메일값이 입력되어 있을 때만 ajax 요청
										if($("#email").val().length >= 15) {

											$.ajax({
												url : "emailCheck.me",
												data : {checkEmail : $("#email").val()},
												success : function(result) {
													
													// console.log(result);
													
													if(result == "NNNNN") { // 사용 불가능
														
														// 빨간색 메세지 출력
														$("#emailMsg").css("color", "red").text("가입된 이메일이 존재합니다. 다른 이메일을 입력해주세요.");
														$("#emailMsg").show();
														$("#email").select(); // 재입력 유도

														// 버튼 비활성화
														$("#join_form button[type=submit]").css("background-color", "lightgray").attr("disabled", true);
														
													} else { // 사용 가능
														// 버튼 활성화
														$("#emailMsg").hide();
														$("#join_form button[type=submit]").css("background-color", "#FFB200").attr("disabled", false);
													}
												},
												error : function() {
													console.log("이메일 중복 체크용 ajax 통신 실패!");
												}
											});
											} else { // 15글자 미만일 때 => 버튼 비활성화, 메세지 내용 숨기기

												$("#emailMsg").hide();
												$("#join_form button[type=submit]").css("background-color", "lightgray").attr("disabled", true);
											}
										}
									});

									let code;
									$("#emailConfirmBtn").click(function() {
										// 이메일 인증
										let email = $('#email').val(); // 이메일 주소값 얻어오기!
										const checkInput = $('#emailConfirm'); // 인증번호 입력하는곳 
										
										$.ajax({
											type : 'get',
											url : 'confirmEmail.me?email='+email,
											success : function (data) {
												checkInput.show();
												code = data;
												alert('인증번호가 전송되었습니다.');
											}			
										});

									})

									$("#emailConfirm").on({blur:function() {
										// 이메일 인증번호 정규식
										let regExp = /^[0-9]{6,6}$/;
										if(!regExp.test($("#emailConfirm").val())) {
											$("#emailConfirmMsg").text("인증번호는 6글자입니다.");
											$("#emailConfirmMsg").show();
											$("#emailConfirm").select(); // 재입력 유도
											return false;
										} else {
											return true;
										}
									}, keyup:function() {
											// 이메일 인증번호 비교 
											// 최소 6글자 이상으로 닉네임값이 입력되어 있을 때만 ajax 요청
											if($("#emailConfirm").val().length >= 6) {

												let inputCode = $(this).val();
												
												if(inputCode === code){
													$('#emailConfirmMsg').show();
													$('#emailConfirmMsg').text("인증번호가 일치합니다.");
													$('#emailConfirmMsg').css('color', 'green');
													$('#email').attr('readonly', true);

													$("#join_form button[type=submit]").css("background-color", "#FFB200").attr("disabled", false);
													$('#emailConfirm').attr('readonly', true);
												}else{
													$('#emailConfirmMsg').text("인증번호가 일치하지 않습니다. 인증번호 혹은 이메일 주소를 다시 확인해주세요.");
													$('#emailConfirmMsg').show();
													$('#emailConfirmMsg').css('color', 'red');
													$('#email').attr('readonly', false);
													// 버튼 비활성화
													$("#join_form button[type=submit]").css("background-color", "lightgray").attr("disabled", true);
												}
											} else { // 6글자 미만일 때
												$("#join_form button[type=submit]").css("background-color", "lightgray").attr("disabled", true);
											}
										}
									})


									$("#nickname").on({blur:function() {
										// 닉네임 정규식
										// 영문자, 숫자, 한글 2~10글자
										let regExp = /^[a-z\d\가-힣]{2,10}$/;
										if(!regExp.test($("#nickname").val())) {
											$("#nickMsg").text("닉네임은 영문자, 숫자, 한글을 포함하여 총 2~10글자를 입력할 수 있습니다.");
											$("#nickMsg").css("display", "block");
											$("#nickname").select(); // 재입력 유도
											return false;
										} else {
											$("#nickMsg").css("display", "none");
											return true;
										}
									}, keyup:function() {
										// 닉네임 중복체크
										// 최소 2글자 이상으로 닉네임값이 입력되어 있을 때만 ajax 요청
										if($("#nickname").val().length >= 2) {

											$.ajax({
												url : "nickCheck.me",
												data : {checkNick : $("#nickname").val()},
												success : function(result) {
													
													// console.log(result);
													
													if(result == "NNNNN") { // 사용 불가능
														
														// 빨간색 메세지 출력
														$("#nickCheckMsg").show();
														$("#nickCheckMsg").css("color", "red").text("이미 사용중인 닉네임입니다.");
														
														// 버튼 비활성화
														$("#join_form button[type=submit]").css("background-color", "lightgray").attr("disabled", true);
														
													} else { // 사용 가능
														// 버튼 활성화
														$("#nickCheckMsg").hide();
														$("#join_form button[type=submit]").css("background-color", "#FFB200").attr("disabled", false);
													}
												},
												error : function() {
													console.log("아이디 중복 체크용 ajax 통신 실패!");
												}
											});
											} else { // 8글자 미만일 때 => 버튼 비활성화, 메세지 내용 숨기기

											$("#nickCheckMsg").hide();
											$("#join_form button[type=submit]").css("background-color", "lightgray").attr("disabled", true);
											}
										}
									});

									$("#yyyy").blur(function() {
										// 생년 정규식
										// 19 혹은 20으로 시작하는 숫자 4자리
										let regExp = /^(19|20)[0-9]{2}$/;
										let date = new Date();
										let yearNow = date.getFullYear;
										console.log(yearNow);
										if(!regExp.test($("#yyyy").val())) {
											$("#yyMsg").css("display", "block");
											$("#yyyy").select(); // 재입력 유도
											return false;
										} 
										else if($("#yyyy").val()>yearNow) {
											$("#yyMsg").css("display", "block");
											$("#yyyy").select(); // 재입력 유도
											return false;
										} 
										else {
											$("#yyMsg").css("display", "none");
											return true;
										}
									});

									$("#dd").blur(function() {
										// 생일 정규식
										let regExp = /^([1-9]|0[1-9]|[1-2][0-9]|3[0-1])$/;
										if(!regExp.test($("#dd").val())) {
											$("#yyMsg").css("display", "block");
											$("#dd").select(); // 재입력 유도
											return false;
										} else {
											if($("#dd").val().length==1) {
												$("#dd").val("0"+$("#dd").val());
											}
											$("#yyMsg").css("display", "none");
											return true;
										}

									});

									$("#phone").blur(function() {
										// 핸드폰 번호 정규식
										let regExp = /^(010)[0-9]{8}$/;
										if(!regExp.test($("#phone").val())) {
											$("#phoneMsg").css("display", "block");
											$("#phone").select(); // 재입력 유도
											return false;
										} else {
											$("#phoneMsg").css("display", "none");
											return true;
										}
									});

									$("button[type=submit]").click(function() {
										// 생일 입력 다 되면 전부 합치기
										let birthday = "" + $("#yyyy").val() + $("#MM").val() + $("#dd").val();
										console.log(birthday);
										$("#birthday").val(birthday);
									});
								});
							</script>
	                        <div class="agree_box" style="margin-top: 30px;">
	                            <p><input id="allAgree" type="checkbox"> <label for="allAgree">아래 약관에 모두 동의합니다.</label></p> 
	                            <ul>
	                                <li class="ltype">
	                                    <input id="agree1" class="agree_check" type="checkbox" required> <label for="agree1"><a onclick="layerPop();">서비스 이용약관 (필수)</a></label>
	                                </li> 
	                                <li class="ltype">
	                                    <input id="agree2" class="agree_check" type="checkbox" required> <label for="agree2"><a onclick="layer2Pop();">개인정보 처리 방침(필수)</a></label>
	                                </li>
	                                <li>
	                                    <input id="agree5" class="agree_check" type="checkbox"> <label for="agree5" style="padding: 0 0 0 20px;">이벤트 등 프로모션 알림 메일 수신 (선택)</label>
	                                </li>
	                            </ul>
	                            <script>
	                                function layerPop() {
	                                    $(".layer_popup").css("display", "block");
	                                    $("#agree1").attr('checked', false);
	                                }
	                                function layer2Pop() {
	                                    $(".layer_popup2").css("display", "block");
	                                    $("#agree2").attr('checked', false);
	                                }

									$(function() {
										// 전체체크박스 함수
										$("#allAgree").click(function() {
											if($("#allAgree").is(":checked")) {
												$(".agree_check").prop("checked", true);
											}
											else $(".agree_check").prop("checked", false);
										});
										
										$(".agree_check").click(function() {
											var total = $(".agree_check").length;
											var checked = $(".agree_check:checked").length;
											
											if(total != checked) $("#allAgree").prop("checked", false);
											else $("#allAgree").prop("checked", true); 
										});
									})
	                            </script>
	                        </div> 
	                        <button type="submit">회원가입</button>
	                    </div>
	                    <div class="layer_popup workspace agreements">
	                        <div class="popup_wrap">
	                            <div class="pop_container">
	                                <div class="agreements-content">
	                                    <div class="heading_agree">
	                                        <h3 class="h_agree_section">이용약관</h3>
	                                    </div> 
	                                    <div class="agree_wrap">
	                                        <dl>
	                                            <dt>제 1 조 (목적)</dt> 
	                                            <dd>이 약관은 주식회사 KH24시간열려있조("회사")가 제공하는 스페이스타임(<a href="http://localhost:8006/spacetime">http://localhost:8006/spacetime</a>) 온라인 서비스(이하 “서비스”라고 합니다.)의 이용과 관련하여 회사와 회원과의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.</dd> 
	                                            <dt>제 2 조 (정의)</dt> 
	                                            <dd>
	                                                <ol>
	                                                    <li>이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
	                                                        <ol>
	                                                            <li>1.	"서비스"라 함은 유휴 공간(이하 “공간”) 정보의 공유 및 예약을 위하여 “회사”가 스페이스타임를 통해 제공하는 온라인 서비스를 말합니다.</li> 
	                                                            <li>2.	“사이트”라 함은 “회사” 가 “서비스”를 운영하는 웹사이트를 의미하며, 현재는 (<a href="http://localhost:8006/spacetime">http://localhost:8006/spacetime</a>) 입니다.</li> 
	                                                            <li>3.	회사의 "서비스"에 접속하여 이 약관에 따라 "회사"와 이용계약을 체결하고 "회사"가 제공하는 "서비스"를 이용하는 고객은 서비스 이용목적에 따라 “게스트회원”과 “호스트회원”으로 구분됩니다.
	                                                                <ol>
	                                                                    <li>A.	게스트회원: 이 약관에 따라 “회사”와 이용계약을 체결하고 “회사”가 제공하는 “서비스”를 이용할 수 있는 “회원”을 말합니다. 이하 이 약관에서 “회원”이라 함은 “게스트회원”을 말합니다.</li> 
	                                                                    <li>B.	호스트회원: “스페이스타임 호스트 이용약관”에 따라 “회사”와 이용계약을 체결하고 “회사”가 제공하는 “서비스”를 통해 “공간” 및 컨텐츠를 등록하거나 제안할 수 있는 회원을 말합니다.</li>
	                                                                </ol>
	                                                            </li> 
	                                                            <li>4.  "아이디"라 함은 "회원"의 식별과 "서비스" 이용을 위하여 "회원"이 정한 온라인 아이디(이메일)를 말합니다.</li> 
	                                                            <li>5.  "비밀번호"라 함은 "회원"이 부여 받은 "아이디”와 일치되는 "회원"임을 확인하고 비밀을 보호하기 위해 "회원" 자신이 정한 온라인 비밀번호를 말합니다.</li> 
	                                                            <li>6.	"게시물"이라 함은 "회원"이 "서비스"를 이용함에 있어 "서비스”에 게시한 부호ㆍ문자ㆍ음성ㆍ음향ㆍ화상ㆍ동영상 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 말하며, "회원"이 “서비스”를 통해 이용한 “공간”의 이용후기를 포함합니다.</li> 
	                                                            <li>7.	“호스트센터”는 “호스트”를 대상으로 제공하는 공간등록 및 관리 페이지를 말합니다.</li>
	                                                        </ol>
	                                                    </li>
	                                                </ol>
	                                            </dd> 
	                                            <dt>제 3 조 (약관의 게시와 개정)</dt> 
	                                            <dd>
	                                                <ol>
	                                                    <li>1.	"회사"는 이 약관의 내용을 "회원"이 쉽게 알 수 있도록 “서비스” 초기 화면에 게시합니다.</li> 
	                                                    <li>2.	"회사"는 "약관의 규제에 관한 법률", "정보통신망 이용촉진 및 정보보호등에 관한 법률(이하 "정보통신망법")" 등 관련 법령을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.</li> 
	                                                    <li>3.	"회사"가 이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 제1항의 방식에 따라 그 개정약관의 적용일자 7일 전부터 적용일자 전일까지 공지합니다. 다만 “회원”에게 불리한 개정인 경우 30일 전부터 적용일자 전일까지 변경 사항을 공지하며, 공지 외에도 “회원”이 등록한 전자우편, “서비스” 로그인 시 동의창 등의 전자적 수단을 통해 따로 명확히 통지합니다.</li> 
	                                                    <li>4.	“회사”가 전항에 따라 개정약관을 공지 또는 통지하면서 “회원”에게 개정약관의 공지기간 내에 거부의 의사표시를 하지 않으면 승낙의 의사표시가 표명된 것으로 본다는 뜻을 명확하게 공지 또는 통지하였음에도 “회원”이 명시적으로 거부의 의사표시를 하지 아니한 경우 “회원”이 개정약관에 동의한 것으로 봅니다.</li> 
	                                                    <li>5.	“회원”이 개정약관의 적용에 동의하지 않는 경우 “회사”는 개정약관의 내용을 적용할 수 없으며, 이 경우 “회원”은 이용계약을 해지할 수 있습니다. 다만, 기존약관을 적용할 수 없는 특별한 사정이 있는 경우에는 “회사”는 이용계약을 해지할 수 있습니다.</li>
	                                                </ol>
	                                            </dd> 
	                                            <dt>제 4 조 (약관의 해석)</dt> 
	                                            <dd>
	                                                <ol>
	                                                    <li>1.	"회사"는 “공간”의 이용 및 예약, 취소, 환불 등에 관한 구체적인 사항을 별도의 이용정책으로 둘 수 있습니다.</li> 
	                                                    <li>2.	이 약관 또는 이용정책에서 정하지 아니한 사항이나 해석에 관하여는 관련 법령 또는 상관례에 따릅니다.</li>
	                                                </ol>
	                                            </dd> 
	                                            <dt>제 5 조 (이용계약 체결)	</dt> 
	                                            <dd>
	                                                <ol>
	                                                    <li>1.	이용계약은 "회원"이 되고자 하는 자(이하 "회원가입신청자")가 이 약관의 내용에 대하여 동의를 한 다음 회원가입신청을 하고 "회사"가 이러한 신청에 대하여 승낙함으로써 체결됩니다. “회사”는 이용계약이 체결되면 “회원”의 성명, 연락처, 전자우편주소를 제공받아 보관하며, “서비스” 제공 목적 범위 내에서 이를 “호스트회원”에게 제공할 수 있습니다.</li> 
	                                                    <li>2.	"회사"는 "회원가입신청자"의 신청에 대하여 "서비스" 이용을 승낙할 수 있습니다. 다만, "회사"는 다음 각 호에 해당하는 신청에 대하여는 승낙을 하지 않거나 사후에 이용계약을 해지할 수 있습니다.
	                                                        <ol>
	                                                            <li>A.	“회원가입신청자”가 이 약관에 의하여 이전에 회원자격을 상실한 적이 있는 경우. 단 "회사"의 회원 재가입 승낙을 얻은 경우에는 예외로 함.</li> 
	                                                            <li>B.	실명이 아니거나 타인의 명의를 이용한 경우.</li> 
	                                                            <li>C.	허위의 정보를 기재하거나, "회사"가 요구하는 내용을 기재하지 않은 경우.</li> 
	                                                            <li>D.	만19세 미만의 미성년자가 법정대리인의 동의 없이 신청하는 경우.</li> 
	                                                            <li>E.	“회원가입신청자”의 귀책사유로 인하여 승인이 불가능하거나 기타 규정한 제반 사항을 위반하며 신청하는 경우.</li>
	                                                        </ol>
	                                                    </li> 
	                                                    <li>3.	제1항에 따른 회원가입신청에 있어 "회사"는 전문기관을 통한 실명확인 및 본인인증을 요청할 수 있습니다.</li> 
	                                                    <li>4.	"회사"는 “서비스” 관련 설비의 여유가 없거나, 기술상 또는 업무상 문제가 있는 경우에는 승낙을 유보할 수 있습니다.</li> 
	                                                    <li>5.	제2항과 제4항에 따라 회원가입신청의 승낙을 하지 아니하거나 유보한 경우, "회사"는 원칙적으로 이를 가입신청자에게 알리도록 합니다.</li> 
	                                                    <li>6.	이용계약의 성립 시기는 "회사"가 가입완료를 신청절차 상에서 표시한 시점으로 합니다.</li> 
	                                                    <li>7.	“회사”는 “회원”에 대하여 “영화 및 비디오물의 진흥에 관한 법률” 및 “청소년보호법” 등에 따른 등급 및 연령 준수를 위해 이용제한이나 등급별 제한을 할 수 있습니다.</li>
	                                                </ol>
	                                            </dd> 
	                                            <dt>제 6 조 (회원정보의 변경)</dt> 
	                                            <dd>“회원”은 회원가입신청 시 기재한 사항이 변경되었을 경우 “서비스” 마이페이지화면을 통하여 수정하여야 합니다. “회원”이 변경사항을 수정하지 아니하여 발생한 불이익에 대하여 “회사”는 책임지지 않습니다.</dd> 
	                                            <dt>제 7 조 (개인정보보호 의무)</dt> 
	                                            <dd>
	                                                <ol>
	                                                    <li>1.	"회사"는 "정보통신망법" 등 관계 법령이 정하는 바에 따라 "회원"의 개인정보를 보호하기 위해 노력합니다. 개인정보의 보호 및 사용에 대해서는 관련 법령 및 "회사"의 개인정보처리방침이 적용됩니다. 다만, "회사"의 공식 사이트 이외의 링크된 사이트에서는 "회사"의 개인정보처리방침이 적용되지 않습니다. </li> 
	                                                    <li>2.	“회사”가 개인정보의 보호를 위하여 상당한 주의를 기울였음에도 불구하고, “호스트회원”이 관련 법령 및 “스페이스타임 호스트 이용약관”을 위반하여 “회원”의 개인정보를 유출 또는 유용한 경우 “회사”는 그에 대하여 아무런 책임을 부담하지 않습니다.</li>
	                                                </ol>
	                                            </dd> 
	                                            <dt>제 8 조 ("회원"의 "아이디" 및 "비밀번호"의 관리에 대한 의무)</dt> 
	                                            <dd>
	                                                <ol>
	                                                    <li>1.	"회원"의 "아이디"와 "비밀번호"에 관한 관리책임은 "회원"에게 있으며, 이를 제3자가 이용하도록 하여서는 안 됩니다.</li> 
	                                                    <li>2. 회사"는 "회원"의 "아이디"가 개인정보 유출 우려가 있거나, 반사회적 또는 미풍양속에 어긋나거나 "회사"로 오인할 우려가 있는 경우, 해당 "아이디"의 이용을 제한할 수 있습니다.</li> 
	                                                    <li>3.	"회원"은 "아이디" 및 "비밀번호"가 도용되거나 제3자가 사용하고 있음을 인지한 경우에는 이를 즉시 "회사"에 통지하고 "회사"의 안내에 따라야 합니다.</li> 
	                                                    <li>4.	제3항의 경우에 해당 "회원"이 "회사"에 그 사실을 통지하지 않거나, 통지한 경우에도 "회사"의 안내에 따르지 않아 발생한 불이익에 대하여 "회사"는 책임지지 않습니다.</li>
	                                                </ol>
	                                            </dd> 
	                                            <dt>제 9 조 ("회원"에 대한 통지)</dt> 
	                                            <dd>
	                                                <ol>
	                                                    <li>1.	"회사"가 "회원"에 대한 통지를 하는 경우 이 약관에 별도 규정이 없는 한 회원가입신청 시 기재한 전자우편주소 등으로 할 수 있습니다.</li> 
	                                                    <li>2.	"회사"는 "회원" 전체에 대한 통지의 경우 7일 이상 "회사"의 공지게시판에 게시함으로써 제1항의 통지에 갈음할 수 있습니다.</li>
	                                                </ol>
	                                            </dd> 
	                                            <dt>제 10 조 ("회사"의 의무)</dt> 
	                                            <dd>
	                                                <ol>
	                                                    <li>1.	"회사"는 관련 법령과 이 약관이 금지하거나 미풍양속에 반하는 행위를 하지 않으며, 계속적이고 안정적으로 "서비스"를 제공하기 위하여 최선을 다하여 노력합니다.</li> 
	                                                    <li>2.	"회사"는 "회원"이 안전하게 "서비스"를 이용할 수 있도록 개인정보(신용정보 포함)보호를 위해 보안시스템을 갖추어야 하며 개인정보처리방침을 공시하고 준수합니다.</li> 
	                                                    <li>3.	"회사"는 “서비스” 이용과 관련하여 발생하는 “회원”의 불만 또는 피해구제요청을 적절하게 처리할 수 있도록 필요한 인력 및 시스템을 구비합니다.</li> 
	                                                    <li>4.	"회사"는 서비스이용과 관련하여 "회원"으로부터 제기된 의견이나 불만이 정당하다고 인정할 경우에는 이를 처리하여야 합니다. "회원"이 제기한 의견이나 불만사항에 대해서는 게시판을 활용하거나 전자우편 등을 통하여 "회원"에게 처리과정 및 결과를 전달합니다.</li>
	                                                </ol>
	                                            </dd> 
	                                            <dt>제 11 조 ("회원"의 의무)</dt> 
	                                            <dd>
	                                                <ol>
	                                                    <li>1.	"회원"은 다음 행위를 하여서는 안 됩니다.
	                                                        <ol>
	                                                            <li>A.	회원가입신청 또는 회원정보변경시 및 공간 예약 신청 또는 변경 시 허위내용의 등록</li> 
	                                                            <li>B.	타인의 정보도용</li> 
	                                                            <li>C.	“회사"가 게시한 정보의 변경</li> 
	                                                            <li>D.	"회사"가 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시</li> 
	                                                            <li>E.	"회사"와 기타 제3자의 저작권 등 지식재산권에 대한 침해</li>
	                                                            <li>F.	“회사" 및 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위</li> 
	                                                            <li>G.	외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 "서비스"에 공개 또는 게시하는 행위</li> 
	                                                            <li>H.	“회사”의 동의 없이 영리를 목적으로 "서비스"를 사용하는 행위</li> 
	                                                            <li>I.	기타 불법적이거나 부당한 행위</li>
	                                                        </ol>
	                                                    </li> 
	                                                    <li>2.	"회원"은 관련 법령, 이 약관의 규정, 이용정책 및 "서비스"와 관련하여 공지한 주의사항, "회사"가 통지하는 사항 등을 준수하여야 하며, 기타 "회사"의 업무에 방해되는 행위를 하여서는 안 됩니다.</li>
	                                                </ol>
	                                            </dd> 
	                                            <dt>제 12 조 ("서비스"의 제공 등)	</dt> 
	                                            <dd>
	                                                <ol>
	                                                    <li>1.	“회사”가 “회원”에게 제공하는 “서비스”는 아래 각호와 같습니다.
	                                                        <ol>
	                                                            <li>A.	공간 검색 서비스</li> 
	                                                            <li>B.	공간 예약 서비스</li> 
	                                                            <li>C.	결제 서비스 (“호스트회원”이 결제 서비스를 신청한 “공간”에만 적용)</li> 
	                                                            <li>D.	게시판 및 이용후기 등록 서비스</li>
	                                                            <li>E.	기타 "회사"가 추가 개발하거나 다른 회사와의 제휴계약 등을 통해 "회원"에게 제공하는 일체의 서비스</li>
	                                                        </ol>
	                                                    </li> 
	                                                    <li>2.	공간 예약 서비스 및 결제 서비스는 아래 각호와 같이 구분됩니다.
	                                                        <ol>
	                                                            <li>A.	신청과 동시에 예약확정&amp;바로결제 유형 : “회원”이 “서비스”를 통하여 공간 예약을 신청하는 즉시 “호스트회원”의 승인 없이 예약이 확정되고 바로 결제하는 유형의 예약 방식</li> 
	                                                            <li>B.	호스트 예약 승인 후 결제 유형 : “회원”의 공간 예약 신청 시 “호스트회원”이 12시간 이내에 해당 예약 건의 적합 여부를 판단하고 승인한 후, “회원”이 결제하는 유형의 예약 방식</li> 
	                                                            <li>C.	 호스트 예약 승인 : “회원”이 공간 예약을 신청한 후 12시간 이내에 “호스트회원”이 예약 건의 적합여부를 판단하고 예약을 승인하되, “회사”의 결제시스템을 이용하지 않고 “회원”와 “호스트회원” 간 당사자의 계약으로 결제하는 유형의 예약 방식 </li>
	                                                        </ol>
	                                                    </li> 
	                                                    <li>3.	“회사”는 "서비스"를 일정범위로 분할하여 각 범위 별로 이용가능시간을 별도로 지정할 수 있습니다. 다만, 이러한 경우에는 그 내용을 사전에 공지합니다.</li> 
	                                                    <li>4.	"회사"는 컴퓨터 등 정보통신설비의 보수점검, 교체 및 고장, 통신두절 또는 운영상 상당한 이유가 있는 경우 "서비스"의 제공을 일시적으로 중단할 수 있습니다. 이 경우 "회사"는 제9조["회원"에 대한 통지]에 정한 방법으로 "회원"에게 통지합니다. 다만, "회사"가 사전에 통지할 수 없는 부득이한 사유가 있는 경우 사후에 통지할 수 있습니다.</li> 
	                                                    <li>5.	"회사"는 “서비스”의 제공에 필요한 경우 정기점검을 실시할 수 있으며, 정기점검시간은 서비스제공화면에 공지한 바에 따릅니다.</li>
	                                                </ol>
	                                            </dd> 
	                                            <dt>제 13 조 ("서비스"의 변경)	</dt> 
	                                            <dd>
	                                                <ol>
	                                                    <li>1.	"회사"는 운영상, 기술상 상당한 이유가 있는 경우 제공하고 있는 “서비스”의 전부 또는 일부를 변경할 수 있습니다.</li> 
	                                                    <li>2.	“회사”는 "서비스"의 내용, 이용방법, 이용시간에 대하여 변경이 있는 경우 변경사유, 변경될 “서비스”의 내용 및 제공일자 등을 그 변경 전에 해당 “서비스” 초기화면에 게시합니다.</li> 
	                                                    <li>3.	"회사"는 무료로 제공되는 “서비스”의 일부 또는 전부를 회사의 정책 및 운영상 필요에 따라 수정, 중단, 변경할 수 있으며, 이에 대하여 관련 법령에 특별한 규정이 없는 한 "회원"에게 별도의 보상을 하지 않습니다.</li>
	                                                </ol>
	                                            </dd> 
	                                            <dt>제 14 조 (정보의 제공 및 광고의 게재)	</dt> 
	                                            <dd>
	                                                <ol>
	                                                    <li>1.	"회사"는 "회원"이 "서비스" 이용 중 필요하다고 인정되는 다양한 정보를 공지사항이나 전자우편 등의 방법으로 "회원"에게 제공할 수 있습니다. 다만, "회원"은 관련 법령에 따른 거래관련 정보 및 고객문의 등에 대한 답변 등을 제외하고는 언제든지 전자우편에 대해서 수신 거절을 할 수 있습니다. 이때 “회원”의 수신거절로 인하여 “회원”이 필요한 정보를 제공받지 못한 경우 그에 대하여 “회사”는 책임이 없습니다.</li> 
	                                                    <li>2.	“회사”가 제1항의 정보를 전화 및 모사전송기기에 의하여 전송하려고 하는 경우 “회사”는  "회원"의 사전 동의를 받아서 전송합니다. 다만, "회원"의 거래관련 정보 및 고객문의 등에 대한 회신은 “회원”의 사전 동의 없이 전송할 수 있습니다.</li> 
	                                                    <li>3.	"회사"는 "서비스"의 운영과 관련하여 “서비스” 화면, 홈페이지, 전자우편 등에 광고를 게재할 수 있습니다. 광고가 게재된 전자우편을 수신한 "회원"은 수신거절을 "회사"에게 할 수 있습니다.</li>
	                                                </ol>
	                                            </dd> 
	                                            <dt>제 15 조 ("게시물"의 저작권 및 관리)</dt>
	                                            <dd>
	                                                <ol>
	                                                    <li>1.	"회원"이 "서비스" 내에 게시한 "게시물"의 저작권은 해당 “게시물”의 저작자에게 귀속됩니다.</li> 
	                                                    <li>2.	"회원"이 "서비스" 내에 게시하는 "게시물"은 검색결과 내지 "서비스" 및 관련 프로모션 등에 노출될 수 있으며, 해당 노출을 위해 필요한 범위 내에서는 일부 수정, 복제, 편집되어 게시될 수 있습니다. 이 경우, “회사”는 저작권법 규정을 준수하며, "회원"은 언제든지 고객센터 또는 "서비스" 내 관리기능을 통해 해당 “게시물”에 대해 삭제, 검색결과 제외, 비공개 등의 조치를 취할 수 있습니다.</li> 
	                                                    <li>3.	"회사"는 제2항 이외의 방법으로 "회원"의 "게시물"을 이용하고자 하는 경우에는 전화, 팩스, 전자우편 등을 통해 사전에 "회원"의 동의를 얻어야 합니다.</li> 
	                                                    <li>4.	"회원"은 “서비스”에서 제3자의 권리를 침해해서는 아니 되며, “회원”의 "게시물"이 "정보통신망법" 및 "저작권법"등 관련 법령에 위반되는 내용을 포함하는 경우 관련 권리자는 관련 법령이 정한 절차에 따라 해당 "게시물"의 게시중단 및 삭제 등을 “회사”에 요청할 수 있으며, "회사"는 관련 법령에 따라 조치를 취할 수 있습니다.</li> 
	                                                    <li>5.	"회사"는 전항에 따른 권리자의 요청이 없는 경우라도 권리침해가 인정될 만한 사유가 있거나 기타 “회사” 정책 및 관련 법령에 위반되는 경우에는 관련 법령에 따라 해당 "게시물"에 대해 임시조치, 삭제 등을 취할 수 있습니다.</li>
	                                                </ol>
	                                            </dd> 
	                                            <dt>제 16 조 (권리의 귀속)	</dt> 
	                                            <dd>
	                                                <ol>
	                                                    <li>1.	"서비스"에 대한 저작권 및 지식재산권은 "회사"에 귀속됩니다. </li> 
	                                                    <li>2.	"회사"는 "회원"에게 "회사"가 정한 이용조건에 따라 “서비스”를 이용할 수 있는 이용권만을 부여하며, "회원"은 “아이디” 등에 관하여 양도, 판매, 담보제공 등의 처분행위를 할 수 없습니다.</li>
	                                                </ol>
	                                            </dd> 
	                                            <dt>제 17 조 (계약해제, 해지 등)</dt> 
	                                            <dd>
	                                                <ol>
	                                                    <li>1.	"회원"은 언제든지 서비스초기화면의 고객센터 또는 내 정보 관리 메뉴 등을 통하여 이용계약 해지 신청을 할 수 있으며, "회사"는 관련 법령 등이 정하는 바에 따라 이를 즉시 처리하여야 합니다.</li> 
	                                                    <li>2.	"회원"이 이용계약을 해지할 경우, 관련 법령 및 개인정보처리방침에 따라 "회사"가 회원정보를 보유하는 경우를 제외하고는 해지 즉시 "회원"의 모든 데이터는 소멸됩니다. 다만 "회원"이 이용계약을 해지하는 경우에도 “회원”이 게시판에 등록한 "게시물"은 자동으로 삭제되지 않으니 이용계약 해지 전 “게시물”을 삭제하시기 바랍니다.</li> 
	                                                    <li>3.	“회원”은 이용계약 해지 신청일로부터 90일 내에 공간 사용 신청이 확정되어 있는 경우에는 해지할 수 없으므로, 사전에 해당 신청을 취소하여야 합니다. “회원”이 공간 사용 신청을 취소하지 않을 경우 “회사”는 제1항에도 불구하고  “회원”의 이용계약 해지 요청을 거절할 수 있습니다.</li>
	                                                </ol>
	                                            </dd> 
	                                            <dt>제 18 조 (공간의 예약 및 취소 등)</dt> 
	                                            <dd>
	                                                <ol>
	                                                    <li>1.	“서비스”에 등록된 “공간”을 예약하고자 하는 “회원”은 “서비스”에서 제공하는 방법에 따라 신청하고, “호스트회원”이 “서비스”상에서 이를 승낙함으로써 “공간” 예약이 완료됩니다.</li> 
	                                                    <li>2.	 “서비스”가 지원하는 공간 예약 방식은 (i) 신청과 동시에 예약확정&amp;바로 결제 유형 (ii) 호스트 예약 승인 후 결제 유형, (iii) 호스트 예약 승인 유형이 있습니다. 이 중 호스트 예약 승인 유형의 공간에 대해서 “회사”는 “회원”이 예약할 수 있도록 지원할 뿐이므로 이용대금 지불 등 구체적인 절차는 “회원”이 해당 호스트회원과 직접 연락하여 처리하여야 며, 이에 대해서는 본 조항을 적용하지 않습니다.</li> 
	                                                    <li>3.	“회사”는 “호스트회원”이 등록한 “공간” 사용의 상세 조건에 대해서 어떠한 보증을 하지 않습니다. “회원”은 “공간”을 예약하기 전에 반드시 “호스트회원”이 “서비스” 내에 작성한 “공간” 사용의 상세 조건을 정확하게 확인해야 합니다. 이를 확인하지 않고 예약하여 발생한 모든 손실과 손해는 “회원”에게 있습니다.</li> 
	                                                    <li>4.	“호스트회원”의 선택에 따라 “공간”에 대한 이용대금 사전 결제가 필수인 “공간”을 “회원”이 예약하고자 하는 경우 “회원”은 신용카드 등 “회사”가 지정하는 결제수단을 통해 “공간”에 대한 이용대금을 사전에 결제하여야 “공간”에 대한 예약이 완료됩니다.</li>
	                                                    미성년자인 “회원”이 “공간”을 예약한 경우 그 법정대리인이 동의하지 않으면 “회원” 본인 또는 법정대리인이 이를 취소할 수 있으며, 미성년자의 거래에 관한 상세한 사항은 관련 법령이 정하는 바에 따릅니다. 
	                                                    <li>5.	“회사”는 “서비스”에서 “회원”과 “호스트회원” 간 “공간” 예약이 완료되면 “회원”에게 이를 통지합니다. </li> 
	                                                    <li>6.	“서비스”에 등록된 “공간” 예약은 청약철회가 가능한 경우와 청약철회가 제한되는 경우로 구분되며, 청약철회 가능 여부는 이 약관이나 이용정책 또는 “공간”의 상세 조건에서 안내됩니다.</li> 
	                                                    <li>7.	 청약철회가 가능한 “공간”을 예약한 “회원”은 본 조 제6항의 통지를 받은 날로부터 7일 이내에 “회사”의 고객센터를 통하여 청약철회를 할 수 있습니다.</li> 
	                                                    <li>8.	“회원”은 전항의 청약철회 기간이 경과되거나 전자상거래 등에서의 소비자 보호에 관한 법률 등 관련 법령에서 정한 청약철회 제한 사유에 해당하는 “공간” 예약에 대해서는 청약철회를 할 수 없습니다.</li> 
	                                                    <li>9.	“회원”이 청약철회 기간 경과 후 또는 청약철회 제한 사유에 해당함에도 불구하고 “회사” 및 “호스트회원”의 책임 없는 사유를 이유로 예약의 취소를 요청하는 경우 “공간”의 상세조건 또는 이용정책 등에서 사전에 안내된 취소수수료가 부과될 수 있습니다.</li> 
	                                                    <li>10.	“호스트회원”의 귀책사유로 “회원”이 “공간” 사용일에 “공간”을 정상적으로 사용하지 못한 경우 “호스트회원”이 그에 관한 모든 책임을 부담하며, “회사”는 이에 관한 책임을 지지 않습니다. “회사”는 통신판매중개시스템의 제공자로서 통신판매의 당사자가 아니므로 “서비스” 내에서 “호스트회원”과 “회원” 간에 발생한 “공간”의 예약, 결제, 취소, 환불 관련 분쟁에 대하여 책임을 지지 않습니다.</li>
	                                                </ol>
	                                            </dd> 
	                                            <dt>제 19 조 (이용제한 등)	</dt> 
	                                            <dd>
	                                                <ol>
	                                                    <li>1.	"회사"는 "회원"이 이 약관의 의무를 위반하거나 "서비스"의 정상적인 운영을 방해한 경우, 경고, 일시정지, 영구이용정지, 이용계약해지 등으로 "서비스" 이용을 단계적으로 제한할 수 있습니다.</li> 
	                                                    <li>2.	"회사"는 전항에도 불구하고, "주민등록법"을 위반한 명의도용 및 결제도용, "저작권법" 및 "컴퓨터프로그램보호법"을 위반한 불법프로그램의 제공 및 운영방해, "정보통신망법"을 위반한 불법통신 및 해킹, 악성프로그램의 배포, 접속권한 초과행위 등과 같이 관련 법령을 위반한 경우에는 즉시 영구이용정지를 할 수 있습니다. 본 항에 따른 영구이용정지 시 "서비스" 이용을 통해 획득한 기타 혜택 등도 모두 소멸되며, "회사"는 이에 대해 별도로 보상하지 않습니다.</li> 
	                                                    <li>3.	"회사"는 "회원"이 계속해서 3개월 이상 로그인하지 않는 경우, 회원정보의 보호 및 운영의 효율성을 위해 이용을 제한할 수 있습니다.</li>
	                                                    <li>4.	"회사"는 본 조의 이용제한의 범위에 대한 구체적인 사항은 이용정책에서 정합니다.</li> 
	                                                    <li>5.	본 조에 따라 "서비스" 이용을 제한하거나 계약을 해지하는 경우에는 "회사"는 제9조["회원"에 대한 통지]에 따라 통지합니다.</li> 
	                                                    <li>6.	"회원"은 본 조에 따른 이용제한 등에 대해 "회사"가 정한 절차에 따라 이의신청을 할 수 있습니다. 이 때 이의가 정당하다고 "회사"가 인정하는 경우 "회사"는 즉시 "서비스"의 이용을 재개합니다.</li>
	                                                </ol>
	                                            </dd> 
	                                            <dt>제 20 조 (책임제한)	</dt> 
	                                            <dd>
	                                                <ol>
	                                                    <li>1.	"회사"는 천재지변 또는 이에 준하는 불가항력으로 인하여 "서비스"를 제공할 수 없는 경우에는 "서비스" 제공에 관한 책임이 면제됩니다.</li> 
	                                                    <li>2.	"회사"는 "회원"의 귀책사유로 인한 "서비스" 이용의 장애에 대하여는 책임을 지지 않습니다.</li> 
	                                                    <li>3.	"회사"는 "회원" 및 “호스트회원”이 "서비스"와 관련하여 게재한 “게시물”, 정보, 자료, 사실의 신뢰도, 정확성 등의 내용에 관하여는 책임을 지지 않습니다.</li> 
	                                                    <li>4.	"회사"는 "회원" 간 또는 "회원"과 제3자 상호간에 "서비스"를 매개로 하여 이루어진 거래에 관하여는 책임을 지지 않습니다.</li> 
	                                                    <li>5.	"회사"는 무료로 제공되는 서비스 이용과 관련하여 관련 법령에 특별한 규정이 없는 한 책임을 지지 않습니다.</li>
	                                                </ol>제소
	                                            </dd> 
	                                            <dt>제 21 조 (준거법 및 재판관할)</dt> 
	                                            <dd>
	                                                <ol>
	                                                    <li>1.	"회사"와 "회원" 간 제기된 소송은 대한민국법을 준거법으로 합니다.</li>
	                                                    <li>2.	"회사"와 "회원"간 발생한 분쟁에 관한 소송은 제소 당시의 "회원"의 주소를 관할하는 지방법원을 전속관할로 하고, 주소가 없는 경우 거소를 관할하는 지방법원의 전속관할로 합니다. 단, 제소 당시 "회원"의 주소 또는 거소가 명확하지 아니한 경우의 관할법원은 민사소송법에 따라 정합니다.</li> 
	                                                    <li>3.	해외에 주소나 거소가 있는 "회원"의 경우 "회사"와 "회원"간 발생한 분쟁에 관한 소송은 전항에도 불구하고 대한민국 서울중앙지방법원을 관할법원으로 합니다.</li>
	                                                </ol>
	                                            </dd> 
	                                            <dt>부칙</dt> 
	                                            <dd>이 약관은 2019년 04월 03일부터 적용됩니다.</dd>
	                                        </dl>
	                                    </div>
	                                </div> 
	                                <div class="btns full">
	                                    <a class="btn" onclick="btnClose();" style="background-color: #277BC0;">확인</a>
	                                </div>
	                                <script>
	                                    function btnClose() {
	                                        $(".layer_popup").css("display", "none");
	                                        $("#agree1").attr('checked', true);
	                                    }
	                                </script>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="layer_popup2 workspace agreements">
	                        <div class="popup_wrap">
	                            <div class="pop_container">
	                                <div class="agreements-content">
	                                    <div class="heading_agree">
	                                        <h3 class="h_agree_section">개인정보처리방침</h3>
	                                    </div> 
	                                    <div class="agree_wrap">
	                                        <dl>
	                                            <dt class="blind">스페이스타임 개인정보처리방침</dt> 
	                                            <dd>(주)앤스페이스(이하 ‘회사’)는 정보통신망이용촉진 및 정보보호 등에 관한 법률(이하 ‘정보통신망법’) 등에 따라 회원의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보처리방침을 수립·공개합니다.</dd> 
	                                            <dt>제1조 (개인정보 수집 항목 및 방법)</dt> 
	                                            <dd>
	                                                <ol>
	                                                    <li>1.	회사는 게스트 회원 가입 시 아래와 같은 개인정보를 수집하고 있습니다.
	                                                        <ol>
	                                                            <li>1)	회원가입시 이 과정에서 성명, 이메일 주소, 휴대폰번호(이상 필수적 수집 정보), 프로필사진, 연령대, 생년월일, 성별(이상 선택적 수집정보)을  수집합니다.</li> 
	                                                            <li>2)	예약 및 결제 과정에서 예약정보(성명, 이메일주소, 휴대폰번호)와 결제정보(신용카드 번호 및 은행계좌정보 일부 등)를 수집합니다.</li> 
	                                                            <li>3)  호스트 회원의 경우, 회원가입 직후 공간 정보 등록 과정에서 필수항목으로 대표자명, 이메일 주소, 휴대폰번호, 주소 등의 공간정보와 선택항목으로 유선전화번호, 계좌번호(은행명, 계좌번호, 예금주)를 수집합니다.</li> 
	                                                            <li>4) 문의 접수 및 회신 과정에서 연락처 및 이메일 주소를 수집 할 수 있으며, 이벤트 진행 시 배송정보 등을 수집할 수 있습니다.</li> 
	                                                            <li>5) 서비스 이용 과정에서 IP주소, 쿠키, 방문 일시·불량 이용 기록, 기기정보(PC/모바일) 정보가 자동으로 생성되어 수집합니다.</li>
	                                                        </ol>
	                                                    </li> 
	                                                    <li>2.	회사는 호스트 회원 가입 시 아래와 같은 개인정보를 수집하고 있습니다.
	                                                        <ol>
	                                                            <li>1)  공간 정보 등록 과정에서 필수항목으로 대표자명, 주소 등의 공간정보와 선택항목으로 유선전화번호, 계좌번호(은행명, 계좌번호, 예금주)를 수집합니다.</li> 
	                                                            <li>2)  서비스 이용 과정에서 IP주소, 쿠키, 방문 일시 ·불량 이용 기록, 기기정보(PC/모바일) 정보가 자동으로 생성되어 수집합니다.</li> 
	                                                            <li>3) 문의 접수 및 회신 과정에서 연락처 및 이메일 주소를 수집 할 수 있으며, 이벤트 진행 시 배송정보 등을 수집할 수 있습니다.</li>
	                                                        </ol>
	                                                    </li> 
	                                                    <li>3.	회사는 회원(게스트,호스트) 및 비회원이 서비스 내 ‘전화걸기’ 버튼을 눌러, 전화를 할 경우, 전화 중개 위탁 서비스에 따라, 전화번호를 수집합니다. 
	                                                        <br> 수집된 전화번호는 위탁사에 기록되며, 회사에는 기록되지 않습니다.
	                                                    </li> 
	                                                    <li>4.	개인정보의 수집 방법
	                                                        <ol>
	                                                            <li>1)	스페이스타임 스페이스타임 PC/모바일회원가입, 고객센터를 통한 유선 상담, 이메일을 통한 온라인 상담, 네이버 톡톡을 통한 온라인 상담</li> 
	                                                            <li>2)	오프라인에서 진행되는 이벤트, 세미나 등</li>
	                                                        </ol>
	                                                    </li>
	                                                </ol>
	                                            </dd> 
	                                            <dt>	제2조(개인정보 이용 목적)</dt> 
	                                            <dd>
	                                                회사는 다음의 목적으로 서비스 제공을 위한 최소한의 개인정보만을 수집하며, 수집한 정보를 목적 외로 이용하거나, 회원의 동의 없이 외부에 공개하지 않습니다.
	                                                <ol>
	                                                    <li>1.	회원관리: 회원제 서비스 제공에 따른 개인식별, 가입의사 확인, 이용약관 위반 회원에 대한 이용제한 조치, 가입 및 가입횟수 제한, 서비스 부정 이용 제재, 고충 처리 및 분쟁 조정을 위한 기록 보존, 고지사항 전달, 회원탈퇴 의사의 확인</li> 
	                                                    <li>2.	콘텐츠 등 기존 서비스 제공(광고 포함)에 더하여, 인구통계학적 분석, 서비스 방문 및 이용기록의 분석, 개인정보 및 관심에 기반한 회원간 관계의 형성, 지인 및 관심사 등에 기반한 맞춤형 서비스 제공 등 신규 서비스 요소의 발굴 및 기존 서비스 개선 등</li> 
	                                                    <li>3.	신규서비스 개발 및 마케팅 광고에의 활용: 신규서비스 개발 및 맞춤 서비스 제공, 인구통계학적 특성에 따른 서비스 제공 및 광고 게재, 서비스의 유효성 확인, 이벤트·광고성 정보 및 참여 기회 제공.</li> 
	                                                    <li>4.	결제 시스템 제공에 따르는 본인인증, 예약 및 요금 결제, 상품 및 서비스 제공</li> 
	                                                    <li>5.	보안, 프라이버시, 안전 측면에서 회원이 안심하고 이용할 수 있는 환경 구축</li>
	                                                </ol>
	                                            </dd> 
	                                            <dt>제3조(개인정보의 제공)</dt> 
	                                            <dd>
	                                                회사는 회원의 개인정보를 사전 동의 없이 외부에 공개하거나 동의하지 않습니다. 다만, 회원이 사전에 제공에 동의한 경우, 법령의 규정에 의하여 법원 및 수사기관의 요구가 있는 경우에는 예외로 합니다.<br>	
	                                                또한 게스트 회원의 공간 예약 및 이용, 결제 및 환불처리 과정에서 아래와 같이 개인정보가 호스트 회원에게 제공됩니다.
	                                                <table>
	                                                    <colgroup>
	                                                        <col width="*" span="4">
	                                                    </colgroup> 
	                                                    <tbody>
	                                                        <tr>
	                                                            <td class="td_tit">제공받는 자</td> 
	                                                            <td class="td_tit">제공항목</td> 
	                                                            <td class="td_tit">제공목적</td> 
	                                                            <td class="td_tit">제공기간</td>
	                                                        </tr> 
	                                                        <tr>
	                                                            <td>스페이스타임 <br>호스트</td> 
	                                                            <td>[필수] 이름, 연락처, 결제정보(결제방식 및 결제금액), 이메일 주소</td> 
	                                                            <td>공간예약 및 환불처리</td> 
	                                                            <td>서비스 제공기간(관계법령의 규정에 의하여 보존할 필요가 있는 경우 및 사전 동의를 득한 경우 해당 보유 기간)</td>
	                                                        </tr>
	                                                    </tbody>
	                                                </table>
	                                            </dd> 
	                                            <dt>제4조(개인정보의 처리위탁)</dt> 
	                                            <dd>회사는 원활한 서비스 제공을 위하여 아래와 같이 개인정보를 위탁하고 있으며, 관계 법령에 따라 위탁계약 시 개인정보가 안전하게 관리될 수 있도록 필요한 사항을 규정하고 있습니다.
	                                                <table>
	                                                    <colgroup>
	                                                        <col width="*" span="3">
	                                                    </colgroup> 
	                                                    <tbody>
	                                                        <tr>
	                                                            <td class="td_tit">수탁업체</td> 
	                                                            <td class="td_tit">위탁업무 내용</td> 
	                                                            <td class="td_tit">개인정보의 보유 및 이용기간</td>
	                                                        </tr> 
	                                                        <tr>
	                                                            <td>(주)시소</td> 
	                                                            <td>서비스 제공을 위한 시스템 개발 및 운영, 인프라 운영</td> 
	                                                            <td rowspan="3">회원 탈퇴시 혹은 위탁 계약 종료시까지</td>
	                                                        </tr> 
	                                                        <tr>
	                                                            <td>네이버 비즈니스 플랫폼 주식회사</td> 
	                                                            <td>호스팅 서비스 제공, 이메일 발송</td>
	                                                        </tr> 
	                                                        <tr>
	                                                            <td>NICE 페이먼츠(주) <br> 네이버㈜</td> 
	                                                            <td>결제처리 <br>간편결제처리</td>
	                                                        </tr> 
	                                                        <tr>
	                                                            <td>SK텔링크주식회사</td> 
	                                                            <td>전화 중개 서비스</td> 
	                                                            <td>전화 중개 서비스 종료시까지</td>
	                                                        </tr> 
	                                                        <tr>
	                                                            <td>API 스토어</td> 
	                                                            <td>카카오 알림톡, SNS 서비스</td> 
	                                                            <td>알림톡, SNS 서비스 종료시까지</td>
	                                                        </tr>
	                                                    </tbody>
	                                                </table>
	                                            </dd> 
	                                            <dt>제 5조 (회원의 권리·의무 및 행사방법)</dt> 
	                                            <dd>
	                                                <ol>
	                                                    <li>1.	회원 및 법정 대리인은 개인정보 관리책임자 및 담당자에게 언제든지 등록되어 있는 자신의 개인정보를 조회하거나 수정, 가입해지를 요청할 수 있습니다. 단, 이 경우 서비스의 일부 또는 전부의 이용이 어려울 수 있습니다.</li> 
	                                                    <li>2.	회원님 및 법정대리인의 개인정보 조회, 수정은 회사의 개인정보관리책임자에게 서면, 전화, 전자우편 등을 통하여 하실 수 있으며 회사는 이에 대해 지체없이 조치하겠습니다.</li> 
	                                                    <li>3.	회원님께서 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다. 또한 잘못된 개인정보를 제3 자에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체 없이 통지하여 정정이 이루어지도록 하겠습니다.</li>
	                                                </ol>
	                                            </dd> 
	                                            <dt>제6조(개인정보의 보유 및 이용기간)</dt> 
	                                            <dd>회사는 회원 탈퇴 등 개인정보 처리목적이 달성되어 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다. <br>
	                                                단, 관련 법령에 따라 일정기간 개인정보를 보관해야 할 수 있으며, 관련 법령에 따른 정보보유 사유는 아래와 같습니다. 공간 예약 과정에서 결제 및 정산 발생 시 관련 법령에 따라 개인정보를 포함한 결제, 정산 관련 정보가 5년간 보관이 됩니다.
	                                                <ul>
	                                                    <li>-	전자상거래 등에서의 소비자 보호에 관한 법률
	                                                        <ul>
	                                                            <li>계약 또는 청약철회 등에 관한 기록: 5년</li> 
	                                                            <li>대금결제 및 재화 등의 공급에 관한 기록: 5년</li> 
	                                                            <li>소비자의 불만 또는 분쟁처리에 관한 기록: 3년</li>
	                                                        </ul>
	                                                    </li> 
	                                                    <li>-	통신비밀보호법
	                                                        <ul>
	                                                            <li>로그인 기록: 3개월</li>
	                                                        </ul>
	                                                    </li>
	                                                </ul>
	                                            </dd> 
	                                            <dt>제7조 (개인정보의 파기)   </dt> 
	                                            <dd>회원탈퇴, 서비스 종료, 회원에게 동의받은 개인정보 보유기간의 도래와 같이 개인정보의 수집 및 이용목적이 달성된 개인정보는 재생이 불가능한 방법으로 파기하고 있습니다. 전자적 파일 형태의 경우 복구 및 재생이 되지 않도록 기술적인 방법을 이용하여 안전하게 삭제하며, 출력물 등은 분쇄하거나 소각하는 방식 등으로 파기합니다.</dd> 
	                                            <dt>제8조(쿠키의 설치/운영 및 거부에 관한 사항)</dt> 
	                                            <dd>
	                                                <ol>
	                                                    <li>1. 쿠키란?
	                                                        <ul>
	                                                            <li>- 회사는 개인화되고 맞춤화된 서비스를 제공하기 위해서 회원을 포함한 서비스 이용자(이하 ‘이용자’)의 정보를 저장하고 수시로 불러오는 '쿠키(cookie)'를 사용합니다.</li> 
	                                                            <li>- 쿠키는 웹사이트를 운영하는데 이용되는 서버가 이용자의 브라우저에게 보내는 아주 작은 텍스트 파일로 이용자 컴퓨터의 하드디스크에 저장됩니다. 이후 이용자가 웹 사이트에 방문할 경우 웹 사이트 서버는 이용자의 하드 디스크에 저장되어 있는 쿠키의 내용을 읽어 이용자의 환경설정을 유지하고 맞춤화된 서비스를 제공하기 위해 이용됩니다.</li> 
	                                                            <li>- 쿠키는 개인을 식별하는 정보를 자동적/능동적으로 수집하지 않으며, 이용자는 언제든지 이러한 쿠키의 저장을 거부하거나 삭제할 수 있습니다.</li>
	                                                        </ul>
	                                                    </li> 
	                                                    <li>2. 회사의 쿠키 사용 목적
	                                                        <ul>
	                                                            <li>- 이용자들이 방문한 웹페이지에 대한 방문 및 이용형태, 이용자 규모 등을 파악하여 이용자에게 최적화된 맞춤형 정보(광고 포함)를 제공하기 위해 사용합니다.</li>
	                                                        </ul>
	                                                    </li> 
	                                                    <li>3. 쿠키의 설치/운영 및 거부
	                                                        <ul>
	                                                            <li>- 이용자는 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서 이용자는 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다.</li> 
	                                                            <li>- 다만, 쿠키의 저장을 거부할 경우에는 로그인이 필요한 일부 서비스는 이용에 어려움이 있을 수 있습니다.</li>
	                                                        </ul>
	                                                    </li>
	                                                </ol>
	                                            </dd> 
	                                            <dt>제9조(개인정보의 기술적/관리적 보호조치)</dt> 
	                                            <dd>회사는 회원의 개인정보를 처리함에 있어 개인정보가 분실, 도난, 누출, 변조 또는 훼손되지 않도록 안전성 확보를 위하여 다음과 같은 기술적/관리적 대책을 강구하고 있습니다.
	                                                <ol>
	                                                    <li>1.	관리적 조치 : 내부관리계획 수립·시행, 정기적 직원 교육, 개인정보보호 전담조직의 운영 등</li> 
	                                                    <li>2.	기술적 조치 : 개인정보처리시스템 등의 접근권한 관리, 접근통제시스템 설치, 고유식별정보 등의 암호화, 보안프로그램 설치</li> 
	                                                    <li>3.	물리적 조치 : 전산실, 자료보관실 등의 접근통제</li>
	                                                </ol>
	                                            </dd> 
	                                            <dt>제10조(개인정보 관리책임자의 연락처)</dt> 
	                                            <dd>
	                                                회원은 아래의 연락처로 개인정보보호 관련 민원을 개인정보 관리책임자 혹은 담당부서로 신고하실 수 있습니다.
	                                                <table>
	                                                    <colgroup>
	                                                        <col width="*" span="2">
	                                                    </colgroup> 
	                                                    <tbody>
	                                                        <tr>
	                                                            <td class="td_tit">개인정보 관리책임자</td> 
	                                                            <td class="td_tit">개인정보 관리담당자</td>
	                                                        </tr> 
	                                                        <tr>
	                                                            <td>
	                                                                <ul>
	                                                                    <li>이름: 정혜민</li> 
	                                                                    <li>부서명 : 경영지원팀 </li> 
	                                                                    <li>연락처 : <a href="tel:1544-9970" class="tel_num">1594-9970</a></li> 
	                                                                    <li>이메일: <a href="mailto:final221223@gmail.com">final221223@gmail.com</a></li>
	                                                                </ul>
	                                                            </td>
	                                                            <td>
	                                                                <ul>
	                                                                    <li>이름: 김정현</li> 
	                                                                    <li>부서명 : 스페이스타임팀</li> 
	                                                                    <li>연락처 : <a href="tel:1594-9970" class="tel_num">1594-9970</a></li> 
	                                                                    <li>이메일: <a href="mailto:final221223@gmail.com">final221223@gmail.com</a></li>
	                                                                </ul>
	                                                            </td>
	                                                        </tr>
	                                                    </tbody>
	                                                </table>
	                                                기타 개인정보 침해에 대한 피해구제, 상담 등을 아래의 기관에 문의하실 수 있습니다.<br>
	                                                (아래의 기관은 회사와는 별개의 기관으로서, 회사의 자체적인 개인정보 불만처리, 피해구제 결과에 만족하지 못하시거나 보다 자세한 도움이 필요하시면 문의하여 주시기 바랍니다.)
	                                                <ul>
	                                                    <li>- 개인정보침해신고센터 (<a href="http://privacy.kisa.or.kr/kor/main.jsp" target="_blank">privacy.kisa.or.kr</a> / 국번없이 <a href="tel:118" class="tel_num">118 </a>)</li> 
	                                                    <li>- 대검찰청 사이버수사과 (<a href="http://www.spo.go.kr/spo/index.jsp" target="_blank">www.spo.go.kr</a> / 국번없이 <a href="tel:1301" class="tel_num">1301 </a>) </li> 
	                                                    <li>- 경찰청 사이버안전국 (<a href="http://www.ctrc.go.kr/" target="_blank">www.ctrc.go.kr</a> / 국번없이 <a href="tel:182" class="tel_num">182 </a>)</li>
	                                                </ul>
	                                            </dd> <dt>제11조(개인정보처리방침 변경 및 고지의무)</dt> 
	                                            <dd>
	                                                <ol>
	                                                    <li>1.	현 개인정보처리방침 내용 추가, 삭제 및 수정이 있을 시에는 개정 최소 7일전부터 서비스의 '공지사항'을 통해 고지할 것입니다.</li> 
	                                                    <li>2.	이 개인정보처리방침은 2019.04.03 부터 적용됩니다.</li>
	                                                </ol>
	                                            </dd>
	                                        </dl>
	                                    </div>
	                                </div> 
	                                <div class="btns full">
	                                    <a class="btn" onclick="btnClose2();" style="background-color: #277BC0;">확인</a>
	                                </div>
	                                <script>
	                                    function btnClose2() {
	                                        $(".layer_popup2").css("display", "none");
	                                        $("#agree2").attr('checked', true);
	                                    }
	                                </script>
	                            </div>
	                        </div>
	                    </div>
	                </form>
	            </div>
	            <div id="content_3"></div>
	        </div>
        </div>
        <br clear="both">
        
		<jsp:include page="../common/footer.jsp" />
</body>
</html>