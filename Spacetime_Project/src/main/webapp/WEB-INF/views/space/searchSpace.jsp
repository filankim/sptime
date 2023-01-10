	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공간 검색</title>
<link href="resources/css/searchSpace.css" rel="stylesheet"
	type="text/css" />
	<script src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=nrd3zj6gm7"></script> <!-- mn7cwsrvym -->
	<script src="resources/js/map.js"></script>
</head>
<body>
	<div class="wrap">
		<jsp:include page="../common/header.jsp" />
		<div class="main">
			<div id="search_display">
				<!-- 목록 보기 -->
				<div id="spaceList">
					<div id="listOption">
						<div id="listOption_lineList"
							class="listOption_listStyle listOption_options">
							<img src="resources/images/space/listStyle.png">
						</div>
						<div id="listOption_picList"
							class="listOption_listStyle listOption_options">
							<img src="resources/images/space/picStyle.png">
						</div>
						<div id="listOption_filter" class="listOption_options">
							<img src="resources/images/space/filter.png">
						</div>
					</div>

					<div id="mapFilter" style="display: none;">
						<div>
							<div class="mapFilter_option_title"><p>지역</p></div>
							<div>
								<select class="mapFilter_options form-control" id="mapFilter_area" name="area">
									<option value="now">현재 지도 위치</option>
									<option>강서구,양천구,구로구,영등포구</option>
									<option>금천구,동작구,관악구,서초구</option>
									<option>강남구,송파구,광진구,강동구</option>
									<option>은평구,마포구,서대문구,종로구</option>
									<option>성북구,강북구,도봉구,노원구,중랑구</option>
									<option>용산구,중구,성동구,동대문구</option>
								</select>
							</div>
						</div>
						
						<div id="mapFilter_option_category">
							<div class="mapFilter_option_title"><p>시설</p></div>
							<div id="mapFilter_category_list" class="mapFilter_options">
								<input class="ctgr" type="checkbox" name="category" value="1">파티룸 
								<input class="ctgr" type="checkbox" name="category" value="2">카페 
								<input class="ctgr" type="checkbox" name="category" value="3">공연장
								<input class="ctgr" type="checkbox" name="category" value="4">연습실<br>
								<input class="ctgr" type="checkbox" name="category" value="5">공유주방
								<input class="ctgr" type="checkbox" name="category" value="6">갤러리 
								<input class="ctgr" type="checkbox" name="category" value="7">운동시설<br>
								<input class="ctgr" type="checkbox" name="category" value="8">스터디룸
								<input class="ctgr" type="checkbox" name="category" value="9">회의실 
								<input class="ctgr" type="checkbox" name="category" value="10">촬영스튜디오
							</div>
						</div>
						<div id="mapFilter_option_price">
							<div class="mapFilter_option_title"><p>가격</p></div>
							<div id="mapFilter_priceRange" class="mapFilter_options">
								최소 <input type="text" id="min_price" name="min_price" value="0" placeholder="" class="form-control">원 &nbsp;~&nbsp; 최대
								<input type="text" id="max_price" name="max_price" value="9999999" placeholder="" class="form-control">원
							</div>
						</div>
						<div id="mapFilter_btns" align="center">
							<button id="mapFilter_search" class="btn btn-warning">검색</button>
						</div>
					</div>
					
					<!-- 사진형 리스트 -->
					<div id="picList">
						
					</div>
					<!-- 게시판형 리스트 -->
					<div id="lineList" style="display: none;">
						
					</div>
				</div>
				<!-- 지도 -->
				<div id="map">
					<div id="changeMap"><button class="btn btn-warning">현재지도 내 검색</button></div>
				</div>
				
				<script>
					//불러온 데이터를 담아두기 위한 전역변수
					var spaceListArr = [];
					var markers = [];
					var mapOptions = {
						center: new naver.maps.LatLng(37.539861, 126.990815),
						//center: new naver.maps.LatLng(37.533937, 126.897133),
				        zoom: 12
					};
					var map = new naver.maps.Map('map', mapOptions);
					//var HOME_PATH = window.HOME_PATH || '.';
					var picListArr = [];
					var lineListArr = [];
					
					//필터를 위한 전역변수
					var filterBtn = document.querySelector("#listOption_filter");
					var filter = document.querySelector("#mapFilter");
					var filterSearch = document.querySelector("#mapFilter_search");
					var area = document.querySelector("#mapFilter_area");
					var category = document.querySelectorAll("input[type=checkbox]");
					var checkedCategory = [];
					
					function getCategory(){
						checkedCategory = [];
						for(var i in category){
							if(category[i].checked == true){
								checkedCategory.push(category[i].value);
							}
						}
					};
					 
					//최초 로딩 시, 지도를 띄움과 동시에 전체 마커,리스트 표시
					window.onload = () => {
						if('${pureKeyword}' == ""){
							if('${categoryNo}' == ""){
								filter.style.display = "block";
								window.alert("필터를 설정해 공간을 검색하세요!");
							}
							//선택한 카테고리에 체크하기
							var categoryNo = [];
							categoryNo[0] = '${categoryNo}';
							console.log(category[0]);
							
							var mapFilterCategoryList = document.querySelectorAll(".ctgr");
							for(var i = 1; i < 11; i++){
								if(i == categoryNo[0]){
									mapFilterCategoryList[i-1].checked = true;
								}
							}
							selectMapByCurrentPosition(map, categoryNo);
							initiateMap();
							
						} else if('${categoryNo}' == ""){
							if ('${pureKeyword}' == "") {
								filter.style.display = "block";
								window.alert("필터를 설정해 공간을 검색하세요!");
		 					} else if('${pureKeyword}'.startsWith("#") == true){
								selectListByHashtag('${pureKeyword}');
								initiateMap();
		 					} else if ('${pureKeyword}' != "" && '${pureKeyword}'.startsWith("#") == false) {
								selectListByKeyword('${pureKeyword}');
								if(spaceListArr.length == 0) {
									window.alert("해당 검색어로 조회된 공간이 없습니다.\n\n다른 키워드로 조회하시거나, \n필터로 조건을 설정해주세요!");
								} 
								initiateMap();
		 					}
						}
 					};
 					
 				
					//지도 이동 후 해당 범위의 장소 재검색
					var changeMap = document.querySelector("#changeMap");
						changeMap.onclick = () => {
							area.setAttribute("value", "now");
							getCategory();
							if(checkedCategory.length > 3){
								window.alert("최대 3개의 시설종류만 선택이 가능합니다!");
							} else {
								if(area.value == "now"){
									if(checkedCategory.length == 0){
										window.alert("지역과 시설의 종류를 설정해주세요!");
										filter.style.display = "block";
									} else {
										selectMapByCurrentPosition(map, checkedCategory);
									}
								} else {
									filter.style.display = "none";
									filterMap();
								}
								initiateMap();
							}
					};
					
					//게시판 형태 변환 (게시판형-사진형)
					var picList = document.querySelector("#picList");
					var lineList = document.querySelector("#lineList");
					var picListBtn = document.querySelector("#listOption_picList");
					var lineListBtn = document.querySelector("#listOption_lineList");
					picListBtn.onclick = () => {
						toPicList();
					};			
					lineListBtn.onclick = () => {
						toLineList();
					};
					
					filterBtn.onclick = () => {
						filterOpenClose();
					};
					
					filterSearch.onclick = () => {
						getCategory();
						if(checkedCategory.length > 3){
							window.alert("최대 3개의 시설종류만 선택이 가능합니다!");
						} else {
							if(area.value == "now"){
								if(checkedCategory.length == 0){
									window.alert("지역과 시설의 종류를 설정해주세요!");
								} else {
									filter.style.display = "none";
									selectCategory();
									selectMapByCurrentPosition(map, checkedCategory);
								}
							} else {
								filter.style.display = "none";
								filterMap();
							}
							initiateMap();
						}
					};
				</script>
			</div>
		</div>
		<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>