<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<title>리뷰 리스트</title>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    /* content */
    /* div { border: 1px black solid; } */
	#header_area { height: 80px; }
	#content { 
		width: 100%;
		height: 850px; 
        /*height: auto;  */
		display: flex;
	}
	
	#content>div { height: 100%; float: left; margin:30px 0px;}
	
	#content_1, #content_3 { width: 10%; }
	#content_2 { width: 80%; }


	#mypage_content {
	font-size: 40px;
	font-weight: bold;
	padding: 30px;
	padding-top: 50px;
	text-align: center;
}
	#reviewList{
		width: 60%;
	}
	/* #title1{cursor : pointer;} */
	
	#review-admin1{text-align: center;}
	
	#reviewTitle {
		font-size: 40px;
		font-weight: bold;
		padding: 50px;
		text-align: center;
	}
	
	
	.table { text-align: center;}
	.table tr { line-height: 35px;} */
	/* .reviewList>table>tbody>tr>td:hover { cursor: pointer ;}  */
	
	#reviewlist_tr{font-size : 20px;
	height : 15px;
	}
	

    /* 페이지 버튼 */
    .pagination {
        margin: auto;
        justify-content: center;
    }

    .pagination a {
        cursor: pointer;
        border: none;
        border-radius: 3px;
        padding: 5px 8px;
        background-color: #eeeeee;
        color: black;
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

	#starArea {
            position: relative;
            height: 30px;
            overflow: hidden;
        }

        #starArea>div {
            overflow: hidden;
            /* position: absolute; */
        }

        #starArea i {
            font-size: 15px;
            color: rgb(253, 193, 55);
            padding: 0;
            margin: 0;
        }

	/* #reviewList tr:not(#reviewlist_tr):hover {
	background-color: #E5E5E5;
	cursor: pointer;
	}  */
	
	#reviewlist_tr{
	font : 30px;}
	
	#tr1{height:10px;}
	
	.nodata {
	text-align: center;
	font-size: 25px;
	font-weight: 600;}
	
	table>tbody>.data:hover {
	cursor: pointer; /* 일부러 조회된 데이터가 있을 경우에만 포인터 모양 변경 */
	background-color: #E5E5E5;
} 

 table>tbody>.nodata:hover {
	background-color : white; /* 마치 hover 가 안일어난거 같은 효과 */
} 
	
</style>
</head>
<body>
	
	<div id="header_area"><jsp:include page="../common/header.jsp" /></div>

	<div id="content">
	<div id="content_1"></div>
	
	<!--컨텐츠작성부분-->
	<div id="content_2">
		<!--마이페이지 내용영역-->
		<div id="mypage_content" class="">리뷰 리스트</div>
		<div id="review-admin1" class="">
			<table align="center" id="reviewList">
				<thead>
					<tr id="reviewlist_tr">
						<th style="width: 10%;">예약번호</th>
						<th style="width: 20%;">공간명</th>
						<th style="width: 40%;">리뷰내용</th>
						<th style="width: 15%;">평점</th>
						<th style="width: 15%;">작성날짜</th>
					</tr>
				</thead>
				
				<tr id=tr1><tr>
				<tbody id="tbody_1">
				<c:choose>	
				 	<c:when test="${list.size() eq 0}">
						<tr class="nodata">
							<td colspan="5" align="center">
							리뷰후기가 없습니다.
							</td>
						</tr>
					</c:when> 
				
					<c:otherwise>
						<c:forEach var="r" items="${ list }">
							<tr class="data">
								<td>${r.reserveNo}</td>
								<td>${r.spaceTitle}</td>
								<td>${r.reviewCont}</td>
								<td>
									<div id="starArea">
										<div id="realStarArea">
									<fmt:parseNumber var="i" value="${r.rating/2}" integerOnly="true" />
							<c:set var="j" value="${r.rating%2}" />
							<c:if test="${i ne 0 }"><c:forEach begin="1" end="${i}" ><i class="fa-solid fa-star" aria-hidden="true"></i></c:forEach></c:if><c:if test="${j ne 0 }"><i class='fa-regular fa-star-half-stroke' aria-hidden='true'></i></c:if><c:if test="${ (5-i-j) ne 0 }"><c:forEach begin="1" end="${5-i-j}" ><i class="fa fa-star-o" aria-hidden="true"></i></c:forEach></c:if>
										</div>
									
									</div>
								</td>
								<td>${r.reviewEnrollDate}</td>
								<input type="hidden" value="${r.reviewNo}">
								
								
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
			<script>
					$(function() {
						$("#reviewList>tbody>.data").click(function() {
							
							location.href = "detail.re?rde=" + $(this).children().eq(5).val();
						});
					});
			
					$(function() {
						$(".page-link").each(function() {
			          		if ($(this).text() ==${ pi.currentPage}) {
			          			$(this).attr("id", "active-page");
			          			$(this).parent().addClass("disabled");
			          		} else {
			          			$(this).removeAttr("id", "active-page");
			          		}
			          	});
			 			
					});
			</script>
		</div>
		<br>
		<!-- 페이지 버튼 -->
			<div id="pagingArea" align="center" id="btn">
                <ul class="pagination">
			      	<c:choose>
				   		<c:when test="${ pi.currentPage eq 1 }">
				   			<li class="page-item no-page-prev disabled"><a class="page-link">&lt;</a></li>
				   		</c:when>
				   		<c:otherwise>
				   			<li class="page-item"><a class="page-link" href="list.re?cpage=${ pi.currentPage - 1 }">&lt;</a></li>
				   		</c:otherwise>
				   	</c:choose>	       
				       <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				       	<li class="page-item page-btn"><a class="page-link" href="list.re?cpage=${ p }">${ p }</a></li>
				       </c:forEach>
				       <c:choose>
				       	<c:when test="${ pi.currentPage eq pi.maxPage }">
				       		<li class="page-item no-page-next disabled"><a class="page-link" >&gt;</a></li>
				       	</c:when>
				       	<c:otherwise>
				      	 	<li class="page-item no-page-next"><a class="page-link" href="list.re?cpage=${ pi.currentPage + 1 }">&gt;</a></li>
				       	</c:otherwise>
				       </c:choose>	       
     			 </ul>
           
            </div>
            
		</div>
	<br><br><br>
	
	<div id="content_3"></div>
	</div>
	
	<jsp:include page="../common/footer.jsp" />
	
</body>
</html>