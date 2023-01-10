<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>

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
	.form-group select { width: 50%;}
	.review { height: 50px; }
	.reviewImg { height: 150px;}
	.reviewImg td { 
		padding: 20px;
	}
	.reviewImg div { margin-bottom: 20px;}
	.spaceTitle {width: 60%;}
	.rate {width: 40%;}

	.reviewImg { padding-top: 20px; }

</style>

</head>
<body>
	
	<jsp:include page="header.jsp" />
	
	<div id="content">
		<div id="content_1">왼쪽여백</div>
		
		<!--컨텐츠작성부분-->
		<div id="content_2">
			<form action="" method="post">
				<div id="reviewDetail">
					<table id="reviewTable">
						<tr>
							<th class="review sapeceTitle"><h3><b>공간명</b></h3></th>
							<th class="review rate"><h3><b>평점</b></h3></th>
						</tr>
						<tr>
							<td class="review spaceTitle">신대방 파티룸</td>
							<!-- 리뷰를 작성하는 공간명을 그대로 가져와서 보여주는 것이므로 공간명을 내가 쓰진 않음 -->
							<td class="review rate">
								<div class="form-group" >
									<select name="" class="form-control mb-2">
										<option value="5">⭐⭐⭐⭐⭐</option>
										<option value="4">⭐⭐⭐⭐</option>
										<option value="3">⭐⭐⭐</option>
										<option value="2">⭐⭐</option>
										<option value="1">⭐</option>
									</select>
								</div>
							</td>
						</tr>
						<tr>
							<th colspan="2" class="review"><h3><b>내용</b></h3></th>					
						</tr>
						<tr class="reviewImg">
							<!-- 이미지 파일 첨부하면 썸네일 미리보기처럼 떴으면 좋겠는데.. -->
							<td colspan="2" class="row">
								<div>
									<input type="file" class="real-upload" accept="image/*">
								</div>
								<div>
									<input type="file" class="real-upload" accept="image/*">
								</div>
								<div>
									<input type="file" class="real-upload" accept="image/*">
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="3" class="reviewContent">
								<textarea class="form-control" rows="5" placeholder="이용후기를 작성해주세요."></textarea>
								<!-- 텍스트에디터 사용하면 textarea 자동으로 바뀌니까 건드리지 마세욥 -->
							</td>
						</tr>
					</table>
				</div>
				<br><br>

				<div class="btns" align="center">
					<a href="" type="button" class="btn btn-sm btn-secondary">취소</a>
					<a href="" type="button" class="btn btn-sm btn-primary">등록</a>
				</div>
			</form>

		</div>
		<div id="content_3">오른쪽여백</div>

		<jsp:include page="footer.jsp" />
	</div>


</body>
</html>