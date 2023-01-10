/**
 *
 */
 var words = [];
 var pureWords = [];
  
 //검색어 자동완성기능
 function autoComplete(input) {
     $.ajax({
         url: "autoComplete.co",
         type : "get",
         data : { keyword : input },
         async : false,
         success : (keywords) => {
             pureWords = keywords.split(",");
             
             //중복제거
             var set = new Set(pureWords);
             words = [...set];
         },
         error : () => {
         }
     });
 }
  
 //해시태그 자동완성기능
 function hashtagAutoComplete(input){
     var keyword = input.replace('#', '');
         $.ajax({
         url: "hashtagAutoComplete.co",
         type : "get",
         async : false,
         data : { keyword : keyword },
         success : (keywords) => {
             //현재 DB에서 해시태그에 키워드가 포함된 공간의 전체 해시태그(키워드포함안된 것도 같이)를 불러온 상태
             //가능하다면 DB에서 포함 여부까지 선별 후 호출하는 것이 최선
             
             //하나의 String으로 이루어진 해시태그 자르기
             pureWords = keywords.split(",");
             
             //콜백함수를 이용하여 검색어가 포함되지 않은 항목 제거
             pureWords.forEach(() => {
                 for(var i in pureWords){
                     if(!pureWords[i].includes(keyword)){
                         pureWords.splice(i, 1);
                     }
                 }
             });
             
             // 중복제거
             var set = new Set(pureWords);
             words = [...set];
         },
         error : () => {
         }
     });
 }
 
 //(자동완성)키워드를 바탕으로 뽑아온 데이터를 동적리스트로 가공하여 화면에 뿌려줌
 function autoCompleteListShowUp(words, input){
     //기존의 내용 삭제
     while(autoCompleteContainer.hasChildNodes()){
         autoCompleteContainer.removeChild(autoCompleteContainer.firstChild);
     }
     
     //자동완성어를 div에 담아 동적으로 뿌려줌
     var keyword;
     var inputHidden;
     var ul = document.createElement("ul");
     ul.setAttribute("class", "autoCompleteUl");
     for(var i = 0; i < words.length; i++){
     	 keyword = document.createElement("li");
     	 keyword.setAttribute("class", "autoCompleteContent");
     	 keyword.setAttribute("id", "autoCompleteContent_" + i);
     	 keyword.innerHTML = words[i];
     	 
     	 
     	 
     	 ul.append(keyword);
         
         //생성된 각 div를 #autoCompleteList의 자식으로 추가
         autoCompleteContainer.append(ul);
     }
 }
 
//추천공간
function spaceRecommend(keyword){
     $.ajax({
         url: "spaceRecommend.co",
         async : false,
         data : { keyword : keyword },
         success : (recommendList) => {
             for(var i in recommendList){
			     var hashtag = recommendList[i].hashtag.split(',');
			     var card = document.createElement("div");
			     card.setAttribute("onclick", "toSpaceDetail(" + recommendList[i].spaceNo + ")");
			     card.innerHTML = "<div class='recommedCard' id='recommend" + i + "'>" +
			                         "<div class='recommend_img_wrap'>" +
	                             		 "<img class='img-0' src='" + recommendList[i].attachmentReName + "' width='100%' height='100%' alt='사진 없음' />" +
			                         "</div>" + 
			                         "<div class='recommend_content_area'>" +
			                             "<div class='recommend_title_wrap'><span class='stitle'>" + recommendList[i].spaceTitle + "</span></div>" +
			                             "<div class='recommend_hashtag_wrap'>"+ 
			                             	"<div>#" + hashtag[0] + "</div>" +
			                             	"<div>#" + hashtag[1] + "</div>" +
			                             	"<div>#" + hashtag[2] + "</div>" +
			                             "</div>" +
			                             "<div class='recommend_priceAndAddress_wrap'>" +
			                                 "<i class='fa-solid fa-location-dot saddresss'></i>" + recommendList[i].addressDefault + 
			                                 "<span class='sprice' style='color: #277BC0;'>" + recommendList[i].hourPrice + "</span><span> 원/시간</span>"+
			                             "</div>" +
			                        "</div>";
                 if(i < 3){
                     document.querySelector("#cardContainer1").append(card);
                 } else if (i < 6) {
                     document.querySelector("#cardContainer2").append(card);
                 } else if (i < 9) {
                     document.querySelector("#cardContainer3").append(card);
                 }
             }
         },
         error : () => {
         }
     });
 }
 //추천공간 테마(해시태그)변경 (관리자용)
 function changeRecommendTheme(keyword){
     
 }
 
 //리뷰존
 function spaceReview() {
     $.ajax({
         url: "spaceReview.co",
         async : false,
         data : { keyword : keyword },
         success : (reviewList) => {
             for(var i in reviewList){
                 var card = document.createElement("div");
                 card.setAttribute("onclick", "toSpaceDetail(" + reviewList[i].spaceNo + ")");
                 card.innerHTML = "<div class='reviewCard' id='review" + i + "'>" +
			                         "<div class='review_img_wrap'>" +
			                            "<img class='img-1' src='" + reviewList[i].reviewAttach1 + "' width='100%' height='100%' alt='사진 없음' />" +
			                         "</div>" + 
			                      "<div class='review_content_area'>" +
			                         "<div class='review_title_wrap'><span class='review_stitle'>" + reviewList[i].spaceTitle + "</span></div>" +
			                         "<div class='review_nickNameAndProfile'>" +
			                         	"<div><img class='img-2' src='" + reviewList[i].profilePath + "'/></div>" +
			                         	"<div class='review_nickName_wrap'><span class='review_nickName'>" + reviewList[i].nickName + "</span></div>" +
			                         	"<div class='review_rating_wrap'><span style='color:red; font-weight:900;'>" + reviewList[i].rating + "</span> / 10점</div>" +
			                         "</div>" +
			                         "<div class='review_content_wrap'>" +  reviewList[i].reviewCont + "</div>"
			                      "</div>";
                if(i == 0){
                     document.querySelector("#reviewContainer1").append(card);
                 } else if (i == 1) {
                     document.querySelector("#reviewContainer2").append(card);
                 } else if (i == 2) {
                     document.querySelector("#reviewContainer3").append(card);
                 }
             }
         },
         error : () => {
         }
    })
}
 
function toSpaceDetail(sno){
	location.href = "detail.sp?sno=" + sno;
}
 
 function changeRecommendTheme(keyword){
 	
 }