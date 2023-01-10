<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 리뷰 상세조회</title>

    <!-- jquery 온라인 방식 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

    <!-- font awesome icon css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

    <!--아이콘-->
    <script src="https://kit.fontawesome.com/c7bfbb0e5b.js" crossorigin="anonymous"></script>
    <link rel='stylesheet' href='http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css'>

    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

    <!-- 나눔스퀘어 폰트 -->
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">

<style>

	body { font-family: 'NanumSquare', sans-serif;}

	#content_2 {
		width: 70%;
		margin: auto;
	}
	
	/* 리뷰 상세내역 전체 영역 */
	#reviewDetail {
		border: 2px solid lightgray;
		border-radius: 10px;
		width: 70%;
		margin: auto;
		margin-top: 50px;
		padding: 40px;
	}
	#reviewTable { width: 100%; }

	.review { height: 50px; }
	td.spaceTitle { font-size: large; }
	.reviewImg { height: 150px;}
	.reviewImg img { 
		margin-right: 20px;
		height: 110px;
		cursor: pointer;
	}
	.reviewImg td { 
		padding: 20px;}
	.reviewImg img:hover { opacity: 0.7;}
	.spaceTitle {width: 40%;}
	.rate, .date {width: 20%;}

	.reviewImg, .reviewContent { padding-top: 5px; }

	/* 이미지 클릭 시 원본 이미지 보이는 모달창! 이 아래로 수정하지 마세요 */

	/* The Modal (background) */
	.modal {
		display: none;
		position: fixed;
		z-index: 1;
		padding-top: 100px;
		left: 0;
		top: 0;
		width: 100%;
		height: 100%;
		margin: auto;
		overflow: auto;
		background-color: rgba(0, 0, 0, 0.8);
	}

	/* Modal Content */
	.modal-content {
		position: relative;
		background-color: #fefefe00;
		margin: auto;
		padding: 0;
		width: 80%;
		max-width: 1200px;
	}

	/* The Close Button */
	.close {
		color: yellow;
		position: absolute;
		top: 10px;
		right: 25px;
		font-size: 55px;
		font-weight: bold;
	}

	.close:hover, .close:focus {
		color: yellow;
		text-decoration: none;
		cursor: pointer;
		
	}

	/* Hide the slides by default */
	.mySlides { 
		display: none; 
		width: 60%;
		margin: auto;
	}

	/* Next & previous buttons */
	.prev, .next {
		cursor: pointer;
		position: absolute;
		top: 50%;
		width: auto;
		padding: 16px;
		margin-top: -50px;
		color: white;
		font-weight: bold;
		font-size: 20px;
		transition: 0.6s ease;
		border-radius: 0 3px 3px 0;
		user-select: none;
		-webkit-user-select: none;
		background-color: #0062cc;
	}

	/* Position the "next button" to the right */
	.next {
		right: 0;
		border-radius: 3px 0 0 3px;
		background-color: #fefefe00;
	}

	/* On hover, add a black background color with a little bit see-through */
	.prev:hover, .next:hover { background-color: rgba(0, 0, 0, 0.8); }
	img.hover-shadow { transition: 0.3s; }
	.hover-shadow:hover { box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); }
	
	 #starArea {
            position: relative;
            height: 30px;
            overflow: hidden;
        }

        #starArea>div {
            overflow: hidden;
            position: absolute;
        }

        #starArea i {
            font-size: 20px;
            color: rgb(253, 193, 55);
            padding: 0;
            margin: 0;
        }

        #starArea span {
            display: inline-block;
            width: 17.875px;
            height: 32px;
            cursor: pointer;
        }
					
		#myModal>span {
			font-size : 50px;
			color :white;
			
		}
		
</style>

</head>
<body>
	
	<jsp:include page="../common/header.jsp" />
	
	<div id="content">
		<div id="content_1">왼쪽여백</div>
		
		<!--컨텐츠작성부분-->
		<div id="content_2">
			<br>
			<div id="reviewDetail">
			
				<table id="reviewTable">
					<tr>
						<th class="review sapeceTitle"><h3><b>공간명</b></h3></th>
						<th class="review rate"><h3><b>평점</b></h3></th>
						<th class="review date"><h3><b>등록일</b></h3></th>
					</tr>
					<tr>
						<td class="review spaceTitle">${r.spaceTitle }</td>
						<td class="review rate">
						<div id="starArea">
                                    <div id="realStarArea">
                                   <fmt:parseNumber var="i" value="${r.rating/2}" integerOnly="true" />
			        	<c:set var="j" value="${r.rating%2}" />
			        	<c:if test="${i ne 0 }"><c:forEach begin="1" end="${i}" ><i class="fa-solid fa-star" aria-hidden="true"></i></c:forEach></c:if><c:if test="${j ne 0 }"><i class='fa-regular fa-star-half-stroke' aria-hidden='true'></i></c:if><c:if test="${ (5-i-j) ne 0 }"><c:forEach begin="1" end="${5-i-j}" ><i class="fa fa-star-o" aria-hidden="true"></i></c:forEach></c:if>
                                    </div>
                                   
                                </div>
                         </td>
						<input type="hidden" name="rating">
						<td class="review date">${r.reviewEnrollDate }</td>
					</tr>
					<tr>
						<th colspan="3" class="review"><h3><b>내용</b></h3></th>					
					</tr>
					<tr class="reviewImg">
						<td colspan="3" class="row" style="flex-wrap: nowrap;">
							<div class="column">
								<img src="${r.reviewAttach1}" onclick="openModal();currentSlide(1)" class="hover-shadow">
							</div>
							<div class="column">
								<img src="${r.reviewAttach2}" onclick="openModal();currentSlide(2)" class="hover-shadow">
							</div>
							<div class="column">
								<img src="${r.reviewAttach3}" onclick="openModal();currentSlide(3)" class="hover-shadow">
							</div>
						</td>
					</tr>
					
					<tr>
						<td colspan="3" class="reviewContent">
						${r.reviewCont}
						
					</tr>
					<tr height="20px;"></tr>
					<tr class="hotitle">
					<th colspan="3" class="reviewhost"><h3><b>호스트 답글</b></h3></th>	
					<input type="hidden" name="reviewNo" value="${r.reviewNo }">
					</tr>
					<tr>
					<td  class="host" name="hostAnswer">${r.hostAnswer}</td>
					</tr>
				</table>
				<%-- <div class="hotitle">호스트 답글</div>
								<input type="hidden" name="reviewNo" value="${r.reviewNo }">
								<c:choose>
									<c:when test="${empty r.hostAnswer}">
										<div class="answer-area">
											<div class="answer-text">
												<td colspan="3" class="host" name="hostAnswer">${r.hostAnswer}</td>
											<div>
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
								</c:choose> --%>
			</div>
			<br><br>

			<div class="btns" align="center">
				<a href="list.re" type="button" class="btn btn-sm btn-secondary">목록</a>
				<a type="button" class="btn btn-sm btn-warning" onclick="postFormSubmit(1);">수정</a>
				<a type="button" class="btn btn-sm btn-danger" onclick="postFormSubmit(2);">삭제</a>
			</div>
			<br><br>
	            
	            <form id="postForm" action="" method="get">
	            	<input type="hidden" name="reviewNo" value="${r.reviewNo}">
	            	<%-- <input type="hidden" name="filePath" value="${ r.changeName }"> --%>
	            </form>
	            
	            <script>
	            	function postFormSubmit(num) {
	            		
	            		// action 속성값을 부여 후 연이어서 곧바로 submit 시키기
	            		if(num == 1) { // 수정하기 버튼 클릭 시 num == 1 : updateForm.re
	            			
	            			$("#postForm").attr("action", "updateForm.re?reviewNo=${r.reviewNo}").submit();
	            		} else { // 삭제하기 버튼 클릭 시 num == 2 : delete.re
	            			
	            			$("#postForm").attr("action", "delete.re").submit();
	            		}
	            	}
	            </script>
			

		</div>

		<!-- 이미지 클릭 시 원본 이미지 보이는 모달창 -->
		<div id="myModal" class="modal">
			<span class="close cursor" onclick="closeModal()">&times;</span>
			<div class="modal-content">
				<div class="mySlides">
					<img src="${r.reviewAttach1}" style="width:100%">
				</div>

				<div class="mySlides">
					<img src="${r.reviewAttach2}" style="width:100%">
				</div>

				<div class="mySlides">
					<img src="${r.reviewAttach3}" style="width:100%">
				</div>
				<!-- Next/previous controls -->
				<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
				<a class="next" onclick="plusSlides(1)">&#10095;</a>

			</div>
		</div>
		
		<div id="content_3"></div>
	</div>
	
	<jsp:include page="../common/footer.jsp" />

<script>
	// Open the Modal
	function openModal() {
	document.getElementById("myModal").style.display = "block";
	}
	
	// Close the Modal
	function closeModal() {
		document.getElementById("myModal").style.display = "none";
	}

	var slideIndex = 1;
	showSlides(slideIndex);
	
	// Next/previous controls
	function plusSlides(n) {
		showSlides(slideIndex += n);
	}
	
	function showSlides(n) {
		var i;
		var slides = document.getElementsByClassName("mySlides");
		var dots = document.getElementsByClassName("demo");
		var captionText = document.getElementById("caption");
		
		var count = 0; // 사진의 갯수 (최대 3개) => 사진의 갯수만큼 반복을 돌리고싶다!
		if(${ not empty r.reviewAttach1 }) {
			count++;
		}
		
		if(${ not empty r.reviewAttach2 }) {
			count++;
		}
		
		if(${ not empty r.reviewAttach3 }) {
			count++;
		}
		
		// 이 시점으로 봤을 때 있을 경우만 각 단일 이프문 안으로 들어왔으니까 사진의 갯수만큼이 count 값이 될거임 => 테스트 해보기!!
		
		if (n > count) {slideIndex = 1}
		if (n < 1) {slideIndex = count}
		for (i = 0; i < count; i++) {
			slides[i].style.display = "none";
		}
		for (i = 0; i < dots.length; i++) {
			dots[i].className = dots[i].className.replace(" active", "");
		}
		slides[slideIndex-1].style.display = "block";
		dots[slideIndex-1].className += " active";
		captionText.innerHTML = dots[slideIndex-1].alt;
	}
	</script>

</body>
</html>