<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세조회</title>
<style>

    /* 회원 상세조회 전체 영역 */
    #memProfile {
        /* border: 3px solid rgba(128, 128, 128, 0.2); */
        background-color: white;
        border-radius: 10px;
        margin: auto;
        margin-top: 100px;
        margin-bottom: 100px;
        padding: 25px 0px 25px 0px;
        width: 35%;
        width: 650px;
        min-height: 570px;
    }

    /* 프로필 영역(사진, 정보, 탈퇴버튼 영역) */
    .mem_info {
        /* border: 1px solid red; */
        margin: auto;
        margin-top: 25px;
        width: 80%;
    }

    /* 프로필 사진 영역 */
    .mem_img {
        border: 2px solid rgba(128, 128, 128, 0.2);
        margin-bottom: 20px;
        border-radius: 100%;
        width: 100px;
        height: 100px;
    }

    /* 프로필사진, 닉네임 변경 아이콘 */
    .memEdit { vertical-align: -120%; }
    .memEdit:hover { cursor: pointer; }

    /* 회원등급.. 일단 border 줘서 구분해줬는데.. 어떻게 할지... */
    #memGrade { 
        border-radius: 5px;
        padding: 5px;
    }

    /* 프로필 정보 영역 */
    #mem_detail th, #mem_detail td { height: 50px; }
    #mem_detail {
        border-bottom: 2px solid lightgray;
        border-top: 2px solid lightgray;
        width: 100%; 
    }
    
    /* 비밀번호 변경, 운영공간, 운영공간 더보기 링크 ------------------------------------------------- 색 나중에 바꾸기 */
    .changePwd, .space, .showmore { color: green; }

    /* 운영공간이름 위아래 여백 */
    div.space { padding: 5px; }

    /* 탈퇴하기 */
    .delete { 
        margin-bottom: 25px;
        text-align: right;
        color: darkgray;
    }
    .showmore:hover, .changePwd:hover, .space:hover, .delete:hover {
        text-decoration: none;
        cursor: pointer;
    }

    /* 연락처 변경 모달창 */
    .modal-body .phone { 
        display: inline-block; 
        width: 300px;
    }
    
    /* 비밀번호 변경 에러 메시지 */
     .error_next_box { 
        font-family: Dotum,'돋움',Helvetica,sans-serif;
        -webkit-text-size-adjust: none;
        display: none;
        margin: 9px 0 -2px;
        font-size: 12px;
        line-height: 14px;
        color: red;
    }
    
    /* 회원 탈퇴 모달창 */
	#deleteForm .modal-content {
		width:600px;
		margin: auto;
	}
    .center {
        text-align: center;
        width: 500px;
	    display: table-cell;
    }

    #deleteForm .error_guide {
        border: 0;
        vertical-align: middle;
        width: 545px;
        margin: 0 auto;
        padding: 42px 0 0;
        font-size: 18px;
        line-height: 28px;
        color: #949494;
    }

    #deleteForm td>input {
        height: 100%;
    }

    #deleteForm .info_duration {
        margin: 0;
        border: 0;
        vertical-align: middle;
        color: #656565;
        display: inline-block;
        padding: 20px 30px 18px;
        border-top: 1px solid #e0e0e0;
        border-bottom: 1px solid #e0e0e0;
        font-size: 16px;
        margin-top: 20px;
        font-weight: 800;
    }

    #deleteForm .checkbox {
        width: 22px;
        height: 22px;
        vertical-align: middle;
        margin: 0 -20px 0 0;
        padding: 0;
        cursor: pointer;
    }

    .info_duration .checkbox+label {
        margin: 0 0 0 40px;
    }

    .warn {
        font-size: 14px;
        line-height: 18px;
        padding-left: 23px;
        color: #ff3a48;
    }

</style>
</head>
<body>
	<div class="wrap">
		<jsp:include page="../common/header.jsp" />
	
	    <div id="content">
	        
	        <!-- 회원 상세조회 -->
	        <div id="memProfile">
	                
	            <!-- 프로필 사진, 닉네임 -->
	            <div class="mem_info" align="center">
	                <c:choose>
	                    <c:when test="${!empty loginMember.profilePath }">
	                        <img src="${loginMember.profilePath}" class="mem_img photo">
	                    </c:when>
	                    <c:otherwise>
	                        <img src="resources/images/profile_default.png" class="mem_img photo">
	                    </c:otherwise>
	                </c:choose>
	                <span class="memEdit"><a class="mamEdit" data-toggle="modal" data-target="#editModal"><i class="fa-solid fa-pencil"></i></a></span>
	                <br>
	                <div style="height:30px;">
		                <b>${ loginMember.nickname }</b>&nbsp;&nbsp;
						<input type="hidden" id="grCode" value="${loginMember.grCode}">
		                <span id="memGrade"><i class="fa-solid fa-sun" style="color: orange;"></i></span>
	                </div>
	            </div>
				<script>
					$(function() {
						let grCode = $("#grCode").val();
						if(grCode == '태양') {
							$("#memGrade").html("<i class='fa-solid fa-sun' style='color: orange;'>");
						} else if(grCode == '지구') {
							$("#memGrade").html("<i class='fa-solid fa-earth-americas' style='color: green;'></i>");
						} else {
							$("#memGrade").html("<i class='fa-solid fa-moon' style='color: #949494;'></i>");
						}
					})

				</script>
	            <!-- 프로필 정보 -->
	            <div class="mem_info">
	                <table id="mem_detail"> 
	                    <tr>
	                        <th>아이디</th>
	                        <td colspan="2">${ loginMember.memId }</td>
	                    </tr>
	                    <tr>
	                        <th>이름</th>
	                        <td colspan="2">${ loginMember.memName } &nbsp;&nbsp;
		                        <span id="gender">
		                        	<c:choose>
		                        		<c:when test="${ loginMember.gender eq 'M' }">
		                        			남
		                        		</c:when>
		                        		<c:otherwise>
		                        			여
		                        		</c:otherwise>
		                        	</c:choose>
								</span>
							</td>
	                    </tr>
	                    <tr>
	                        <th>이메일</th> 
	                        <td colspan="2">${ loginMember.email }</td>
	                    </tr> 
	                    <tr>
	                        <th>연락처</th>
	                        <td>${ loginMember.phone }</td>
	                        <td align="right"><button class="btn btn-sm btn-outline-primary" data-toggle="modal" data-target="#editPhone">변경하기</button></td>
	                    </tr>
	                    <tr>
	                        <th>가입일</th>
	                        <td colspan="2">${ loginMember.enrollDate }</td>
	                    </tr> 
	                    <tr>
	                        <th>비밀번호</th> 
	                        <td colspan="2"><a class="changePwd" data-toggle="modal" data-target="#editPwd">변경하기</a></td>
	                    </tr> 
						<c:choose>
							<c:when test="${ loginMember.hostStatus eq 'Y' and loginMember.memNo != 1 }">
								<!-- ===================================== 호스트만 보이기 ===================================== -->
			                    <tr>
			                        <th>정산 계좌</th>
			                        <td>${ loginMember.bankName } ${ loginMember.accountNum } ${ loginMember.memName }</td>
			                        <td align="right"><button class="btn btn-sm btn-outline-primary" data-toggle="modal" data-target="#editAccount">변경하기</button></td>
			                    </tr>
			                    <tr>
			                        <th>운영공간</th> 
			                        <td class="space">
										<a href="hostSpaceList.sp" class="showmore">더보기</a>
			                        </td>
			                    </tr>
			                    <!-- ===================================== 호스트만 보이기 ===================================== -->
							</c:when>
						</c:choose>
	                </table>
	            </div> 
	                
	            <div class="mem_info delete"><a data-toggle="modal" data-target="#deleteForm" class="delete">서비스 탈퇴하기</a></div>
	                
	        </div>
	    </div>
	
	    <!-- 프사, 닉네임 수정 모달창 -->
	    <div class="modal fade" id="editModal">
	        <div class="modal-dialog modal-dialog-centered">
	            <div class="modal-content">
	            
	                <!-- Modal Header -->
	                <div class="modal-header">
	                <h4 class="modal-title">프로필 변경</h4>
	                <button type="button" class="close" data-dismiss="modal">&times;</button>
	                </div>
	                
	                <!-- Modal body -->
	                <form action="update.me" method="post" enctype="multipart/form-data">
	                    <div class="modal-body">
	                        <table>
	                            <tr>
	                                <th style="width:25%;">프로필 사진</th>
	                                <td>
	                                    <c:choose>
	                                        <c:when test="${!empty loginMember.profilePath }">
	                                            <img src="${loginMember.profilePath}" id="preview-image1" class="mem_img photo">
												<script>
													$(function() {
														function readImage(input) {

														// 인풋 태그에 파일이 있는 경우
														if(input.files && input.files[0]) {

															// 이미지 파일인지 검사 (생략)

															// FileReader 인스턴스 생성
															const reader = new FileReader();

															// 이미지가 로드가 된 경우
															reader.onload = e => {
																const previewImage1 = document.getElementById("preview-image1")
																previewImage1.src = e.target.result
															}

															// reader가 이미지 읽도록 하기
															reader.readAsDataURL(input.files[0]);
														}
														}

														// input file에 change 이벤트 부여
														const inputImage = document.getElementById("input-image")
														inputImage.addEventListener("change", e => {
														readImage(e.target);
														})
													})
												</script>
	                                        </c:when>
	                                        <c:otherwise>
	                                            <img src="resources/images/profile_default.png" id="preview-image2" class="mem_img photo">
												<script>
													$(function() {
														function readImage(input) {

														// 인풋 태그에 파일이 있는 경우
														if(input.files && input.files[0]) {

															// 이미지 파일인지 검사 (생략)

															// FileReader 인스턴스 생성
															const reader = new FileReader();

															// 이미지가 로드가 된 경우
															reader.onload = e => {
																const previewImage2 = document.getElementById("preview-image2")
																previewImage2.src = e.target.result
															}

															// reader가 이미지 읽도록 하기
															reader.readAsDataURL(input.files[0]);
														}
														}

														// input file에 change 이벤트 부여
														const inputImage = document.getElementById("input-image")
														inputImage.addEventListener("change", e => {
														readImage(e.target);
														})
													})
												</script>
	                                        </c:otherwise>
	                                    </c:choose>
	                                </td>
	                            </tr>
								<c:choose>
									<c:when test="${!empty loginMember.profilePath }"></c:when>
								</c:choose>
	                            <tr>
	                                <th></th>
	                                <td style="height:70px;"><input type="file" name="upfile" id="input-image" class="form-control-file border"></td>
	                            </tr>
	                            <tr>
	                                <th>닉네임</th>
	                                <td>
	                                    <input type="text" id="nickname" name="nickname" class="form-control mb-2" value="${loginMember.nickname}" required>
	                                    <span class="error_next_box" id="nickMsg">.</span>
	                                </td>
	                                <!-- 닉네임 중복확인은 ajax 로!!!! -->
	                            </tr>
	                        </table>
	                    </div>
	                    <script>
	                        $(function() {

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
	                                                $("#nickChange").attr("disabled", true);
	                                                
	                                            } else { // 사용 가능
	                                                // 버튼 활성화
	                                                $("#nickCheckMsg").hide();
	                                                $("#nickChange").attr("disabled", false);
	                                            }
	                                        },
	                                        error : function() {
	                                            console.log("아이디 중복 체크용 ajax 통신 실패!");
	                                        }
	                                    });
	                                    } else { // 8글자 미만일 때 => 버튼 비활성화, 메세지 내용 숨기기
	
	                                    $("#nickCheckMsg").hide();
	                                    $("#nickChange").attr("disabled", true);
	                                    }
	                                }
	                            })
	                        })
	                    </script>
	                    <!-- Modal footer -->
	                    <div class="modal-footer">
	                        <button type="submit" id="nickChange" class="btn btn-primary">변경</button>
	                        <!-- 수정이 잘 되면 alert 창 띄우기! -->
	                    </div>
	                </form>
	            </div>
	        </div>
	    </div>
	
	    <!-- 연락처 수정 모달창 -->
	    <div class="modal fade" id="editPhone">
	        <div class="modal-dialog modal-dialog-centered">
	            <div class="modal-content">
	            
	                <!-- Modal Header -->
	                <div class="modal-header">
	                <h4 class="modal-title">연락처 변경</h4>
	                <button type="button" class="close" data-dismiss="modal">&times;</button>
	                </div>
	                
	                <!-- Modal body -->
	                <form action="update.me" method="post">
	                    <div class="modal-body">
	                        <table>
	                            <tr>
	                                <th style="width:20%;">연락처</th>
	                                <td>
	                                    <input type="text" id="phone" name="phone" value="${loginMember.phone}" class="form-control phone" required>
	                                    <span class="error_next_box" id="phoneMsg">-을 제외한 유효한 전화번호(010으로 시작)를 입력해주세요.</span>
	                                </td>
	                            </tr>
	                        </table>
	                    </div>
	                    <script>
	                        $(function() {
	                            $("#phone").keyup(function() {
	                                // 핸드폰 번호 정규식
	                                let regExp = /^(010)[0-9]{8}$/;
	                                if(!regExp.test($("#phone").val())) {
	                                    $("#phoneMsg").css("display", "block");
	                                    $("#phoneChange").attr("disabled", true);
	                                    return false;
	                                } else {
	                                    $("#phoneMsg").css("display", "none");
	                                    $("#phoneChange").attr("disabled", false);
	                                    return true;
	                                }
								})
	                        })
	                    </script>
	                    <!-- Modal footer -->
	                    <div class="modal-footer">
	                        <button type="submit" id="phoneChange" class="btn btn-primary">변경</button>
	                        <!-- 수정이 잘 되면 alert 창 띄우기! -->
	                    </div>
	                </form>
	            </div>
	        </div>
	    </div>
	
	    <!-- 비밀번호 수정 모달창 -->
	    <div class="modal fade" id="editPwd">
	        <div class="modal-dialog modal-dialog-centered">
	            <div class="modal-content">
	            
	                <!-- Modal Header -->
	                <div class="modal-header">
	                <h4 class="modal-title">비밀번호 변경</h4>
	                <button type="button" class="close" data-dismiss="modal">&times;</button>
	                </div>
	                
	                <!-- Modal body -->
	                <form action="update.me" method="post">
	                    <div class="modal-body">
	                        <table>
	                            <tr>
	                                <th style="width:40%;">현재 비밀번호</th>
	                                <td>
	                                	<input type="password" id="checkPwd" name="checkPwd" class="form-control mb-2" required>
	                                	<span class="error_next_box" id="pwdMsg">비밀번호가 일치하지 않습니다. 다시 확인해주세요.</span>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>새 비밀번호</th>
	                                <td><input id="memPwd" name="memPwd" type="password" class="form-control mb-2" required>
										<span class="error_next_box" id="pwd1Msg">비밀번호가 일치하지 않습니다.</span>
									</td>
	                            </tr>
	                            <tr>
	                                <th>새 비밀번호 확인</th>
	                                <td><input id="pwOk" type="password" class="form-control mb-2" required>
	                                	<span class="error_next_box" id="pwd2Msg">비밀번호가 일치하지 않습니다.</span>
	                                </td>
	                            </tr>
	                        </table>
	                    </div>
	                    <script>
	                    
	                    	$(function() { 
	                    		$("#checkPwd").keyup(function() {
	                                // 현재 비밀번호 확인
	                                // 최소 8글자 이상으로 비밀번호값이 입력되어 있을 때만 ajax 요청
	                                if($("#checkPwd").val().length >= 8) {
	
	                                    $.ajax({
	                                        url : "pwdCheck.me",
	                                        data : {checkPwd : $("#checkPwd").val()},
	                                        success : function(result) {
	                                            
	                                            // console.log(result);
	                                            
	                                            if(result == "NNNNN") { // 사용 불가능
	                                                
	                                                // 빨간색 메세지 출력
	                                                $("#pwdMsg").show();
	                                                
	                                                // 버튼 비활성화
	                                                $("#pwdChange").attr("disabled", true);
	                                                
	                                            } else { // 사용 가능
	                                                // 버튼 활성화
	                                                $("#pwdMsg").hide();
	                                                $("#pwdChange").attr("disabled", false);
	                                            }
	                                            
	                                        },
	                                        error : function() {
	                                            console.log("비밀번호 확인용 ajax 통신 실패!");
	                                        }
	                                    });
	                                } else { // 8글자 미만일 때 => 버튼 비활성화, 메세지 내용 숨기기
	
	                                $("#pwdMsg").hide();
	                                $("#pwdChange").attr("disabled", false);
	                                }
								});

								$("#memPwd").blur(function() {
									// 비밀번호 정규식
									// 영문자, 숫자, 특수문자(!@#$%^&*()) 로 총 12~20 자 로 이루어져야함
									let regExp = /^[a-z\d!@#$%^&*()]{8,20}$/i;
									if(!regExp.test($("#memPwd").val())) {
										$("#pwd1Msg").text("비밀번호는 총 8~20자의 영문자,숫자,특수문자로만 입력 가능합니다.");
										$("#pwd1Msg").css("display", "block");
										$("#memPwd").select(); // 재입력 유도
										return false;
									} else {
										$("#pwd1Msg").css("display", "none");
										return true;
									}
								});
							
							$("#pwOk").keyup(function() {
								// 비밀번호 유효성 검사
								let pwOk = $("#pwOk").val();
								if($("#memPwd").val() != (pwOk)) {
									$("#pwd2Msg").css("display", "block");
									// $("#memPwd").select(); // 비밀번호부터 재입력 유도
									$("#pwdChange").attr("disabled", true);
									return false;
								} else {
									$("#pwd2Msg").css("display", "none");
									$("#pwdChange").attr("disabled", false);
									return true;
								}
							});
						});
	                    </script>
	                    
	                    <!-- Modal footer -->
	                    <div class="modal-footer">
	                        <button id="pwdChange" type="submit" class="btn btn-primary">변경</button>
	                        <!-- 수정이 잘 되면 alert 창 띄우기! -->
	                    </div>
	                </form>
	            </div>
	        </div>
	    </div>
	    
	    <!-- 회원탈퇴 모달창 -->
	    <div class="modal fade" id="deleteForm">
	        <div class="modal-dialog modal-lg">
	            <div class="modal-content" style="width:600px;">
	
	                <!-- Modal Header -->
	                <div class="modal-header">
	                    <h4 class="modal-title">회원탈퇴</h4>
	                    <button type="button" class="close" data-dismiss="modal">&times;</button>
	                </div>
	
	                <form action="delete.me" method="post">
	                    <!-- Modal body -->
	                    <div class="modal-body">
	                        <div class="center">
	                            <h3 class="tit">서비스 탈퇴 전에 꼭 <span class="br_section">확인하세요.</span></h3> 
	                            <p class="error_guide">
	                            서비스 탈퇴 시 내 프로필, 예약내역 등<br> 모든 정보가 삭제되며 이후 복구가 불가능합니다.
	                            </p>
	                            <div align="center" style="margin-top: 30px;">
	                                <table>
	                                    <tr>
	                                        <th style="width:40%;">현재 비밀번호</th>
	                                        <td>
	                                        	<input type="password" name="memPwd" class="form-control" style="height:100%;" id="checkPwd2">
	                                        	<span class="error_next_box" id="pwdMsg2">비밀번호가 일치하지 않습니다. 다시 확인해주세요.</span>
	                                        </td>
	                                        <input type="hidden" name="memNo" value="${ loginMember.memNo} ">
	                                    </tr>
	                                </table>
	                            </div>
	                            <script>
	                            $(function() { 
	                        		$("#checkPwd2").keyup(function() {
	                                    // 현재 비밀번호 확인
	                                    // 최소 8글자 이상으로 비밀번호값이 입력되어 있을 때만 ajax 요청
	                                    if($("#checkPwd2").val().length >= 8) {
	
	                                        $.ajax({
	                                            url : "pwdCheck.me",
	                                            data : {checkPwd : $("#checkPwd2").val()},
	                                            success : function(result) {
	                                                
	                                                // console.log(result);
	                                                
	                                                if(result == "NNNNN") { // 사용 불가능
	                                                    
	                                                    // 빨간색 메세지 출력
	                                                    $("#pwdMsg2").show();
	                                                    
	                                                    // 버튼 비활성화
	                                                    $("#leaveMem").attr("disabled", true);
	                                                    
	                                                } else { // 사용 가능
	                                                    // 버튼 활성화
	                                                    $("#pwdMsg2").hide();
	                                                    $("#leaveMem").attr("disabled", false);
	                                                }
	                                                
	                                            },
	                                            error : function() {
	                                                console.log("비밀번호 확인용 ajax 통신 실패!");
	                                            }
	                                        });
	                                    } else { // 8글자 미만일 때 => 버튼 비활성화, 메세지 내용 숨기기
	
		                                    $("#pwdMsg2").hide();
		                                    $("#pwdChange").attr("disabled", false);
	                                    }
	    							});
	                            })
	                            </script>
	                            <div class="info_duration error">
	                                <input id="agree_member_out" type="checkbox" class="checkbox" required> 
	                                <label for="agree_member_out">위의 내용을 숙지했으며 서비스 탈퇴에 동의합니다.</label>
	                            </div> 
	                            <p class="p_guide warn" style="padding-top: 10px;">
	                                서비스 탈퇴 동의는 필수입니다.
	                            </p> 
	                            <div class="btns" style="margin: 50px auto 0;">
	                                <button type="button" class="btn btn-primary" data-dismiss="modal" style="width: 150px; background-color: #FFB200; border-color:#FFB200;">취소</button>
	                                <button type="submit" id="leaveMem" class="btn btn-danger" style="width: 150px; color:black; background-color: lightgray; border-color: lightgray;">탈퇴</button>
	                            </div>
	                        </div>
	                    </div>
	                </form>
	            </div>
	        </div>
	    </div>
	
	    <!-- 정산계좌정보 수정 모달창 -->
	    <div class="modal fade" id="editAccount">
	        <div class="modal-dialog modal-dialog-centered">
	            <div class="modal-content">
	            
	                <!-- Modal Header -->
	                <div class="modal-header">
	                <h4 class="modal-title">계좌 정보 변경</h4>
	                <button type="button" class="close" data-dismiss="modal">&times;</button>
	                </div>
	                
	                <!-- Modal body -->
	                <form action="update.me" method="post">
	                    <div class="modal-body">
	                        <table>
	                            <tr>
	                                <th style="width:30%;">은행명</th>
	                                <td>
	                                    <select name="bankName" class="select_category form-control mb-2" required>
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
	                                    </select>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>계좌번호</th>
	                                <td>
	                                    <input type="text" id="accountNum" name="accountNum" class="form-control mb-2" placeholder="- 없이 숫자만 입력" required>
	                                    <span class="error_next_box" id="accountMsg">-을 제외하여 유효한 계좌번호를 입력해주세요.</span>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>예금주명</th>
	                                <td><input type="text" class="form-control mb-2" value="${ loginMember.memName }" readonly></td>
	                            </tr>
	                        </table>
	                    </div>
	                    <script>
	                        $(function() {
	                            $("#accountNum").keyup(function() {
	                                // 계좌번호 정규식
	                                let regExp = /^[0-9]{11,15}$/;
	                                if(!regExp.test($("#accountNum").val())) {
	                                    $("#accountMsg").css("display", "block");
	                                    $("#bankChange").attr("disabled", true);
	                                    return false;
	                                } else {
	                                    $("#accountMsg").css("display", "none");
	                                    $("#bankChange").attr("disabled", false);
	                                    return true;
	                                }
								});
	
	                        })
	                    </script>
	                    <!-- Modal footer -->
	                    <div class="modal-footer">
	                        <button type="submit" id="bankChange" class="btn btn-primary">변경</button>
	                        <!-- 수정이 잘 되면 alert 창 띄우기! -->
	                    </div>
	                </form>
	            </div>
	        </div>
	    </div>
	    
	    <jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>