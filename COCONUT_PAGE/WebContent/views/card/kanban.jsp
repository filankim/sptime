<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<!-- Popper JS -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<style>
.kanban-outer {
	background-color: rgb(253, 255, 240);
	width: 1820px;
	height: 80%;
	margin: auto;
	display: flex;
	flex-direction: column;
}

.kanban-header {
	display: flex;
	flex-direction: row;
	justify-content: right;
	font-family: sans-serif;
	
}

.kanban-header-text {
	font-size: 1.8rem;
	background-color: rgb(110, 76, 68);
	color: rgb(253, 255, 240);
	padding: 0.8rem 1.7rem;
	border-radius: 0.5rem;
	margin: auto;
}

#addCard-button {
    width: 150px;
    height: 70px;
}

.kanban-board {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	font-family: sans-serif;
	white-space: nowrap;
	
	width : 90%;
	margin: 2% 5%;
}

.kanban-block {
	padding: 20px;
	width: 100%;
    margin: 50px;
	border-radius: 30px;
	flex: 1 0 1;
	background-color: rgb(110, 76, 68);
}

.card {
	background-color: white;
	margin : 2rem 0rem 2rem 1rem;
	padding : 10px;
	border: 0.1rem solid black;
	border-radius: 0.2rem;
	
	max-width : 371px;
}

input[name=cardTitle] {
	width:80%;
}

#addCard-button {
	margin: 0.2rem 0rem 0.1rem 0rem;
	background-color: white;
	border-radius: 0.2rem;
	width: 100%;
	border: 0.25rem solid black;
	padding: 0.5rem 2.7rem;
	border-radius: 0.3rem;
	font-size: 1rem;
}

.cardDetail>div>input {
	width: 100%;
	margin-top: 4px;
}

.cardTitle {
	text-align: center;
	font-weight: bold;
}

.cardContent {
	width: 100%;
	height: 100px;
}

.cardTitle:hover {
	cursor: pointer;
}

.kanban-block span {
	color: rgb(253, 255, 240);
	width : 100px;
}

#addCard-button { 
	float : right;
}


<!------------------------------------------>
#addCardForm .modal-dialog {
	border-radius : 50px;
}

#addCardForm .modal-content {
	margin-top : 250px;
	background-color : #6E4C44 !important;
	width : 500px !important;
 	height : 500px !important ;
 	border-radius : 20px;
}

#addCardForm .modal-header {
	margin-top: 15px;
}

#addCardForm .modal-title {
	width : 100%;
	height : 90%;
 	background-color : #FDFFF0;
	border-radius : 30px;
	border : 3px solid #FDFFF0;
	line-height : 55px;
	font-size : 25px;
	font-weight : bold;
	color : #6E4C44;
	text-align : center;
}

.add_cardTitle{
	height : 50px;
}

#addModal-btn input {
	padding : 10px 15px;
	border-radius : 10px;
	background-color : #FDFFF0;
	color : #6E4C44;
	border : none;
	font-weight: 600;
	display: inline-block;
	margin: 0 5px;
	width : 100px;
	height : 45px;
	text-align : center;
}

#addCardForm .modal-body table {
	 border-spacing: 15px;
	 border-collapse: separate;
	 width : 100%;
}



</style>

<script>

		
/*?????? ???????????? ??????*******************************************************************************/
        var pickedCard;
        function drag(ev) {
            ev.dataTransfer.setData("text", ev.target.id);
            pickedCard = ev.target;
        }

        var dragYpoint;
        function allowDrop(ev) {
            ev.preventDefault();
            dragYpoint = ev.clientY + 60;
            
        }
        
        var cardNoArr = [];
        var orderArr = [];
		var statementArr = [];
		
        function drop(ev) {
        	if($(ev.target).is('.kanban-block')){
        		
        	} else {
        		return false;
        	}
        	
            ev.preventDefault();
            var data = ev.dataTransfer.getData("text");
            
    		var cardCount = ev.target.children.length; //???????????? ?????? ?????? ????????? ?????? ?????? (span??????)
    		var cards = [];
    		var yStartPoint = []; //???????????? ??? ?????? ?????? ?????? y?????? (?????? div??????)
    		var yEndPoint = []; //???????????? ??? ?????? ?????? ?????? y?????? (?????? div??????)
    		var yPoints = []; //???????????? ??? ?????? ??????
    		
    		for(var i = 0; i < cardCount; i++){
    			var card = ev.target.children[i];
    			cards[i] = card;
    			
    			yStartPoint[i] = card.getBoundingClientRect().x;
    			yStartPoint[i] = card.getBoundingClientRect().y;
    			
    			yEndPoint[i] = card.getBoundingClientRect().right;
    			yEndPoint[i] = card.getBoundingClientRect().bottom;
    			
    			yPoints[i] = (yStartPoint[i]  + yEndPoint[i]) / 2;
    		}
    		
			
			
			var cardAlready = $(ev.target).children();
			
    		if(cardAlready.length == 1){ //????????? ????????? ?????? ???
    			$(ev.target).children().eq(0).after(pickedCard);
    			
        	} else if (cardAlready.length == 2){ //????????? ????????? 1??? ??? ???
        		if(dragYpoint > yStartPoint[0] && dragYpoint < yPoints[1]){
        			$(ev.target).children().eq(0).after(pickedCard);
        		} else {
        			$(ev.target).children().eq(1).after(pickedCard);
        		}
        		
        	} else if (cardAlready.length == 3){ //????????? ????????? 2??? ??? ???
        		if(dragYpoint > yStartPoint[0] && dragYpoint < yPoints[1]){
        			$(ev.target).children().eq(0).after(pickedCard);
        		} else if (dragYpoint > yPoints[1] && dragYpoint < yPoints[2]){
					$(ev.target).children().eq(1).after(pickedCard);        			
        		} else {
        			$(ev.target).children().eq(2).after(pickedCard);   
        		}
        		
        	} else if (cardAlready.length == 4){ //????????? ????????? 3??? ??? ???
        		if(dragYpoint > yStartPoint[0] && dragYpoint < yPoints[1]){
        			$(ev.target).children().eq(0).after(pickedCard);
        		} else if (dragYpoint > yPoints[1] && dragYpoint < yPoints[2]){
					$(ev.target).children().eq(1).after(pickedCard);        			
        		} else if (dragYpoint > yPoints[2] && dragYpoint < yPoints[3]){
        			$(ev.target).children().eq(2).after(pickedCard);   
        		} else {
        			$(ev.target).children().eq(3).after(pickedCard); 
        		}
        		
        	} else if (cardAlready.length == 5){ //????????? ????????? 4??? ??? ???
        		if(dragYpoint > yStartPoint[0] && dragYpoint < yPoints[1]){
        			$(ev.target).children().eq(0).after(pickedCard);
        		} else if (dragYpoint > yPoints[1] && dragYpoint < yPoints[2]){
					$(ev.target).children().eq(1).after(pickedCard);        			
        		} else if (dragYpoint > yPoints[2] && dragYpoint < yPoints[3]){
        			$(ev.target).children().eq(2).after(pickedCard);   
        		} else if (dragYpoint > yPoints[3] && dragYpoint < yPoints[4]) {
        			$(ev.target).children().eq(3).after(pickedCard); 
        		} else {
        			$(ev.target).children().eq(4).after(pickedCard); 
        		}
        		
        	} else { // 5???????????? ???????????? ??????
        		return false;
        	}
    	
            
<!-------------------------------------------------------------------------------------------------------->
    		
            
            //?????? ??? cardOrder, cardStatement??? ?????? 
            
			var todoOrderArr = $("#todo").find($("input[name=cardOrder]"));
			for(var i = 0; i < todoOrderArr.length; i++){
				$("#todo").find($("input[name=cardOrder]")).eq(i).attr("value", i+1);
				$("#todo").find($("input[name=cardStatement]")).eq(i).attr("value", "1");
			}
			
			var inprogressOrderArr = $("#inprogress").find($("input[name=cardOrder]"));
			for(var i = 0; i < inprogressOrderArr.length; i++){
				$("#inprogress").find($("input[name=cardOrder]")).eq(i).attr("value", i+1);
				$("#inprogress").find($("input[name=cardStatement]")).eq(i).attr("value", "2");
			}
			
			var doneOrderArr = $("#done").find($("input[name=cardOrder]"));
			for(var i = 0; i < doneOrderArr.length; i++){
				$("#done").find($("input[name=cardOrder]")).eq(i).attr("value", i+1);
				$("#done").find($("input[name=cardStatement]")).eq(i).attr("value", "3");
			}
			
			var a = $(".kanban-block").find($("input[name=cardOrder]"));
			for(var i = 0; i < a.length; i++){
				orderArr[i] = $(".kanban-block").find($("input[name=cardOrder]")).eq(i).val();
				statementArr[i] = $(".kanban-block").find($("input[name=cardStatement]")).eq(i).val();
				cardNoArr[i] = $(".kanban-block").find($("input[name=cardNo]")).eq(i).val();
			}
			
			$.ajax({
				url : "updatePosition.kan",
				traditional : true,
				data : {
					cardNoArr : cardNoArr,
					orderArr : orderArr,
					statementArr : statementArr
				},
				type : "post",
				success : function(result) {
				},
				error : function() {
				}
			});
		}
        
/*************************************************************************************************/
        $(function(){
        	selectCard();
        	/*?????? slideUp,Down??????*/	
        	$(".kanban-block").on("click", ".cardTitle", function(e){
        		if($(this).nextAll().css("display") == "none"){
        			$(this).closest(".kanban-block").find(".cardDetail-block").slideUp(1000);
        			$(this).siblings().slideDown(1000);
        		} else {
        			$(".cardDetail-block").not($(this)).slideUp(1000);
        		}
        	});
        	
        });
        
        $(function(){
        	$("#addCard-button").click(function(){
                $("#addCardForm").modal("show");
            });
            
            $("#cardEnroll").click(function(){
            	$("#addCardForm").modal("hide");
            });
        })
        
        
        /*???????????? ??????????????? ?????? ?????????*/
        
        
        function updateCard(cardNo) {
        	
        	$.ajax({
        		url : "update.kan",
        		data : {
        			cardNo : cardNo,
        			cardContent : $("#"+cardNo).find("textarea[name=cardContent]").val(),
					dewDate : $("#"+cardNo).find("input[name=dewDate]").val(),
					cardPriority : $("#"+cardNo).find("input[class=cardPriority]:checked").val()
        		},
        		type: "post",
        		success : function(){
        			alert("????????? ?????????????????????.");
        			location.reload();
        			
        			
        		},
        		error : function(){
        		}
        	})
        }
        

        
        <%-- ?????? ????????? ?????? ????????? --%>
        $(function(){
        	$(".kanban-block").on("click", ".deleteBtn", function(e){
        		e.currentTarget.closest(".card").remove();
        	})
        })
        
        function deleteCard() {
        	$.ajax({
        		url : "delete.kan",
        		data : { cardNo : $("input[name=cardNo]").val() },
        		type : "post",
        		success : function(result){
        			alert("????????? ?????????????????????.");
        		},
        		error : function(){
        		}
        	});
        }

</script>
</head>
<body>
	<div class="wrap">
		<%@ include file="../common/header.jsp"%>???
			<div class="container">???
			<!-- ?????? ???????????? -->
			<%@ include file="../common/sidebar.jsp"%>
			
			<script>
			function selectCard(){ 
				$.ajax({
	        		url : "selectAll.kan",
	        		data : { empNo : <%= e.getEmpNo() %> },
	        		type: "post",
	        		success : function(list){
	        			for(var i = 0; i < list.length; i++){
		        			var str = "<div class='card' id='" + list[i].cardNo + "' draggable='true' ondragstart='drag(event)'>" +
											"<h3 class='cardTitle' name='cardTitle'>" + 
												list[i].cardTitle +
											<!--"<input type='text' name='cardTitle' value='" + list[i].cardTitle + "'>" +--> 
											"</h3>" +
											"<div class='cardDetail-block'>" +
												"<div class='cardDetail'>" +
													"<input type='hidden' name='cardNo' value='" + list[i].cardNo+ "'>" +
													"<input type='hidden' name='cardStatement' value='" + list[i].cardStatement+ "'>" +
													"<input type='hidden' name='cardOrder' value='" + list[i].cardOrder + "'>" +
													"<table>" +
														"<tr>" +
															"<td colspan='2'>&nbsp;<b>????????????</b><br>" +
																"<textarea class='cardContent' name='cardContent' cols='42' contenteditable style='resize:none;' required>" + list[i].cardContent + "</textarea>" + 
															"</td>" +
														"</tr>" +
														"<tr>" +
															"<th>&nbsp;&nbsp; ????????? &nbsp;</th>" +
															"<td><input type='date' name='dewDate' value='" + list[i].dewDate + "'></td>" +
														"</tr>" +
														"<tr>" +
															"<th>&nbsp;&nbsp;&nbsp;?????????" +  
															"</th>" +
															"<td id='cardPriority" + i + "' name='cardPriority' value='" + list[i].cardPriority + "'>" +
																 "<input type='radio' class='cardPriority' name='cardPriority" + i + "' value='1'><label>??????</label>" + 
															     "<input type='radio' class='cardPriority' name='cardPriority" + i + "' value='2'><label>??????</label>" + 
															     "<input type='radio' class='cardPriority' name='cardPriority" + i + "' value='3'><label>??????</label>" +
															
															"</td>" + 
														"</tr>" +
													"</table>" + 
													"<div>" +
														"<input class='btn btn-warning updateBtn' value='update' onclick='updateCard(" + list[i].cardNo + ");'><br>" + 
														"<input class='btn btn-danger deleteBtn' type='button' value='delete' onclick='deleteCard();'> " +
													"</div>" +
												"</div>" +
											"</div>" +
										"</div>";
										
										
	        				if(list[i].cardStatement == 1){
	        					$("#todo").append(str);
	        				} else if(list[i].cardStatement == 2) {
	        					$("#inprogress").append(str);
	        				} else if(list[i].cardStatement == 3) {
	        					$("#done").append(str);
	        				}
	        	            $(".cardDetail-block").css("display", "none");/*?????? ????????? display=none*/
	        			}
	        			
	        			
		        		for(var i = 0; i< list.length; i++){
		        			switch(list[i].cardPriority){
			        			case 1 : 
			        					 $("#cardPriority" + i).closest(".card").css("border", "5px solid red"); 
			        					 $("#cardPriority" + i).children().eq(0).prop("checked", true);
			        					 break;
			        			case 2 : 
			        					 $("#cardPriority" + i).closest(".card").css("border", "5px solid yellow");
			        					 $("#cardPriority" + i).children().eq(2).prop("checked", true);
			        					 break;
			        			case 3 : 
			        					 $("#cardPriority" + i).closest(".card").css("border", "5px solid rgb(110, 76, 68)");
			        					 $("#cardPriority" + i).children().eq(4).prop("checked", true);
			        					 break;
		        			}
		        		}
	        		},
	        		error : function() {
	        		}
	        	});
			}
			
			function insertCard() {
				$.ajax({
					url: "insert.kan",
					data : {
						cardTitle : $("input[name=add_cardTitle]").val(),
						cardContent : $("textarea[name=add_cardContent]").val(),
						dewDate : $("input[name=add_dewDate]").val(),
						cardPriority : $("input[name=add_cardPriority]:checked").val(),
						empNo : $("input[name=add_empNo]").val()
					},
					type : "post",
					success : function(result){
		        		var childNodesArr = document.getElementById("todo").childNodes;
						var newCardOrder = document.getElementById("todo").querySelectorAll("input[name=cardOrder]");
						
						if(childNodesArr.length > 3){
							for(var i = 0; i < newCardOrder.length; i++){
								newCardOrder[i].value ++;
							}
						}
						alert("????????? ?????????????????????.");
						location.reload();
					},
					error : function(){
					}
				});
			}
			</script>
			
			
	            <div class="kanban-outer">
	                <div class="kanban-header">
	                    
	                    <div class="addCard-block">
	                    	<button id="addCard-button">+ ?????? ??????</span>
	                    </div>
<!--?????????????????????-------------------------------------------------------->  
                        <div class="modal fade" id="addCardForm" role="dialog" width="100%;" height="100%;">
                            <div class="modal-dialog">
                            
                            <!-- Modal content-->
                                  <div class="modal-content">
                                      <div class="modal-header" style="border-bottom:none">
                                      <h4 class="modal-title" >?????? ??????</h4>
               
                                      </div>
                                      <div class="modal-body">
                                          <input type="hidden" name="add_empNo" value="<%= e.getEmpNo() %>">
                                          <table>
                                              <tr>
                                                  <th style="background-color:#FDFFF0; color:#6E4C44; width:150px; padding:6px 0; border-radius:10px; text-align:center;" >?????????</th>
                                                  <td >
                                                  	<input type="text" name="add_cardTitle" required style="border-radius:10px; width:250px; border:none;">
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <th style="background-color:#FDFFF0; color:#6E4C44; width:150px; padding:6px 0; border-radius:10px; text-align:center;">?????? ??????</th>
                                                  <td >
                                                  <textarea name="add_cardContent" placeholder="100??? ????????? ???????????????." style="resize:none; width:248px; height:80px; border:none; border-radius:10px;" required></textarea>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <th style="background-color:#FDFFF0; color:#6E4C44; border-radius:3px; width:150px; border-radius:10px; text-align:center;">????????????</th>
                                                  <td><input type="date" name="add_dewDate" style="width:250px; border-radius:10px;"></td>
                                              </tr>
                                              <tr>
                                                  <th style="background-color:#FDFFF0; color:#6E4C44; width:150px; padding:6px 0; border-radius:10px; text-align:center;">?????????</th>
                                                  <td style="font-size:20px; font-wieght: 300; color:#FDFFF0;">
                                                      <input type="radio" name="add_cardPriority" value="1" style="color:#6E4C44; border-radius:10px; font-size:30px;">&nbsp;&nbsp;??????&nbsp;&nbsp;
                                                      <input type="radio" name="add_cardPriority" value="2" style="color:#6E4C44; border-radius:10px;">&nbsp;&nbsp;??????&nbsp;&nbsp;
                                                      <input type="radio" name="add_cardPriority" value="3" style="color:#6E4C44; border-radius:10px;">&nbsp;&nbsp;??????
                                                  </td>
                                              </tr>
                                          </table>
                                          <div id="addModal-btn" style="text-align: center; margin: 30px 0;"> 
                                          	<input type="button" id="cardEnroll" value="???????????? " onclick="insertCard();" >
                                          	<input type="button" value="?????? " data-dismiss="modal">
                                          	</div>
                                      </div>
                                  </div>
                            </div>
                        </div>
	                </div>
					<div class="kanban-board">
<!--??????????????? TODO----------------------------------------------------------------------------------------------------------------->
						<div class="kanban-block" id="todo"  ondrop="drop(event)" ondragover="allowDrop(event)">
							<div><span id=columnTitle>To Do</span></div>
	                    </div>
	                    
<!--??????????????? INPROGRESS----------------------------------------------------------------------------------------------------------------->                    
	                    <div class="kanban-block" id="inprogress" ondrop="drop(event)" ondragover="allowDrop(event)">
	                        <div><span id=columnTitle>In Progress</span></div>
	                    </div>
	                       
	                        
<!--??????????????? DONE----------------------------------------------------------------------------------------------------------------->               
	                    <div class="kanban-block" id="done" ondrop="drop(event)" ondragover="allowDrop(event)">
	                        <div><span id=columnTitle>Done</span></div>
	                    </div>
	                </div><!-- ??????????????? -->
            </div><!-- KANBANOUTER -->
        </div><!-- HEADER -->
    </div><!-- WRAP -->
    
    <script>
	    $(function() {
	        $("#header_menu").html("<div><a href='<%=contextPath%>/list.kan' style='color:#20c997'>????????????</a></div>");
	 	});
    </script>
</body>
</html>



