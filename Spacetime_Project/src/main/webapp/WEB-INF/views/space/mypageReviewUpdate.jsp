<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 수정</title>

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

	td.spaceTitle { font-size: large; }
	.review { height: 50px; }
	.form-group select { width: 50%;}
	.reviewImg { height: 150px;}
	.reviewImg td { 
		padding: 20px;
	}
	.reviewImg div { margin-bottom: 20px;}
	.spaceTitle {width: 58%;}
	.rate {width: 30%;}

	.reviewImg { padding-top: 20px; }
	.reviewDetail{padding :10px;}
	
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
            font-size: 30px;
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
</style>

</head>
<body>
	
	<jsp:include page="../common/header.jsp" />
	
	<div id="content">
		<div id="content_1"></div>
		
		<!--컨텐츠작성부분-->
		<div id="content_2">
			<form action="update.re" id="update" method="post" enctype="multipart/form-data">
			<input id="reviewNo" type="hidden" name="reviewNo" value="${r.reviewNo}">
			<script>
				$(function() {
					$("#reviewNo").val();
				})
			</script>
				<br>
				<div id="reviewDetail">
					<table id="reviewTable" style="border:1px red;">
						<tr>
							<th class="review sapeceTitle"><h3><b>공간명</b></h3></th>
							<th class="review rate"><h3><b>평점</b></h3></th>
							<th class="review date"><h3><b>등록일</b></h3></th>
						</tr>
						<tr>
							<td class="review spaceTitle">${r.spaceTitle }</td>
							<!-- 리뷰를 작성하는 공간명을 그대로 가져와서 보여주는 것이므로 공간명을 내가 쓰진 않음 -->
							<td class="review rate">
																
                                <div id="starArea">
                                    <div id="realStarArea"><i class="fa fa-star-o" aria-hidden="true"></i><i
                                            class="fa fa-star-o" aria-hidden="true"></i><i class="fa fa-star-o"
                                            aria-hidden="true"></i><i class="fa fa-star-o" aria-hidden="true"></i><i class="fa fa-star-o" aria-hidden="true"></i>
                                    </div>
                                    <div>
                                        <span class="s1"></span><span class="s2"></span><span class="s3"></span><span
                                            class="s4"></span><span class="s5"></span><span class="s6"></span><span
                                            class="s7"></span><span class="s8"></span><span class="s9"></span><span
                                            class="s10"></span>
                                    </div>
                                </div>
                                <input type="hidden" name="rating" value="${r.rating }">
								
								
								<td class="review date">${r.reviewEnrollDate }</td>
							</td>
						</tr>
						<tr>
							<th colspan="2" class="review"><h3><b>내용</b></h3></th>					
						</tr>
						<tr class="reviewImg">
							
							<td colspan="2" class="row">
								<div>
									<input type="file" class="real-upload" name="upfile" accept="image/*">
								</div>
								<div>
									<input type="file" class="real-upload" name="upfile" accept="image/*">
								</div>
								<div>
									<input type="file" class="real-upload" name="upfile" accept="image/*">
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="3" class="reviewContent">
								<textarea class="form-control" name="reviewCont" rows="5">${r.reviewCont }</textarea>
								<!-- 텍스트에디터 사용하면 textarea 자동으로 바뀌니까 건드리지 마세욥 -->
							</td>
						</tr>
					</table>
				</div>
				<br><br>

				<div class="btns" align="center">
					
					<button type="button" class="btn btn-sm btn-primary" onclick="updatereview()">수정</button>
					<button type="button" class="btn btn-sm btn-secondary" onclick="javascript:history.go(-1);">취소</button>
				</div>
			</form>

		</div>
		<div id="content_3"></div>

		<jsp:include page="../common/footer.jsp" />
	</div>
	<script>
	
	function updatereview(){
		if($("input[name=rating]").val() == "") {
		      alert("평점을 등록해주세요.");
		      return false;
		}
		$("#update").submit();
	} 
	
	$(function () {
		var rating = $("input[name=rating]").val();
        var str = "";
        var i = parseInt(rating / 2);
        var j = rating % 2;
        
        for (let index = 0; index < i; index++) {
            str += "<i class='fa-solid fa-star' aria-hidden='true'></i>";
        }
        if (j == 1) {
            str += "<i class='fa-regular fa-star-half-stroke' aria-hidden='true'></i>";
        }
        for (let index = 0; index < 5 - i - j; index++) {
            str += "<i class='fa fa-star-o' aria-hidden='true'></i>";
        }
        $("#realStarArea").html(str);
        
        
          
        $("#starArea span").click(function () {
        	console.log("!!");
            
        	var rating = $(this).attr("class").substr(1);
            $("input[name=rating]").val(rating);
            var str = "";
            var i = parseInt(rating / 2);
            var j = rating % 2;
            
            for (let index = 0; index < i; index++) {
                str += "<i class='fa-solid fa-star' aria-hidden='true'></i>";
            }
            if (j == 1) {
                str += "<i class='fa-regular fa-star-half-stroke' aria-hidden='true'></i>";
            }
            for (let index = 0; index < 5 - i - j; index++) {
                str += "<i class='fa fa-star-o' aria-hidden='true'></i>";
            }
            $("#realStarArea").html(str);
        });
    });
	
	
	</script>

</body>
</html>