//지도의 정보를 불러와 마커를 추가하는 메소드
function loadMap(map, mapOptions) {
	mapOptions = {
		center: new naver.maps.LatLng(37.539861, 126.990815),
		//center: new naver.maps.LatLng(37.533937, 126.897133),
        zoom: 12
	};
	var map = new naver.maps.Map('map', mapOptions);
};

function selectListByHashtag(pureKeyword){
	if(pureKeyword == "#"){
		window.alert("해시태그(#)와 검색어를 함께 입력해주세요!");
		return;
	}
	$.ajax({
		url: "searchSpaceByHashtag.mp",
		type : "get",
		async : false,
		data : {
			pureKeyword : pureKeyword
		},
		success : (listArr) => {
			spaceListArr = listArr;
		},
		error : () => {
		}
	});
}

function selectListByKeyword(pureKeyword){
	$.ajax({
		url: "searchSpaceByKeyword.mp",
		type : "get",
		async : false,
		data : {
			keyword : pureKeyword
		},
		success : (listArr) => {
				spaceListArr = listArr;
		},
		error : () => {
		}
	});
}

function filterMap() {
	//지역
	
	var selectedArea = area.options[area.selectedIndex].value;
	var areaArr = selectedArea.split(',');
	
	//카테고리
	if(checkedCategory.length == 0){
		for(var i = 0; i < 10; i++){
		checkedCategory.push(i);
		}
	}
	
	$.ajax({
		url: "mapFilter.mp",
		type: "get",
		async: false,
		data : {
			area : areaArr,
			category : checkedCategory,
			min_price : document.querySelector("#min_price").value,
			max_price : document.querySelector("#max_price").value
		},
		success : (listArr) => {
			spaceListArr = listArr;
		},
		error : () => {
		}
	});
}

function selectMapByCurrentPosition(map, checkedCategory){
	$.ajax({
		url: "mapFilterOnCurrentMap.mp",
		type: "get",
		async: false,
		data : {
			max_lat : map.getBounds()._max._lat,
			max_lng : map.getBounds()._max._lng,
			min_lat : map.getBounds()._min._lat,
			min_lng : map.getBounds()._min._lng,
			category : checkedCategory,
			min_price : document.querySelector("#min_price").value,
			max_price : document.querySelector("#max_price").value
		},
		success : (listArr) => {
			spaceListArr = [];
			spaceListArr = listArr;
		},
		error : () => {
		}
	});
}


function selectCategory(){
	var category = document.querySelectorAll("input[type=checkbox]");
	var checkedCategory = [];
	for(var i in category){
		if(category[i].checked == true){
			checkedCategory.push(category[i].value);
		}
	}
	
	if(checkedCategory.length == 0){
		for(var i = 0; i < 10; i++){
		checkedCategory.push(i);
		}
	}
	
	return checkedCategory;
}

function loadList(spaceListArr, picListArr, lineListArr){
	//기존의 리스트 삭제
	while(picList.hasChildNodes()){
		picList.removeChild(picList.firstChild);
	}
	while(lineList.hasChildNodes()){
		lineList.removeChild(lineList.firstChild);
	}
	
	//새로운 리스트 생성
	var picContent, lineCotent;
	
	for(var i in spaceListArr){
		//리스트를 위한 div요소 생성 (id속성, onclick속성, onmouseover속성 추가)
		picContent = document.createElement("div");
		picContent.setAttribute("id", "picList_" + spaceListArr[i].spaceNo);
		picContent.setAttribute("onclick", "toSpaceDetail(" + spaceListArr[i].spaceNo + ")");
		picContent.setAttribute("onmouseover", "linkListWithMarker(" + spaceListArr[i].spaceNo + ")");
		picContent.setAttribute("onmouseout", "unlinkListWithMarker(" + spaceListArr[i].spaceNo + ")");
		
		lineContent = document.createElement("div");
		lineContent.setAttribute("id", "lineList_" + spaceListArr[i].spaceNo);
		lineContent.setAttribute("onclick", "toSpaceDetail(" + spaceListArr[i].spaceNo + ")");
		lineContent.setAttribute("onmouseover", "linkListWithMarker(" + spaceListArr[i].spaceNo + ")");
		lineContent.setAttribute("onmouseout", "unlinkListWithMarker(" + spaceListArr[i].spaceNo + ")");
		
		//리스트를 위한 내용물 생성
		picContent.innerHTML = "<div class='picList_content'>" +
								   "<div class='picList_content_pic'><img src='" + spaceListArr[i].attachments[0].attachmentReName + "' alt='사진없음'/></div>" +
								   "<div class='picList_content_spaceName'>" + spaceListArr[i].spaceTitle + "</div>" +
								   "<hr>" +
								   "<div class='picList_content_price click_disable'><span>" + spaceListArr[i].hourPrice + "</span><span> 원 / 시간</span></div>" +
							   "</div>";
		
		lineContent.innerHTML = "<div class='lineList_content'>" +
								    "<div class='lineList_content_spaceTitle'>" + spaceListArr[i].spaceTitle + "</div>" +
								    "<div class='lineList_content_hashTag click_disable'>" + spaceListArr[i].hashtag + "</div>" +
								    "<div class='lineList_content_extraInfo'>" +
									    "<div class='lineList_content_price click_disable'>" + spaceListArr[i].hourPrice + "원 / 시간</div>" +
									    "<div class='lineList_content_reviewCount click_disable'>최대 : " + spaceListArr[i].maxPeople + "명</div>" +
									    "<i class='fa-solid fa-location-dot saddresss'></i>" + spaceListArr[i].addressDefault + 
								    "</div>" +
							    "</div>";
							    
		picListArr.push(picContent);
		lineListArr.push(lineContent);
		
		//생성된 내용물 리스트 칸 안에 넣기
		picList.append(picContent);
		lineList.append(lineContent);
	}	
};

function updateMarkers() {
	//기존의 마커 삭제
	for(var i in markers){
		markers[i].setMap(null);
	}
	
	//기존에 담겨있던 필요없는 마커객체 삭제
	markers.length = spaceListArr.length;
	
	//새로운 마커 표시
	for(var i in spaceListArr){
		position = new naver.maps.LatLng(spaceListArr[i].latitude, spaceListArr[i].longitude);
    	marker = new naver.maps.Marker({
			position : position,
			title : spaceListArr[i].spaceNo,
			clickable : true,
			map: map,
			animation: null
		});
        markers[i] = marker;
	}
};

function linkMarkerWithList(markers, picListArr, lineListArr, map){
	for(var i = 0; i < markers.length; i++){
		naver.maps.Event.addListener(markers[i], "click", (e) => {
			var clickedPicList = document.getElementById("picList_" + e.overlay.title);
			$("#picList").animate({
				scrollTop : clickedPicList.offsetTop - 100
			}, 500);
			clickedPicList.style.cssText = "background-color: black; color: white;";
			setTimeout( () => clickedPicList.style.cssText = "", 1000);
			
			var clickedLineList = document.getElementById("lineList_" + e.overlay.title);
			$("#lineList").animate({
				scrollTop : clickedLineList.offsetTop - 100
			}, 500);
			clickedLineList.style.cssText = "background-color: black; color: white;";
			setTimeout( () => clickedLineList.style.cssText = "", 1000);
		});
	}
}

function linkListWithMarker(sno){
	for(var i = 0; i < markers.length; i++){
		if(markers[i].title == sno){
			markers[i].setAnimation(1);
		}
	}
}

function unlinkListWithMarker(sno){
	for(var i = 0; i < markers.length; i++){
		if(markers[i].title == sno){
			markers[i].setAnimation(null);
		}
	}
}

function filterOpenClose() {
    if(filter.style.display =="none"){
        filter.style.display="block";
    } else {
        filter.style.display="none";
    }
};

function toPicList() {
	if(picList.style.display != "none") return;
	picList.style.display = "block";
	lineList.style.display = "none";
}

function toLineList() {
	if(lineList.style.display != "none") return;
	lineList.style.display = "block";
	picList.style.display = "none";
}



function toSpaceDetail(sno){
	location.href = "detail.sp?sno=" + sno;
}

//중복코드 묶은 메소드
function initiateMap(map){
	loadList(spaceListArr, picListArr, lineListArr);
	updateMarkers();
	linkMarkerWithList(markers, picListArr, lineListArr, map);
}