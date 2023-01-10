<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
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
	
	
    /* login-area */
    #content { height: 800px; }
    #content_2 { position: relative; }
    #content_2>#login-area { width: 40%; height: 60%; }
    #login-area { 
        padding: 20px;
        position: absolute; 
        margin: auto;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
    }

    #login-area>div>input { 
        width: 100%; 
        margin-top: 10px; 
        height: 50px;   
    }

    a { cursor : pointer; }

    .memory_box { margin-top: 15px;}

    a { text-decoration: none; }
    .memory_box>div { display:inline-block; float:left;  }
    .memory_box a {
        /*float: right;*/
        color: #000;
    }
    #login-area button {
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

    .no_mem {
        margin-top: 15px;
        color: #656565;
        font-size: 14px;
    }
    .no_mem a { color: #000; text-decoration: underline;}
    /* ------------------------------ */
	
    /* 아이디 찾기 모달창 */
    #findId_form input, #findId_form button {
        width: 100%; 
        margin-top: 10px; 
        height: 50px;   
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
    /* -------------------------------- */

    /* 비밀번호 찾기 모달창 */
    #findPwd_form button, #findPwd .modal_footer button {
        width: 100%; 
        margin-top: 10px; 
        height: 50px;  
    }
    #findPwd_form input {
        width: 100%; 
        margin-top: 10px; 
        height: 50px;   
    }
</style>
</head>
<body>
	
	<div class="wrap">
	
	<div id="header_area"><jsp:include page="../common/header.jsp" /></div>
	<div id="content">
		<div id="content_1"></div>
		
        <div id="content_2">
        <br><br><br>
            <form id="login-area" action="login.me" method="post">
                <div><legend align="center">로그인</legend></div>
                <div>
                    <input id="memId" class="form-control" type="text" name="memId" value="${cookie.saveId.value }" placeholder="아이디" required>
                    <input id="memPwd" class="form-control" name="memPwd" type="password" placeholder="비밀번호" required>

                    <div class="memory_box">
                        <div style="float:left;">
                        	<c:choose>
                        		<c:when test="${ not empty cookie.saveId }">
                        			<input id="memory" name="saveId" type="checkbox" value="y" checked><label for="memory">아이디 기억하기</label>
                        		</c:when>
                        		<c:otherwise>
                        			<input id="memory" name="saveId" type="checkbox" value="y"><label for="memory">아이디 기억하기</label>
                        		</c:otherwise>
                        	</c:choose>
                        </div>
                        <div style="float:right;">
                            <a data-toggle="modal" data-target="#findId">아이디 찾기</a>
                            <span clear="both"></span><span> | </span>
                            <a data-toggle="modal" data-target="#findPwd">비밀번호 찾기</a>
                        </div>
                    </div>
                    <br clear="both">
                    <button type="submit">로그인</button>
                </div>

                <p class="no_mem" align="center"> 아직 스페이스타임 회원이 아니신가요?
                    <a href="enrollForm.me">회원가입</a>
                </p>
            </form>
        </div>
        <!-- 아이디 찾기 모달창 -->
        <div class="modal fade" id="findId">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content" style="width:600px;">
                
                    <!-- Modal Header -->
                    <div class="modal-header">
                    <h4 class="modal-title">아이디 찾기</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    
                    <!-- Modal body -->
                    <form id="findId_form" action="findId.me" method="post">
                        <div class="modal-body">
	                        <input id="memName" name="memName" class="form-control" type="text" placeholder="이름" minlength="2" maxlength="6" required>
                            <span class="error_next_box" id="nameMsg"></span>
                            <input id="phone" name="phone" class="form-control" type="text" placeholder="전화번호(- 제외)" required>
                            <span class="error_next_box" id="phoneMsg" style="display:none;">-을 제외한 유효한 전화번호를 입력해주세요.</span>
                            <input id="email" name="email" class="form-control" type="email" placeholder="이메일" required>
                            <span class="error_next_box" id="emailMsg">이메일 주소를 다시 확인해주세요.</span>
                        </div>
                        <div class="btns" style="margin:0px 0px 20px 0px;" align="center">
                            <button type="button" id="findIdBtn" class="btn btn-primary" style="width: 93%; background-color: #FFB200; border-color:#FFB200;" align="center">찾기</button>
                        </div>
                        
                        <!-- Modal footer -->
                        <div class="modal-footer" align="center">
                            <p style="display:none;">
                                회원님의 아이디는 
                                <b style="color: #FFB200; font-size:15px;">ggg</b> 
                                입니다.
                            </p>
                        </div>
                    </form>
                    <script>
                        // ajax로 보내고 찾았을 시 div change
                        $(function() {
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

                            $("#email").blur(function() {
                                // 이메일 정규식
                                // - 이메일주소 시작은 숫자나 알파벳으로 시작됨
                                // - 이메일 첫째자리 뒤에는 -_. 을 포함하여 들어올 수 있음
                                // - 도메인 주소 전에는 @ 포함
                                // - . 이 최소한 하나는 있어야 하며 마지막 마디는 2-3자리 여야 함
                                let regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
                                if(!regExp.test($("#email").val())) {
                                    $("#emailMsg").css("display", "block");
                                    $("#email").select(); // 재입력 유도
                                    return false;
                                } else {
                                    $("#emailMsg").css("display", "none");
                                    return true;
                                }
                            })                           

                            $("#findIdBtn").click(function() {
                                $.ajax({
                                    url : "findId.me",
                                    data : {
                                        memName : $("#memName").val(),
                                        phone : $("#phone").val(),
                                        email : $("#email").val()
                                    },
                                    success : function(result) {
                                        
                                        // console.log(result);
                                        
                                        if(result == "NNNNN") { // 못찾음
                                            $("#findId_form p").html("회원님의 아이디를 찾을 수 없습니다. <br>입력하신 정보를 다시 확인해주세요.");
                                            $("#findId_form p").show();
                                         
                                        } else { // 찾음
                                            $("#findId_form p").html("회원님의 아이디는 <b style='color: #FFB200; font-size:15px;'></b> 입니다.")
                                            $("#findId_form b").text(result);
                                            $("#findId_form p").show();
                                        }
                                    },
                                    error : function() {
                                        console.log("아이디 중복 체크용 ajax 통신 실패!");
                                    }
                                });
                            });
                        })
                    </script>
                </div>
            </div>
        </div>
        <!-- 비밀번호 찾기 모달창 -->
        <div class="modal fade" id="findPwd">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content" style="width:600px;">
                
                    <!-- Modal Header -->
                    <div class="modal-header">
                    <h4 class="modal-title">비밀번호 찾기</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    
                    <!-- Modal body -->
                    <form id="findPwd_form" action="searchPwd.me" method="post">
                        <div class="modal-body">
                            <input id="email2" class="form-control" type="email" placeholder="이메일" required>
                            <span class="error_next_box" id="emailMsg">이메일 주소를 다시 확인해주세요.</span>
                            <!-- 이메일 본인인증 -->
	                        <button id="emailConfirmBtn" class="btn" type="button" style="background: #277BC0; border-color: #277BC0; color:white; margin-top: 10px;">이메일 본인인증</button>
							<input id="emailConfirm" name="emailConfirm" class="form-control" type="text" placeholder="인증 번호를 입력해주세요." style="display:none;">
							<span class="error_next_box" id="emailConfirmMsg"></span>
                        </div>
                        
                        <!-- Modal footer -->
                        <div class="modal-footer" align="center">
                            <div class="btns" style="margin:0px 0px 20px 0px; width:100%; height:100%; " align="center">
                                <!-- 비밀번호 변경창으로 이동 -->
                                <button type="button" id="findPwdBtn" class="btn btn-primary" style="width: 98%; background-color: #FFB200; border-color:#FFB200;" align="center">비밀번호 변경하기</button>
                            </div>
                        </div>
                    </form>
                    <script>
                        $(function() {
                            let code;
                            $("#emailConfirmBtn").click(function() {
                                // 이메일 인증
                                let email = $('#email2').val(); // 이메일 주소값 얻어오기!
                                console.log(email);
                                const checkInput = $('#emailConfirm'); // 인증번호 입력하는곳 
                                
                                $.ajax({
                                    type : 'get',
                                    url : 'findPwd.me?email='+email,
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
                                            $('#email2').attr('readonly', true);

                                            $("#findPwdBtn").css("background-color", "#FFB200").attr("disabled", false);
                                            $('#emailConfirm').attr('readonly', true);
                                        }else{
                                            $('#emailConfirmMsg').text("인증번호가 일치하지 않습니다. 인증번호 혹은 이메일 주소를 다시 확인해주세요.");
                                            $('#emailConfirmMsg').show();
                                            $('#emailConfirmMsg').css('color', 'red');
                                            $('#email2').attr('readonly', false);
                                            // 버튼 비활성화
                                            $("#findPwdBtn").attr("disabled", true);
                                        }
                                    } else { // 6글자 미만일 때
                                        $("#findPwdBtn").attr("disabled", true);
                                    }
                                }
                            });

                            $("#findPwdBtn").click(function() {
                                $("#findPwd .modal-title").text("비밀번호 변경");
                                $("#findPwd_form").attr("action", "pChange.me");
                                $("#findPwd_form>.modal-body").html("<input name='memId' type='text' class='form-control' placeholder='아이디'><input id='memPwd2' name='memPwd' type='password' class='form-control' placeholder='새 비밀번호' required><input id='pwOk' type='password' class='form-control' placeholder='새 비밀번호 확인' required><span class='error_next_box' id='pswd2Msg'>비밀번호가 일치하지 않습니다.</span>");
                                $("#findPwd_form .btns").html("<button id='pwdChange' type='submit' class='btn btn-primary'>변경</button>");
                            });

                            $("#pwOk").on({keyup:function() {
                                // 비밀번호 유효성 검사
								let pwOk = $("#pwOk").val();
								if($("#memPwd2").val() != (pwOk)) {
									$("#pwd2Msg").css("display", "block");
									// $("#memPwd").select(); // 비밀번호부터 재입력 유도
									$("#pwdChange").attr("disabled", true);
									return false;
								} else {
									$("#pwd2Msg").css("display", "none");
									$("#pwdChange").attr("disabled", false);
									return true;
								}
                            }});
                        })
                    </script>
                </div>
            </div>
        </div>
            
		<div id="content_3"></div>
	</div>
	<br clear="both">
	<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>